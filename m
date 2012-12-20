From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 20 Dec 2012 05:10:13 +0200
Subject: [Buildroot] [PATCH 01/12] elfutils: new package
In-Reply-To: <1355973013-22849-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1355973013-22849-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <1355973013-22849-2-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Elfutils package
argp-standalone (which is needed by elfutils) has
to be compiled as position-independent code.
Otherwise compilation will abort at some point.

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/argp-standalone/argp-standalone-PIC.patch |   11 ++++++
 package/argp-standalone/argp-standalone.mk        |    1 +
 package/elfutils/Config.in                        |   25 ++++++++++++++
 package/elfutils/elfutils.mk                      |   36 +++++++++++++++++++++
 4 files changed, 73 insertions(+), 0 deletions(-)
 create mode 100644 package/argp-standalone/argp-standalone-PIC.patch
 create mode 100644 package/elfutils/Config.in
 create mode 100644 package/elfutils/elfutils.mk

diff --git a/package/argp-standalone/argp-standalone-PIC.patch b/package/argp-standalone/argp-standalone-PIC.patch
new file mode 100644
index 0000000..8cf8bd6
--- /dev/null
+++ b/package/argp-standalone/argp-standalone-PIC.patch
@@ -0,0 +1,11 @@
+--- argp-standalone-1.3.org/configure.ac	2012-12-18 03:56:46.660018525 +0200
++++ argp-standalone-1.3/configure.ac	2012-12-18 03:59:45.822789182 +0200
+@@ -88,7 +88,7 @@
+   CFLAGS="$CFLAGS -Wall -W \
+  -Wmissing-prototypes -Wmissing-declarations -Wstrict-prototypes \
+  -Waggregate-return \
+- -Wpointer-arith -Wbad-function-cast -Wnested-externs"
++ -Wpointer-arith -Wbad-function-cast -Wnested-externs -DPIC -fPIC"
+ fi
+ 
+ CPPFLAGS="$CPPFLAGS -I$srcdir"
diff --git a/package/argp-standalone/argp-standalone.mk b/package/argp-standalone/argp-standalone.mk
index 47c09b2..4d7f726 100644
--- a/package/argp-standalone/argp-standalone.mk
+++ b/package/argp-standalone/argp-standalone.mk
@@ -7,6 +7,7 @@
 ARGP_STANDALONE_VERSION = 1.3
 ARGP_STANDALONE_SITE = http://www.lysator.liu.se/~nisse/archive
 ARGP_STANDALONE_INSTALL_STAGING = YES
+ARGP_AUTORECONF = YES
 
 define ARGP_STANDALONE_INSTALL_STAGING_CMDS
 	$(INSTALL) -D $(@D)/libargp.a $(STAGING_DIR)/usr/lib/libargp.a
diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
new file mode 100644
index 0000000..8e8e008
--- /dev/null
+++ b/package/elfutils/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_ELFUTILS
+	bool "elfutils"
+	select BR2_PACKAGE_ARGP_STANDALONE
+	help
+	  Libraries/utilities to handle ELF objects (drop in replacement for libelf)
+
+	  https://fedorahosted.org/elfutils
+
+config BR2_PACKAGE_ELFUTILS_ZLIB_SUPPORT
+	bool "zlib support"
+	depends on BR2_PACKAGE_ELFUTILS
+	help
+	  Enable zlib support
+
+config BR2_PACKAGE_ELFUTILS_BZIP2_SUPPORT
+	bool "bzip2 support"
+	depends on BR2_PACKAGE_ELFUTILS
+	help
+	  Enable bzip2 support
+
+config BR2_PACKAGE_ELFUTILS_LZMA_SUPPORT
+	bool "lzma support"
+	depends on BR2_PACKAGE_ELFUTILS
+	help
+	  Enable lzma support
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
new file mode 100644
index 0000000..01ce3b3
--- /dev/null
+++ b/package/elfutils/elfutils.mk
@@ -0,0 +1,36 @@
+#############################################################
+#
+# elfutils
+#
+#############################################################
+ELFUTILS_VERSION = 0.155
+ELFUTILS_SOURCE = elfutils-$(ELFUTILS_VERSION).tar.bz2
+ELFUTILS_SITE = https://fedorahosted.org/releases/e/l/elfutils/$(ELFUTILS_VERSION)
+ELFUTILS_AUTORECONF = YES
+ELFUTILS_CONF_OPT += --disable-werror --program-prefix="eu-"
+ELFUTILS_CFLAGS= -fPIC
+ELFUTILS_DEPENDENCIES += argp-standalone
+
+ifeq ($(BR2_PACKAGE_ELFUTILS_ZLIB_SUPPORT),y)
+ ELFUTILS_DEPENDENCIES += zlib
+ ELFUTILS_CONF_OPT += --with-zlib
+else
+ ELFUTILS_CONF_OPT += --without-zlib
+endif
+
+ifeq ($(BR2_PACKAGE_ELFUTILS_BZIP2_SUPPORT),y)
+ ELFUTILS_DEPENDENCIES += bzip2
+ ELFUTILS_CONF_OPT += --with-bzlib
+else
+ ELFUTILS_CONF_OPT += --without-bzlib
+endif
+
+ifeq ($(BR2_PACKAGE_ELFUTILS_LZMA_SUPPORT),y)
+ ELFUTILS_DEPENDENCIES += xz
+ ELFUTILS_CONF_OPT += --with-lzma
+else
+ ELFUTILS_CONF_OPT += --without-lzma
+endif
+
+$(eval $(autotools-package))
+
-- 
1.7.7.6
