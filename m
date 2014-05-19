From: Steve Thomas <scjthm@live.com>
Date: Mon, 19 May 2014 10:09:08 +0000
Subject: [Buildroot] [PATCH v2 2/3] cloog: new package
In-Reply-To: <1400494150-6936-1-git-send-email-scjthm@live.com>
References: <1400494150-6936-1-git-send-email-scjthm@live.com>
Message-ID: <BLU436-SMTP16014D2002DF50BC7AB4F2EA8320@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CLooG is a free software and library to generate code for scanning
Z-polyhedra.

cloog is needed for the optional graphite optimisations that are
supported by gcc since version 4.5. Therefore this package is required
for the toolchain to support graphite.

Graphite optimisations primarily involve loop blocking flattening and
interchage so are probably of mimimal use in an embedded system where
small sizes are favoured.

cloog depends on isl.

Signed-off-by: Steve Thomas <scjthm@live.com>
---
Changes v1 -> v2:
    - added more lucid and verbose description in commit messages
    - fixed the url and removed the sources files
    - add complete graphite as three commits yet a single patch
---
 package/Config.in       |  1 +
 package/cloog/Config.in |  8 ++++++++
 package/cloog/cloog.mk  | 17 +++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/cloog/Config.in
 create mode 100644 package/cloog/cloog.mk

diff --git a/package/Config.in b/package/Config.in
index 1248eeb..5a6c2e8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -771,6 +771,7 @@ source "package/apr-util/Config.in"
 source "package/argp-standalone/Config.in"
 source "package/boost/Config.in"
 source "package/classpath/Config.in"
+source "package/cloog/Config.in"
 source "package/cppcms/Config.in"
 source "package/eigen/Config.in"
 source "package/elfutils/Config.in"
diff --git a/package/cloog/Config.in b/package/cloog/Config.in
new file mode 100644
index 0000000..db99242
--- /dev/null
+++ b/package/cloog/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_CLOOG
+	bool "cloog"
+    select BR2_PACKAGE_GMP
+    select BR2_PACKAGE_ISL
+	help
+	  Chunky LOOp Generator - Library which generates loops for scanning Z-polyhedra.
+
+	  http://clooglib.org/
diff --git a/package/cloog/cloog.mk b/package/cloog/cloog.mk
new file mode 100644
index 0000000..dea1cfd
--- /dev/null
+++ b/package/cloog/cloog.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# cloog
+#
+################################################################################
+
+CLOOG_VERSION = 0.18.1
+CLOOG_SITE = http://www.bastoul.net/cloog/pages/download/
+CLOOG_INSTALL_STAGING = YES
+CLOOG_LICENSE = LGPLv2.1
+CLOOG_LICENSE_FILES = LICENSE
+CLOOG_DEPENDENCIES = gmp isl
+
+CLOOG_CONF_OPT = --with-isl=system --with-polylib=no
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.9.3
