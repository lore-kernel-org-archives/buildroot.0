From: Wojciech Nizinski <niziak@spox.org>
Date: Tue,  5 Apr 2016 21:32:15 +0200
Subject: [Buildroot] [PATCH 1/1] new package: fwup (host and target)
Message-ID: <1459884735-16102-1-git-send-email-niziak@spox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To easily generate bootable binary image of SD card.
BR package files comes from project https://github.com/fhunleth/bbb-
buildroot-fwup

Signed-off-by: Wojciech Nizinski <niziak@spox.org>
---
 package/Config.in                |  1 +
 package/Config.in.host           |  1 +
 package/fwup/Config.in           | 14 ++++++++++++++
 package/fwup/Config.in.host      |  6 ++++++
 package/fwup/fwup.mk             | 21 +++++++++++++++++++++
 package/libarchive/libarchive.mk |  1 +
 package/libsodium/libsodium.mk   |  1 +
 7 files changed, 45 insertions(+)
 create mode 100644 package/fwup/Config.in
 create mode 100644 package/fwup/Config.in.host
 create mode 100644 package/fwup/fwup.mk

diff --git a/package/Config.in b/package/Config.in
index 5dd6374..58666af 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -171,6 +171,7 @@ menu "Filesystem and flash utilities"
 	source "package/exfat-utils/Config.in"
 	source "package/f2fs-tools/Config.in"
 	source "package/flashbench/Config.in"
+	source "package/fwup/Config.in"
 	source "package/genext2fs/Config.in"
 	source "package/genpart/Config.in"
 	source "package/genromfs/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index 1c691a3..2b1bde7 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -10,6 +10,7 @@ menu "Host utilities"
 	source "package/e2fsprogs/Config.in.host"
 	source "package/e2tools/Config.in.host"
 	source "package/faketime/Config.in.host"
+	source "package/fwup/Config.in.host"
 	source "package/genext2fs/Config.in.host"
 	source "package/genimage/Config.in.host"
 	source "package/genpart/Config.in.host"
diff --git a/package/fwup/Config.in b/package/fwup/Config.in
new file mode 100644
index 0000000..67736b2
--- /dev/null
+++ b/package/fwup/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_FWUP
+	bool "fwup"
+	depends on BR2_USE_MMU
+	select BR2_PACKAGE_LIBARCHIVE
+	select BR2_PACKAGE_ZLIB        # required by libarchive to include zip compression
+	select BR2_PACKAGE_LIBCONFUSE
+	select BR2_PACKAGE_LIBSODIUM
+	help
+	  Fwup is a scriptable embedded Linux firmware update creator and runner.
+
+	  https://github.com/fhunleth/fwup
+
+comment "fwup needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/fwup/Config.in.host b/package/fwup/Config.in.host
new file mode 100644
index 0000000..ae71a33
--- /dev/null
+++ b/package/fwup/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_FWUP
+	bool "host fwup"
+	help
+	  Fwup is a scriptable embedded Linux firmware update creator and runner.
+
+	  https://github.com/fhunleth/fwup
diff --git a/package/fwup/fwup.mk b/package/fwup/fwup.mk
new file mode 100644
index 0000000..1feee07
--- /dev/null
+++ b/package/fwup/fwup.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# fwup
+#
+#############################################################
+
+FWUP_VERSION = v0.6.1
+FWUP_SITE = $(call github,fhunleth,fwup,$(FWUP_VERSION))
+FWUP_LICENSE = Apache-2.0
+FWUP_LICENSE_FILES = LICENSE
+FWUP_AUTORECONF = YES
+FWUP_DEPENDENCIES = libconfuse libarchive libsodium
+
+define FWUP_RUN_AUTOGEN
+	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
+endef
+HOST_FWUP_PRE_CONFIGURE_HOOKS += FWUP_RUN_AUTOGEN
+FWUP_PRE_CONFIGURE_HOOKS += FWUP_RUN_AUTOGEN
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 206de3f..f45335e 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -93,3 +93,4 @@ LIBARCHIVE_CONF_OPTS += --without-lzma
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
diff --git a/package/libsodium/libsodium.mk b/package/libsodium/libsodium.mk
index 09bc777..fd89ced 100644
--- a/package/libsodium/libsodium.mk
+++ b/package/libsodium/libsodium.mk
@@ -15,3 +15,4 @@ LIBSODIUM_CONF_OPTS += --disable-pie
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.1.4
