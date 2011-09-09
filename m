From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri,  9 Sep 2011 16:05:09 +0200
Subject: [Buildroot] [PATCH 3/4] Add support for package-declared devices
In-Reply-To: <cover.1315577080.git.maxime.ripard@free-electrons.com>
References: <cover.1315577080.git.maxime.ripard@free-electrons.com>
Message-ID: <27c148fb963fc098010e2c4bc37c3d8558313799.1315577080.git.maxime.ripard@free-electrons.com>
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
index 2ee318a..ae4f83c 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -50,6 +50,7 @@ $(BINARIES_DIR)/rootfs.$(1): $(ROOTFS_$(2)_DEPENDENCIES)
 	echo "chown -R 0:0 $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
 ifneq ($(ROOTFS_FILE_INSTALL_TABLES),)
 	cat $(ROOTFS_FILE_INSTALL_TABLES) > $(FULL_FILE_INSTALL_TABLE)
+	echo -e '$(subst $(newline),\n,$(PACKAGES_FILE_INSTALL_TABLE))' >> $(FULL_FILE_INSTALL_TABLE)
 	echo "$(HOST_DIR)/usr/bin/makedevs -d $(FULL_FILE_INSTALL_TABLE) $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
 endif
 	echo "$(ROOTFS_$(2)_CMD)" >> $(FAKEROOT_SCRIPT)
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 868bf28..26ae56c 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -541,6 +541,7 @@ endif
 ifeq ($$($$($(2)_KCONFIG_VAR)),y)
 
 TARGETS += $(1)
+PACKAGES_FILE_INSTALL_TABLE += $$($(2)_FILES)$$(newline)
 
 ifeq ($$($(2)_SITE_METHOD),svn)
 DL_TOOLS_DEPENDENCIES += svn
-- 
1.7.4.1
