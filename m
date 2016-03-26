From: Erico Nunes <nunes.erico@gmail.com>
Date: Sat, 26 Mar 2016 15:25:32 -0300
Subject: [Buildroot] [PATCH 2/2] efibootmgr: new package
In-Reply-To: <1459016732-27843-1-git-send-email-nunes.erico@gmail.com>
References: <1459016732-27843-1-git-send-email-nunes.erico@gmail.com>
Message-ID: <1459016732-27843-2-git-send-email-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A Linux user-space application to modify the Intel Extensible Firmware
Interface (EFI) Boot Manager. This application can create and destroy
boot entries, change the boot order, change the next running boot
option, and more.

The only issue found was that it was trying to include headers from the
host, so $(STAGING_DIR) has been prepended to the include path so that
the package finds the right headers.

efibootmgr depends on the libraries provided by efivar.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 package/Config.in                  |  1 +
 package/efibootmgr/Config.in       | 10 ++++++++++
 package/efibootmgr/efibootmgr.hash |  2 ++
 package/efibootmgr/efibootmgr.mk   | 23 +++++++++++++++++++++++
 4 files changed, 36 insertions(+)
 create mode 100644 package/efibootmgr/Config.in
 create mode 100644 package/efibootmgr/efibootmgr.hash
 create mode 100644 package/efibootmgr/efibootmgr.mk

diff --git a/package/Config.in b/package/Config.in
index b8d142f..bd30c07 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1612,6 +1612,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 endif
 	source "package/cgroupfs-mount/Config.in"
 	source "package/dsp-tools/Config.in"
+	source "package/efibootmgr/Config.in"
 	source "package/efivar/Config.in"
 	source "package/emlog/Config.in"
 	source "package/ftop/Config.in"
diff --git a/package/efibootmgr/Config.in b/package/efibootmgr/Config.in
new file mode 100644
index 0000000..a784d8c
--- /dev/null
+++ b/package/efibootmgr/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_EFIBOOTMGR
+	bool "efibootmgr"
+	depends on BR2_PACKAGE_EFIVAR
+	help
+	  A Linux user-space application to modify the Intel Extensible
+	  Firmware Interface (EFI) Boot Manager. This application can create
+	  and destroy boot entries, change the boot order, change the next
+	  running boot option, and more.
+
+	  https://github.com/rhinstaller/efibootmgr
diff --git a/package/efibootmgr/efibootmgr.hash b/package/efibootmgr/efibootmgr.hash
new file mode 100644
index 0000000..a789942
--- /dev/null
+++ b/package/efibootmgr/efibootmgr.hash
@@ -0,0 +1,2 @@
+# locally computed hash
+sha256 b180d7d6b377d24b0872869f2571e2700b618e4d7ebdc2133134a918efe2623b efibootmgr-efibootmgr-0.12.tar.gz
diff --git a/package/efibootmgr/efibootmgr.mk b/package/efibootmgr/efibootmgr.mk
new file mode 100644
index 0000000..9156499
--- /dev/null
+++ b/package/efibootmgr/efibootmgr.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# efibootmgr
+#
+################################################################################
+
+EFIBOOTMGR_VERSION = efibootmgr-0.12
+EFIBOOTMGR_SITE = $(call github,rhinstaller,efibootmgr,$(EFIBOOTMGR_VERSION))
+EFIBOOTMGR_LICENSE = GPLv2
+EFIBOOTMGR_LICENSE_FILES = COPYING
+EFIBOOTMGR_DEPENDENCIES = efivar
+
+define EFIBOOTMGR_BUILD_CMDS
+	$(SED) 's,-I/,-I$(STAGING_DIR)/,' $(@D)/Makefile
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D)
+endef
+
+define EFIBOOTMGR_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/src/efibootmgr/efibootmgr \
+		$(TARGET_DIR)/usr/bin/efibootmgr
+endef
+
+$(eval $(generic-package))
-- 
2.7.4
