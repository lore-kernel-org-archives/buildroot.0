From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jun 2016 18:31:01 +0200
Subject: [Buildroot] [git commit] efibootmgr: new package
Message-ID: <20160612163208.3847881D8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2d8af430d6ed9b52117e2546d7a4ae8a51d2f87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A Linux user-space application to modify the Intel Extensible Firmware
Interface (EFI) Boot Manager. This application can create and destroy
boot entries, change the boot order, change the next running boot
option, and more.

The only issue found was that it was trying to include headers from the
host, so $(STAGING_DIR) has been prepended to the include path so that
the package finds the right headers.

efibootmgr depends on the libraries provided by efivar.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
[Thomas:
  - change the "depends on" for efivar to a "select", and propagate the
    relevant dependencies.
  - the license is GPLv2+, not GPLv2.
  - move the Makefile tweak to a post-patch hook rather than doing it as
    part of the build step.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                  |  1 +
 package/efibootmgr/Config.in       | 16 ++++++++++++++++
 package/efibootmgr/efibootmgr.hash |  2 ++
 package/efibootmgr/efibootmgr.mk   | 28 ++++++++++++++++++++++++++++
 4 files changed, 47 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index efce72d..03c67ce 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1658,6 +1658,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 endif
 	source "package/cgroupfs-mount/Config.in"
 	source "package/dsp-tools/Config.in"
+	source "package/efibootmgr/Config.in"
 	source "package/efivar/Config.in"
 	source "package/emlog/Config.in"
 	source "package/ftop/Config.in"
diff --git a/package/efibootmgr/Config.in b/package/efibootmgr/Config.in
new file mode 100644
index 0000000..cb1b18e
--- /dev/null
+++ b/package/efibootmgr/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_EFIBOOTMGR
+	bool "efibootmgr"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # efivar
+	depends on BR2_TOOLCHAIN_USES_GLIBC # efivar
+	select BR2_PACKAGE_EFIVAR
+	help
+	  A Linux user-space application to modify the Intel Extensible
+	  Firmware Interface (EFI) Boot Manager. This application can create
+	  and destroy boot entries, change the boot order, change the next
+	  running boot option, and more.
+
+	  https://github.com/rhinstaller/efibootmgr
+
+comment "efibootmgr requires an (e)glibc toolchain w/ headers >= 3.12"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
+		!BR2_TOOLCHAIN_USES_GLIBC
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
index 0000000..a0c5646
--- /dev/null
+++ b/package/efibootmgr/efibootmgr.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# efibootmgr
+#
+################################################################################
+
+EFIBOOTMGR_VERSION = efibootmgr-0.12
+EFIBOOTMGR_SITE = $(call github,rhinstaller,efibootmgr,$(EFIBOOTMGR_VERSION))
+EFIBOOTMGR_LICENSE = GPLv2+
+EFIBOOTMGR_LICENSE_FILES = COPYING
+EFIBOOTMGR_DEPENDENCIES = efivar
+
+define EFIBOOTMSR_PATCH_HEADER_PATH
+	$(SED) 's,-I/,-I$(STAGING_DIR)/,' $(@D)/Makefile
+endef
+
+EFIBOOTMGR_POST_PATCH_HOOKS += EFIBOOTMSR_PATCH_HEADER_PATH
+
+define EFIBOOTMGR_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D)
+endef
+
+define EFIBOOTMGR_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/src/efibootmgr/efibootmgr \
+		$(TARGET_DIR)/usr/bin/efibootmgr
+endef
+
+$(eval $(generic-package))
