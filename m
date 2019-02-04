From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 4 Feb 2019 15:14:18 +0100
Subject: [Buildroot] [git commit] package/ntp: use common sysv init install
Message-ID: <20190204141303.84865811FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fcf9bcf014d654248dfc7d7fb6b7dbb34935e63e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Previously the sysv init script install was conditional based on ntpd
being selected, now that sntp also has an init script and could be
selected independent of ntpd, a common install is necessary.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ntp/ntp.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index aad1cdd661..c62d59e81a 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -102,9 +102,8 @@ endef
 endif
 
 ifeq ($(BR2_PACKAGE_NTP_NTPD),y)
-define NTP_INSTALL_INIT_SYSV
+define NTP_INSTALL_INIT_SYSV_NTPD
 	$(INSTALL) -D -m 755 package/ntp/S49ntp $(TARGET_DIR)/etc/init.d/S49ntp
-	$(NTP_INSTALL_INIT_SYSV_SNTP)
 endef
 
 define NTP_INSTALL_INIT_SYSTEMD
@@ -115,4 +114,9 @@ define NTP_INSTALL_INIT_SYSTEMD
 endef
 endif
 
+define NTP_INSTALL_INIT_SYSV
+	$(NTP_INSTALL_INIT_SYSV_NTPD)
+	$(NTP_INSTALL_INIT_SYSV_SNTP)
+endef
+
 $(eval $(autotools-package))
