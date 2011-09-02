From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri,  2 Sep 2011 14:08:59 +0200
Subject: [Buildroot] [PATCH 1/2] Add support for package-declared devices
In-Reply-To: <cover.1314965303.git.maxime.ripard@free-electrons.com>
References: <cover.1314965303.git.maxime.ripard@free-electrons.com>
Message-ID: <4aaac08b6012188f28e05ee700f9be550b40dde4.1314965303.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a way for packages to declare files they need instead of relying
only on device tables, which creates files no matter if the package is
indeed enabled, as we can see for busybox.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 Makefile                    |    4 ++++
 fs/common.mk                |    1 +
 package/Makefile.package.in |    1 +
 3 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 9ed46fc..b293d2f 100644
--- a/Makefile
+++ b/Makefile
@@ -52,6 +52,10 @@ qstrip=$(strip $(subst ",,$(1)))
 comma:=,
 empty:=
 space:=$(empty) $(empty)
+define newline
+
+
+endef
 
 ifneq ("$(origin O)", "command line")
 O:=output
diff --git a/fs/common.mk b/fs/common.mk
index f793ff9..46d191b 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -50,6 +50,7 @@ $(BINARIES_DIR)/rootfs.$(1): $(ROOTFS_$(2)_DEPENDENCIES)
 	echo "chown -R 0:0 $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
 ifneq ($(ROOTFS_DEVICE_TABLES),)
 	cat $(ROOTFS_DEVICE_TABLES) > $(FULL_DEVICE_TABLE)
+	echo -e '$(subst $(newline),\n,$(PACKAGES_DEVICE_TABLE))' >> $(FULL_DEVICE_TABLE)
 	echo "$(HOST_DIR)/usr/bin/makedevs -d $(FULL_DEVICE_TABLE) $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
 endif
 	echo "$(ROOTFS_$(2)_CMD)" >> $(FAKEROOT_SCRIPT)
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 868bf28..d8d435e 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -541,6 +541,7 @@ endif
 ifeq ($$($$($(2)_KCONFIG_VAR)),y)
 
 TARGETS += $(1)
+PACKAGES_DEVICE_TABLE += $$($(2)_DEVICES)$$(newline)
 
 ifeq ($$($(2)_SITE_METHOD),svn)
 DL_TOOLS_DEPENDENCIES += svn
-- 
1.7.4.1
