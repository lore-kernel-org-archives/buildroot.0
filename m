From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 6 Apr 2021 22:06:00 +0200
Subject: [Buildroot] [git commit] package/wpa_supplicant: handle
 CONFIG_CTRL_IFACE carefully
Message-ID: <20210406194530.52EE982AA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da80fd41563911cfa46aa94afd626310565251c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE is not set and
BR2_PACKAGE_WPA_SUPPLICANT_DBUS=y, CONFIG_CTRL_IFACE_DBUS_NEW will be
enabled by 's/^#\(CONFIG_CTRL_IFACE_DBUS_NEW\)/\1/' first, and then
disabled by 's/^\(CONFIG_CTRL_IFACE\)/#\1/'.

CONFIG_CTRL_IFACE_DBUS_NEW does not depend on CONFIG_CTRL_IFACE, except
for using it as a prefix. Fix this wrong behavior by adding '\>' after
CONFIG_CTRL_IFACE.

Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
Tested-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wpa_supplicant/wpa_supplicant.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 96f0596bfe..356ea91828 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -138,7 +138,7 @@ WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1internal/'
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE),)
-WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_CTRL_IFACE
+WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_CTRL_IFACE\>
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS),y)
