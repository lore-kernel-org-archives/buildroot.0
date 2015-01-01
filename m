From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jan 2015 12:32:15 +0100
Subject: [Buildroot] [git commit] libwebsock: new package
Message-ID: <20150101113301.65393807AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a569dfc9db32dee4b07c56b70b8e4278f6451e6e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - Add dependency on BR2_TOOLCHAIN_HAS_THREADS
 - Improve Config.in help text
 - Fixup comment header in .mk file.
 - Use github helper.
 - Remove hash file (we're downloading from Git)
 - Fixup LICENSE_FILES
 - Remove LIBWEBSOCK_CFLAGS, they were the default.
 - Remove LIBWEBSOCK_LIBS, and instead use a patch to switch
   libwebsock configure script to use pkg-config.]

Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 ...se-pkg-config-to-detect-libevent-and-open.patch |   81 ++++++++++++++++++++
 package/libwebsock/Config.in                       |   16 ++++
 package/libwebsock/libwebsock.mk                   |   15 ++++
 4 files changed, 113 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 78aa842..0d7ff76 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -854,6 +854,7 @@ menu "Networking"
 	source "package/libupnpp/Config.in"
 	source "package/liburiparser/Config.in"
 	source "package/libvncserver/Config.in"
+	source "package/libwebsock/Config.in"
 	source "package/libwebsockets/Config.in"
 	source "package/neon/Config.in"
 	source "package/nss-mdns/Config.in"
diff --git a/package/libwebsock/0001-Switch-to-use-pkg-config-to-detect-libevent-and-open.patch b/package/libwebsock/0001-Switch-to-use-pkg-config-to-detect-libevent-and-open.patch
new file mode 100644
index 0000000..ea3fd00
--- /dev/null
+++ b/package/libwebsock/0001-Switch-to-use-pkg-config-to-detect-libevent-and-open.patch
@@ -0,0 +1,81 @@
+From a6c35dbab5a2a75c176e031122ee64152e50e5d3 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 1 Jan 2015 12:23:43 +0100
+Subject: [PATCH] Switch to use pkg-config to detect libevent and openssl
+
+Switching to pkg-config fixes a number of problems when detecting the
+libraries. For example the detection of libpthread was failing,
+because libevent_threads was added to LIBS before libevent itself,
+causing the libpthread test to fail due to missing symbols. pkg-config
+is anyway nowadays the preferred way for detecting libraries. It also
+has the benefit of working properly in static library situations.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac | 36 ++++++++++++------------------------
+ 1 file changed, 12 insertions(+), 24 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d4109ce..fc1cadc 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -27,35 +27,20 @@ AC_FUNC_MALLOC
+ AC_FUNC_REALLOC
+ AC_CHECK_FUNCS([memset socket strstr])
+ 
+-AC_CHECK_HEADERS([event2/thread.h], [
+-					LIBS="-levent_pthreads ${LIBS}"
+-				    ], [
+-                                                echo "libevent_pthreads required, failing"
+-                                                exit -1
+-                                                ])
+-AC_CHECK_LIB(pthread, pthread_create, [LIBS="-lpthread ${LIBS}"], [
++AC_CHECK_LIB(pthread, pthread_create, [PTHREAD_LIBS="-lpthread"], [
+                                                 echo "pthreads required, failing"
+                                                 exit -1
+                                                 ])
+-AC_CHECK_LIB(event, event_base_dispatch, [], [
+-						echo "libevent required, failing"
+-						exit -1
+-						])
++
++PKG_CHECK_MODULES([EVENT], [libevent])
++PKG_CHECK_MODULES([EVENT_PTHREAD], [libevent_pthreads])
+ 
+ AS_IF([test "x$with_ssl" != "xno"],
+ 	[
+-  	AC_CHECK_LIB([ssl], [SSL_CTX_new],
+-  		[
+-  			LIBS="-lssl ${LIBS}"
+-  			AC_CHECK_LIB([event_openssl], [bufferevent_openssl_socket_new], [
+-  				LIBS="-levent_openssl ${LIBS}"
+-  				have_ssl=yes
+-  			], [have_ssl=no])
+-  		], 
+-  		[have_ssl=no])
+-  	],
+-  	[have_ssl=no])
+-  	
++	PKG_CHECK_MODULES([SSL], [openssl], [have_ssl=yes], [have_ssl=no])
++	AS_IF([test "x${have_ssl}" = "xyes"],
++		[PKG_CHECK_MODULES([EVENT_OPENSSL], [libevent_openssl], [have_ssl=yes], [have_ssl=no])])])
++
+ AS_IF([test "x$have_ssl" = "xyes"],
+ 	[
+ 		AC_DEFINE([WEBSOCK_HAVE_SSL], [1], [Define if building SSL support])
+@@ -63,8 +48,11 @@ AS_IF([test "x$have_ssl" = "xyes"],
+ 	[AS_IF([test "x$with_ssl" = "xyes"],
+ 		[AC_MSG_ERROR([SSL support requested but not found])
+ 	])])
+-  	
++
+ AM_CONDITIONAL([HAVE_SSL], [test "x$have_ssl" = "xyes"])
++
++LIBS="${EVENT_LIBS} ${EVENT_PTHREAD_LIBS} ${PTHREAD_LIBS} ${SSL_LIBS} ${EVENT_OPENSSL_LIBS}"
++
+ AC_DEFINE_UNQUOTED([WEBSOCK_PACKAGE_VERSION], ["$PACKAGE_VERSION"], [libwebsock version])
+ AC_DEFINE_UNQUOTED([WEBSOCK_PACKAGE_STRING], ["$PACKAGE_STRING"], [libwebsock package string])
+ AC_DEFINE_UNQUOTED([WEBSOCK_PACKAGE_NAME], ["$PACKAGE_NAME"], [libwebsock package name])
+-- 
+2.1.0
+
diff --git a/package/libwebsock/Config.in b/package/libwebsock/Config.in
new file mode 100644
index 0000000..9ef2136
--- /dev/null
+++ b/package/libwebsock/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_LIBWEBSOCK
+	bool "libwebsock"
+	select BR2_PACKAGE_LIBEVENT
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  C library for easy WebSockets servers.
+
+	  This library allows a developer to quickly develop WebSocket
+	  servers by focusing on the actual logic of your WebSocket
+	  implementation instead of the details of the WebSocket
+	  protocol or even specifics of C sockets.
+
+	  https://github.com/payden/libwebsock
+
+comment "libwebsock needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libwebsock/libwebsock.mk b/package/libwebsock/libwebsock.mk
new file mode 100644
index 0000000..8458883
--- /dev/null
+++ b/package/libwebsock/libwebsock.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libwebsock
+#
+################################################################################
+
+LIBWEBSOCK_VERSION = 3c1615eeadb0b582b63851073bfe3e5132f31ebc
+LIBWEBSOCK_SITE = $(call github,payden,libwebsock,$(LIBWEBSOCK_VERSION))
+LIBWEBSOCK_DEPENDENCIES = libevent host-pkgconf
+LIBWEBSOCK_AUTORECONF = YES
+LIBWEBSOCK_INSTALL_STAGING = YES
+LIBWEBSOCK_LICENSE = LGPLv3
+LIBWEBSOCK_LICENSE_FILES = COPYING.lesser
+
+$(eval $(autotools-package))
