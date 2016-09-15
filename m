From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 15 Sep 2016 08:40:00 +0200
Subject: [Buildroot] [PATCH v2 5/6] package/upmpdcli: add patch to use
	pkg-config for libupnpp
In-Reply-To: <20160915064001.8684-1-joerg.krause@embedded.rocks>
References: <20160915064001.8684-1-joerg.krause@embedded.rocks>
Message-ID: <20160915064001.8684-6-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building upmpdcli aborts because of an unsafe header inclusion of
`/usr/include/libupnpp`. Using `{prefix}` to get the header path is
wrong for cross-compilation.

Instead of hard-coding the flags for libupnpp use pkg-config to get the
correct ones.

Note that this patch adds the host-pkgconfig dependency unconditionally and
removes the necessity to pass the libupnpp manually to LIBS for a static
build.

Upstream-status: https://github.com/medoc92/upmpdcli/pull/49

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 .../0002-use-pkg-config-for-libupnpp.patch         | 66 ++++++++++++++++++++++
 package/upmpdcli/upmpdcli.mk                       | 17 +-----
 2 files changed, 69 insertions(+), 14 deletions(-)
 create mode 100644 package/upmpdcli/0002-use-pkg-config-for-libupnpp.patch

diff --git a/package/upmpdcli/0002-use-pkg-config-for-libupnpp.patch b/package/upmpdcli/0002-use-pkg-config-for-libupnpp.patch
new file mode 100644
index 0000000..daef415
--- /dev/null
+++ b/package/upmpdcli/0002-use-pkg-config-for-libupnpp.patch
@@ -0,0 +1,66 @@
+From 16bcaaee1c28b972e0cc6a542f511af44306ce6c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Wed, 14 Sep 2016 11:43:21 +0200
+Subject: [PATCH] Use pkg-config for libupnpp
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Use pkg-config for libupnpp to fix build issues when cross-compiling and
+building upmpdcli statically.
+
+Building upmpdcli aborts because of an unsafe header inclusion of
+`/usr/include/libupnpp`. Using `{prefix}` to get the header path is wrong for
+cross-compilation. Instead of hard-coding the flags for libupnpp use pkg-config
+to get the correct ones.
+
+Upstream-status: https://github.com/medoc92/upmpdcli/pull/49
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ Makefile.am  | 2 +-
+ configure.ac | 8 ++++----
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index d0c10a4..5c83aa1 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,5 +1,5 @@
+ AM_CPPFLAGS = -DDEBUG -g -Wall \
+-            -I${prefix}/include/libupnpp \
++            $(upnpp_CFLAGS) \
+             -I$(top_srcdir)/src \
+             -DDATADIR=\"${pkgdatadir}\" -DCONFIGDIR=\"${sysconfdir}\"
+ 
+diff --git a/configure.ac b/configure.ac
+index 108dcce..a165b5d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -35,10 +35,10 @@ dnl AC_CHECK_LIB([upnp], [UpnpInit], [], AC_MSG_ERROR([libupnp not found]))
+ dnl AC_CHECK_LIB([curl], [curl_easy_init], [],AC_MSG_ERROR([libcurl not found]))
+ dnl AC_CHECK_LIB([expat], [XML_ParserCreate], [],AC_MSG_ERROR([libexpat not found]))
+ 
+-AC_CHECK_LIB([upnpp], [getsyshwaddr], [], [AC_MSG_ERROR([libupnpp])])
++PKG_CHECK_MODULES([upnpp], [libupnpp], [], [AC_MSG_ERROR([libupnpp])])
+ AC_CHECK_LIB([mpdclient], [mpd_connection_new], [],
+                           AC_MSG_ERROR([libmpdclient not found]))
+-SCCTL_LIBS=$LIBS
++SCCTL_LIBS="$LIBS $upnpp_LIBS"
+ 
+ AC_CHECK_LIB([microhttpd], [MHD_queue_response], [], [])
+ 
+@@ -56,8 +56,8 @@ AC_LINK_IFELSE([AC_LANG_PROGRAM(
+     [AC_MSG_ERROR([libjsoncpp not found.])])
+ AC_LANG_POP
+ 
+-UPMPDCLI_LIBS=$LIBS
+-echo "UPMPDCLI_LIBS=$LIBS"
++UPMPDCLI_LIBS="$LIBS $upnpp_LIBS"
++echo "UPMPDCLI_LIBS=$UPMPDCLI_LIBS"
+ 
+ LIBS=""
+ 
+-- 
+2.9.3
+
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index b70f413..3beda1b 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -8,23 +8,12 @@ UPMPDCLI_VERSION = 1.2.2
 UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = GPLv2+
 UPMPDCLI_LICENSE_FILES = COPYING
-UPMPDCLI_DEPENDENCIES = libmpdclient libupnpp libmicrohttpd jsoncpp
-# touching configure.ac in
+UPMPDCLI_DEPENDENCIES = host-pkgconf libmpdclient libupnpp libmicrohttpd jsoncpp
+# touching configure.ac and Makefile.am in
 #   0001-fix-jsoncpp-detection.patch
+#   0002-use-pkg-config-for-libupnpp.patch
 UPMPDCLI_AUTORECONF = YES
 
-ifeq ($(BR2_STATIC_LIBS),y)
-# Upmpdcli forgets to take the dependencies of libupnpp into
-# consideration, breaking static linking, so help it.
-# Libupnpp unfortunately doesn't provide a .pc file, so manually
-# handle the dependencies here.
-# The build system doesn't expand LIBS from the configure step, so
-# manually pass it to make.
-UPMPDCLI_DEPENDENCIES += host-pkgconf
-UPMPDCLI_MAKE_OPTS = \
-	LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs expat libcurl libupnp`"
-endif
-
 # Upmpdcli only runs if user upmpdcli exists
 define UPMPDCLI_USERS
 	upmpdcli -1 upmpdcli -1 * - - - Upmpdcli MPD UPnP Renderer Front-End
-- 
2.9.3
