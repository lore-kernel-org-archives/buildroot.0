From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 16 Dec 2014 22:46:58 +0100
Subject: [Buildroot] [PATCH] package/zlib: allow shared-only builds
Message-ID: <1418766418-8947-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we can build a static-only zlib, but not a shared-only one.

This is because zlib's build-system is a custom ./configure (not using
autotools), and does not allow building/installing only the shared
library.

Simply remove the .a as a post-staging install hook. We don't care
removing it from target, since it is not used at link time to build
other packages, and it is anyway removed later before assembling the
filesystem images anyway.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zlib/zlib.mk | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index 7c849cd..aec9daf 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -11,6 +11,9 @@ ZLIB_LICENSE = zlib license
 ZLIB_LICENSE_FILES = README
 ZLIB_INSTALL_STAGING = YES
 
+# It is not possible to build only a shared version of zlib, so we build both
+# shared and static, unless we only want the static libs, and we eventually
+# selectively remove what we do not want
 ifeq ($(BR2_STATIC_LIBS),y)
 ZLIB_PIC =
 ZLIB_SHARED = --static
@@ -56,6 +59,16 @@ define ZLIB_INSTALL_TARGET_CMDS
 	$(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) LDCONFIG=true install
 endef
 
+# We don't care removing the .a from target, since it not used at link
+# time to build other packages, and it is anyway removed later before
+# assembling the filesystem images anyway.
+ifeq ($(BR2_SHARED_LIBS),y)
+define ZLIB_RM_STATIC_STAGING
+	rm -f $(STAGING_DIR)/usr/lib/libz.a
+endef
+ZLIB_POST_INSTALL_STAGING_HOOKS += ZLIB_RM_STATIC_STAGING
+endif
+
 define HOST_ZLIB_INSTALL_CMDS
 	$(MAKE1) -C $(@D) LDCONFIG=true install
 endef
-- 
1.9.1
