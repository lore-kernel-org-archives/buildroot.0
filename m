From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Oct 2015 22:17:45 +0100
Subject: [Buildroot] [git commit] wpa_supplicant: fix static build with EAP
	enabled
Message-ID: <20151027211833.DC42981F75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c2601c2d6209d567873c328da64c33c33b0992ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable EAP-TNC for static build because its implementation uses dlopen().

 Fixes:
http://autobuild.buildroot.net/results/e21/e21705ae690ab899b6f00e4a15833abef5e54e0e/

[Peter: add comment explaining why]
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpa_supplicant/wpa_supplicant.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 0574f02..839a419 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -45,6 +45,10 @@ endif
 # Trailing underscore on purpose to not enable CONFIG_EAPOL_TEST
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_EAP),y)
 WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_EAP_
+# uses dlopen()
+ifeq ($(BR2_STATIC_LIBS),y)
+WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP_TNC
+endif
 else
 WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP
 endif
