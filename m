From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Jul 2014 22:15:48 +0200
Subject: [Buildroot] [PATCH v8 1/1] google-breakpad: Integration into
 Makefile and Config.in
In-Reply-To: <1406734040-31558-2-git-send-email-pascal.huerst@gmail.com>
References: <1406734040-31558-1-git-send-email-pascal.huerst@gmail.com>
 <1406734040-31558-2-git-send-email-pascal.huerst@gmail.com>
Message-ID: <20140731201548.GF3960@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pascal, All,

On 2014-07-30 17:27 +0200, Pascal Huerst spake thusly:
> Signed-off-by: Pascal Huerst <pascal.huerst@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/google-breakpad/gen-syms.sh b/package/google-breakpad/gen-syms.sh
> new file mode 100755
> index 0000000..284d210
> --- /dev/null
> +++ b/package/google-breakpad/gen-syms.sh
> @@ -0,0 +1,25 @@
> +#!/bin/sh
> +STAGING_DIR="${1}"
> +TARGET_DIR="${2}"
> +shift 2
> +
> +SYMBOLS_DIR="${STAGING_DIR}/usr/share/google-breakpad-symbols"
> +rm -rf "${SYMBOLS_DIR}"
> +mkdir -p "${SYMBOLS_DIR}"
> +
> +for FILE in $(ls ${TARGET_DIR}/${@}); do

This is broken, since it would pick binaries from the host system.

For example, I set the list to:    /bin/busybox /bin/bzip2

And it does not fail, even though we install bzip2 in /usr/bin/bzip2.
That's because it picks my host's bzip2 which is /bin/bzip2.

I've reworked this script in my recent respin:
    http://patchwork.ozlabs.org/patch/375417/

> +	if [ -d "${FILE}" ]; then
> +		printf "Error: '%s' is a directory\n" "${FILE}" >&2
> +		exit 1
> +	fi
> +	if dump_syms "${FILE}" > "${SYMBOLS_DIR}/tmp.sym" 2>/dev/null; then

We need to install host-google-breakpad, which so far nothing depends
on, so it does not get installed unless you manually do it (either in
the host system, or manually run 'make host-google-breakpad), which
defeats the initial purpose of having an entry in the menuconfig.

I've fixed that in my respin, too.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
