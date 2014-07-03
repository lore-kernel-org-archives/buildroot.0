From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu,  3 Jul 2014 18:57:38 +0200
Subject: [Buildroot] [PATCH 5/6] systemd: add hook to fix /run, /var
In-Reply-To: <1404406659-31109-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1404406659-31109-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1404406659-31109-6-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a post installation hook to fix target runtime data directories
/var/{lock,run,tmp} and /run. Theses directories will be populated by
systemd according to the configuration files from /usr/lib/tmpfiles.d.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/systemd/systemd.mk |   13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 25bea0b..2da65e6 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -149,11 +149,24 @@ define SYSTEMD_SANITIZE_PATH_IN_UNITS
 		-exec $(SED) 's,$(HOST_DIR),,g' {} \;
 endef
 
+# /var/{lock,run,tmp} and /run will be populated at runtime by Systemd
+# according to the configuration files from /usr/lib/tmpfiles.d/.
+define SYSTEMD_FIX_RUNTIME_DIRS_HOOK
+	$(RM) -rf $(TARGET_DIR)/var/lock
+	$(RM) -rf $(TARGET_DIR)/var/run
+	$(RM) -rf $(TARGET_DIR)/var/tmp
+	ln -sf ../run $(TARGET_DIR)/var/run
+	ln -sf ../run $(TARGET_DIR)/var/lock
+	$(RM) -rf $(TARGET_DIR)/run
+	mkdir -p $(TARGET_DIR)/run
+endef
+
 SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
 	SYSTEMD_INSTALL_INIT_HOOK \
 	SYSTEMD_INSTALL_TTY_HOOK \
 	SYSTEMD_INSTALL_MACHINEID_HOOK \
 	SYSTEMD_INSTALL_RESOLVCONF_HOOK \
+	SYSTEMD_FIX_RUNTIME_DIRS_HOOK \
 	SYSTEMD_SANITIZE_PATH_IN_UNITS
 
 define SYSTEMD_USERS
-- 
1.7.10.4
