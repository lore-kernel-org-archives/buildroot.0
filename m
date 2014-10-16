From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Thu, 16 Oct 2014 11:46:35 -0400
Subject: [Buildroot] [PATCH v4] cppunit: new package
Message-ID: <1413474395-20165-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CppUnit is the C++ port of the famous JUnit framework for unit testing.
Test output is in XML or text format for automatic testing and GUI
based for supervised tests.

http://www.freedesktop.org/wiki/Software/cppunit/

Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
---
Changes v3 -> v4:
  - move the package from "Librairies" > "Others" to "Development tools"
		 (suggested by arnout at mind.be)
  - change the CPPUNIT_VERSION and remove the useless CPPUNIT_SOURCE
		 (suggested by jerzy.grzegorek at trzebnica.net and
		 arnout at mind.be)
  - change the link which refer to the md5 hash (suggested by
		 arnout at mind.be)
  - change the comment for the locally calculated hash in the .hash file
  - change the commit title
  - add a dependency to a toolchain with dynamic library supported
  since the static situation is not correctly detected (suggested by
		 arnout at mind.be and thomas.petazzoni at free-electrons.com)
---
Changes v2 -> v3:
 - use the release tarball instead of the git repository (suggested by
		 arnout at mind.be)
 - fix the Licence (suggested by arnout at mind.be)
 - add upstream and locally compute .hash (suggested by
		 arnout at mind.be)
---
Changes v1 -> v2:
 - used AUTORECONF option (suggested by romain.naour at openwide.fr)
 - removed useless CONFIGURE_CMDS (suggested by romain.naour at openwide.fr)
---
 package/Config.in            |  1 +
 package/cppunit/Config.in    | 14 ++++++++++++++
 package/cppunit/cppunit.hash |  5 +++++
 package/cppunit/cppunit.mk   | 13 +++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/cppunit/Config.in
 create mode 100644 package/cppunit/cppunit.hash
 create mode 100644 package/cppunit/cppunit.mk

diff --git a/package/Config.in b/package/Config.in
index 93e148d..619d136 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -98,6 +98,7 @@ menu "Development tools"
 	source "package/bison/Config.in"
 	source "package/bsdiff/Config.in"
 	source "package/bustle/Config.in"
+	source "package/cppunit/Config.in"
 	source "package/cvs/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/diffutils/Config.in"
diff --git a/package/cppunit/Config.in b/package/cppunit/Config.in
new file mode 100644
index 0000000..71e791c
--- /dev/null
+++ b/package/cppunit/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_CPPUNIT
+	bool "cppunit"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_PREFER_STATIC_LIB # currently the static situation
+					  # is not correctly detected.
+	help
+	  CppUnit is the C++ port of the famous JUnit framework for unit testing.
+	  Test output is in XML or text format for automatic testing and GUI
+	  based for supervised tests.
+
+	  http://www.freedesktop.org/wiki/Software/cppunit/
+
+comment "cppunit needs a toolchain w/ C++, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_PREFER_STATIC_LIB
diff --git a/package/cppunit/cppunit.hash b/package/cppunit/cppunit.hash
new file mode 100644
index 0000000..a097e32
--- /dev/null
+++ b/package/cppunit/cppunit.hash
@@ -0,0 +1,5 @@
+# hash from: http://www.freedesktop.org/wiki/Software/cppunit/:
+md5	d1c6bdd5a76c66d2c38331e2d287bc01  cppunit-1.13.2.tar.gz
+
+# Locally calculated:
+sha512	8f4be569f321d577cec31931f49f4df143bc94e283605509b6ea50c60690aa91a2aed940e7eebd4b2413a4218f9a6c3978d312d8e587eab040283c6563846ecd  cppunit-1.13.2.tar.gz
diff --git a/package/cppunit/cppunit.mk b/package/cppunit/cppunit.mk
new file mode 100644
index 0000000..ab370f3
--- /dev/null
+++ b/package/cppunit/cppunit.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# cppunit
+#
+################################################################################
+
+CPPUNIT_VERSION = 1.13.2
+CPPUNIT_SITE = http://dev-www.libreoffice.org/src
+CPPUNIT_INSTALL_STAGING = YES
+CPPUNIT_LICENSE = LGPLv2.1+
+CPPUNIT_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.8.3.4
