From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Thu, 23 Feb 2017 14:44:13 +0100
Subject: [Buildroot] [RFC PATCH 1/2] package/gobject-introspection: add
	package
In-Reply-To: <b5cbc35d4d8e4457563fdf5b8dfd04360c6616a5.1487811280.git.sam.bobroff@au1.ibm.com>
References: <cover.1487811280.git.sam.bobroff@au1.ibm.com>
 <b5cbc35d4d8e4457563fdf5b8dfd04360c6616a5.1487811280.git.sam.bobroff@au1.ibm.com>
Message-ID: <20107548.7MX6vXLLbF@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sam,

On Thursday 23 February 2017 11:54:54 CET Sam Bobroff wrote:
[...]
> diff --git a/package/gobject-introspection/create-ldd-cross.sh b/package/
gobject-introspection/create-ldd-cross.sh
> new file mode 100755
> index 000000000..58d4281e8
> --- /dev/null
> +++ b/package/gobject-introspection/create-ldd-cross.sh
> @@ -0,0 +1,46 @@
> +#!/bin/bash
> +set -e
> +
> +if [ $# -ne 2 ]; then
> +	echo "Usage: <full qemu path> <staging dir>"
> +	exit 2
> +fi
> +
> +QEMU="$1"
> +STAGING_DIR="$2"
> +OUT="$STAGING_DIR/usr/bin/ldd-cross"
> +cat > "$OUT"<<'EOF'
> +#! /bin/bash
> +
> +set -e
> +
> +EOF
> +echo "QEMU=\"$QEMU\"" >> "$OUT"
> +eval "$(grep ^RTLDLIST= $STAGING_DIR/usr/bin/ldd)"
> +
> +echo -n 'RTLDLIST="' >> "$OUT"
> +for RTLD in $RTLDLIST; do
> +	echo -n "$STAGING_DIR$RTLD " >> "$OUT"
> +done
> +echo '"' >> "$OUT"
> +echo >> "$OUT"
> +
> +cat >> "$OUT"<<'EOF'
> +for file do
> +  case $file in
> +  */*) :
> +       ;;
> +  *) file=./$file
> +     ;;
> +  esac
> +  for RTLD in ${RTLDLIST}; do
> +    if test -x $RTLD; then
> +      "$QEMU" "$RTLD" --list "$file"

Why do not call directly ldd? It does not give same result?

In add, do uclibc and musl provide ldd?

If you are looking for a cross-ldd, you can take a look to this script:

  https://gist.github.com/jerome-pouiller/c403786c1394f53f44a3b61214489e6f

It come from crosstool-ng project (and written by Yann Morin).

You may also have noticed that Yocto use "prelink"[1]. However, it seems 
overkill for our usage.

[1] http://git.yoctoproject.org/cgit/cgit.cgi/prelink-cross/


> +    fi
> +  done
> +done
> +EOF


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
