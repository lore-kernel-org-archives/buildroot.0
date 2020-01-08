From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Wed,  8 Jan 2020 22:04:39 +0300
Subject: [Buildroot] [PATCH 1/1] package/wpa_supplicant: disable TEAP for
 internal TLS implementation
Message-ID: <20200108190439.459316-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

EAP-TEAP support in hostapd/wpa_supplicant fails to build with internal
TLS implementation. This patch disables TEAP support in wpa_supplicant
when internal TLS implementation is selected. Similar fix for hostapd
package has already been merged to Buildroot: see commit 47d14e3b1c20
("package/hostapd: disable TEAP for internal TLS implementation").

TEAP is still an experimental feature that is not recommmended for
production use. Currently it should not be used for anything else
than experimentation and interoperability testing. Those who needs
experimenting with TEAP are encouraged to enable openssl in their
buildroot configuration.

Fixes:
http://autobuild.buildroot.net/results/e83613c06041a60f89da787f4ebf876245713cd2/

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 package/wpa_supplicant/wpa_supplicant.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 4f95ea6276..c87494c2bf 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -112,7 +112,7 @@ WPA_SUPPLICANT_DEPENDENCIES += host-pkgconf libopenssl
 WPA_SUPPLICANT_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=openssl\)/\1/'
 else
-WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP_PWD
+WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP_PWD CONFIG_EAP_TEAP
 WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1internal/'
 endif
 
-- 
2.24.1
