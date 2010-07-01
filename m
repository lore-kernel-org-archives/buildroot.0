From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 1 Jul 2010 17:33:29 +0200
Subject: [Buildroot] [git commit master 1/1] tremor: fix svn checkout
Message-ID: <20100701153712.D699F821E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=da32c7ca2d488ffdd2e37a1cc533338741342a3c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 1dc19c445 (split tremor into its own package) unfortunately
broke the svn checkout step (but normally not noticable as we have
a tarball on sources.buildroot.net that will get downloaded instead).

Fix it by using a custom download step, and remove unused variables
while we're at it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                             |    2 +-
 package/multimedia/tremor/tremor.mk |   26 +++++++++-----------------
 2 files changed, 10 insertions(+), 18 deletions(-)

diff --git a/CHANGES b/CHANGES
index 9e672f1..91d3cf1 100644
--- a/CHANGES
+++ b/CHANGES
@@ -19,7 +19,7 @@
 	libart, libfuse, libgpg-error, libidn, liblockfile, links,
 	lmbench, lrzsz, make, module-init-tools, nbd, ncurses, netperf,
 	ntfsprogs, openssl, php, qt, quagga, sqlite, sdl, sdl_mixer,
-	sdl_ttf, squashfs, tn5250, usbutils, xkeyboard-config,
+	sdl_ttf, squashfs, tn5250, tremor, usbutils, xkeyboard-config,
 	xserver_xorg-server
 
 	Removed packages: modutils, portage, rxvt
diff --git a/package/multimedia/tremor/tremor.mk b/package/multimedia/tremor/tremor.mk
index b493375..74fd725 100644
--- a/package/multimedia/tremor/tremor.mk
+++ b/package/multimedia/tremor/tremor.mk
@@ -4,28 +4,20 @@
 #
 ############################################################
 
-TREMOR_TRUNK:=http://svn.xiph.org/trunk/Tremor/
+TREMOR_SITE:=http://svn.xiph.org/trunk/Tremor/
 TREMOR_VERSION:=16259
-TREMOR_NAME:=Tremor-svn-r$(TREMOR_VERSION)
-TREMOR_DIR:=$(BUILD_DIR)/$(TREMOR_NAME)
-TREMOR_SOURCE:=$(TREMOR_NAME).tar.bz2
-TREMOR_CAT=$(BZCAT)
+TREMOR_SVNDIR = Tremor-svn-r$(TREMOR_VERSION)
+TREMOR_SOURCE:= $(TREMOR_SVNDIR).tar.bz2
 TREMOR_AUTORECONF = YES
 TREMOR_INSTALL_STAGING = YES
 TREMOR_INSTALL_TARGET = YES
 
 $(DL_DIR)/$(TREMOR_SOURCE):
-	$(SVN_CO) -r $(TREMOR_VERSION) $(TREMOR_TRUNK) $(TREMOR_DIR)
-	tar -cv -C $(BUILD_DIR) $(TREMOR_NAME) | bzip2 - -c > $@
-
-$(eval $(call AUTOTARGETS,package/multimedia,tremor))
+	$(SVN_CO) -r $(TREMOR_VERSION) $(TREMOR_SITE) $(BUILD_DIR)/$(TREMOR_SVNDIR)
+	tar -cv -C $(BUILD_DIR) $(TREMOR_SVNDIR) | bzip2 - -c > $@
+	rm -rf $(BUILD_DIR)/$(TREMOR_SVNDIR)
 
+# use custom download step
+TREMOR_TARGET_SOURCE := $(DL_DIR)/$(TREMOR_SOURCE)
 
-############################################################
-#
-# Toplevel Makefile options
-#
-############################################################
-ifeq ($(BR2_PACKAGE_TREMOR),y)
-TARGETS+=tremor
-endif
+$(eval $(call AUTOTARGETS,package/multimedia,tremor))
-- 
1.7.1
