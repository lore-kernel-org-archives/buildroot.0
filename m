From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Nov 2014 21:51:41 +0100
Subject: [Buildroot] [git commit] bdwgc: Add new package
Message-ID: <20141201104838.84DE87FFFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b0476427f6c0036b7803d591a5394923c4b07142
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bdwgc is a garbage collector for C and C++. The Boehm-Demers-Weiser
conservative garbage collector can be used as a garbage collecting
replacement for C 'malloc' or C++ 'new'.

[Thomas:
 - drop the dependency on host-bdwgc, since it is not needed. Only
   host-guile will need host-bdwgc, but bdwgc itself doesn't need
   host-bdwgc.
 - add dependency on host-pkgconf, needed to detect libatomic_ops
 - add --with-libatomic-ops=yes to force bdwgc to use the system
   libatomic_ops, and not the internal one.
 - instead of using BDWGC_LIBTOOL_PATCH = NO (needed to avoid patching
   libtool because the libtool version used by bdwgc does not have a
   corresponding patch in Buildroot), use BDWGC_AUTORECONF = YES,
   which generates a proper libtool (without this, some -L/usr/lib
   flags are added by libtool).]

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in       |    1 +
 package/bdwgc/Config.in |   10 ++++++++++
 package/bdwgc/bdwgc.mk  |   26 ++++++++++++++++++++++++++
 3 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 6875d8b..5d6d62d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -859,6 +859,7 @@ menu "Other"
 	source "package/apr-util/Config.in"
 	source "package/argp-standalone/Config.in"
 	source "package/armadillo/Config.in"
+	source "package/bdwgc/Config.in"
 	source "package/boost/Config.in"
 	source "package/clapack/Config.in"
 	source "package/classpath/Config.in"
diff --git a/package/bdwgc/Config.in b/package/bdwgc/Config.in
new file mode 100644
index 0000000..9aa7c7d
--- /dev/null
+++ b/package/bdwgc/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_BDWGC
+	bool "bdwgc"
+	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
+	select BR2_PACKAGE_LIBATOMIC_OPS
+	help
+	  The Boehm-Demers-Weiser conservative garbage collector can
+	  be used as a garbage collecting replacement for C 'malloc'
+	  or C++ 'new'.
+
+	  http://www.hboehm.info/gc/
diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
new file mode 100644
index 0000000..3e6de1a
--- /dev/null
+++ b/package/bdwgc/bdwgc.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# bdwgc
+#
+################################################################################
+
+BDWGC_VERSION = 7.2f
+BDWGC_SOURCE = gc-$(BDWGC_VERSION).tar.gz
+BDWGC_SITE = http://www.hboehm.info/gc/gc_source
+BDWGC_INSTALL_STAGING = YES
+BDWGC_LICENSE = bdwgc license
+BDWGC_LICENSE_FILES = README.QUICK
+BDWGC_DEPENDENCIES = libatomic_ops host-pkgconf
+
+# The libtool shipped with the package is bogus and generates some
+# -L/usr/lib flags. It uses a version not supported by Buildroot
+# libtool patches, so autoreconfiguring the packages is the easiest
+# solution.
+BDWGC_AUTORECONF = YES
+
+# Ensure we use the system libatomic_ops, and not the internal one.
+BDWGC_CONF_OPTS = --with-libatomic-ops=yes
+HOST_BDWGC_CONF_OPTS = --with-libatomic-ops=yes
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
