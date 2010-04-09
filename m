From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Apr 2010 16:19:13 +0200
Subject: [Buildroot] [git commit master] target/cpio: cleanup
Message-ID: <20100409142125.82F5920E54@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4bcefe826bbc1bf550a091e7ae86ad5ee7946909
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 * Remove the dependency on BR2_HOST_FAKEROOT, since we don't have
   config option for host tools.

 * Remove a few useless things.

 * Check that cpio is available on the host in
   toolchain/dependencies/dependencies.sh.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/cpio/Config.in                  |    1 -
 target/cpio/cpioroot.mk                |   17 +++--------------
 toolchain/dependencies/dependencies.sh |    2 +-
 3 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/target/cpio/Config.in b/target/cpio/Config.in
index 83bdd21..4ee1037 100644
--- a/target/cpio/Config.in
+++ b/target/cpio/Config.in
@@ -1,6 +1,5 @@
 config BR2_TARGET_ROOTFS_CPIO
 	bool "cpio the root filesystem"
-	select BR2_HOST_FAKEROOT
 	help
 	  Build a cpio archive of the root filesystem
 
diff --git a/target/cpio/cpioroot.mk b/target/cpio/cpioroot.mk
index 2197d10..021847f 100644
--- a/target/cpio/cpioroot.mk
+++ b/target/cpio/cpioroot.mk
@@ -12,17 +12,15 @@ CPIO_ROOTFS_COMPRESSOR_PREREQ:=
 ifeq ($(BR2_TARGET_ROOTFS_CPIO_GZIP),y)
 CPIO_ROOTFS_COMPRESSOR:=gzip -9 -c
 CPIO_ROOTFS_COMPRESSOR_EXT:=gz
-#CPIO_ROOTFS_COMPRESSOR_PREREQ:= gzip-host
 endif
 ifeq ($(BR2_TARGET_ROOTFS_CPIO_BZIP2),y)
 CPIO_ROOTFS_COMPRESSOR:=bzip2 -9 -c
 CPIO_ROOTFS_COMPRESSOR_EXT:=bz2
-#CPIO_ROOTFS_COMPRESSOR_PREREQ:= bzip2-host
 endif
 ifeq ($(BR2_TARGET_ROOTFS_CPIO_LZMA),y)
-CPIO_ROOTFS_COMPRESSOR:=lzma -9 -c
+CPIO_ROOTFS_COMPRESSOR:=$(LZMA) -9 -c
 CPIO_ROOTFS_COMPRESSOR_EXT:=lzma
-CPIO_ROOTFS_COMPRESSOR_PREREQ:= lzma-host
+CPIO_ROOTFS_COMPRESSOR_PREREQ:= host-lzma
 endif
 
 ifneq ($(CPIO_ROOTFS_COMPRESSOR),)
@@ -32,7 +30,6 @@ CPIO_TARGET := $(CPIO_BASE)
 endif
 
 ROOTFS_CPIO_COPYTO:=$(call qstrip,$(BR2_TARGET_ROOTFS_CPIO_COPYTO))
-#
 
 cpioroot-init:
 	rm -f $(TARGET_DIR)/init
@@ -54,7 +51,7 @@ endif
 		>> $(BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
 	chmod a+x $(BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
 	$(HOST_DIR)/usr/bin/fakeroot -- $(BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
-	#- at rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
+	- at rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
 ifeq ($(CPIO_ROOTFS_COMPRESSOR),)
 ifneq ($(ROOTFS_CPIO_COPYTO),)
 	$(Q)cp -f $(CPIO_BASE) $(ROOTFS_CPIO_COPYTO)
@@ -69,14 +66,6 @@ ifneq ($(ROOTFS_CPIO_COPYTO),)
 endif
 endif
 
-cpioroot: $(CPIO_TARGET)
-
-cpioroot-source:
-
-cpioroot-clean:
-
-cpioroot-dirclean:
-
 #############################################################
 #
 # Toplevel Makefile options
diff --git a/toolchain/dependencies/dependencies.sh b/toolchain/dependencies/dependencies.sh
index 68b2751..013c1d5 100755
--- a/toolchain/dependencies/dependencies.sh
+++ b/toolchain/dependencies/dependencies.sh
@@ -122,7 +122,7 @@ if ! $SHELL --version 2>&1 | grep -q '^GNU bash'; then
 fi;
 
 # Check that a few mandatory programs are installed
-for prog in awk bison flex msgfmt makeinfo patch gzip bzip2 perl tar wget ; do
+for prog in awk bison flex msgfmt makeinfo patch gzip bzip2 perl tar wget cpio ; do
     if ! which $prog > /dev/null ; then
 	/bin/echo -e "\nYou must install '$prog' on your build machine";
 	if test $prog = "makeinfo" ; then
-- 
1.6.3.3
