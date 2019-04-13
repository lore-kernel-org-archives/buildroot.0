From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 13 Apr 2019 16:25:25 +0200
Subject: [Buildroot] [git commit] package/hostapd: fix static build with
 openssl and atomic
Message-ID: <20190413143605.A15F58D413@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1455b91f88a33ab96cf356ca3ded86a0e196cb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use pkg-config to find openssl dependencies such as lz or latomic

Fix build on sparc v8 (even if there is no autobuilder failures yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/hostapd/hostapd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index b7ebe26a28..e2b0feec9b 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -35,8 +35,8 @@ HOSTAPD_CONFIG_DISABLE =
 
 # Try to use openssl if it's already available
 ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
-HOSTAPD_DEPENDENCIES += libopenssl
-HOSTAPD_LIBS += $(if $(BR2_STATIC_LIBS),-lcrypto -lz)
+HOSTAPD_DEPENDENCIES += host-pkgconf libopenssl
+HOSTAPD_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 HOSTAPD_CONFIG_EDITS += 's/\#\(CONFIG_TLS=openssl\)/\1/'
 else
 HOSTAPD_CONFIG_DISABLE += CONFIG_EAP_PWD
