From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Feb 2016 23:41:13 +0100
Subject: [Buildroot] [git commit] systemd: fix dbus activation
Message-ID: <20160214225054.0DFB18081A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea3643d5695a948420a70b76b718bd98a2305a6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
