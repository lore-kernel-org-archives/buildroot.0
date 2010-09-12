From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:42:34 +0200
Subject: [Buildroot] [PATCH 48/74] nano: use correct step override method
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <3396401dad1aa6324a9ecddfbf6aa8e2ca5e2072.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nano/nano.mk |   17 +++++++----------
 1 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 3e8ba50..47355a3 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -10,15 +10,12 @@ NANO_MAKE_ENV = CURSES_LIB="-lncurses"
 NANO_CONF_OPT = --without-slang --enable-tiny
 NANO_DEPENDENCIES = ncurses
 
-$(eval $(call AUTOTARGETS,package,nano))
-
-$(NANO_TARGET_INSTALL_TARGET):
-	$(call MESSAGE,"Installing to target")
-	$(INSTALL) -m 0755 $(NANO_DIR)/src/nano \
-		$(TARGET_DIR)/usr/bin/nano
-	touch $@
+define NANO_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 $(@D)/src/nano $(TARGET_DIR)/usr/bin/nano
+endef
 
-$(NANO_TARGET_UNINSTALL):
-	$(call MESSAGE,"Uninstalling")
+define NANO_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/nano
-	rm -f $(NANO_TARGET_INSTALL_TARGET) $(NANO_HOOK_POST_INSTALL)
+endef
+
+$(eval $(call AUTOTARGETS,package,nano))
-- 
1.7.0.4
