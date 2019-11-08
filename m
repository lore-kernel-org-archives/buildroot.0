From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 Nov 2019 22:13:23 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/shairport-sync: fix static build with soxr
In-Reply-To: <20190830185104.6303-1-fontaine.fabrice@gmail.com>
References: <20190830185104.6303-1-fontaine.fabrice@gmail.com>
Message-ID: <20191108211323.GL3419@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2019-08-30 20:51 +0200, Fabrice Fontaine spake thusly:
> Commit 4a28f22383f07b7ea96ee1d63ee2fbeadaec5444
> "package/shairport-sync: bump to version 3.2.2", wrongly removed first
> and second patches so add them back to fix static build with soxr.
> Indeed, these patches were only merged in version 3.3.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/7edc8f8bafdc9982f8f35e171010227d6b00da46
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Sorry for being late at the party, but this has been superseded by a
recent bump to 3.3.2, which includes those changes.

Thanks you!

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>  - Add URL to autobuilder failure
> 
>  ...ibsoxr-is-built-to-rely-on-libavutil.patch | 40 +++++++++++++++++++
>  ...f-HAVE_LIBSOXR-with-using-pkg_config.patch | 24 +++++++++++
>  2 files changed, 64 insertions(+)
>  create mode 100644 package/shairport-sync/0001-Sometimes-libsoxr-is-built-to-rely-on-libavutil.patch
>  create mode 100644 package/shairport-sync/0002-Include-a-definition-of-HAVE_LIBSOXR-with-using-pkg_config.patch
> 
> diff --git a/package/shairport-sync/0001-Sometimes-libsoxr-is-built-to-rely-on-libavutil.patch b/package/shairport-sync/0001-Sometimes-libsoxr-is-built-to-rely-on-libavutil.patch
> new file mode 100644
> index 0000000000..c76c4fa4fe
> --- /dev/null
> +++ b/package/shairport-sync/0001-Sometimes-libsoxr-is-built-to-rely-on-libavutil.patch
> @@ -0,0 +1,40 @@
> +From 5101ab2d13e2b89ea3c1276df5fb7413634eeccd Mon Sep 17 00:00:00 2001
> +From: Mike Brady <mikebrady@eircom.net>
> +Date: Sat, 25 Aug 2018 13:08:37 +0100
> +Subject: [PATCH] Sometimes libsoxr is built to rely on libavutil. If libavutil
> + is detected, link to it when building libsoxr. Add pgk_config support to soxr
> + selection.
> +
> +[Retrieved from:
> +https://github.com/mikebrady/shairport-sync/commit/5101ab2d13e2b89ea3c1276df5fb7413634eeccd]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + configure.ac | 15 ++++++++++++++-
> + 1 file changed, 14 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 0c917a43..2b6fddb3 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -176,7 +176,20 @@ AC_ARG_WITH(ssl, [ choose --with-ssl=openssl, --with-ssl=mbedtls or --with-ssl=p
> + # Look for soxr flag
> + AC_ARG_WITH(soxr, [  --with-soxr = choose libsoxr for high-quality interpolation], [
> +   AC_MSG_RESULT(>>Including support for soxr-based interpolation)
> +-  AC_CHECK_LIB([soxr],[soxr_create], , AC_MSG_ERROR(soxr support requested but libsoxr not found!))], )
> ++  if  test "x${with_pkg_config}" = xyes ; then
> ++    PKG_CHECK_MODULES(
> ++        [SOXR], [soxr],
> ++        [LIBS="${SOXR_LIBS} ${LIBS}"])
> ++  else
> ++    AC_CHECK_LIB([avutil],[av_get_cpu_flags])
> ++    if  test "x${ac_cv_lib_avutil_av_get_cpu_flags}" = xyes ; then
> ++      # soxr may link against libavutil, depending on the architecture, but for the sake of simplicity link with it if it is found
> ++      AC_CHECK_LIB([soxr],[soxr_create], , AC_MSG_ERROR(soxr support requested but libsoxr not found!), [-lavutil])
> ++    else
> ++      AC_CHECK_LIB([soxr],[soxr_create], , AC_MSG_ERROR(soxr support requested but libsoxr not found!))
> ++    fi
> ++  fi
> ++], )
> + 
> + # Look for metadata flag -- set flag for conditional compilation
> + AC_ARG_WITH(metadata, [  --with-metadata = include support for a metadata feed], [
> diff --git a/package/shairport-sync/0002-Include-a-definition-of-HAVE_LIBSOXR-with-using-pkg_config.patch b/package/shairport-sync/0002-Include-a-definition-of-HAVE_LIBSOXR-with-using-pkg_config.patch
> new file mode 100644
> index 0000000000..937e8385ba
> --- /dev/null
> +++ b/package/shairport-sync/0002-Include-a-definition-of-HAVE_LIBSOXR-with-using-pkg_config.patch
> @@ -0,0 +1,24 @@
> +From cd6a99a7cfde1c5e1c1cc74ee6a77041bb4012d9 Mon Sep 17 00:00:00 2001
> +From: Mike Brady <mikebrady@eircom.net>
> +Date: Sat, 8 Sep 2018 15:06:18 +0100
> +Subject: [PATCH] Include a definition of HAVE_LIBSOXR with using pkg_config
> +
> +[Retrieved from:
> +https://github.com/mikebrady/shairport-sync/commit/cd6a99a7cfde1c5e1c1cc74ee6a77041bb4012d9]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + configure.ac | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index ceec4af6..690a774f 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -180,6 +180,7 @@ AC_ARG_WITH(soxr, [  --with-soxr = choose libsoxr for high-quality interpolation
> +     PKG_CHECK_MODULES(
> +         [SOXR], [soxr],
> +         [LIBS="${SOXR_LIBS} ${LIBS}"])
> ++    AC_DEFINE([HAVE_LIBSOXR],[1],[Define to 1 if you are including support for soxr interpolation])
> +   else
> +     AC_CHECK_LIB([avutil],[av_get_cpu_flags])
> +     if  test "x${ac_cv_lib_avutil_av_get_cpu_flags}" = xyes ; then
> -- 
> 2.23.0.rc1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
