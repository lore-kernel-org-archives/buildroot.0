From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Sep 2015 11:18:02 +0200
Subject: [Buildroot] [git commit] package/libldns: Fix static build
Message-ID: <20150906092939.4753281767@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=828349febdbd5baa952e14bf30bb8051009098f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

http://autobuild.buildroot.net/results/a0e/a0e686cbe5104f48c9ab05aef7b2989abdb23821/
http://autobuild.buildroot.net/results/527/527b6167fcade1333d8bedffca21e32e410ed8c9/
http://autobuild.buildroot.net/results/0f2/0f229b6806b5cf18d5b56f80088bba7dc3c6eb28/
http://autobuild.buildroot.net/results/bad/bad1c0590868c1e97f647172f85b112ff2604994/
http://autobuild.buildroot.net/results/7db/7dba36ae44560e65a00daf912abe8b43fa8a060d/
http://autobuild.buildroot.net/results/3bf/3bf24e3e845ad8ebcfd0469787e7b7342ecfe3c5/
http://autobuild.buildroot.net/results/7c6/7c6985518bb068ef1764dfb44c59c9f583f07c71/
http://autobuild.buildroot.net/results/211/2117de3dc3d1168bdba0c771b54b3d998e3d62ce/
http://autobuild.buildroot.net/results/908/90893b2cdbbc02d75be5cbc09b8a244d5b05d386/

[Peter:
 - Move workaround under openssl conditional
 - Only add host-pkgconf for static builds
 - Always use lib target]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libldns/libldns.mk |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
index 9a28404..3d4d356 100644
--- a/package/libldns/libldns.mk
+++ b/package/libldns/libldns.mk
@@ -17,13 +17,20 @@ LIBLDNS_CONF_OPTS = \
 	--without-pyldnsx
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LIBLDNS_DEPENDENCIES += host-pkgconf openssl
+LIBLDNS_DEPENDENCIES += openssl
 LIBLDNS_CONF_OPTS += \
 	--with-ssl=$(STAGING_DIR)/usr \
 	--enable-dane \
 	--enable-ecdsa \
 	--enable-gost \
 	--enable-sha2
+
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBLDNS_DEPENDENCIES += host-pkgconf
+# missing -lz breaks configure, add it using pkgconf
+LIBLDNS_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs openssl`"
+endif
+
 else
 LIBLDNS_CONF_OPTS += \
 	--without-ssl \
@@ -33,4 +40,8 @@ LIBLDNS_CONF_OPTS += \
 	--disable-sha2
 endif
 
+# the linktest make target fails with static linking, and we are only
+# interested in the lib target anyway
+LIBLDNS_MAKE_OPTS = lib
+
 $(eval $(autotools-package))
