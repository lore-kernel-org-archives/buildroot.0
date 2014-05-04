From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 May 2014 23:18:13 +0200
Subject: [Buildroot] [git commit] armadillo: new package
Message-ID: <20140504212125.9C19A9C389@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9583969992b9eb42e72d78f1dd0755f1ea17b0ff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Armadillo is a C++ linear algebra library.

[Peter: needs largefile, sort Config.in alphabetically]
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in              |    1 +
 package/armadillo/Config.in    |   13 +++++++++++++
 package/armadillo/armadillo.mk |   15 +++++++++++++++
 3 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index a39887f..7800f23 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -770,6 +770,7 @@ menu "Other"
 source "package/apr/Config.in"
 source "package/apr-util/Config.in"
 source "package/argp-standalone/Config.in"
+source "package/armadillo/Config.in"
 source "package/boost/Config.in"
 source "package/clapack/Config.in"
 source "package/classpath/Config.in"
diff --git a/package/armadillo/Config.in b/package/armadillo/Config.in
new file mode 100644
index 0000000..2251d91
--- /dev/null
+++ b/package/armadillo/Config.in
@@ -0,0 +1,13 @@
+comment "armadillo needs a toolchain w/ C++, largefile"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE
+
+config BR2_PACKAGE_ARMADILLO
+	bool "armadillo"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_LARGEFILE # clapack
+	select BR2_PACKAGE_CLAPACK
+	help
+	  Armadillo: An Open Source C++ Linear Algebra Library for
+	  Fast Prototyping and Computationally Intensive Experiments.
+
+	  http://arma.sourceforge.net/
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
new file mode 100644
index 0000000..b2cfdfc
--- /dev/null
+++ b/package/armadillo/armadillo.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# armadillo
+#
+################################################################################
+
+ARMADILLO_VERSION_MAJOR = 4.000
+ARMADILLO_VERSION = $(ARMADILLO_VERSION_MAJOR).4
+ARMADILLO_SITE = http://downloads.sourceforge.net/project/arma/
+ARMADILLO_DEPENDENCIES = clapack
+ARMADILLO_INSTALL_STAGING = YES
+ARMADILLO_LICENSE = MPLv2.0
+ARMADILLO_LICENSE_FILES = LICENSE.txt
+
+$(eval $(cmake-package))
