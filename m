From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 21 Apr 2021 15:42:32 -0500
Subject: [Buildroot] [PATCH 07/10] package/wpa_supplicant: ignore
 CVE-2021-30004 when using openssl
In-Reply-To: <20210421204235.5956-1-matthew.weber@rockwellcollins.com>
References: <20210421204235.5956-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210421204235.5956-8-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The CVE can be ignored when the internal TLS impl isn't used.

https://security-tracker.debian.org/tracker/CVE-2021-30004
 "Issue only affects the "internal" TLS implementation
 (CONFIG_TLS=internal)"

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
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
-- 
2.17.1
