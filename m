From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Mar 2021 21:29:36 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/wpa_supplicant:
 add upstream 2021-1 security fix
Message-ID: <20210314201241.46EC987C90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca8e5c9e33bcde0228e50a7c98966dd0bac4e95e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes the following security issue:

- wpa_supplicant P2P provision discovery processing vulnerability (no CVE
  yet)

A vulnerability was discovered in how wpa_supplicant processes P2P
(Wi-Fi Direct) provision discovery requests. Under a corner case
condition, an invalid Provision Discovery Request frame could end up
reaching a state where the oldest peer entry needs to be removed. With
a suitably constructed invalid frame, this could result in use
(read+write) of freed memory. This can result in an attacker within
radio range of the device running P2P discovery being able to cause
unexpected behavior, including termination of the wpa_supplicant process
and potentially code execution.

For more details, see the advisory:
https://w1.fi/security/2021-1/wpa_supplicant-p2p-provision-discovery-processing-vulnerability.txt

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[yann.morin.1998 at free.fr: actually add the patch URL to the patch list]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9ada4eb2f1c3d67ee49f6f5466738bcd821fc647)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpa_supplicant/wpa_supplicant.hash | 1 +
 package/wpa_supplicant/wpa_supplicant.mk   | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.hash b/package/wpa_supplicant/wpa_supplicant.hash
index cce465d849..2387391a3c 100644
--- a/package/wpa_supplicant/wpa_supplicant.hash
+++ b/package/wpa_supplicant/wpa_supplicant.hash
@@ -2,3 +2,4 @@
 sha256  fcbdee7b4a64bea8177973299c8c824419c413ec2e3a95db63dd6a5dc3541f17  wpa_supplicant-2.9.tar.gz
 sha256  9da5dd0776da266b180b915e460ff75c6ff729aca1196ab396529510f24f3761  README
 sha256  c4d65cc13863e0237d0644198558e2c47b4ed91e2b2be4516ff590724187c4a5  0001-P2P-Fix-copying-of-secondary-device-types-for-P2P-gr.patch
+sha256  7f40cfec5faf5e927ea9028ab9392cd118685bde7229ad24210caf0a8f6e9611  0001-P2P-Fix-a-corner-case-in-peer-addition-based-on-PD-R.patch
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index eaa43302d6..9f6f18382f 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -7,7 +7,8 @@
 WPA_SUPPLICANT_VERSION = 2.9
 WPA_SUPPLICANT_SITE = http://w1.fi/releases
 WPA_SUPPLICANT_PATCH = \
-	https://w1.fi/security/2020-2/0001-P2P-Fix-copying-of-secondary-device-types-for-P2P-gr.patch
+	https://w1.fi/security/2020-2/0001-P2P-Fix-copying-of-secondary-device-types-for-P2P-gr.patch \
+	https://w1.fi/security/2021-1/0001-P2P-Fix-a-corner-case-in-peer-addition-based-on-PD-R.patch
 WPA_SUPPLICANT_LICENSE = BSD-3-Clause
 WPA_SUPPLICANT_LICENSE_FILES = README
 WPA_SUPPLICANT_CONFIG = $(WPA_SUPPLICANT_DIR)/wpa_supplicant/.config
