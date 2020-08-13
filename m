From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2020 23:06:35 +0200
Subject: [Buildroot] [git commit] package/wpa_supplicant: disable TEAP for
 internal TLS implementation
Message-ID: <20200813210021.44335861D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb27efbce75071d7c9b36bc5a896d166e01c1aa1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wpa_supplicant/wpa_supplicant.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 8e7b9c3a65..7170db0d07 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -115,7 +115,7 @@ WPA_SUPPLICANT_DEPENDENCIES += host-pkgconf libopenssl
 WPA_SUPPLICANT_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=openssl\)/\1/'
 else
-WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP_PWD
+WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP_PWD CONFIG_EAP_TEAP
 WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1internal/'
 endif
 
