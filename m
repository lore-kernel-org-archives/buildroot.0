From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2010 21:27:28 +0100
Subject: [Buildroot] [git commit master] dosfstools: make sure install
	targets aren't run everytime
Message-ID: <20100223202934.B6206776A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e83529882b71cb8a2c6ba2c997308196a2857af0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adding real targets to $(TARGETS) doesn't work, since they are
prefixed __real_tgt by the main Makefile. 'make' then always thinks
that these targets aren't up-to-date, and re-generate them every time.

Therefore, we switch dosfstools to the more common way of handling
packages, with a phony target added to $(TARGETS), this phony target
depending on real targets.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dosfstools/dosfstools.mk |   32 +++++++++++++++++++-------------
 1 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index e1e9fe3..b826ab1 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -32,7 +32,8 @@ $(DOSFSTOOLS_DIR)/.built : $(DOSFSTOOLS_DIR)/.unpacked
 	$(STRIPCMD) $(DOSFSTOOLS_DIR)/$(DOSFSLABEL_BINARY)
 	touch $@
 
-$(TARGET_DIR)/$(MKDOSFS_TARGET_BINARY): $(DOSFSTOOLS_DIR)/.built
+$(TARGET_DIR)/$(MKDOSFS_TARGET_BINARY): # $(DOSFSTOOLS_DIR)/.built
+	echo foo
 	cp -a $(DOSFSTOOLS_DIR)/$(MKDOSFS_BINARY) $@
 	touch -c $@
 
@@ -44,7 +45,20 @@ $(TARGET_DIR)/$(DOSFSLABEL_TARGET_BINARY): $(DOSFSTOOLS_DIR)/.built
 	cp -a $(DOSFSTOOLS_DIR)/$(DOSFSLABEL_BINARY) $@
 	touch -c $@
 
-dosfstools: $(TARGET_DIR)/$(DOSFSTOOLS_TARGET_BINARY) $(TARGET_DIR)/$(DOSFSCK_TARGET_BINARY)
+DOSFSTOOLS=
+ifeq ($(BR2_PACKAGE_DOSFSTOOLS_MKDOSFS),y)
+DOSFSTOOLS+=$(TARGET_DIR)/$(MKDOSFS_TARGET_BINARY)
+endif
+
+ifeq ($(BR2_PACKAGE_DOSFSTOOLS_DOSFSCK),y)
+DOSFSTOOLS+=$(TARGET_DIR)/$(DOSFSCK_TARGET_BINARY)
+endif
+
+ifeq ($(BR2_PACKAGE_DOSFSTOOLS_DOSFSLABEL),y)
+DOSFSTOOLS+=$(TARGET_DIR)/$(DOSFSLABEL_TARGET_BINARY)
+endif
+
+dosfstools: $(DOSFSTOOLS)
 
 dosfstools-clean:
 	rm -f $(TARGET_DIR)/$(MKDOSFS_TARGET_BINARY)
@@ -60,14 +74,6 @@ dosfstools-dirclean:
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(BR2_PACKAGE_DOSFSTOOLS_MKDOSFS),y)
-TARGETS+=$(TARGET_DIR)/$(MKDOSFS_TARGET_BINARY)
-endif
-
-ifeq ($(BR2_PACKAGE_DOSFSTOOLS_DOSFSCK),y)
-TARGETS+=$(TARGET_DIR)/$(DOSFSCK_TARGET_BINARY)
-endif
-
-ifeq ($(BR2_PACKAGE_DOSFSTOOLS_DOSFSLABEL),y)
-TARGETS+=$(TARGET_DIR)/$(DOSFSLABEL_TARGET_BINARY)
-endif
+ifeq ($(BR2_PACKAGE_DOSFSTOOLS),y)
+TARGETS+=dosfstools
+endif
\ No newline at end of file
-- 
1.6.3.3
