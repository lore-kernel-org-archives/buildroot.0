From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Jan 2018 11:12:19 +0100
Subject: [Buildroot] [PATCH v2] snort: new package
In-Reply-To: <1515575890-29518-1-git-send-email-sergio.prado@e-labworks.com>
References: <1515575890-29518-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20180110111219.10aeca4b@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Jan 2018 07:18:10 -0200, Sergio Prado wrote:

> diff --git a/package/snort/0001-Fix-cross-compilation-errors.patch b/package/snort/0001-Fix-cross-compilation-errors.patch
> new file mode 100644
> index 000000000000..b3cad44229c3
> --- /dev/null
> +++ b/package/snort/0001-Fix-cross-compilation-errors.patch
> @@ -0,0 +1,290 @@
> +From 0c3d43c5f189b24504a809af9eaa1d2741a18bea Mon Sep 17 00:00:00 2001
> +From: Sergio Prado <sergio.prado@e-labworks.com>
> +Date: Tue, 9 Jan 2018 22:24:40 -0200
> +Subject: [PATCH] Fix cross compilation errors
> +
> +Prevent configure script from trying to run programs in a cross
> +compilation environment.
> +
> +Also remove unsafe header/library path used in cross-compilation.
> +
> +Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> +---
> + configure.in | 160 +++++------------------------------------------------------
> + 1 file changed, 13 insertions(+), 147 deletions(-)
> +
> +diff --git a/configure.in b/configure.in
> +index 4b3a5dbbf450..13798ce80ae7 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -71,7 +71,6 @@ case "$host" in
> +     linux="yes"
> +     AC_DEFINE([LINUX],[1],[Define if Linux])
> +     AC_SUBST(extra_incl)
> +-    extra_incl="-I/usr/include/pcap"
> +     ;;
> +   *-hpux10*|*-hpux11*)
> +     AC_DEFINE([HPUX],[1],[Define if HP-UX 10 or 11])
> +@@ -282,21 +281,8 @@ AC_CHECK_TYPES([int8_t,int16_t,int32_t,int64_t])
> + AC_CHECK_TYPES([boolean])
> + 
> + # In case INADDR_NONE is not defined (like on Solaris)
> +-have_inaddr_none="no"
> ++have_inaddr_none="yes"
> + AC_MSG_CHECKING([for INADDR_NONE])
> +-AC_RUN_IFELSE(
> +-[AC_LANG_PROGRAM(
> +-[[
> +-#include <sys/types.h>
> +-#include <netinet/in.h>
> +-#include <arpa/inet.h>
> +-]],
> +-[[
> +-	if (inet_addr("10,5,2") == INADDR_NONE);
> +-    return 0;
> +-]])],
> +-[have_inaddr_none="yes"],
> +-[have_inaddr_none="no"])

That's not the right way of fixing the problem, as your patch is not
upstreamable. The right way is to use AC_CACHE_CHECK(), so that you can
preseed the variable value from the environment to avoid the
AC_TRY_RUN() test, and still do the test if no value is preseeded in
the environment.

AC_CACHE_CHECK([whether ... is available], [have_inaddr_none],
	[AC_RUN_IFELSE(......, [have_inaddr_none=yes], [have_inaddr_none=no])])

if test "x$have_inaddr_none" = "xno"; then
 ...
fi

With this in place, you can pass have_inaddr_none=yes in
SNORT_CONF_ENV. The configure script will skip the AC_RUN_IFELSE() test
and assume have_inaddr_none=yes is correct.

And if you do this, you can send the patch upstream.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
