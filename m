From: Gabe Evans <gabe@hashrabbit.co>
Date: Wed, 10 Feb 2016 23:44:03 +0000
Subject: [Buildroot] [PATCH v2 1/2] systemd: fix dbus activation
In-Reply-To: <1454971831-11139-1-git-send-email-gabe@hashrabbit.co>
References: <1454971831-11139-1-git-send-email-gabe@hashrabbit.co>
Message-ID: <1455147844-4918-1-git-send-email-gabe@hashrabbit.co>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Various DBus activated services fail to start with errors similar to:

  Unit dbus-org.freedesktop.hostname1.service failed to load: File exists.

The message itself is rather vague and can be seen as a warning in
systemd-networkd logs. Meanwhile, tools like hostnamectl don't work
at all.

The post-install target hook SYSTEMD_SANITIZE_PATH_IN_UNITS was replacing
symlinks with duplicate files. The find command could have used -type f
to avoid this but I instead chose to remove the hook since this fix doesn't
seem to be needed anymore.

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changes v1 -> v2:
  - split changes into two separate commits (suggested by Arnout)
---
 package/systemd/systemd.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index e432069..2340963 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -150,16 +150,10 @@ define SYSTEMD_INSTALL_MACHINEID_HOOK
 	touch $(TARGET_DIR)/etc/machine-id
 endef
 
-define SYSTEMD_SANITIZE_PATH_IN_UNITS
-	find $(TARGET_DIR)/lib/systemd/system -name '*.service' \
-		-exec $(SED) 's,$(HOST_DIR),,g' {} \;
-endef
-
 SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
 	SYSTEMD_INSTALL_INIT_HOOK \
 	SYSTEMD_INSTALL_MACHINEID_HOOK \
-	SYSTEMD_INSTALL_RESOLVCONF_HOOK \
-	SYSTEMD_SANITIZE_PATH_IN_UNITS
+	SYSTEMD_INSTALL_RESOLVCONF_HOOK
 
 define SYSTEMD_USERS
 	systemd-journal -1 systemd-journal -1 * /var/log/journal - - Journal
-- 
1.9.1
