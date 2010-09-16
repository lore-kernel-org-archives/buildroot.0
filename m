From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] kexec: convert to new style hook
Message-ID: <20100916113832.829158AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0355eb522b0ab354df6262c8ef72e56403720d5b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kexec/kexec.mk |   14 ++++++--------
 1 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index 4367885..5081ee8 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -16,12 +16,10 @@ else
 KEXEC_CONF_OPT += --without-zlib
 endif
 
-$(eval $(call AUTOTARGETS,package,kexec))
-
-$(KEXEC_HOOK_POST_INSTALL): $(KEXEC_TARGET_INSTALL_TARGET)
-ifneq ($(BR2_ENABLE_DEBUG),y)
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/sbin/kexec
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/sbin/kdump
-endif
+define KEXEC_REMOVE_LIB_TOOLS
 	rm -rf $(TARGET_DIR)/usr/lib/kexec-tools
-	touch $@
+endef
+
+KEXEC_POST_INSTALL_TARGET_HOOKS += KEXEC_REMOVE_LIB_TOOLS
+
+$(eval $(call AUTOTARGETS,package,kexec))
-- 
1.7.1
