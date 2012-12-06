From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@openwide.fr>
Date: Thu,  6 Dec 2012 14:36:07 +0100
Subject: [Buildroot] [PATCH] [RFC] new target: live filesystem
In-Reply-To: <1354531204-17481-1-git-send-email-jeremy.rosen@openwide.fr>
References: <1354531204-17481-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <1354800968-16745-1-git-send-email-jeremy.rosen@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

add a new target to deploy a live filesystem to be used with NFS or as a chroot

Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
---
v2 : implement Arnoult's suggestion, update manual entry
v3 : improve documentation for the chroot case, more suggestions by Arnoult
---
 docs/manual/beyond-buildroot.txt     |   20 ++++++++------------
 fs/Config.in                         |    1 +
 fs/live/Config.in                    |   14 ++++++++++++++
 fs/live/live.mk                      |   19 +++++++++++++++++++
 support/dependencies/dependencies.sh |    8 ++++++++
 5 files changed, 50 insertions(+), 12 deletions(-)
 create mode 100644 fs/live/Config.in
 create mode 100644 fs/live/live.mk

diff --git a/docs/manual/beyond-buildroot.txt b/docs/manual/beyond-buildroot.txt
index a87b584..17ccc1a 100644
--- a/docs/manual/beyond-buildroot.txt
+++ b/docs/manual/beyond-buildroot.txt
@@ -9,19 +9,15 @@ Boot the generated images
 NFS boot
 ~~~~~~~~
 
-To achieve NFS-boot, enable _tar root filesystem_ in the _Filesystem
-images_ menu.
+To achieve NFS-boot, enable _live root filesystem_ in the _Filesystem
+images_ menu and select a _live image location_ to choose where the live
+filesystem will be deployed. you can use _$(BINARIES_DIR)_ to easily 
+build in +/path/to/output_dir/images+
 
-After a complete build, just run the following commands to setup the
-NFS-root directory:
+You will be asked for a password during the build. This is needed to create
+device entries in the target filesystem
 
--------------------
-sudo tar -xavf /path/to/output_dir/rootfs.tar -C /path/to/nfs_root_dir
--------------------
-
-Remember to add this path to +/etc/exports+.
-
-Then, you can execute a NFS-boot from your target.
+You will need to add the _live image location_  to +/etc/exports+.
 
 Chroot
 ------
@@ -29,7 +25,7 @@ Chroot
 If you want to chroot in a generated image, then there are few thing
 you should be aware of:
 
-* you should setup the new root from the _tar root filesystem_ image;
+* you should use the _live root filesystem_ image;
 
 * either the selected target architecture is compatible with your host
   machine, or you should use some +qemu-*+ binary and correctly set it
diff --git a/fs/Config.in b/fs/Config.in
index da4c5ff..664d2f6 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -11,5 +11,6 @@ source "fs/romfs/Config.in"
 source "fs/squashfs/Config.in"
 source "fs/tar/Config.in"
 source "fs/ubifs/Config.in"
+source "fs/live/Config.in"
 
 endmenu
diff --git a/fs/live/Config.in b/fs/live/Config.in
new file mode 100644
index 0000000..a79f1dc
--- /dev/null
+++ b/fs/live/Config.in
@@ -0,0 +1,14 @@
+config BR2_TARGET_ROOTFS_LIVE
+	bool "live root filesystem"
+	help
+	  Create a live image of the root filesystem that is directly
+	  usable as over NFS or chroot.
+
+config BR2_TARGET_ROOTFS_LIVE_DEST
+	string "live image location"
+	depends on BR2_TARGET_ROOTFS_LIVE
+	default "$(BINARIES_DIR)/live"
+	help
+	  The directory where the image should be stored.
+	  This directory will be emptied and recreated
+
diff --git a/fs/live/live.mk b/fs/live/live.mk
new file mode 100644
index 0000000..52f7444
--- /dev/null
+++ b/fs/live/live.mk
@@ -0,0 +1,19 @@
+#############################################################
+#
+# Build the live root filesystem directory
+#
+#############################################################
+
+
+define ROOTFS_LIVE_CMD
+	sudo rsync -a --no-o --no-g --delete-during $(TARGET_DIR)/ \
+		$(BR2_TARGET_ROOTFS_LIVE_DEST)/
+endef
+
+define ROOTFS_LIVE_INIT
+  if [ -z $(shell which sudo) ] ; then echo "sudo seems to not be installed on the host system" ; false ; fi 
+endef
+
+ROOTFS_LIVE_PRE_GEN_HOOKS += ROOTFS_LIVE_INIT
+
+$(eval $(call ROOTFS_TARGET,live))
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 7a02512..ebaabbb 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -158,6 +158,7 @@ if grep ^BR2_TOOLCHAIN_BUILDROOT=y $CONFIG_FILE > /dev/null && \
        exit 1 ;
    fi
 fi
+
 if grep -q ^BR2_PACKAGE_CLASSPATH=y $CONFIG_FILE ; then
     for prog in javac jar; do
 	if ! which $prog > /dev/null ; then
@@ -166,3 +167,10 @@ if grep -q ^BR2_PACKAGE_CLASSPATH=y $CONFIG_FILE ; then
 	fi
     done
 fi
+
+if grep ^BR2_TARGET_ROOTFS_LIVE=y $CONFIG_FILE > /dev/null ; then
+   if ! which sudo > /dev/null ; then
+       /bin/echo -e "\nYou need sudo installed on your build machine to build a live filesystem\n"
+       exit 1 ;
+   fi
+fi
-- 
1.7.10.4
