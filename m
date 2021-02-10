From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 19:54:23 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/wpa_supplicant:
 add upstream 2020-2 security fix
Message-ID: <20210210183732.2028181672@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f273fa3861da24cd83940cfd4fcd422d626cd16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes the following security issue:

 - wpa_supplicant P2P group information processing vulnerability (no CVE yet)

   A vulnerability was discovered in how wpa_supplicant processing P2P
   (Wi-Fi Direct) group information from active group owners.  The actual
   parsing of that information validates field lengths appropriately, but
   processing of the parsed information misses a length check when storing a
   copy of the secondary device types.  This can result in writing attacker
   controlled data into the peer entry after the area assigned for the
   secondary device type.  The overflow can result in corrupting pointers
   for heap allocations.  This can result in an attacker within radio range
   of the device running P2P discovery being able to cause unexpected
   behavior, including termination of the wpa_supplicant process and
   potentially arbitrary code execution.

For more details, see the advisory:
https://w1.fi/security/2020-2/wpa_supplicant-p2p-group-info-processing-vulnerability.txt

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[yann.morin.1998 at free.fr: keep _PATCH near _VERSION and _SITE]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 74c854bd518be67719872a9ceb2336a149458deb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpa_supplicant/wpa_supplicant.hash | 1 +
 package/wpa_supplicant/wpa_supplicant.mk   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/wpa_supplicant/wpa_supplicant.hash b/package/wpa_supplicant/wpa_supplicant.hash
index ff5a2edb34..cce465d849 100644
--- a/package/wpa_supplicant/wpa_supplicant.hash
+++ b/package/wpa_supplicant/wpa_supplicant.hash
@@ -1,3 +1,4 @@
 # Locally calculated
 sha256  fcbdee7b4a64bea8177973299c8c824419c413ec2e3a95db63dd6a5dc3541f17  wpa_supplicant-2.9.tar.gz
 sha256  9da5dd0776da266b180b915e460ff75c6ff729aca1196ab396529510f24f3761  README
+sha256  c4d65cc13863e0237d0644198558e2c47b4ed91e2b2be4516ff590724187c4a5  0001-P2P-Fix-copying-of-secondary-device-types-for-P2P-gr.patch
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 7170db0d07..eaa43302d6 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -6,6 +6,8 @@
 
 WPA_SUPPLICANT_VERSION = 2.9
 WPA_SUPPLICANT_SITE = http://w1.fi/releases
+WPA_SUPPLICANT_PATCH = \
+	https://w1.fi/security/2020-2/0001-P2P-Fix-copying-of-secondary-device-types-for-P2P-gr.patch
 WPA_SUPPLICANT_LICENSE = BSD-3-Clause
 WPA_SUPPLICANT_LICENSE_FILES = README
 WPA_SUPPLICANT_CONFIG = $(WPA_SUPPLICANT_DIR)/wpa_supplicant/.config
