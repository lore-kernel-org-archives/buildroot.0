From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 20 Dec 2012 01:43:39 +0200
Subject: [Buildroot] [PATCH 01/12] elfutils: new package
In-Reply-To: <y>
References: <y>
Message-ID: <1355960630-25089-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>

Elfutils package.
argp-standalone (which elfutils needs when compiling against uClibc)
has to be compiled as position-independent code.
Otherwise compilation will abort at some point.

---
 package/argp-standalone/argp-standalone.mk |    1 +
 package/elfutils/Config.in                 |   25 ++++++++++++++++++++
 package/elfutils/elfutils.mk               |   35 ++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+), 0 deletions(-)
 create mode 100644 package/elfutils/Config.in
 create mode 100644 package/elfutils/elfutils.mk

diff --git a/package/argp-standalone/argp-standalone.mk b/package/argp-standalone/argp-standalone.mk
index 47c09b2..2237c6d 100644
--- a/package/argp-standalone/argp-standalone.mk
+++ b/package/argp-standalone/argp-standalone.mk
@@ -7,6 +7,7 @@
 ARGP_STANDALONE_VERSION = 1.3
 ARGP_STANDALONE_SITE = http://www.lysator.liu.se/~nisse/archive
 ARGP_STANDALONE_INSTALL_STAGING = YES
+ARGP_CFLAGS += "$(TARGET_CFLAGS) -fPIC"
 
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
index 0000000..a141697
--- /dev/null
+++ b/package/elfutils/elfutils.mk
@@ -0,0 +1,35 @@
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
