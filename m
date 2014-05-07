From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 May 2014 22:39:33 +0200
Subject: [Buildroot] [git commit] host-pkgconf: use --static option for
	static builds
Message-ID: <20140507204846.30C719CB25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=958c9438ccb5e8c8864edf242b6b4ce3b1f058a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Detect when BR2_PREFER_STATIC_LIBS is selected and modify the host
pkg-config wrapper to append the --static option in that case.

Fixes:
   http://autobuild.buildroot.net/results/161/161446dde7e8e774773eb2b34fd555f5ac22dd02/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
