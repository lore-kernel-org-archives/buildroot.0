From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  5 Mar 2021 15:59:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/libshout: disable tools
Message-ID: <20210305145928.2007111-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will fix static build of libshout in version 2.4.5 with openssl
(tools were added by
https://gitlab.xiph.org/xiph/icecast-libshout/-/commit/34a535bdbb7d8bb4545d2bd71ba29a212e83041e)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...re.ac-add-an-option-to-disable-tools.patch | 51 +++++++++++++++++++
 package/libshout/libshout.mk                  |  6 ++-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 package/libshout/0001-configure.ac-add-an-option-to-disable-tools.patch

diff --git a/package/libshout/0001-configure.ac-add-an-option-to-disable-tools.patch b/package/libshout/0001-configure.ac-add-an-option-to-disable-tools.patch
new file mode 100644
index 0000000000..5c20db72e9
--- /dev/null
+++ b/package/libshout/0001-configure.ac-add-an-option-to-disable-tools.patch
@@ -0,0 +1,51 @@
+From 148b56bf894192cef6dd133715e295260b934a71 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 5 Mar 2021 15:50:32 +0100
+Subject: [PATCH] configure.ac: add an option to disable tools
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.xiph.org/xiph/icecast-libshout/-/issues/2331]
+---
+ Makefile.am  | 5 ++++-
+ configure.ac | 5 +++++
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index ea855cf..79241f1 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -3,10 +3,13 @@
+ AUTOMAKE_OPTIONS = 1.6 foreign
+ ACLOCAL_AMFLAGS = -I m4
+ 
+-SUBDIRS = include src doc win32 tools
++SUBDIRS = include src doc win32
+ if HAVE_EXAMPLES
+ SUBDIRS += examples
+ endif
++if HAVE_TOOLS
++SUBDIRS += tools
++endif
+ 
+ EXTRA_DIST = INSTALL m4/shout.m4 m4/acx_pthread.m4 \
+ 	m4/ogg.m4 m4/vorbis.m4 m4/xiph_compiler.m4 m4/xiph_net.m4 \
+diff --git a/configure.ac b/configure.ac
+index 264b9b0..34f971c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -100,6 +100,11 @@ AC_ARG_ENABLE([examples],
+   AS_HELP_STRING([--disable-examples],[Do not build example code]))
+ AM_CONDITIONAL([HAVE_EXAMPLES],[test "${enable_examples}" != "no"])
+ 
++dnl Allow tools not to be build
++AC_ARG_ENABLE([tools],
++  AS_HELP_STRING([--disable-tools],[Do not build tools]))
++AM_CONDITIONAL([HAVE_TOOLS],[test "${enable_tools}" != "no"])
++
+ dnl Module checks
+ XIPH_NET
+ 
+-- 
+2.30.0
+
diff --git a/package/libshout/libshout.mk b/package/libshout/libshout.mk
index 01ccf22e23..57d26390c5 100644
--- a/package/libshout/libshout.mk
+++ b/package/libshout/libshout.mk
@@ -10,7 +10,11 @@ LIBSHOUT_LICENSE = LGPL-2.0+
 LIBSHOUT_LICENSE_FILES = COPYING
 LIBSHOUT_INSTALL_STAGING = YES
 LIBSHOUT_DEPENDENCIES = host-pkgconf libogg libvorbis
-LIBSHOUT_CONF_OPTS = --disable-examples
+# We're patching configure.ac
+LIBSHOUT_AUTORECONF = YES
+LIBSHOUT_CONF_OPTS = \
+	--disable-examples \
+	--disable-tools
 
 ifeq ($(BR2_PACKAGE_LIBTHEORA),y)
 LIBSHOUT_CONF_OPTS += --enable-theora
-- 
2.30.0
