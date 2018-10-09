From: Joel Carlson <joelsoncarl@gmail.com>
Date: Tue,  9 Oct 2018 17:46:49 -0600
Subject: [Buildroot] [PATCH 1/1] libcorrect: add package
Message-ID: <20181009234649.19784-1-JoelsonCarl@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds the libcorrect package. Libcorrect by default builds a shared
library, so require shared libraries. It also sets the -Wpedantic flag
in its Debug build, which first exists starting in gcc 4.8.

Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
---

Compile-tested using utils/test-pkg -a

---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/libcorrect/Config.in       | 13 +++++++++++++
 package/libcorrect/libcorrect.hash |  3 +++
 package/libcorrect/libcorrect.mk   | 13 +++++++++++++
 5 files changed, 31 insertions(+)
 create mode 100644 package/libcorrect/Config.in
 create mode 100644 package/libcorrect/libcorrect.hash
 create mode 100644 package/libcorrect/libcorrect.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 0fb3738e9a..0757ebfcf2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1073,6 +1073,7 @@ N:	Joel Carlson <JoelsonCarl@gmail.com>
 F:	package/capnproto/
 F:	package/cmocka/
 F:	package/flatcc/
+F:	package/libcorrect/
 
 N:	Joel Stanley <joel@jms.id.au>
 F:	package/pdbg/
diff --git a/package/Config.in b/package/Config.in
index 29e11441f9..aae7855ec3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1609,6 +1609,7 @@ menu "Other"
 	source "package/libcap-ng/Config.in"
 	source "package/libcgroup/Config.in"
 	source "package/libcofi/Config.in"
+	source "package/libcorrect/Config.in"
 	source "package/libcroco/Config.in"
 	source "package/libcrossguid/Config.in"
 	source "package/libcsv/Config.in"
diff --git a/package/libcorrect/Config.in b/package/libcorrect/Config.in
new file mode 100644
index 0000000000..e29b39caa0
--- /dev/null
+++ b/package/libcorrect/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBCORRECT
+	bool "libcorrect"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # -Wpedantic first appears
+	depends on !BR2_STATIC_LIBS
+	help
+	  A C library for Forward Error Correction, providing
+	  convolutional codes and Reed-Solomon codes. It is part
+	  of the Quiet Modem Project.
+
+	  https://github.com/quiet/libcorrect
+
+comment "libcorrect needs a toolchain w/ gcc >= 4.8, dynamic library"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || BR2_STATIC_LIBS
diff --git a/package/libcorrect/libcorrect.hash b/package/libcorrect/libcorrect.hash
new file mode 100644
index 0000000000..20df38c158
--- /dev/null
+++ b/package/libcorrect/libcorrect.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256	79861750540fb3a1cc501ee217cb4d1febc4855f3fb82e5eb60906eec5379890  libcorrect-ce6c17f1f988765ae3695315d7cce1f2a2e6cf0d.tar.gz
+sha256	135138cd4304aa637836758dc5edfb5f21b7d09ecc637d25288d206b151a5768  LICENSE
diff --git a/package/libcorrect/libcorrect.mk b/package/libcorrect/libcorrect.mk
new file mode 100644
index 0000000000..0a84aa5c26
--- /dev/null
+++ b/package/libcorrect/libcorrect.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libcorrect
+#
+################################################################################
+
+LIBCORRECT_VERSION = ce6c17f1f988765ae3695315d7cce1f2a2e6cf0d
+LIBCORRECT_SITE = $(call github,quiet,libcorrect,$(LIBCORRECT_VERSION))
+LIBCORRECT_LICENSE = BSD-3-Clause
+LIBCORRECT_LICENSE_FILES = LICENSE
+LIBCORRECT_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
-- 
2.17.1
