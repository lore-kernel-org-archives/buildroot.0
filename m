From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 13 Feb 2021 18:40:10 +0100
Subject: [Buildroot] [RFC v1 3/6] package/double-conversion: new package
In-Reply-To: <20210213174013.32584-1-ps.report@gmx.net>
References: <20210213174013.32584-1-ps.report@gmx.net>
Message-ID: <20210213174013.32584-4-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/Config.in                                |  1 +
 package/double-conversion/Config.in              | 14 ++++++++++++++
 package/double-conversion/double-conversion.hash |  3 +++
 package/double-conversion/double-conversion.mk   | 13 +++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/double-conversion/Config.in
 create mode 100644 package/double-conversion/double-conversion.hash
 create mode 100644 package/double-conversion/double-conversion.mk

diff --git a/package/Config.in b/package/Config.in
index fab4dcab89..1ddd47f50a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1861,6 +1861,7 @@ menu "Other"
 	source "package/cracklib/Config.in"
 	source "package/dawgdic/Config.in"
 	source "package/ding-libs/Config.in"
+	source "package/double-conversion/Config.in"
 	source "package/eigen/Config.in"
 	source "package/elfutils/Config.in"
 	source "package/ell/Config.in"
diff --git a/package/double-conversion/Config.in b/package/double-conversion/Config.in
new file mode 100644
index 0000000000..8c590fbde6
--- /dev/null
+++ b/package/double-conversion/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_DOUBLE_CONVERSION
+	bool "double-conversion"
+	# note: BR2_microblazeel/BR2_nios2/BR2_xtensa was added post v3.1.5 already
+	depends on !BR2_nds32 && !BR2_microblazeel && !BR2_nios2
+	depends on !BR2_xtensa
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Provides binary-decimal and decimal-binary routines for
+	  IEEE doubles.
+
+	  https://github.com/google/double-conversion
+
+comment "double-conversion needs a toolchian w/ C++
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/double-conversion/double-conversion.hash b/package/double-conversion/double-conversion.hash
new file mode 100644
index 0000000000..65411a8982
--- /dev/null
+++ b/package/double-conversion/double-conversion.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  a63ecb93182134ba4293fd5f22d6e08ca417caafa244afaa751cbfddf6415b13  double-conversion-3.1.5.tar.gz
+sha256  4af93c12062c58058378de2397dc1c92bbff9ddfb1d583a01c84127557ce97ca  COPYING
diff --git a/package/double-conversion/double-conversion.mk b/package/double-conversion/double-conversion.mk
new file mode 100644
index 0000000000..c8db5104f0
--- /dev/null
+++ b/package/double-conversion/double-conversion.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# double-conversion
+#
+################################################################################
+
+DOUBLE_CONVERSION_VERSION = 3.1.5
+DOUBLE_CONVERSION_SITE = $(call github,google,double-conversion,v$(DOUBLE_CONVERSION_VERSION))
+DOUBLE_CONVERSION_LICENSE = BSD-3-Clause
+DOUBLE_CONVERSION_LICENSE_FILES = COPYING
+DOUBLE_CONVERSION_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
-- 
2.30.0
