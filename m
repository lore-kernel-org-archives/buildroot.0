From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Oct 2014 22:07:03 +0100
Subject: [Buildroot] [git commit] cppunit: new package
Message-ID: <20141029210751.CD381B1FC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c385bf19786a5a220dc9d1a82eb28df57afebf8b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CppUnit is the C++ port of the famous JUnit framework for unit testing.
Test output is in XML or text format for automatic testing and GUI
based for supervised tests.

http://www.freedesktop.org/wiki/Software/cppunit/

[Thomas:
  - change license to LGPLv2.1, since there is no indication that the
    "or later" option is used.
  - slightly rewrap text in Config.in file.]

Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |    1 +
 package/cppunit/Config.in    |   14 ++++++++++++++
 package/cppunit/cppunit.hash |    5 +++++
 package/cppunit/cppunit.mk   |   14 ++++++++++++++
 4 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 8be24f4..5de4df9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -101,6 +101,7 @@ menu "Development tools"
 	source "package/bison/Config.in"
 	source "package/bsdiff/Config.in"
 	source "package/bustle/Config.in"
+	source "package/cppunit/Config.in"
 	source "package/cvs/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/diffutils/Config.in"
diff --git a/package/cppunit/Config.in b/package/cppunit/Config.in
new file mode 100644
index 0000000..d7582b3
--- /dev/null
+++ b/package/cppunit/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_CPPUNIT
+	bool "cppunit"
+	depends on BR2_INSTALL_LIBSTDCPP
+	# currently the static situation is not correctly detected.
+	depends on !BR2_PREFER_STATIC_LIB
+	help
+	  CppUnit is the C++ port of the famous JUnit framework for
+	  unit testing.  Test output is in XML or text format for
+	  automatic testing and GUI based for supervised tests.
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
index 0000000..b8251c2
--- /dev/null
+++ b/package/cppunit/cppunit.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# cppunit
+#
+################################################################################
+
+CPPUNIT_VERSION = 1.13.2
+CPPUNIT_SITE = http://dev-www.libreoffice.org/src
+CPPUNIT_INSTALL_STAGING = YES
+CPPUNIT_LICENSE = LGPLv2.1
+CPPUNIT_LICENSE_FILES = COPYING
+CPPUNIT_CONF_OPTS = --disable-doxygen
+
+$(eval $(autotools-package))
