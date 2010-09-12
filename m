From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:42:48 +0200
Subject: [Buildroot] [PATCH 62/74] kexec: convert to new style hook
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0355eb522b0ab354df6262c8ef72e56403720d5b.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.7.0.4
