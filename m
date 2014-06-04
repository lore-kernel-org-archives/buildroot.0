From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 4 Jun 2014 21:53:02 +0200
Subject: [Buildroot] [PATCH V4 1/2] google-breakpad: new package
In-Reply-To: <1401881573-12921-2-git-send-email-pascal.huerst@gmail.com>
References: <1401881573-12921-1-git-send-email-pascal.huerst@gmail.com>
 <1401881573-12921-2-git-send-email-pascal.huerst@gmail.com>
Message-ID: <20140604195302.GF3325@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pascal, All,

Some comments below...

On 2014-06-04 13:32 +0200, Pascal Huerst spake thusly:
> Breakpad is a library and tool suite that allows you to distribute an application
> to users with compiler-provided debugging information removed, record crashes in
> compact "minidump" files, send them back to your server, and produce C and C++
> stack traces from these minidumps. Breakpad can also write minidumps on request
> for programs that have not crashed.
> 
> Signed-off-by: Pascal Huerst <pascal.huerst@gmail.com>
> ---
>  package/Config.in                                  |  1 +
>  package/google-breakpad/Config.in                  | 21 ++++++++++++
>  .../google-breakpad/google-breakpad-gen-syms.sh    | 37 ++++++++++++++++++++++
>  package/google-breakpad/google-breakpad.mk         | 17 ++++++++++
>  4 files changed, 76 insertions(+)
>  create mode 100644 package/google-breakpad/Config.in
>  create mode 100755 package/google-breakpad/google-breakpad-gen-syms.sh
>  create mode 100644 package/google-breakpad/google-breakpad.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 1706197..ea94f01 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -54,6 +54,7 @@ source "package/dstat/Config.in"
>  source "package/duma/Config.in"
>  source "package/fio/Config.in"
>  source "package/gdb/Config.in"
> +source "package/google-breakpad/Config.in"
>  source "package/iozone/Config.in"
>  source "package/kexec/Config.in"
>  source "package/ktap/Config.in"
> diff --git a/package/google-breakpad/Config.in b/package/google-breakpad/Config.in
> new file mode 100644
> index 0000000..5c9e18b
> --- /dev/null
> +++ b/package/google-breakpad/Config.in
> @@ -0,0 +1,21 @@
> +config BR2_PACKAGE_GOOGLE_BREAKPAD
> +	bool "google-breakpad"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_aarch64 || BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
> +

No empty line here.

> +	help
> +	  Google-Breakpad is a library and tool suite that allows you to distribute 
> +	  an application to users with compiler-provided debugging information 
> +	  removed, record crashes in compact "minidump" files, send them back to 
> +	  your server, and produce C and C++ stack traces from these minidumps. 
> +	  Breakpad can also write minidumps on request for programs that have not 
> +	  crashed. 	 
> +
> +	  Add all binaries and libraries you want to debug by google-breakpad to
> +	  BR2_GOOGLE_BREAKPAD_INCLUDE_FILES

These two lines should have been part of the following patch, since you
introduce that variable only then.

> +	  http://code.google.com/p/google-breakpad/
> +
> +comment "google-breakpad requires an (e)glibc toolchain w/ C++ enabled"
> +	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_USES_GLIBC)
> diff --git a/package/google-breakpad/google-breakpad-gen-syms.sh b/package/google-breakpad/google-breakpad-gen-syms.sh
> new file mode 100755
> index 0000000..e082875
> --- /dev/null
> +++ b/package/google-breakpad/google-breakpad-gen-syms.sh

This script should have been part of your next patch.

> @@ -0,0 +1,37 @@
> +#!/bin/sh
> +
> +STAGING_DIR=$1
> +HOST_DIR=$2

Passing HOST_DIR is not needed. You should call the script with the
EXTRA_ENV which contains the PATH variable, in the Makefile:

    $(EXTRA_ENV) your-script your-args

> +INCLUDE_FILES=$3
> +
> +# Search for files we want to dump symbols of
> +FIND_CMD="find $STAGING_DIR -name \"\""

Ugly hack. It took me a moment to understand what you wanted.
See below for a suggested better way to achieve the same result.

Besides, not all package install their files in staging. You should use
TARGET_DIR instead.

> +for INCLUDE_FILE in $INCLUDE_FILES; do
> +	FIND_CMD="$FIND_CMD -o -name \"$INCLUDE_FILE\""
> +done

This does not handle the case where two files would have the same
basename but reside in different directories. For example:
    /usr/bin/my-exec        <- ELF file
    /data/config/my-exec    <- database

Please state that INCLUDE_FILES should be relative to $(TARGET_DIR).
That way, we guarantee breakpad is not run against unwanted files, which
would otherwise confuse the unsuspecting user.

