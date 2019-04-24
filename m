From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 21:56:39 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/hostapd: fix
 static build with openssl and atomic
Message-ID: <20190424195216.171408135F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=440c933d3c5796ddb953cf88b5abecebc82d10d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Use pkg-config to find openssl dependencies such as lz or latomic

Fix build on sparc v8 (even if there is no autobuilder failures yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit d1455b91f88a33ab96cf356ca3ded86a0e196cb9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
