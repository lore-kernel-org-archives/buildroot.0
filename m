From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 31 Jul 2016 12:35:05 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/transmission: Fix compilation
	when using system libminiupnpc with libutp disabled
Message-ID: <1469961305-25334-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/63a/63a3caac7e1e7b5ab268d9be3cd77617df619659/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: updated patch (Yann)

 package/transmission/0004-fix-utp-include.patch | 47 +++++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/transmission/0004-fix-utp-include.patch

diff --git a/package/transmission/0004-fix-utp-include.patch b/package/transmission/0004-fix-utp-include.patch
new file mode 100644
index 0000000..3613024
--- /dev/null
+++ b/package/transmission/0004-fix-utp-include.patch
@@ -0,0 +1,47 @@
+Fix compilation when using system libminiupnpc with libutp disabled
+
+If transmission uses its own copy of libminiupnpc in third-party/ then
+the configure script adds that path to CFLAGS:
+https://trac.transmissionbt.com/browser/trunk/configure.ac#L455
+
+This patch is also added if transmission uses its own copy of libutp:
+https://trac.transmissionbt.com/browser/trunk/configure.ac#L349
+
+But if a system-provided libminiupnpc is used and utp-support is
+disabled using --disable-utp the result is a build error, detected by
+buildroot autobuilders:
+http://autobuild.buildroot.net/results/b79/b79e51140cb0320554a58ce59dcb33f53cd9211a/build-end.log
+
+net.c:40:24: fatal error: libutp/utp.h: No such file or directory
+
+Patch proposed by Yann E. MORIN:
+http://lists.busybox.net/pipermail/buildroot/2016-July/167896.html
+
+Patch sent upstream: https://trac.transmissionbt.com/ticket/9554
+(awaiting moderation at the time of writing)
+
+Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
+
+diff -uNr transmission-2.92.org/configure.ac transmission-2.92/configure.ac
+--- transmission-2.92.org/configure.ac	2016-03-06 21:23:45.336198393 +0100
++++ transmission-2.92/configure.ac	2016-07-31 12:13:40.921660078 +0200
+@@ -358,6 +358,10 @@
+     else
+       AC_MSG_ERROR("Unable to build uTP support -- C++ compiler not found")
+     fi
++else
++    # For the system libminiupnpc with UTC disabled,
++    # point to our bundled UTP headers
++    LIBUTP_CFLAGS="-I\$(top_srcdir)/third-party/"
+ fi
+ AC_SUBST(LIBUTP_CFLAGS)
+ AC_SUBST(LIBUTP_LIBS)
+@@ -457,7 +461,7 @@
+     LIBUPNP_LIBS_QT="\$\${TRANSMISSION_TOP}/third-party/miniupnp/libminiupnp.a"
+ else
+     AC_DEFINE([SYSTEM_MINIUPNP])
+-    LIBUPNP_CFLAGS="" 
++    LIBUPNP_CFLAGS="${LIBUTP_CFLAGS}"
+     LIBUPNP_LIBS="-lminiupnpc"
+     LIBUPNP_LIBS_QT="-lminiupnpc"
+ fi
-- 
2.8.1
