From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 19:03:15 +0200
Subject: [Buildroot] [git commit] package/systemd: create /etc/resolv.conf
 only if resolved is selected
Message-ID: <20191026165726.C650B81046@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e51737575bcfbe573c8fe156f1e4a5408aad0fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Or else it becomes a dangling link to
/run/systemd/resolve/resolv.conf, which is never created. Even worst,
it also prevents NetworkManager from updating resolv.conf.

Fixes:
  https://bugs.busybox.net/show_bug.cgi?id=9881

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 5961d98b22..df40961fee 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -354,10 +354,6 @@ define SYSTEMD_INSTALL_SERVICE_NETWORKD
 	ln -sf ../../../../lib/systemd/system/systemd-network-generator.service \
 		$(TARGET_DIR)/etc/systemd/system/network-pre.target.wants/systemd-network-generator.service
 endef
-define SYSTEMD_INSTALL_RESOLVCONF_HOOK
-	ln -sf ../run/systemd/resolve/resolv.conf \
-		$(TARGET_DIR)/etc/resolv.conf
-endef
 SYSTEMD_NETWORKD_DHCP_IFACE = $(call qstrip,$(BR2_SYSTEM_DHCP))
 ifneq ($(SYSTEMD_NETWORKD_DHCP_IFACE),)
 define SYSTEMD_INSTALL_NETWORK_CONFS
@@ -371,6 +367,10 @@ SYSTEMD_CONF_OPTS += -Dnetworkd=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_RESOLVED),y)
+define SYSTEMD_INSTALL_RESOLVCONF_HOOK
+	ln -sf ../run/systemd/resolve/resolv.conf \
+		$(TARGET_DIR)/etc/resolv.conf
+endef
 SYSTEMD_CONF_OPTS += -Dresolve=true
 SYSTEMD_RESOLVED_USER = systemd-resolve -1 systemd-resolve -1 * - - - Network Name Resolution Manager
 define SYSTEMD_INSTALL_SERVICE_RESOLVED
