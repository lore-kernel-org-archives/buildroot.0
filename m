From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Nov 2012 17:12:49 +0100
Subject: [Buildroot] [git commit] Warn the user about the usage of
	output/target as the root filesystem
Message-ID: <20121117163109.3B9A39A074@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9226a9907c4eb0fffab777f50e88b74aa14d1737
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A very common mistake done by our users is that they use
output/target/ directory as their root filesystem. Even though this is
loudly documented in our Buildroot manual, people don't read
documentation, so it is not sufficient.

This patch adds a text file named
output/target/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM which explains why
output/target isn't appropriate to use as the root filesystem. The
process is:

 * At the beginning of the build, right after the skeleton has been
   copied, support/misc/target-dir-warning.txt is copied to
   output/target/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM

 * In the filesystem images creation code, this file is removed before
   launching fakeroot, and restored right after that, so that this
   file is not present in the generated root filesystem images.

Note that the file has not been added to the default skeleton for two
reasons:

 * It would have annoying to have in our source tree a file named in
   capital letters inside system/skeleton/

 * The proposed way works even if the user uses a custom skeleton.

[Peter: fixed typo]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Juha Lumme <juha.lumme@gmail.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile                            |    5 +++++
 fs/common.mk                        |    2 ++
 support/misc/target-dir-warning.txt |   29 +++++++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index c526fe1..3e7d520 100644
--- a/Makefile
+++ b/Makefile
@@ -269,6 +269,10 @@ LEGAL_LICENSES_TXT=$(LEGAL_INFO_DIR)/licenses.txt
 LEGAL_WARNINGS=$(LEGAL_INFO_DIR)/.warnings
 LEGAL_REPORT=$(LEGAL_INFO_DIR)/README
 
+# Location of a file giving a big fat warning that output/target
+# should not be used as the root filesystem.
+TARGET_DIR_WARNING_FILE=$(TARGET_DIR)/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
+
 ifeq ($(BR2_CCACHE),y)
 CCACHE:=$(HOST_DIR)/usr/bin/ccache
 BUILDROOT_CACHE_DIR = $(call qstrip,$(BR2_CCACHE_DIR))
@@ -403,6 +407,7 @@ $(BUILD_DIR)/.root:
 			cp -fa $(TARGET_SKELETON)/* $(TARGET_DIR)/; \
 		fi; \
 	fi
+	cp support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
 	-find $(TARGET_DIR) -type d -name CVS -print0 -o -name .svn -print0 | xargs -0 rm -rf
 	-find $(TARGET_DIR) -type f \( -name .empty -o -name '*~' \) -print0 | xargs -0 rm -rf
 	touch $@
diff --git a/fs/common.mk b/fs/common.mk
index 0f0eae9..b1512dd 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -45,6 +45,7 @@ $(BINARIES_DIR)/rootfs.$(1): $(ROOTFS_$(2)_DEPENDENCIES)
 	@$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
 	$(foreach hook,$(ROOTFS_$(2)_PRE_GEN_HOOKS),$(call $(hook))$(sep))
 	rm -f $(FAKEROOT_SCRIPT)
+	rm -f $(TARGET_DIR_WARNING_FILE)
 	echo "chown -R 0:0 $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
 ifneq ($(ROOTFS_DEVICE_TABLES),)
 	cat $(ROOTFS_DEVICE_TABLES) > $(FULL_DEVICE_TABLE)
@@ -57,6 +58,7 @@ endif
 	echo "$(ROOTFS_$(2)_CMD)" >> $(FAKEROOT_SCRIPT)
 	chmod a+x $(FAKEROOT_SCRIPT)
 	$(HOST_DIR)/usr/bin/fakeroot -- $(FAKEROOT_SCRIPT)
+	cp support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
 	- at rm -f $(FAKEROOT_SCRIPT) $(FULL_DEVICE_TABLE)
 	$(foreach hook,$(ROOTFS_$(2)_POST_GEN_HOOKS),$(call $(hook))$(sep))
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_GZIP),y)
diff --git a/support/misc/target-dir-warning.txt b/support/misc/target-dir-warning.txt
new file mode 100644
index 0000000..90f8841
--- /dev/null
+++ b/support/misc/target-dir-warning.txt
@@ -0,0 +1,29 @@
+Warning!
+========
+
+This directory does *not* contain the root filesystem that you can use
+on your embedded system. Since Buildroot does not run as root, it
+cannot create device files and set the permissions and ownership of
+files correctly in this directory to make it usable as a root
+filesystem.
+
+For that reason, do *not* use the contents of this directory to mount
+your root filesystem over NFS or copy the contents of this directory
+to a SD card or USB key, thinking it will work as the root filesystem
+for your embedded system. It will simply *not* work.
+
+Instead, if you need a usable root filesystem, please select one of
+the filesystem image formats available in the Buildroot configuration
+interface (make menuconfig or others) in the "Filesystem images"
+sub-menu. If you want to get a filesystem image that you can easily
+extract to your SD card or to some directory exposed through NFS,
+please use the "tar the root filesystem" option. It will generate a
+images/rootfs.tar image in your Buildroot output directory, which you
+can extract as root:
+
+  sudo tar -C /destination/of/extraction -xf images/rootfs.tar
+
+Those image files are created using the contents of the target/
+directory, but there is a post-processing step to create device files
+and set owernship/permissions properly even if Buildroot does not run
+as root.
