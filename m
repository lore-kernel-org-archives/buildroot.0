From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:37:15 +0200
Subject: [Buildroot] [git commit] util-linux: remove libintl static linking
	handling
Message-ID: <20170704233520.8D40480257@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ba3474a4bb924a3f21cab4aa60d7b34a4da8062
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We no longer support building the full-blown libintl in static linking
scenarios, as it causes too many problems. Therefore, remove the
special code that was handling this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/util-linux.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 61e3e63..4c2b1f6 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -223,13 +223,5 @@ endif
 
 UTIL_LINUX_POST_INSTALL_TARGET_HOOKS += UTIL_LINUX_GETTY_SYMLINK
 
-ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE)$(BR2_PACKAGE_UTIL_LINUX_LIBUUID),yy)
-define UTIL_LINUX_TWEAK_UUID_PC
-	$(SED) '/Libs\.private: .*/d' $(STAGING_DIR)/usr/lib/pkgconfig/uuid.pc
-	printf "Libs.private: -lintl\n" >>$(STAGING_DIR)/usr/lib/pkgconfig/uuid.pc
-endef
-UTIL_LINUX_POST_INSTALL_TARGET_HOOKS += UTIL_LINUX_TWEAK_UUID_PC
-endif
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
