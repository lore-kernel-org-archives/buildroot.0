From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  1 Dec 2017 21:53:38 +0100
Subject: [Buildroot] [RFCv3 01/15] pkgconf: use relative path to STAGING_DIR
 instead of absolute path
In-Reply-To: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
References: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20171201205352.24287-2-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
Changes since v2:
 - None
Changes since v1:
 - As suggested by Arnout, simplify the generation of the pkg-config
   script by doing only a replacement on @STAGING_SUBDIR@, the rest
   being encoded inside the pkg-config script.
---
 package/pkgconf/pkg-config.in | 5 ++++-
 package/pkgconf/pkgconf.mk    | 3 +--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/pkgconf/pkg-config.in b/package/pkgconf/pkg-config.in
index 4dec48789a..b9ce0935cc 100644
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
index cc190d26da..00b2d017ee 100644
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
 
-- 
2.13.6
