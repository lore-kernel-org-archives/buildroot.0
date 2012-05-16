From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 16 May 2012 15:26:48 +0200
Subject: [Buildroot] [git commit] wpa_supplicant: explicitly disable libnl
	by default
Message-ID: <20120531113257.A5BB996E2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=56901908c63ed7b2aedffaa4b2143ce87a15d837
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libnl support is enabled by default since version 1.0, so disable it
to avoid build breakage when there's no libnl.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/wpa_supplicant/wpa_supplicant.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index a4978e0..97210ce 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -15,9 +15,12 @@ WPA_SUPPLICANT_LDFLAGS = $(TARGET_LDFLAGS)
 ifeq ($(BR2_PACKAGE_LIBNL),y)
 	WPA_SUPPLICANT_DEPENDENCIES += libnl
 define WPA_SUPPLICANT_LIBNL_CONFIG
-	$(SED) "s/^#CONFIG_DRIVER_NL80211/CONFIG_DRIVER_NL80211/" $(WPA_SUPPLICANT_CONFIG)
 	echo "CONFIG_LIBNL32=y" >>$(WPA_SUPPLICANT_CONFIG)
 endef
+else
+define WPA_SUPPLICANT_LIBNL_CONFIG
+	$(SED) "s/^CONFIG_DRIVER_NL80211/#CONFIG_DRIVER_NL80211/" $(WPA_SUPPLICANT_CONFIG)
+endef
 endif
 
 ifneq ($(BR2_PACKAGE_WPA_SUPPLICANT_EAP),y)
