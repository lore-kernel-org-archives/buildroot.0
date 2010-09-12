From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:42:25 +0200
Subject: [Buildroot] [PATCH 39/74] libnl: remove useless strip and use
	correct step override
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4dfe998b3252ac55e2c56e106e9f090b951191c6.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnl/libnl.mk |   13 ++++---------
 1 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 1a66746..ccedd22 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -10,13 +10,8 @@ LIBNL_SITE = http://distfiles.gentoo.org/distfiles
 LIBNL_INSTALL_STAGING = YES
 LIBNL_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-$(eval $(call AUTOTARGETS,package,libnl))
-
-$(LIBNL_HOOK_POST_INSTALL): $(LIBNL_TARGET_INSTALL_TARGET)
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libnl.so*
-	touch $@
-
-$(LIBNL_TARGET_UNINSTALL):
-	$(call MESSAGE,"Uninstalling")
+define LIBNL_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/lib/libnl.so*
-	rm -f $(LIBNL_TARGET_INSTALL_TARGET) $(LIBNL_HOOK_POST_INSTALL)
+endef
+
+$(eval $(call AUTOTARGETS,package,libnl))
-- 
1.7.0.4
