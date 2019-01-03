From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Jan 2019 22:37:52 +0100
Subject: [Buildroot] [PATCH] core/instrumentation: filter-out packages
 that install identical files
In-Reply-To: <20190103160431.13306-1-yann.morin.1998@free.fr>
References: <20190103160431.13306-1-yann.morin.1998@free.fr>
Message-ID: <20190103223752.5262bdac@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  3 Jan 2019 17:04:31 +0100, Yann E. MORIN wrote:
> Currently, we check that no two packages write to the same files, as a
> sanity check. We do so by checking which files were touched since the
> end of the build (aka begining of the installation).
> 
> However, when the packages do install the exact same file, i,e, the
> same content, we in fact do not really care what package had provided
> said file.
> 
> In the past, we avoided that situation because we were md5sum-inf every
> files before and after installation. Anything that changed was new or
> modified, and everything that did not change was not modified (but could
> have been reinstalled).
> 
> However, since 7fb6e78254 (core/instrumentation: shave minutes off the
> build time), we're now using mtimes, and we're in the situation that the
> exact same file installed by two-or-more packages is reported.
> 
> In such a situation, it is not very interesting to know what package
> installed the file, because whatever the ordering, or whatever the
> subset of said packages, we'd have ended up with the same file anyway.
> One prominent case where this happens, if the fftw familly of pcackages,
> that all install different libraries, but install the same set of
> identical headers and some common utilities.
> 
> The rationale for 7fb6e78254 was that the impact on the build time was
> horrible, so we can't revert it.
> 
> However, we can partially restore use of md5 to detect if the files were
> actually modified or not, and limiting the md5sum-ing only to those
> actually modified files. The comparison of the md5 is then offloaded to
> later, during the final check-uniq-files calls.
> 
> Since the md5sum is run only on new files, they are cache-hot, and so
> the md5 is not going to storage to fetch them (and if they were not
> cache-hot, it would mean memory pressure for a reason or another, and
> the system would already be slowed for other reasons).
> 
> Using a defconfig with a various set of ~236 packages, the build times
> reported by running "time make >log.file 2>&1", on an otherwise unloaded
> system, were (smallest value of 5 runs each):
> 
>     before:     35:15.92
>     after:      35:22.03
> 
> Which is a slight overhead of just 6.11s, which is less than 26ms per
> package. Also, the system, although pretty idle, was still doing
> background work like fetching mails and such, so the overhead is not
> even consistent across various measurements...

Overall, I find the idea good and useful.

A couple of comments/questions (here and below):

 - I believe we should still fix the fact that the .la file timestamp
   is changed everytime we $(SED) the .la files, even if they are not
   changed. This will also help reduce the number of files to check
   using md5sum: a .la file should be fixed only once, and its
   timestamp never touched again.

 - Could we make a check-uniq-files error a hard build failure, as a
   follow-up patch from yours ? So far, check-uniq-files errors have
   been a bit useless, because they do not cause the build to fail, so
   nobody really cared.

> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index f5cab2b9c2..7c6a995c19 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -64,12 +64,14 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
>  # $(3): suffix of file  (optional)
>  define step_pkg_size_inner
>  	@touch $(BUILD_DIR)/packages-file-list$(3).txt
> -	$(SED) '/^$(1),/d' $(BUILD_DIR)/packages-file-list$(3).txt
> +	$(SED) '/^$(1)  /d' $(BUILD_DIR)/packages-file-list$(3).txt

Why is the separator changed from , to space ?

>  	cd $(2); \
> -	find . \( -type f -o -type l \) \
> +	find . -xtype f \

Why are you changing from -type f -o -type l to -xtype f ? Is this
really related to the change ? Is -xtype supported in old version of
find ?

>  		-newer $($(PKG)_DIR)/.stamp_built \
> -		-exec printf '$(1),%s\n' {} + \
> -		>> $(BUILD_DIR)/packages-file-list$(3).txt  
> +		-print0 \
> +	|xargs -0 -r md5sum \

Ah, you're changing the separator to two spaces, because md5sum's output
already uses two spaces as a separator ?

This could break people who have scripts that parse the
package-file-list.txt contents. Maybe we should keep the compatibility,
and keep using , as a separator, and push the md5sum as an additional
third column ?

Like:
	|xargs -0 -r md5sum \
	| sed -r -e 's/([0-9a-f]{32})  (.*)/$(1),\2,\1/'

One drawback is that it won't work with filenames that contain a comma.
But in this case, we're forced to keep the filename field as the last
one, and therefore break backward compatibility of the
package-file-lists.txt format every time we want to add a new
information to it.

> +	|sed -r -e 's/^/$(1)  /' \
> +	>> $(BUILD_DIR)/packages-file-list$(3).txt
>  endef
>  
>  define step_pkg_size
> diff --git a/support/scripts/check-uniq-files b/support/scripts/check-uniq-files
> index fbc6b5d6e7..94deea01db 100755
> --- a/support/scripts/check-uniq-files
> +++ b/support/scripts/check-uniq-files
> @@ -24,24 +24,30 @@ def main():
>          sys.stderr.write('No type was provided\n')
>          return False
>  
> -    file_to_pkg = defaultdict(list)
> +    file_to_pkg = defaultdict(set)

You're changing from list to set, it's a bit unrelated. Should be a
separate commit ?

> +    file_md5 = defaultdict(set)
>      with open(args.packages_file_list[0], 'rb') as pkg_file_list:
>          for line in pkg_file_list.readlines():
> -            pkg, _, file = line.rstrip(b'\n').partition(b',')
> -            file_to_pkg[file].append(pkg)
> +            pkg, md5, file = line.rstrip(b'\n').split(b'  ', 2)

The ", 2" in split() is to make sure that if the filename contains two
consecutive spaces, we don't split it up ?

> +            file_to_pkg[file].add(pkg)
> +            file_md5[file].add(md5)
>  
>      for file in file_to_pkg:
> -        if len(file_to_pkg[file]) > 1:
> -            # If possible, try to decode the binary strings with
> -            # the default user's locale
> -            try:
> -                sys.stderr.write(warn.format(args.type, file.decode(),
> -                                             [p.decode() for p in file_to_pkg[file]]))
> -            except UnicodeDecodeError:
> -                # ... but fallback to just dumping them raw if they
> -                # contain non-representable chars
> -                sys.stderr.write(warn.format(args.type, file,
> -                                             file_to_pkg[file]))
> +        if len(file_to_pkg[file]) == 1 or len(file_md5[file]) == 1:
> +            # If only one package installed that file, or they all
> +            # installed the same content, don't report that file.
> +            continue
> +
> +        # If possible, try to decode the binary strings with
> +        # the default user's locale
> +        try:
> +            sys.stderr.write(warn.format(args.type, file.decode(),
> +                                         [p.decode() for p in file_to_pkg[file]]))
> +        except UnicodeDecodeError:
> +            # ... but fallback to just dumping them raw if they
> +            # contain non-representable chars
> +            sys.stderr.write(warn.format(args.type, file,
> +                                         file_to_pkg[file]))

I'm not sure why the whole test is inverted, it causes a lot of noise
in the diff. If there is a good reason for it, should be a separate
patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
