From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 11 Nov 2015 18:06:25 +0100
Subject: [Buildroot] [PATCH v1] valgrind: fix musl compile
In-Reply-To: <1446317942-18726-1-git-send-email-ps.report@gmx.net>
References: <1446317942-18726-1-git-send-email-ps.report@gmx.net>
Message-ID: <56437591.1090806@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Le 31/10/2015 19:59, Peter Seiderer a ?crit :
> Add patch disabling glibc version check and adding some tweaks
> for musl support (based on OpenWRT patch [1]).
> 
> Fixes ([2]):
>   checking the glibc version... unsupported version
>   configure: error: Valgrind requires glibc version 2.2 or later
> 
> [1] https://dev.openwrt.org/browser/trunk/package/devel/valgrind/patches/200-musl_fix.patch?rev=46302
> [2] http://autobuild.buildroot.org/results/7b0/7b048ba58918f0a08498c61327fcf35a85a84837/build-end.log
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...bc-detection-for-musl-plus-some-adjusteme.patch | 77 ++++++++++++++++++++++
>  package/valgrind/valgrind.mk                       |  3 +
>  2 files changed, 80 insertions(+)
>  create mode 100644 package/valgrind/0003-Disable-glibc-detection-for-musl-plus-some-adjusteme.patch
> 
> diff --git a/package/valgrind/0003-Disable-glibc-detection-for-musl-plus-some-adjusteme.patch b/package/valgrind/0003-Disable-glibc-detection-for-musl-plus-some-adjusteme.patch
> new file mode 100644
> index 0000000..0a2f660
> --- /dev/null
> +++ b/package/valgrind/0003-Disable-glibc-detection-for-musl-plus-some-adjusteme.patch
> @@ -0,0 +1,77 @@
> +From fcb21d1480c17da6c59422d8eebfdf42d967f441 Mon Sep 17 00:00:00 2001
> +From: Peter Seiderer <ps.report@gmx.net>
> +Date: Sat, 31 Oct 2015 19:45:04 +0100
> +Subject: [PATCH] Disable glibc detection for musl (plus some adjustements).
> +
> +Patch based on the OpenWrt patch for valgrind/musl, see [1].
> +
> +[1] https://dev.openwrt.org/browser/trunk/package/devel/valgrind/patches/200-musl_fix.patch?rev=46302
> +
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +---
> + configure.ac             | 5 +++--
> + coregrind/vg_preloaded.c | 2 +-
> + include/pub_tool_redir.h | 9 ++++++++-
> + 3 files changed, 12 insertions(+), 4 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 8ab7f9b..378ba9f 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -1066,8 +1066,9 @@ case "${GLIBC_VERSION}" in
> + 	;;
> +      2.0|2.1|*)
> + 	AC_MSG_RESULT([unsupported version ${GLIBC_VERSION}])
> +-	AC_MSG_ERROR([Valgrind requires glibc version 2.2 or later,])
> +-	AC_MSG_ERROR([Darwin libc, Bionic libc or Solaris libc])
> ++	AC_MSG_WARN([Valgrind requires glibc version 2.2 or later,])
> ++	AC_MSG_WARN([Darwin libc, Bionic libc or Solaris libc])
> ++	GLIBC_VERSION=musl

This part of this patch break the glibc check for unsupported version 2.0 and 2.1.

If you want to upstream the patch, maybe you can check if GLIBC_VERSION is empty
and use the toolchain tuple instead ?

Something like:

# GLIBC_VERSION is empty if a musl libc is used, so use the toolchain tuple
# in this case.
if test x$GLIBC_VERSION = x; then
    TUPLE=`$CC -dumpmachine | grep musl`
    if test -n $TUPLE; then
        GLIBC_VERSION=musl
    fi
fi

AC_MSG_CHECKING([the glibc version])

case "${GLIBC_VERSION}" in
...
    musl)
	AC_MSG_RESULT(Musl)
	;;
...

Thoughts?

Best regards,
Romain Naour