> +# Create directory structure
> +SYMBOLS_DIR=$STAGING_DIR/usr/share/google-breakpad-symbols
> +
> +mkdir -p $SYMBOLS_DIR/tmp
> +
> +for BIN_PATH in $(eval $FIND_CMD); do
> +	BIN=$(basename $BIN_PATH);
> +	SYM=$BIN.sym;
> +
> +	$HOST_DIR/usr/bin/dump_syms $BIN_PATH > $SYMBOLS_DIR/tmp/$SYM 2>/dev/null;
> +
> +	if [ $? -eq 0 ]; then
> +		HASH=$(head -n1 $SYMBOLS_DIR/tmp/$SYM | cut -d ' ' -f 4);
> +		mkdir -p $SYMBOLS_DIR/$BIN/$HASH
> +		mv $SYMBOLS_DIR/tmp/$SYM $SYMBOLS_DIR/$BIN/$HASH;
> +	else
> +		rm -f $SYMBOLS_DIR/tmp/$SYM
> +		echo "Can not dump symbols of $BIN for google-breakpad!"
> +	fi
> +done
> +
> +rm -Rf $SYMBOLS_DIR/tmp
> +
> +exit 0

'exit 0' is not needed.

What about the following (untested)?

    #!/bin/sh
    STAGING_DIR="${1}"
    TARGET_DIR="${2}"
    shift 2

    symbols_dir="${STAGING_DIR}/usr/share/google-breakpad-symbols"
    rm -rf "${symbols_dir}"
    mkdir -p "${symbols_dir}/tmp"

    cd "${TARGET_DIR}"
    for file in $(ls -1d "${@}"); do
        if [ -d "${file}" ]; then
            printf "Error: '%s' is a directory\n" "${file}" >&2
            exit 1
        fi
        if dump_syms "${file}" >"${symbols_dir}/tmp/tmp.syms"; then
            sha1="$( printf "%s" "${file}" |sha1sum |awk '{print $1}' )"
            mv "${symbols_dir}/tmp/tmp.syms" "${symbols_dir}/${sha1}.sym"
            printf "%s %s\n" "${sha1}" "${file}" >>"${symbols_dir}/hashes.list"
        else
            printf "Error dumping symbols for: '%s'\n" "${file}" >&2
            exit 1
        fi
    done
    rm -rf "${symbols_dir}/tmp"

It is more concise, and handles mutilple files with the same name, and
packages which do not install their files in STAGING_DIR.

${1} and ${2} are the staging and target dirs, so we store them and shift,
so the remaining arguments are all the paths to files we want to extract
symbols from.

We $(ls -1d) the args, in case one of them is a glob.

A directory argument is invalid. The user should use a glob.

We can use 'dump_syms' without full path since it is guaranteed to be in
the PATH, as exported by the EXTRA_ENV variable used above.

We store the symbols in a file named after the sha1 of the filename. We
could use the symbols file's hash if it is a strong enough hash (eg sha1
or above, but since I don;t know what hash dump_syms generates, I can't
trust it to not collide). This allows to store symbols for file with the
same name in different directories.

We store the correspondence {sha1,file} in a text file, so it is easy to
retrieve the filename from a sha1, and conversely.

We exit as soon as we can't extract symbols from a file, as we want to
catch it as a failure, instead of ignoring it.

But this script should go in the second patch of yours in any case.

> diff --git a/package/google-breakpad/google-breakpad.mk b/package/google-breakpad/google-breakpad.mk
> new file mode 100644
> index 0000000..e5b69c0
> --- /dev/null
> +++ b/package/google-breakpad/google-breakpad.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# google-breakpad
> +#
> +################################################################################
> +
> +GOOGLE_BREAKPAD_VERSION = 1320
> +GOOGLE_BREAKPAD_SITE = http://google-breakpad.googlecode.com/svn/trunk
> +GOOGLE_BREAKPAD_SITE_METHOD = svn
> +GOOGLE_BREAKPAD_CONF_OPT = --disable-processor --disable-tools

Do we really want to disable tools even for the host variant?
Isn't dump_symc a tool that gets disabled in this case?

> +GOOGLE_BREAKPAD_DEPENDENCIES = host-google-breakpad

Does the target variant have a build-time dependency on the host tools?

If not, then you should do, in Config.in:

    config BR2_PACKAGE_GOOGLE_BREAKPAD
        bool "google breakpad"
        select BR2_PACKAGE_HOST_GOOGLE_BREAKPAD

    config BR2_PACKAGE_HOST_GOOGLE_BREAKPAD
        bool

(with the other depends you need, of course.)

Regards,
Yann E. MORIN.

> +GOOGLE_BREAKPAD_INSTALL_STAGING = YES
> +GOOGLE_BREAKPAD_LICENSE = BSD-3c
> +GOOGLE_BREAKPAD_LICENSE_FILES = LICENSE
> +
> +$(eval $(host-autotools-package))
> +$(eval $(autotools-package))
> -- 
> 1.9.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
