From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 02 May 2014 22:59:00 +0200
Subject: [Buildroot] [PATCH v3 1/1] xlib_libXpm: Fix compilation on
 systems lacking fork().
In-Reply-To: <1398937003-14143-1-git-send-email-bernd.kuhls@t-online.de>
References: <1398937003-14143-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <53640714.8020807@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/05/14 11:36, Bernd Kuhls wrote:
> Fixes http://autobuild.buildroot.net/results/c57/c571b0a9d9f36a445ea36a4bd609154f9a9bddd5/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: check for fork(), unpacking of .Z and .gz files will be disabled (Thomas)
> v2: extend patch to reverse dependency of xlib_libXpm (Thomas)
> 
>  .../xlib_libXpm/xlib_libXpm-0001-detect-fork.patch |   66 ++++++++++++++++++++
>  package/x11r7/xlib_libXpm/xlib_libXpm.mk           |    1 +
>  2 files changed, 67 insertions(+)
>  create mode 100644 package/x11r7/xlib_libXpm/xlib_libXpm-0001-detect-fork.patch
> 
> diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm-0001-detect-fork.patch b/package/x11r7/xlib_libXpm/xlib_libXpm-0001-detect-fork.patch
> new file mode 100644
> index 0000000..4bf7aa1
> --- /dev/null
> +++ b/package/x11r7/xlib_libXpm/xlib_libXpm-0001-detect-fork.patch
> @@ -0,0 +1,66 @@
> +Fix compilation on systems lacking fork().
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +
> +diff -uNr libXpm-3.5.11.org/configure.ac libXpm-3.5.11/configure.ac
> +--- libXpm-3.5.11.org/configure.ac	2013-09-08 06:40:20.000000000 +0200
> ++++ libXpm-3.5.11/configure.ac	2014-05-01 09:56:42.000000000 +0200
> +@@ -20,7 +20,7 @@
> + XORG_DEFAULT_OPTIONS
> + 
> + # Checks for library functions
> +-AC_CHECK_FUNCS([strlcat])
> ++AC_CHECK_FUNCS([strlcat fork])

 Wouldn't it be simpler to do

AC_CHECK_FUNC([fork],[], AC_DEFINE(NO_ZPIPE))

? Then you don't need to make all the other changes below.


 Regards,
 Arnout

> + 
> + # Obtain compiler/linker options for dependencies
> + PKG_CHECK_MODULES(XPM, xproto x11)
> +diff -uNr libXpm-3.5.11.org/src/RdFToI.c libXpm-3.5.11/src/RdFToI.c
> +--- libXpm-3.5.11.org/src/RdFToI.c	2013-09-08 06:40:20.000000000 +0200
> ++++ libXpm-3.5.11/src/RdFToI.c	2014-05-01 10:57:43.000000000 +0200
> +@@ -128,7 +128,7 @@
> + }
> + #endif /* CXPMPROG */
> + 
> +-#ifndef NO_ZPIPE
> ++#if ! defined(NO_ZPIPE) && defined(HAVE_FORK)
> + /* Do not depend on errno after read_through */
> + FILE*
> + xpmPipeThrough(
> +@@ -202,7 +202,7 @@
> + 	mdata->type = XPMFILE;
> +     } else {
> + 	int fd = open(filename, O_RDONLY);
> +-#if defined(NO_ZPIPE)
> ++#if defined(NO_ZPIPE) || ! defined(HAVE_FORK)
> + 	if ( fd < 0 )
> + 	    return XpmOpenFailed;
> + #else
> +diff -uNr libXpm-3.5.11.org/src/WrFFrI.c libXpm-3.5.11/src/WrFFrI.c
> +--- libXpm-3.5.11.org/src/WrFFrI.c	2013-09-08 06:40:20.000000000 +0200
> ++++ libXpm-3.5.11/src/WrFFrI.c	2014-05-01 10:56:53.000000000 +0200
> +@@ -307,8 +307,7 @@
> +     fprintf(file, ",\n\"XPMENDEXT\"");
> + }
> + 
> +-
> +-#ifndef NO_ZPIPE
> ++#if ! defined(NO_ZPIPE) && defined(HAVE_FORK)
> + FUNC(xpmPipeThrough, FILE*, (int fd,
> + 			     const char* cmd,
> + 			     const char* arg1,
> +@@ -327,13 +326,13 @@
> + 	mdata->stream.file = (stdout);
> + 	mdata->type = XPMFILE;
> +     } else {
> +-#ifndef NO_ZPIPE
> ++#if ! defined(NO_ZPIPE) && defined(HAVE_FORK)
> + 	size_t len;
> + #endif
> + 	int fd = open(filename, O_WRONLY|O_CREAT|O_TRUNC, 0644);
> + 	if ( fd < 0 )
> + 	    return(XpmOpenFailed);
> +-#ifndef NO_ZPIPE
> ++#if ! defined(NO_ZPIPE) && defined(HAVE_FORK)
> + 	len = strlen(filename);
> + 	if (len > 2 && !strcmp(".Z", filename + (len - 2))) {
> + 	    mdata->stream.file = xpmPipeThrough(fd, "compress", NULL, "w");
> diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
> index 86f331b..b5eb558 100644
> --- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
> +++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
> @@ -9,6 +9,7 @@ XLIB_LIBXPM_SOURCE = libXpm-$(XLIB_LIBXPM_VERSION).tar.bz2
>  XLIB_LIBXPM_SITE = http://xorg.freedesktop.org/releases/individual/lib
>  XLIB_LIBXPM_LICENSE = MIT
>  XLIB_LIBXPM_LICENSE_FILES = COPYING
> +XLIB_LIBXPM_AUTORECONF = YES
>  XLIB_LIBXPM_INSTALL_STAGING = YES
>  XLIB_LIBXPM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xproto_xproto \
>  	host-gettext
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
