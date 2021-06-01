From: Sam Voss <sam.voss@collins.com>
Date: Tue,  1 Jun 2021 13:09:14 -0500
Subject: [Buildroot] [PATCH] package/hostapd: add upstream patch to fix
 CVE-2021-27803
Message-ID: <20210601180915.14897-1-sam.voss@collins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following:

- CVE-2021-27803: A vulnerability was discovered in how p2p/p2p_pd.c in
wpa_supplicant before 2.10 processes P2P (Wi-Fi Direct) provision
discovery requests. It could result in denial of service or other impact
(potentially execution of arbitrary code), for an attacker within radio
range.

Signed-off-by: Sam Voss <sam.voss@collins.com>
---
 package/hostapd/hostapd.hash | 1 +
 package/hostapd/hostapd.mk   | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/hostapd/hostapd.hash b/package/hostapd/hostapd.hash
index e2f76c12d9..9ac5f4b392 100644
--- a/package/hostapd/hostapd.hash
+++ b/package/hostapd/hostapd.hash
@@ -3,4 +3,5 @@ sha256  881d7d6a90b2428479288d64233151448f8990ab4958e0ecaca7eeb3c9db2bd7  hostap
 sha256  2d9a5b9d616f1b4aa4a22b967cee866e2f69b798b0b46803a7928c8559842bd7  0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch
 sha256  49feb35a5276279b465f6836d6fa2c6b34d94dc979e8b840d1918865c04260de  0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch
 sha256  a8212a2d89a5bab2824d22b6047e7740553df163114fcec94832bfa9c5c5d78a  0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch
+sha256  7f40cfec5faf5e927ea9028ab9392cd118685bde7229ad24210caf0a8f6e9611  0001-P2P-Fix-a-corner-case-in-peer-addition-based-on-PD-R.patch
 sha256  9da5dd0776da266b180b915e460ff75c6ff729aca1196ab396529510f24f3761  README
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 8eff92eb1e..8820254f89 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -11,7 +11,8 @@ HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config
 HOSTAPD_PATCH = \
 	https://w1.fi/security/2020-1/0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch \
 	https://w1.fi/security/2020-1/0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch \
-	https://w1.fi/security/2020-1/0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch
+	https://w1.fi/security/2020-1/0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch \
+	https://w1.fi/security/2021-1/0001-P2P-Fix-a-corner-case-in-peer-addition-based-on-PD-R.patch
 HOSTAPD_DEPENDENCIES = host-pkgconf
 HOSTAPD_CFLAGS = $(TARGET_CFLAGS)
 HOSTAPD_LICENSE = BSD-3-Clause
@@ -26,6 +27,9 @@ HOSTAPD_IGNORE_CVES += CVE-2020-12695
 # 0002-ASN.1-Validate-DigestAlgorithmIdentifier-parameters.patch
 HOSTAPD_IGNORE_CVES += CVE-2021-30004
 
+# 0001-P2P-Fix-a-corner-case-in-peer-addition-based-on-PD-R.patch
+HOSTAPD_IGNORE_CVES += CVE-2021-27803
+
 HOSTAPD_CPE_ID_VENDOR = w1.fi
 HOSTAPD_CONFIG_SET =
 
-- 
2.17.1
