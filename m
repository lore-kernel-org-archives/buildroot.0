From: Tian Yuanhao <tianyuanhao@aliyun.com>
Date: Fri,  2 Apr 2021 19:23:16 -0700
Subject: [Buildroot] [PATCH v3 1/1] package/wpa_supplicant: handle
 CONFIG_CTRL_IFACE carefully
In-Reply-To: <20210317033739.71436-1-tianyuanhao@aliyun.com>
References: <20210317033739.71436-1-tianyuanhao@aliyun.com>
Message-ID: <20210403022316.8719-1-tianyuanhao@aliyun.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE is not set and
BR2_PACKAGE_WPA_SUPPLICANT_DBUS=y, CONFIG_CTRL_IFACE_DBUS_NEW will be
enabled by 's/^#\(CONFIG_CTRL_IFACE_DBUS_NEW\)/\1/' first, and then
disabled by 's/^\(CONFIG_CTRL_IFACE\)/#\1/'.

CONFIG_CTRL_IFACE_DBUS_NEW does not depend on CONFIG_CTRL_IFACE, except
for using it as a prefix. Fix this wrong behavior by adding '\>' after
CONFIG_CTRL_IFACE.

Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
Tested-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---

v1 -> v2:
  - only handle CONFIG_CTRL_IFACE

v2 -> v3:
  - rewrite commit message
---
 package/wpa_supplicant/wpa_supplicant.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index c82db43c1c..80d75a57c7 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -135,7 +135,7 @@ WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1internal/'
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE),)
-WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_CTRL_IFACE
+WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_CTRL_IFACE\>
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS),y)
-- 
2.25.1
