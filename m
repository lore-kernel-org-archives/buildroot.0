From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 9 Mar 2020 16:22:12 +0100
Subject: [Buildroot] [PATCH v1] package/php: fix aarch64 uclibc-ng
 compile
In-Reply-To: <20200309145038.18093-1-ps.report@gmx.net>
References: <20200309145038.18093-1-ps.report@gmx.net>
Message-ID: <20200309162212.5d8739be@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  9 Mar 2020 15:50:38 +0100, Peter Seiderer <ps.report@gmx.net> wrote:

> The aarch64 compile uses the sys/auxv.h header which is not
> provided by ulcibc-ng. Add configure.ac patch to check for
> the header before using it in ext/standard/crc32.c.
>
> Fixes:
>
>   https://bugs.busybox.net/show_bug.cgi?id=12626
>
>   build/php-7.4.3/ext/standard/crc32.c:26:12: schwerwiegender Fehler: sys/auxv.h: Datei oder Verzeichnis nicht gefunden
>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...Check-for-sys-auxv.h-before-using-it.patch | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 package/php/0005-Check-for-sys-auxv.h-before-using-it.patch
>
> diff --git a/package/php/0005-Check-for-sys-auxv.h-before-using-it.patch b/package/php/0005-Check-for-sys-auxv.h-before-using-it.patch
> new file mode 100644
> index 0000000000..265bb4248c
> --- /dev/null
> +++ b/package/php/0005-Check-for-sys-auxv.h-before-using-it.patch
> @@ -0,0 +1,59 @@
> +From f150702d5ab72878d45b722b6d7d4194db92c44a Mon Sep 17 00:00:00 2001
> +From: Peter Seiderer <ps.report@gmx.net>
> +Date: Mon, 9 Mar 2020 15:36:48 +0100
> +Subject: [PATCH] Check for sys/auxv.h before using it.
> +
> +Fixes aarch64 compile wiht uclibc-ng (does not provide
> +sys/auxv.h header file).
> +

Upstream: https://github.com/php/php-src/pull/5248

> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +---
> + configure.ac         | 1 +
> + ext/standard/crc32.c | 9 +++++++--
> + 2 files changed, 8 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 5219a5f2..caf62302 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -440,6 +440,7 @@ resolv.h \
> + strings.h \
> + syslog.h \
> + sysexits.h \
> ++sys/auxv.h \
> + sys/ioctl.h \
> + sys/file.h \
> + sys/mman.h \
> +diff --git a/ext/standard/crc32.c b/ext/standard/crc32.c
> +index c3ca5903..e59ab45f 100644
> +--- a/ext/standard/crc32.c
> ++++ b/ext/standard/crc32.c
> +@@ -17,10 +17,15 @@
> + */
> +
> + #include "php.h"
> ++#ifdef PHP_WIN32
> ++#include "config.w32.h"
> ++#else
> ++#include <php_config.h>
> ++#endif
> + #include "basic_functions.h"
> + #include "crc32.h"
> +
> +-#if defined(__aarch64__)
> ++#if defined(__aarch64__) && defined(HAVE_SYS_AUXV_H)
> + # include <arm_acle.h>
> + # if defined(__linux__)
> + #  include <sys/auxv.h>
> +@@ -85,7 +90,7 @@ PHP_NAMED_FUNCTION(php_if_crc32)
> +
> + 	crc = crcinit^0xFFFFFFFF;
> +
> +-#if defined(__aarch64__)
> ++#if defined(__aarch64__) && defined(HAVE_SYS_AUXV_H)
> + 	if (has_crc32_insn()) {
> + 		crc = crc32_aarch64(crc, p, nr);
> + 		RETURN_LONG(crc^0xFFFFFFFF);
> +--
> +2.25.1
> +
