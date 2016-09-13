From: Erico Nunes <nunes.erico@gmail.com>
Date: Tue, 13 Sep 2016 06:15:45 +0200
Subject: [Buildroot] [PATCH 2/5] grub2-tools: new package
In-Reply-To: <20160913041548.10290-1-nunes.erico@gmail.com>
References: <20160913041548.10290-1-nunes.erico@gmail.com>
Message-ID: <20160913041548.10290-3-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support tools to interact with GNU GRUB Multiboot boot loader.

In the context of Buildroot, some useful target tools provided by
grub2-tools are grub2-editenv, grub2-reboot, which provide means to
manage the Grub 2 environment, boot order, and others.

This package is also meant as a preparation step to be turned into a
host-package later and help decouple the target and host portions of the
actual Grub 2 boot loader package.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 package/Config.in                    |  1 +
 package/grub2-tools/Config.in        |  6 +++++
 package/grub2-tools/grub2-tools.hash |  2 ++
 package/grub2-tools/grub2-tools.mk   | 44 ++++++++++++++++++++++++++++++++++++
 4 files changed, 53 insertions(+)
 create mode 100644 package/grub2-tools/Config.in
 create mode 100644 package/grub2-tools/grub2-tools.hash
 create mode 100644 package/grub2-tools/grub2-tools.mk

diff --git a/package/Config.in b/package/Config.in
index 332f05d..e8f90df 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -379,6 +379,7 @@ endmenu
 	source "package/gpm/Config.in"
 	source "package/gpsd/Config.in"
 	source "package/gptfdisk/Config.in"
+	source "package/grub2-tools/Config.in"
 	source "package/gvfs/Config.in"
 	source "package/hdparm/Config.in"
 	source "package/hwdata/Config.in"
diff --git a/package/grub2-tools/Config.in b/package/grub2-tools/Config.in
new file mode 100644
index 0000000..9cc9e9c
--- /dev/null
+++ b/package/grub2-tools/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_GRUB2_TOOLS
+	bool "grub2-tools"
+	help
+	  Support tools to interact with GNU GRUB Multiboot boot loader.
+
+	  http://www.gnu.org/software/grub/
diff --git a/package/grub2-tools/grub2-tools.hash b/package/grub2-tools/grub2-tools.hash
new file mode 100644
index 0000000..051a9ab
--- /dev/null
+++ b/package/grub2-tools/grub2-tools.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 680f584995cf318adb1ff8c40caef30d0ec7c03e16e88ba60bf5aa5b5a6e26ed grub2-4e0f8f66e321cf1051c0e01f6fbcc6fc35a807b6.tar.gz
diff --git a/package/grub2-tools/grub2-tools.mk b/package/grub2-tools/grub2-tools.mk
new file mode 100644
index 0000000..8ed23f3
--- /dev/null
+++ b/package/grub2-tools/grub2-tools.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# grub2-tools
+#
+################################################################################
+
+GRUB2_TOOLS_VERSION = 4e0f8f66e321cf1051c0e01f6fbcc6fc35a807b6
+GRUB2_TOOLS_SITE = git://git.savannah.gnu.org/grub.git
+GRUB2_TOOLS_SITE_METHOD = git
+GRUB2_TOOLS_LICENSE = GPLv3+
+GRUB2_TOOLS_LICENSE_FILES = COPYING
+GRUB2_TOOLS_DEPENDENCIES = host-bison host-flex
+HOST_GRUB2_TOOLS_DEPENDENCIES = host-bison host-flex
+
+HOST_GRUB2_TOOLS_CONF_ENV = \
+	CPP="$(HOSTCC) -E"
+
+GRUB2_TOOLS_CONF_ENV = \
+	CPP="$(TARGET_CC) -E" \
+	TARGET_CC="$(TARGET_CC)" \
+	TARGET_CFLAGS="$(TARGET_CFLAGS)" \
+	TARGET_CPPFLAGS="$(TARGET_CPPFLAGS)" \
+	TARGET_LDFLAGS="$(TARGET_LDFLAGS)" \
+	TARGET_NM="$(TARGET_NM)" \
+	TARGET_OBJCOPY="$(TARGET_OBJCOPY)" \
+	TARGET_STRIP="$(TARGET_CROSS)strip"
+
+GRUB2_TOOLS_CONF_OPTS = \
+	--disable-grub-mkfont \
+	--enable-efiemu=no \
+	ac_cv_lib_lzma_lzma_code=no \
+	--enable-device-mapper=no \
+	--enable-libzfs=no \
+	--disable-werror
+
+HOST_GRUB2_TOOLS_CONF_OPTS = $(GRUB2_TOOLS_CONF_OPTS)
+
+define GRUB2_TOOLS_RUN_AUTOGEN
+	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
+endef
+GRUB2_TOOLS_PRE_CONFIGURE_HOOKS += GRUB2_TOOLS_RUN_AUTOGEN
+HOST_GRUB2_TOOLS_PRE_CONFIGURE_HOOKS += GRUB2_TOOLS_RUN_AUTOGEN
+
+$(eval $(autotools-package))
-- 
2.9.3
