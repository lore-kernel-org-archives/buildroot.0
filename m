From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Mar 2016 10:16:49 -0300
Subject: [Buildroot] [PATCH] pkgconf: make wrapper relocatable
Message-ID: <1457529409-24102-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use shell ${STAGING_DIR} to expand at run time instead of build time
hence avoiding hardcoding the staging directory in it and making it
relocatable.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pkgconf/pkg-config.in | 2 +-
 package/pkgconf/pkgconf.mk    | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/pkgconf/pkg-config.in b/package/pkgconf/pkg-config.in
index 4dec487..51ac8c1 100644
--- a/package/pkgconf/pkg-config.in
+++ b/package/pkgconf/pkg-config.in
@@ -1,2 +1,2 @@
 #!/bin/sh
-PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:- at PKG_CONFIG_LIBDIR@} PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:- at STAGING_DIR@} $(dirname $0)/pkgconf @STATIC@ $@
+PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:-${STAGING_DIR}/usr/lib/pkgconfig:${STAGING_DIR}/usr/share/pkgconfig} PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:-${STAGING_DIR}} $(dirname $0)/pkgconf @STATIC@ $@
diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index c8b0cba..3cfcc2a 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -19,9 +19,6 @@ endef
 define HOST_PKGCONF_INSTALL_WRAPPER
 	$(INSTALL) -m 0755 -D package/pkgconf/pkg-config.in \
 		$(HOST_DIR)/usr/bin/pkg-config
-	$(SED) 's, at PKG_CONFIG_LIBDIR@,$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig,' \
-		-e 's, at STAGING_DIR@,$(STAGING_DIR),' \
-		$(HOST_DIR)/usr/bin/pkg-config
 endef
 
 define HOST_PKGCONF_STATIC
-- 
2.4.10
