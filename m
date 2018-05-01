From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 May 2018 14:04:16 +0200
Subject: [Buildroot] [PATCH v2] core/pkg-generic: only save latest
 package list
In-Reply-To: <20180501111304.17597-1-john@metanate.com>
References: <20180430194136.GC2470@scaer>
 <20180501111304.17597-1-john@metanate.com>
Message-ID: <20180501120416.GA29082@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

John, All,

On 2018-05-01 12:13 +0100, John Keeping spake thusly:
> When rebuilding a package, simply appending the package's file list to
> the global list means that the package list grows for every rebuild, as
> does the time taken to check for files installed by multiple packages.
> Furthermore, we get false positives where a file is reported as being
> installed by multiple copies of the same package.
> 
> With this approach we may end up with orphaned files in the target
> filesystem if a package that has been updated and rebuilt no longer
> installs the same set of files, but we know that only a clean build will
> produce reliable results.  In fact it may be helpful to identify these
> orphaned files as evidence that the build is not clean.
> 
> Signed-off-by: John Keeping <john@metanate.com>
> ---
> Changes in v2:
> - Do the sed as a separate step rather than in the same shell invocation
>   as the find (we know that $(BUILD_DIR) is an absolute path); since we
>   no longer ignore the exit status of sed, we also have to ensure that
>   the file exists before executing sed
> 
>  package/pkg-generic.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index bd47ca1964..8ebbacc180 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -63,6 +63,8 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
>  # $(2): base directory to search in
>  # $(3): suffix of file  (optional)
>  define step_pkg_size_inner
> +	@>$(BUILD_DIR)/packages-file-list$(3).txt

Have you tested that? In my little experience with dealing with the
shell, this actually truncates the file to a zero-size, and thus we
loose the existing package->file list, even for other packages.

So, just do as I suggested: use touch to ensure the file exists.

(Yeah, one could also use the append-redirection >> instead of touch,
but is that trick really an improvement over touch? touch is well known,
and virtually everyone will recognise a construct that uses touch before
sed-ing a file.)

Regards,
Yann E. MORIN.

> +	$(SED) '/^$(1),/d' $(BUILD_DIR)/packages-file-list$(3).txt
>  	cd $(2); \
>  	find . \( -type f -o -type l \) \
>  		-newer $($(PKG)_DIR)/.stamp_built \
> -- 
> 2.17.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
