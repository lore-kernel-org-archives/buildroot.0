From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 21:56:33 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/wpa_supplicant:
 fix static build with openssl and atomic
Message-ID: <20190424195216.10B338135F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=88019952d5d1e47c5000732e8e7d4c2cf1d1133e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Use pkg-config to find openssl dependencies such as lz or latomic

Fix build on sparc v8 (even if there is no autobuilder failures yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 056e963119ce6d553d2383b863d5e68f923c6922)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpa_supplicant/wpa_supplicant.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index a60f097801..4c80cd2d03 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -105,8 +105,8 @@ endif
 
 # Try to use openssl if it's already available
 ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
-WPA_SUPPLICANT_DEPENDENCIES += libopenssl
-WPA_SUPPLICANT_LIBS += $(if $(BR2_STATIC_LIBS),-lcrypto -lz)
+WPA_SUPPLICANT_DEPENDENCIES += host-pkgconf libopenssl
+WPA_SUPPLICANT_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=openssl\)/\1/'
 else
 WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP_PWD
