From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 7 Jul 2011 23:48:41 +0200
Subject: [Buildroot] [git commit] linux: simplify modules check
Message-ID: <20110707220517.CE7D08A3F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ce03b89881571e9dd3a5c83430f1d32a6a6307c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No need to mix make and shell code.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/linux.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index a5b9b8e..f9fe454 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -149,7 +149,7 @@ endif
 $(LINUX26_DIR)/.stamp_compiled: $(LINUX26_DIR)/.stamp_configured $(LINUX26_DIR)/.config
 	@$(call MESSAGE,"Compiling kernel")
 	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) $(LINUX26_IMAGE_NAME)
-	@if [ $(shell grep -c "CONFIG_MODULES=y" $(LINUX26_DIR)/.config) != 0 ] ; then 	\
+	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
 		$(TARGET_MAKE_ENV) $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) modules ;	\
 	fi
 	$(Q)touch $@
@@ -163,7 +163,7 @@ endif
 	cp $(LINUX26_IMAGE_PATH) $(BINARIES_DIR)
 	# Install modules and remove symbolic links pointing to build
 	# directories, not relevant on the target
-	@if [ $(shell grep -c "CONFIG_MODULES=y" $(LINUX26_DIR)/.config) != 0 ] ; then 	\
+	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
 		$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(@D) 		\
 			DEPMOD="$(HOST_DIR)/usr/sbin/depmod" modules_install ;		\
 		rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/build ;	\
-- 
1.7.3.4
