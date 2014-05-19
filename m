From: Steve Thomas <scjthm@live.com>
Date: Mon, 19 May 2014 11:54:24 +0000
Subject: [Buildroot] [PATCH v3 2/3] cloog: new package
In-Reply-To: <1400500465-9142-1-git-send-email-scjthm@live.com>
References: <1400500465-9142-1-git-send-email-scjthm@live.com>
Message-ID: <BLU436-SMTP25605C9B636A28776C2EAA8320@phx.gbl>
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
Changes v2 -> v3:
    - removed packages from Config.in
    - disabled target builds
    - added empty line to commit messages
    - removed isl patch as different version used

Changes v1 -> v2:
    - added more lucid and verbose description in commit messages
    - fixed the url and removed the sources files
    - add complete graphite as three commits yet a single patch
---
 package/cloog/Config.in |  8 ++++++++
 package/cloog/cloog.mk  | 16 ++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 package/cloog/Config.in
 create mode 100644 package/cloog/cloog.mk

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
index 0000000..9308e8f
--- /dev/null
+++ b/package/cloog/cloog.mk
@@ -0,0 +1,16 @@
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
+HOST_CLOOG_CONF_OPT = --with-isl=system --with-polylib=no
+
+$(eval $(host-autotools-package))
-- 
1.9.3
