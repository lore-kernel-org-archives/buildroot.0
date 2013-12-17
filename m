From: Paul Cercueil <paul@crapouillou.net>
Date: Tue, 17 Dec 2013 02:14:54 +0100
Subject: [Buildroot] [PATCH] systemd: Replace busybox' binaries only if
	applicable
Message-ID: <1387242894-4966-1-git-send-email-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Previously, the package would overwrite busybox' binaries even
if Busybox was set in the config as the default init system.

Signed-Off-By: Paul Cercueil <paul@crapouillou.net>
---
 package/systemd/systemd.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 4e4955e..a5dc8e5 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -54,6 +54,7 @@ endif
 SYSTEMD_MAKE_OPT += LIBS=-lrt
 SYSTEMD_MAKE_OPT += LDFLAGS+=-ldl
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
 define SYSTEMD_INSTALL_INIT_HOOK
 	ln -fs ../usr/lib/systemd/systemd $(TARGET_DIR)/sbin/init
 	ln -fs ../usr/bin/systemctl $(TARGET_DIR)/sbin/halt
@@ -62,6 +63,9 @@ define SYSTEMD_INSTALL_INIT_HOOK
 
 	ln -fs ../../../usr/lib/systemd/system/multi-user.target $(TARGET_DIR)/etc/systemd/system/default.target
 endef
+SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
+	SYSTEMD_INSTALL_INIT_HOOK
+endif
 
 define SYSTEMD_INSTALL_TTY_HOOK
 	rm -f $(TARGET_DIR)/etc/systemd/system/getty.target.wants/getty at tty1.service
@@ -69,7 +73,6 @@ define SYSTEMD_INSTALL_TTY_HOOK
 endef
 
 SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
-	SYSTEMD_INSTALL_INIT_HOOK \
 	SYSTEMD_INSTALL_TTY_HOOK \
 
 $(eval $(autotools-package))
-- 
1.8.5.1
