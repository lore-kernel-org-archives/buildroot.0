From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Apr 2010 22:53:51 +0200
Subject: [Buildroot] [PATCH 2/2] makedevs: convert to a more normal way of
	building packages
In-Reply-To: <cover.1271710428.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271710428.git.thomas.petazzoni@free-electrons.com>
Message-ID: <81cd9d45ffa5cd2e8622ca2d11f4e62580bd2cbb.1271710428.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/common.mk                 |    2 +-
 package/Config.in            |    1 +
 package/makedevs/Config.in   |    5 +++++
 package/makedevs/makedevs.mk |   33 +++++++++++++++++++--------------
 4 files changed, 26 insertions(+), 15 deletions(-)
 create mode 100644 package/makedevs/Config.in

diff --git a/fs/common.mk b/fs/common.mk
index cc94eb4..a3248c1 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -32,7 +32,7 @@ ROOTFS_DEVICE_TABLE = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE))
 
 define ROOTFS_TARGET_INTERNAL
 
-$(BINARIES_DIR)/rootfs.$(1): $(ROOTFS_$(2)_DEPENDENCIES) host-fakeroot makedevs $(if $(BR2_TARGET_ROOTFS_$(2)_LZMA),host-lzma)
+$(BINARIES_DIR)/rootfs.$(1): $(ROOTFS_$(2)_DEPENDENCIES) host-fakeroot host-makedevs $(if $(BR2_TARGET_ROOTFS_$(2)_LZMA),host-lzma)
 	@$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
 	$(foreach hook,$(ROOTFS_$(2)_PRE_GEN_HOOKS),$(call $(hook))$(sep))
 	rm -f $(FAKEROOT_SCRIPT)
diff --git a/package/Config.in b/package/Config.in
index 6104903..a4ef362 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -175,6 +175,7 @@ source "package/input-tools/Config.in"
 source "package/iostat/Config.in"
 source "package/lm-sensors/Config.in"
 source "package/lvm2/Config.in"
+source "package/makedevs/Config.in"
 source "package/mdadm/Config.in"
 source "package/memtester/Config.in"
 source "package/mtd/Config.in"
diff --git a/package/makedevs/Config.in b/package/makedevs/Config.in
new file mode 100644
index 0000000..4f8c38d
--- /dev/null
+++ b/package/makedevs/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_MAKEDEVS
+       bool "makedevs"
+       help
+         The makedevs utility allows to create a set of device files
+         according to a configuration file.
\ No newline at end of file
diff --git a/package/makedevs/makedevs.mk b/package/makedevs/makedevs.mk
index fe426ca..a3bb5cb 100644
--- a/package/makedevs/makedevs.mk
+++ b/package/makedevs/makedevs.mk
@@ -1,30 +1,35 @@
 #############################################################
 #
-# build makedevs to run on the build system, in order to create
-# device nodes and whatnot for the target device, in conjunction
-# with fakeroot.
+# makedevs
 #
 #############################################################
-MAKEDEVS_DIR=$(BUILD_DIR)/makedevs-host
 
-$(MAKEDEVS_DIR)/makedevs.c: target/makedevs/makedevs.c
+MAKEDEVS_DIR=$(BUILD_DIR)/makedevs
+
+$(MAKEDEVS_DIR)/makedevs.c:
 	rm -rf $(MAKEDEVS_DIR)
 	mkdir $(MAKEDEVS_DIR)
-	cp target/makedevs/makedevs.c $(MAKEDEVS_DIR)
+	cp package/makedevs/makedevs.c $(MAKEDEVS_DIR)
 
 $(MAKEDEVS_DIR)/makedevs: $(MAKEDEVS_DIR)/makedevs.c
-	$(HOSTCC) -Wall -Werror -O2 $(MAKEDEVS_DIR)/makedevs.c -o $@
+	$(CC) -Wall -Werror -O2 $(MAKEDEVS_DIR)/makedevs.c -o $@
 
-$(HOST_DIR)/usr/bin/makedevs: $(MAKEDEVS_DIR)/makedevs
+$(TARGET_DIR)/usr/bin/makedevs: $(MAKEDEVS_DIR)/makedevs
 	$(INSTALL) -m 755 $^ $@
 
-makedevs: $(HOST_DIR)/usr/bin/makedevs
+makedevs: $(TARGET_DIR)/usr/bin/makedevs
 
-makedevs-source:
+HOST_MAKEDEVS_DIR=$(BUILD_DIR)/host-makedevs
 
-makedevs-clean:
-	rm -rf $(MAKEDEVS_DIR)/makedevs
+$(HOST_MAKEDEVS_DIR)/makedevs.c:
+	rm -rf $(HOST_MAKEDEVS_DIR)
+	mkdir $(HOST_MAKEDEVS_DIR)
+	cp package/makedevs/makedevs.c $(HOST_MAKEDEVS_DIR)
 
-makedevs-dirclean:
-	rm -rf $(MAKEDEVS_DIR)
+$(HOST_MAKEDEVS_DIR)/makedevs: $(HOST_MAKEDEVS_DIR)/makedevs.c
+	$(CC) -Wall -Werror -O2 $(HOST_MAKEDEVS_DIR)/makedevs.c -o $@
+
+$(HOST_DIR)/usr/bin/makedevs: $(HOST_MAKEDEVS_DIR)/makedevs
+	$(INSTALL) -m 755 $^ $@
 
+host-makedevs: $(HOST_DIR)/usr/bin/makedevs
\ No newline at end of file
-- 
1.6.3.3
