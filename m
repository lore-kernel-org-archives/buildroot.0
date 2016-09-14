From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed, 14 Sep 2016 13:41:44 +0200
Subject: [Buildroot] [PATCH 5/7] package/upmpdcli: add patch to fix unsafe
	header path
In-Reply-To: <20160914114146.3796-1-joerg.krause@embedded.rocks>
References: <20160914114146.3796-1-joerg.krause@embedded.rocks>
Message-ID: <20160914114146.3796-6-joerg.krause@embedded.rocks>
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

Note that this add the host-pkgconfig dependency unconditionally.

Upstream-status: https://github.com/medoc92/upmpdcli/pull/49

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 ...x-unsafe-header-path-when-cross-compiling.patch | 48 ++++++++++++++++++++++
 package/upmpdcli/upmpdcli.mk                       |  4 +-
 2 files changed, 50 insertions(+), 2 deletions(-)
 create mode 100644 package/upmpdcli/0002-Fix-unsafe-header-path-when-cross-compiling.patch

diff --git a/package/upmpdcli/0002-Fix-unsafe-header-path-when-cross-compiling.patch b/package/upmpdcli/0002-Fix-unsafe-header-path-when-cross-compiling.patch
new file mode 100644
index 0000000..44d9814
--- /dev/null
+++ b/package/upmpdcli/0002-Fix-unsafe-header-path-when-cross-compiling.patch
@@ -0,0 +1,48 @@
+From 0cf81723bf5de00723ec149bcfa4f2050a4c3a04 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Wed, 14 Sep 2016 11:43:21 +0200
+Subject: [PATCH] Fix unsafe header path when cross-compiling
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
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
+ configure.ac | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
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
+index 108dcce..1c3985e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -35,7 +35,7 @@ dnl AC_CHECK_LIB([upnp], [UpnpInit], [], AC_MSG_ERROR([libupnp not found]))
+ dnl AC_CHECK_LIB([curl], [curl_easy_init], [],AC_MSG_ERROR([libcurl not found]))
+ dnl AC_CHECK_LIB([expat], [XML_ParserCreate], [],AC_MSG_ERROR([libexpat not found]))
+ 
+-AC_CHECK_LIB([upnpp], [getsyshwaddr], [], [AC_MSG_ERROR([libupnpp])])
++PKG_CHECK_MODULES([upnpp], [libupnpp], [], [AC_MSG_ERROR([libupnpp])])
+ AC_CHECK_LIB([mpdclient], [mpd_connection_new], [],
+                           AC_MSG_ERROR([libmpdclient not found]))
+ SCCTL_LIBS=$LIBS
+-- 
+2.9.3
+
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index b70f413..3f521cf 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -8,9 +8,10 @@ UPMPDCLI_VERSION = 1.2.2
 UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = GPLv2+
 UPMPDCLI_LICENSE_FILES = COPYING
-UPMPDCLI_DEPENDENCIES = libmpdclient libupnpp libmicrohttpd jsoncpp
+UPMPDCLI_DEPENDENCIES = host-pkgconf libmpdclient libupnpp libmicrohttpd jsoncpp
 # touching configure.ac in
 #   0001-fix-jsoncpp-detection.patch
+#   0002-Fix-unsafe-header-path-when-cross-compiling
 UPMPDCLI_AUTORECONF = YES
 
 ifeq ($(BR2_STATIC_LIBS),y)
@@ -20,7 +21,6 @@ ifeq ($(BR2_STATIC_LIBS),y)
 # handle the dependencies here.
 # The build system doesn't expand LIBS from the configure step, so
 # manually pass it to make.
-UPMPDCLI_DEPENDENCIES += host-pkgconf
 UPMPDCLI_MAKE_OPTS = \
 	LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs expat libcurl libupnp`"
 endif
-- 
2.9.3
