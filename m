From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 Feb 2020 21:02:42 +0100
Subject: [Buildroot] [PATCH 2/2] package/ser2net: fix static build
In-Reply-To: <20200216200242.1414766-1-fontaine.fabrice@gmail.com>
References: <20200216200242.1414766-1-fontaine.fabrice@gmail.com>
Message-ID: <20200216200242.1414766-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/f15cf961ddaf849987afce01ede0e3d1e77a0fc0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-pkg-config-to-retrieve-gensio-depen.patch | 46 +++++++++++++++++++
 package/ser2net/ser2net.mk                    |  2 +
 2 files changed, 48 insertions(+)
 create mode 100644 package/ser2net/0001-configure.ac-use-pkg-config-to-retrieve-gensio-depen.patch

diff --git a/package/ser2net/0001-configure.ac-use-pkg-config-to-retrieve-gensio-depen.patch b/package/ser2net/0001-configure.ac-use-pkg-config-to-retrieve-gensio-depen.patch
new file mode 100644
index 0000000000..30811d6c05
--- /dev/null
+++ b/package/ser2net/0001-configure.ac-use-pkg-config-to-retrieve-gensio-depen.patch
@@ -0,0 +1,46 @@
+From 047f05862880f370b4ef3bf718557f18ac429787 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 12 Feb 2020 09:06:02 +0100
+Subject: [PATCH] configure.ac: use pkg-config to retrieve gensio dependencies
+
+gensio can optionally depends on openssl so use pkg-config to retrieve
+those static dependencies thanks to libgensio.pc
+
+This will avoid the following build failure when building statically:
+
+checking gensio/gensio.h usability... yes
+checking gensio/gensio.h presence... yes
+checking for gensio/gensio.h... yes
+checking for str_to_gensio in -lgensio... no
+configure: error: libgensio won't link, please install gensio dev package
+
+Fixes:
+ - http://autobuild.buildroot.org/results/f15cf961ddaf849987afce01ede0e3d1e77a0fc0
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/cminyard/ser2net/commit/047f05862880f370b4ef3bf718557f18ac429787]
+---
+ configure.ac | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 011f9df..c5af1fc 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -40,10 +40,11 @@ AC_CONFIG_MACRO_DIR([m4])
+ AC_STDC_HEADERS
+ AC_CHECK_LIB(nsl,main)
+ 
+-AC_CHECK_HEADER(gensio/gensio.h, [],
+-   [AC_MSG_ERROR([gensio.h not found, please install gensio dev package])])
+-AC_CHECK_LIB(gensio, str_to_gensio, [],
+-   [AC_MSG_ERROR([libgensio won't link, please install gensio dev package])])
++PKG_CHECK_MODULES(GENSIO, libgensio, [LIBS=$GENSIO_LIBS],
++   [AC_CHECK_HEADER(gensio/gensio.h, [],
++      [AC_MSG_ERROR([gensio.h not found, please install gensio dev package])])
++   AC_CHECK_LIB(gensio, str_to_gensio, [],
++      [AC_MSG_ERROR([libgensio won't link, please install gensio dev package])])])
+ 
+ AC_CHECK_HEADER(yaml.h, [],
+    [AC_MSG_ERROR([yaml.h not found, please install libyaml dev package])])
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 2ea68ccc43..7f6076a1c8 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -9,6 +9,8 @@ SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPL-2.0+
 SER2NET_LICENSE_FILES = COPYING
 SER2NET_DEPENDENCIES = gensio libyaml
+# We're patching configure.ac
+SER2NET_AUTORECONF = YES
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 SER2NET_CONF_OPTS += --with-pthreads
-- 
2.24.1
