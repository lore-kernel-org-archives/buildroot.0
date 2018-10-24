From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 12:39:28 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] freetype: drop calling
 autogen, no longer needed
Message-ID: <20181024103752.20A4F88844@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c9bf7176e734b76a0f916d090efe803a2c6c334e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

In commit a31a66802a7a1af76a629b0ba7120424ed547646 ("freetype:
security bump to version 2.5.3"), the freetype package was changed to
call ./autogen.sh to regenerate the autotools stuff, because the
ltmain.sh provided by upstream freetype was not compatible with
Buildroot libtool-patching logic.

Since then, freetype has been bumped several times, and the current
version packaged in Buildroot has an ltmain.sh that is compatible with
our libtool-patching logic.

Therefore, this commit drops the no longer needed autogen stuff.

This autogen stuff was badly breaking per-package host/target
directory, because the autogen happened at the post-patch hook step,
at which point the host-automake/host-autoconf/host-libtool
dependencies have not yet been copied into this package host
directory.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 88c6329521a634a6550f50900f4334b1d2e3473a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freetype/freetype.mk | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 1028664799..e755c82378 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -17,19 +17,6 @@ FREETYPE_CONFIG_SCRIPTS = freetype-config
 HOST_FREETYPE_DEPENDENCIES = host-pkgconf
 HOST_FREETYPE_CONF_OPTS = --without-zlib --without-bzip2 --without-png
 
-# Regen required because the tarball ships with an experimental ltmain.sh
-# that can't be patched by our infra.
-# autogen.sh is because autotools stuff lives in other directories and
-# even AUTORECONF with _OPTS doesn't do it properly.
-# POST_PATCH is because we still need to patch libtool after the regen.
-define FREETYPE_RUN_AUTOGEN
-	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
-endef
-FREETYPE_POST_PATCH_HOOKS += FREETYPE_RUN_AUTOGEN
-HOST_FREETYPE_POST_PATCH_HOOKS += FREETYPE_RUN_AUTOGEN
-FREETYPE_DEPENDENCIES += host-automake host-autoconf host-libtool
-HOST_FREETYPE_DEPENDENCIES += host-automake host-autoconf host-libtool
-
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 FREETYPE_DEPENDENCIES += zlib
 FREETYPE_CONF_OPTS += --with-zlib
@@ -72,8 +59,3 @@ FREETYPE_POST_INSTALL_STAGING_HOOKS += FREETYPE_FIX_CONFIG_FILE_LIBS
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-
-# freetype-patch and host-freetype-patch use autogen.sh so add
-# host-automake as a order-only-prerequisite because it is a phony
-# target.
-$(FREETYPE_TARGET_PATCH) $(HOST_FREETYPE_TARGET_PATCH): | host-automake
