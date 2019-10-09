From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 9 Oct 2019 23:08:05 +0200
Subject: [Buildroot] [git commit] package/musl-fts: new package
Message-ID: <20191009221023.A68FF8B6FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3461109ec6cb2842922d3f77bb71ce2a5235536b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package provides a replacement implementation for <fts.h>
functions missing from musl and uClibc-ng.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
[Arnout: move v from VERSION to SITE, as suggested by Matt]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/musl-fts/Config.in     |  7 +++++++
 package/musl-fts/musl-fts.hash |  3 +++
 package/musl-fts/musl-fts.mk   | 21 +++++++++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 05f33eb2c3..75e3f76986 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2304,6 +2304,7 @@ F:	package/monit/
 F:	package/mpdecimal/
 F:	package/msmtp/
 F:	package/musl/
+F:	package/musl-fts/
 F:	package/ne10/
 F:	package/pkg-python.mk
 F:	package/pkg-autotools.mk
diff --git a/package/Config.in b/package/Config.in
index 47b602c547..71e939797c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1775,6 +1775,7 @@ endif
 	source "package/msgpack/Config.in"
 	source "package/mtdev2tuio/Config.in"
 	source "package/musl-compat-headers/Config.in"
+	source "package/musl-fts/Config.in"
 	source "package/openblas/Config.in"
 	source "package/orc/Config.in"
 	source "package/p11-kit/Config.in"
diff --git a/package/musl-fts/Config.in b/package/musl-fts/Config.in
new file mode 100644
index 0000000000..a7f38c182e
--- /dev/null
+++ b/package/musl-fts/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_MUSL_FTS
+	bool "musl-fts"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  The musl-fts package implements the fts(3) functions
+	  fts_open, fts_read, fts_children, fts_set and fts_close,
+	  which are missing in musl and uClibc-ng C libraries.
diff --git a/package/musl-fts/musl-fts.hash b/package/musl-fts/musl-fts.hash
new file mode 100644
index 0000000000..8838c84793
--- /dev/null
+++ b/package/musl-fts/musl-fts.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256	  49ae567a96dbab22823d045ffebe0d6b14b9b799925e9ca9274d47d26ff482a6  musl-fts-1.2.7.tar.gz
+sha256	  55af87e4017668f54467a3380e7ebbac5e672d8c763bfe95e6fc882a6fdc4046  COPYING
diff --git a/package/musl-fts/musl-fts.mk b/package/musl-fts/musl-fts.mk
new file mode 100644
index 0000000000..d1999acb17
--- /dev/null
+++ b/package/musl-fts/musl-fts.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# musl-fts
+#
+################################################################################
+
+MUSL_FTS_VERSION = 1.2.7
+MUSL_FTS_SITE = $(call github,void-linux,musl-fts,v$(MUSL_FTS_VERSION))
+MUSL_FTS_AUTORECONF = YES
+MUSL_FTS_LICENSE = BSD-3-Clause
+MUSL_FTS_LICENSE_FILES = COPYING
+# pkg-config needed for autoreconf
+MUSL_FTS_DEPENDENCIES = host-pkgconf
+MUSL_FTS_INSTALL_STAGING = YES
+
+define MUSL_FTS_CREATE_M4_DIR
+	mkdir -p $(@D)/m4
+endef
+MUSL_FTS_POST_PATCH_HOOKS += MUSL_FTS_CREATE_M4_DIR
+
+$(eval $(autotools-package))
