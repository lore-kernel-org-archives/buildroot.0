From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 19:19:59 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/hostapd: add
 upstream 2020-1 security patches
Message-ID: <20200828174508.450338653F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df77691b15824fd62990137cec38903b100a94bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes the following security vulnerabilities:

CVE-2020-12695: The Open Connectivity Foundation UPnP specification before
2020-04-17 does not forbid the acceptance of a subscription request with a
delivery URL on a different network segment than the fully qualified
event-subscription URL, aka the CallStranger issue.

For details, see the advisory:
https://w1.fi/security/2020-1/upnp-subscribe-misbehavior-wps-ap.txt

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9b020359b141f5316276079cbea8001649bcec0c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hostapd/hostapd.hash | 3 +++
 package/hostapd/hostapd.mk   | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/package/hostapd/hostapd.hash b/package/hostapd/hostapd.hash
index bf5016acc3..e2f76c12d9 100644
--- a/package/hostapd/hostapd.hash
+++ b/package/hostapd/hostapd.hash
@@ -1,3 +1,6 @@
 # Locally calculated
 sha256  881d7d6a90b2428479288d64233151448f8990ab4958e0ecaca7eeb3c9db2bd7  hostapd-2.9.tar.gz
+sha256  2d9a5b9d616f1b4aa4a22b967cee866e2f69b798b0b46803a7928c8559842bd7  0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch
+sha256  49feb35a5276279b465f6836d6fa2c6b34d94dc979e8b840d1918865c04260de  0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch
+sha256  a8212a2d89a5bab2824d22b6047e7740553df163114fcec94832bfa9c5c5d78a  0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch
 sha256  9da5dd0776da266b180b915e460ff75c6ff729aca1196ab396529510f24f3761  README
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index b94a0e4578..676e36d8ba 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -8,6 +8,10 @@ HOSTAPD_VERSION = 2.9
 HOSTAPD_SITE = http://w1.fi/releases
 HOSTAPD_SUBDIR = hostapd
 HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config
+HOSTAPD_PATCH = \
+	https://w1.fi/security/2020-1/0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch \
+	https://w1.fi/security/2020-1/0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch \
+	https://w1.fi/security/2020-1/0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch
 HOSTAPD_DEPENDENCIES = host-pkgconf
 HOSTAPD_CFLAGS = $(TARGET_CFLAGS)
 HOSTAPD_LICENSE = BSD-3-Clause
@@ -16,6 +20,9 @@ HOSTAPD_LICENSE_FILES = README
 # 0001-AP-Silently-ignore-management-frame-from-unexpected-.patch
 HOSTAPD_IGNORE_CVES += CVE-2019-16275
 
+# 0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch
+HOSTAPD_IGNORE_CVES += CVE-2020-12695
+
 HOSTAPD_CONFIG_SET =
 
 HOSTAPD_CONFIG_ENABLE = \
