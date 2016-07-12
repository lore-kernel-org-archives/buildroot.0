From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Jul 2016 18:42:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/transmission: Fix compilation
 when using system libminiupnpc with libutp disabled
In-Reply-To: <1467868386-32591-1-git-send-email-bernd.kuhls@t-online.de>
References: <1467868386-32591-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160712164247.GB3680@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2016-07-07 07:13 +0200, Bernd Kuhls spake thusly:
> Fixes
> http://autobuild.buildroot.net/results/b79/b79e51140cb0320554a58ce59dcb33f53cd9211a/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Sending the patch upstream failed until now because I could not finish
> my registration on trac.transmissionbt.com for over 12h. I will continue
> to try to send the patch upstream, but I need to receive a security
> token from upstream to finish my registration.
> 
>  package/transmission/0004-fix-utp-include.patch | 41 +++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/transmission/0004-fix-utp-include.patch
> 
> diff --git a/package/transmission/0004-fix-utp-include.patch b/package/transmission/0004-fix-utp-include.patch
> new file mode 100644
> index 0000000..e693bf9
> --- /dev/null
> +++ b/package/transmission/0004-fix-utp-include.patch
> @@ -0,0 +1,41 @@
> +Fix compilation when using system libminiupnpc with libutp disabled
> +
> +If transmission uses its own copy of libminiupnpc in third-party/ then
> +the configure script adds that path to CFLAGS:
> +https://trac.transmissionbt.com/browser/trunk/configure.ac#L455
> +
> +This patch is also added if transmission uses its own copy of libutp:
> +https://trac.transmissionbt.com/browser/trunk/configure.ac#L349
> +
> +But if a system-provided libminiupnpc is used and utp-support is
> +disabled using --disable-utp the result is a build error, detected by
> +buildroot autobuilders:
> +http://autobuild.buildroot.net/results/b79/b79e51140cb0320554a58ce59dcb33f53cd9211a/build-end.log
> +
> +net.c:40:24: fatal error: libutp/utp.h: No such file or directory
> +
> +This patch moves LIBUTP_CFLAGS outside the if-condition because
> +transmission needs utp.h regardless whether support for libutp is
> +enabled or not.
> +
> +Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
> +
> +diff -uNr transmission-2.92.org/configure.ac transmission-2.92/configure.ac
> +--- transmission-2.92.org/configure.ac	2016-03-06 21:23:45.336198393 +0100
> ++++ transmission-2.92/configure.ac	2016-07-06 22:27:25.809613723 +0200
> +@@ -333,6 +333,7 @@
> +     want_utp_default="no"
> + fi
> + 
> ++LIBUTP_CFLAGS="-I\$(top_srcdir)/third-party/"
> + AC_ARG_ENABLE([utp],
> +               AS_HELP_STRING([--enable-utp],[build ?TP support]),
> +               [want_utp=${enableval}],
> +@@ -346,7 +347,6 @@
> +         AC_DEFINE([WITH_UTP],[1])
> +         build_utp="system"
> +     elif test "x$CXX" != "x"; then
> +-        LIBUTP_CFLAGS="-I\$(top_srcdir)/third-party/"
> +         LIBUTP_LIBS="\$(top_builddir)/third-party/libutp/libutp.a"
> +         LIBUTP_LIBS_QT="\$\${TRANSMISSION_TOP}/third-party/libutp/libutp.a"
> +         if test "x$libutp_extra_libs" != "x" ; then
> -- 
> 2.8.1
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
