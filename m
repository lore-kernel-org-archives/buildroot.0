From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Dec 2017 18:24:11 +0100
Subject: [Buildroot] [git commit] pkgconf: use relative path to STAGING_DIR
 instead of absolute path
Message-ID: <20171231172424.A091D8395A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f6d39816bdb2cbd544779d82591b0e9e1a9877f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The pkg-config wrapper script is currently generated with absolute
paths to $(STAGING_DIR). However, this will not work properly with
per-package SDK, and each package will be built with a different
STAGING_DIR value.

In order to fix this, we adjust how the pkg-config wrapper script is
generated, so that it uses a relative path to itself: the sysroot (i.e
STAGING_DIR) is always located in $(path of
pkg-config)/../$(STAGING_SUBDIR).

This change is independent from the per-package SDK work, and could be
applied independently from it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkgconf/pkg-config.in | 5 ++++-
 package/pkgconf/pkgconf.mk    | 3 +--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/pkgconf/pkg-config.in b/package/pkgconf/pkg-config.in
index 4dec487..b9ce093 100644
--- a/package/pkgconf/pkg-config.in
+++ b/package/pkgconf/pkg-config.in
@@ -1,2 +1,5 @@
 #!/bin/sh
-PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:- at PKG_CONFIG_LIBDIR@} PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:- at STAGING_DIR@} $(dirname $0)/pkgconf @STATIC@ $@
+PKGCONFDIR=$(dirname $0)
+DEFAULT_PKG_CONFIG_LIBDIR=${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/lib/pkgconfig:${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/share/pkgconfig
+DEFAULT_PKG_CONFIG_SYSROOT_DIR=${PKGCONFDIR}/../@STAGING_SUBDIR@
+PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:-${DEFAULT_PKG_CONFIG_LIBDIR}} PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:-${DEFAULT_PKG_CONFIG_SYSROOT_DIR}} ${PKGCONFDIR}/pkgconf @STATIC@ $@
diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index cc190d2..00b2d01 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -19,8 +19,7 @@ endef
 define HOST_PKGCONF_INSTALL_WRAPPER
 	$(INSTALL) -m 0755 -D package/pkgconf/pkg-config.in \
 		$(HOST_DIR)/bin/pkg-config
-	$(SED) 's, at PKG_CONFIG_LIBDIR@,$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig,' \
-		-e 's, at STAGING_DIR@,$(STAGING_DIR),' \
+	$(SED) 's, at STAGING_SUBDIR@,$(STAGING_SUBDIR),g' \
 		$(HOST_DIR)/bin/pkg-config
 endef
 
