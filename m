From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Dec 2020 18:39:33 +0100
Subject: [Buildroot] [PATCH v2 04/12]
 support/download/post-process-helpers: add helper function for post process
 scripts
In-Reply-To: <20201219153525.1361175-5-thomas.petazzoni@bootlin.com>
References: <20201219153525.1361175-1-thomas.petazzoni@bootlin.com>
 <20201219153525.1361175-5-thomas.petazzoni@bootlin.com>
Message-ID: <20201219173933.GJ3188@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-12-19 16:35 +0100, Thomas Petazzoni spake thusly:
> download post process scripts will often need to unpack the source
> code tarball, do some operation, and then repack it. In order to help
> with this, post-process-helpers provide an unpack() function and a
> repack() function.

You forgot to explain in the commit log why we need a hard-coded, fixed
date.

However, I find it ugly that we resort to such an arbitrary constant. At
the very least, I'd like we take a memorable value, like 1970-01-01
00:00:00 +0000.

However, I am afraid that tar would refuse to extract files to that
date, whining about an "implausibly old time stamp" when extracting such
files...

But see below for a proposal...

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/download/post-process-helpers | 30 +++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 support/download/post-process-helpers
> 
> diff --git a/support/download/post-process-helpers b/support/download/post-process-helpers
> new file mode 100644
> index 0000000000..bed8df2577
> --- /dev/null
> +++ b/support/download/post-process-helpers
> @@ -0,0 +1,30 @@
> +
> +unpack() {
> +        dest="$1"
> +        tarball="$2"

This is a shell script, variables are global. But since we run it with
bash, we can declare such variable as local:

    local dest="${1}"
    local tarball="${2}"

> +        mkdir ${dest}
> +        tar -C ${dest} --strip-components=1 -xf ${tarball}

    local one_file

    one_file="$(find "${dest}" -type f |head -n1)"
    touch -r "${one_file}" "${dest}.timestamp"

> +}
> +
> +repack() {
> +        src="$1"
> +        tarball="$2"

Ditto: make them 'local' (this can be fixed when applying).

Also, I suppose that the 'dest' parameter of unpack is expected to be the
'src' parameter of repack, right?

> +        # Generate the archive, sort with the C locale so that it is reproducible.
> +        find "$(basename ${src})" -not -type d -print0 >files.list
> +        LC_ALL=C sort -z <files.list >files.list.sorted
> +
> +        # let's use a fixed hardcoded date to be reproducible
> +        date="2020-02-06 01:02:03 +0000"

Assuming that unpack's dest and repack's src are pointing to the same
directory:

        date="$(stat -c "${src}.timestamp")"

> +        # Create GNU-format tarballs, since that's the format of the tarballs on
> +        # sources.buildroot.org and used in the *.hash files
> +        tar cf new.tar --null --verbatim-files-from --numeric-owner --format=gnu \
> +            --owner=0 --group=0 --mtime="${date}" -T files.list.sorted

This will have to be changed according to my pending series to change to
the PAX format, whish is even more reproducible.

> +        gzip -6 -n <new.tar >new.tar.gz
> +        mv "${tarball}" "${tarball}".old
> +        mv new.tar.gz "${tarball}"
> +        rm "${tarball}".old
> +        rm -rf ${src}

Quote all expanded variable, even "${src}". And also rm "${src}.timestamp",
now.

Regards,
Yann E. MORIN.

> +}
> -- 
> 2.29.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
