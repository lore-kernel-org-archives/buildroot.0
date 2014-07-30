From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Jul 2014 19:50:47 +0200
Subject: [Buildroot] [git commit] libiconv: disable building the preloadable
	library
Message-ID: <20140730175452.6D4779D34A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=82cf4f00ac11fb08eff0f39a6c264d75f4ea0817
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We were already removing the preloadable iconv library (that can be
used through LD_PRELOAD to override the C library iconv
implementation) from staging/target, but it was still built. And this
causes issues in static only scenarios, so this patch changes that to
not even build/install the preloadable library.

[Thomas: changed Gustavo's patch to take into the fact that we never
need the preloadable library.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libiconv/libiconv.mk |   16 ++++++----------
 1 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/package/libiconv/libiconv.mk b/package/libiconv/libiconv.mk
index 52e2349..af55b60 100644
--- a/package/libiconv/libiconv.mk
+++ b/package/libiconv/libiconv.mk
@@ -10,17 +10,13 @@ LIBICONV_INSTALL_STAGING = YES
 LIBICONV_LICENSE = GPLv3+ (iconv program), LGPLv2+ (library)
 LIBICONV_LICENSE_FILES = COPYING COPYING.LIB
 
-# Remove not used preloadable libiconv.so
-define LIBICONV_TARGET_REMOVE_PRELOADABLE_LIBS
-	rm -f $(TARGET_DIR)/usr/lib/preloadable_libiconv.so
+# Don't build the preloadable library, as we don't need it (it's only
+# for LD_PRELOAD to replace glibc's iconv, but we never build libiconv
+# when glibc is ued). And it causes problems for static only builds.
+define LIBICONV_DISABLE_PRELOAD
+	$(SED) '/preload/d' $(@D)/Makefile.in
 endef
-
-define LIBICONV_STAGING_REMOVE_PRELOADABLE_LIBS
-	rm -f $(STAGING_DIR)/usr/lib/preloadable_libiconv.so
-endef
-
-LIBICONV_POST_INSTALL_TARGET_HOOKS += LIBICONV_TARGET_REMOVE_PRELOADABLE_LIBS
-LIBICONV_POST_INSTALL_STAGING_HOOKS += LIBICONV_STAGING_REMOVE_PRELOADABLE_LIBS
+LIBICONV_PRE_CONFIGURE_HOOKS += LIBICONV_DISABLE_PRELOAD
 
 $(eval $(autotools-package))
 
