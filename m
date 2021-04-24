From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Apr 2021 11:28:03 +0200
Subject: [Buildroot] [git commit] package/wpa_supplicant: ignore
 CVE-2021-30004 when using openssl
Message-ID: <20210424090312.D4EA18039D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f6a6b8e502e47474758f65e09ae9e269ea6bf46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CVE can be ignored when the internal TLS impl isn't used.

https://security-tracker.debian.org/tracker/CVE-2021-30004
 "Issue only affects the "internal" TLS implementation
 (CONFIG_TLS=internal)"

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/wpa_supplicant/wpa_supplicant.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 356ea91828..f59832645f 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -132,6 +132,8 @@ ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 WPA_SUPPLICANT_DEPENDENCIES += host-pkgconf libopenssl
 WPA_SUPPLICANT_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=openssl\)/\1/'
+# Issue only affects the "internal" TLS implementation
+WPA_SUPPLICANT_IGNORE_CVES += CVE-2021-30004
 else
 WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP_PWD CONFIG_EAP_TEAP
 WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1internal/'
