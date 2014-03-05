From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 5 Mar 2014 12:19:37 +0000
Subject: [Buildroot] [PATCH] host-pkgconf: use --static option for static
	builds
Message-ID: <1394021977-60055-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Detect when BR2_PREFER_STATIC_LIBS is selected and modify the host
pkg-config wrapper to append the --static option in that case.

Fixes:
   http://autobuild.buildroot.net/results/161/161446dde7e8e774773eb2b34fd555f5ac22dd02/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/pkgconf/pkg-config.in |    2 +-
 package/pkgconf/pkgconf.mk    |   14 ++++++++++++++
 2 files changed, 15 insertions(+), 1 deletions(-)

diff --git a/package/pkgconf/pkg-config.in b/package/pkgconf/pkg-config.in
index 25a536b..4dec487 100644
--- a/package/pkgconf/pkg-config.in
+++ b/package/pkgconf/pkg-config.in
@@ -1,2 +1,2 @@
 #!/bin/sh
-PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:- at PKG_CONFIG_LIBDIR@} PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:- at STAGING_DIR@} $(dirname $0)/pkgconf $@
+PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:- at PKG_CONFIG_LIBDIR@} PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:- at STAGING_DIR@} $(dirname $0)/pkgconf @STATIC@ $@
diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index f3f6526..9641371 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -24,8 +24,22 @@ define HOST_PKGCONF_INSTALL_WRAPPER
 		$(HOST_DIR)/usr/bin/pkg-config
 endef
 
+define HOST_PKGCONF_STATIC
+	$(SED) 's, at STATIC@,--static,' $(HOST_DIR)/usr/bin/pkg-config
+endef
+
+define HOST_PKGCONF_SHARED
+	$(SED) 's, at STATIC@,,' $(HOST_DIR)/usr/bin/pkg-config
+endef
+
 PKGCONF_POST_INSTALL_TARGET_HOOKS += PKGCONF_LINK_PKGCONFIG
 HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_INSTALL_WRAPPER
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+	HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_STATIC
+else
+	HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_SHARED
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.7.1
