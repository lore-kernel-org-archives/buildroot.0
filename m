From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 21:57:45 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/softether: fix
 static build with openssl and atomic
Message-ID: <20190424195441.8D98881287@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2615bba75e0d78b01a27613be3fab9a60547b8db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Don't pass --with-openssl option to force softether to use pkg-config
(see autotools/ax_check_openssl.m4).

pkg-config will find openssl dependencies such as lz or latomic

Fix static build on sparc v8 (even if there is no autobuilder failures
yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 5472d80405b7edd61ad0eec3a6b2f45e8dd8f8e9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/softether/softether.mk | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/package/softether/softether.mk b/package/softether/softether.mk
index 31378e8b70..1a31abd4bd 100644
--- a/package/softether/softether.mk
+++ b/package/softether/softether.mk
@@ -8,7 +8,7 @@ SOFTETHER_VERSION = v4.28-9669-beta
 SOFTETHER_SITE = $(call github,SoftEtherVPN,SoftEtherVPN_stable,$(SOFTETHER_VERSION))
 SOFTETHER_LICENSE = GPL-2.0
 SOFTETHER_LICENSE_FILES = LICENSE
-SOFTETHER_DEPENDENCIES = host-softether libopenssl readline
+SOFTETHER_DEPENDENCIES = host-pkgconf host-softether libopenssl readline
 SOFTETHER_AUTORECONF = YES
 
 ifeq ($(BR2_ENABLE_LOCALE),)
@@ -16,14 +16,7 @@ SOFTETHER_DEPENDENCIES += libiconv
 SOFTETHER_CONF_ENV = LIBS+=" -liconv"
 endif
 
-ifeq ($(BR2_STATIC_LIBS),y)
-# openssl needs zlib
-SOFTETHER_CONF_ENV += LIBS+=" -lz"
-endif
-
-SOFTETHER_CONF_OPTS = \
-	--with-openssl="$(STAGING_DIR)/usr" \
-	--with-zlib="$(STAGING_DIR)/usr"
+SOFTETHER_CONF_OPTS = --with-zlib="$(STAGING_DIR)/usr"
 
 # host-libiconv does not exist, therefore we need this extra line
 HOST_SOFTETHER_DEPENDENCIES = host-pkgconf host-libopenssl host-readline
