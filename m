From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sat, 26 Dec 2009 15:03:28 +0100
Subject: [Buildroot] [PATCH] bash: remove CC variable when calling make
Message-ID: <1261836208.5867.15.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So "/opt/whatever_toolchain/gcc --sysroot $(STAGING_DIR)" isn't
stripped to "/opt/whatever_toolchain/gcc", making gcc to look at
$(ORIGINAL_TOOLCHAIN_DIRECTORY)/usr/include instead of
$(STAGING_DIR)/usr/include. For more CC is already filled when
running the configure script.

This problem should only be visible with an external toolchain.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/bash/bash.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index fbb9cfb..705ce8d 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -72,11 +72,11 @@ $(BASH_DIR)/.configured: $(BASH_DIR)/.unpacked
 	touch $@
 
 $(BASH_DIR)/$(BASH_BINARY): $(BASH_DIR)/.configured
-	$(MAKE1) CC=$(TARGET_CC) CC_FOR_BUILD="$(HOSTCC)" -C $(BASH_DIR)
+	$(MAKE1) CC_FOR_BUILD="$(HOSTCC)" -C $(BASH_DIR)
 
 $(TARGET_DIR)/$(BASH_TARGET_BINARY): $(BASH_DIR)/$(BASH_BINARY)
 	mkdir -p $(TARGET_DIR)/bin
-	$(MAKE1) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(BASH_DIR) install
+	$(MAKE1) DESTDIR=$(TARGET_DIR) -C $(BASH_DIR) install
 	rm -f $(TARGET_DIR)/bin/bash*
 	mv $(TARGET_DIR)/usr/bin/bash* $(TARGET_DIR)/bin/
 	(cd $(TARGET_DIR)/bin; /bin/ln -fs bash sh)
@@ -100,7 +100,7 @@ endif
 # If both bash and busybox are selected, the /bin/sh symlink
 # may need to be reinstated by the clean targets.
 bash-clean:
-	-$(MAKE1) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(BASH_DIR) uninstall
+	-$(MAKE1) DESTDIR=$(TARGET_DIR) -C $(BASH_DIR) uninstall
 	rm -f $(TARGET_DIR)/$(BASH_TARGET_BINARY)
 	-$(MAKE1) -C $(BASH_DIR) clean
 
-- 
1.6.5.7
