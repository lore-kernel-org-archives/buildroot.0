From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 1 Feb 2012 22:55:49 +0100
Subject: [Buildroot] [git commit] Add support for package-declared devices
Message-ID: <20120201221424.85EEB90979@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2444085bdc3b2931c4826e455b938ce75d10821c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a way for packages to declare files they need instead of relying
only on device tables, which creates files no matter if the package is
indeed enabled, as we can see for busybox.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/common.mk                |    4 ++++
 package/Makefile.package.in |    2 ++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index f793ff9..d426f37 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -50,6 +50,10 @@ $(BINARIES_DIR)/rootfs.$(1): $(ROOTFS_$(2)_DEPENDENCIES)
 	echo "chown -R 0:0 $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
 ifneq ($(ROOTFS_DEVICE_TABLES),)
 	cat $(ROOTFS_DEVICE_TABLES) > $(FULL_DEVICE_TABLE)
+ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
+	echo -e '$(subst $(sep),\n,$(PACKAGES_DEVICES_TABLE))' >> $(FULL_DEVICE_TABLE)
+endif
+	echo -e '$(subst $(sep),\n,$(PACKAGES_PERMISSIONS_TABLE))' >> $(FULL_DEVICE_TABLE)
 	echo "$(HOST_DIR)/usr/bin/makedevs -d $(FULL_DEVICE_TABLE) $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
 endif
 	echo "$(ROOTFS_$(2)_CMD)" >> $(FAKEROOT_SCRIPT)
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index e57bfed..31f5ab6 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -714,6 +714,8 @@ endif
 ifeq ($$($$($(2)_KCONFIG_VAR)),y)
 
 TARGETS += $(1)
+PACKAGES_PERMISSIONS_TABLE += $$($(2)_PERMISSIONS)$$(sep)
+PACKAGES_DEVICES_TABLE += $$($(2)_DEVICES)$$(sep)
 
 ifeq ($$($(2)_SITE_METHOD),svn)
 DL_TOOLS_DEPENDENCIES += svn
