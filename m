From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 17 Mar 2013 23:22:40 +0100
Subject: [Buildroot] [git commit] New package: gtest
Message-ID: <20130317222241.528EC9B13C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a42e10c61b19a6054d10fc809460c7e23c46fde7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Google's framework for writing C++ tests on a variety of platforms (Linux,
Mac OS X, Windows, Cygwin, Windows CE, and Symbian). Based on the xUnit
architecture. Supports automatic test discovery, a rich set of assertions,
user-defined assertions, death tests, fatal and non-fatal failures, value-
and type-parameterized tests, various options for running the tests, and XML
test report generation.

Gtest also allows to easily build testsuites for C programs.

This package allows running testsuites on the target which might be
advantgeous in certain cases.

http://code.google.com/p/googletest/

[Peter: Tweak Config.in, use GTEST_VERSION in _SOURCE]
Signed-off-by: Stephan Hoffmann <sho@relinux.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in       |    1 +
 package/gtest/Config.in |   24 ++++++++++++++++++++++++
 package/gtest/gtest.mk  |   23 +++++++++++++++++++++++
 3 files changed, 48 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 9be62c1..1a99a17 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -546,6 +546,7 @@ source "package/fftw/Config.in"
 source "package/libargtable2/Config.in"
 source "package/argp-standalone/Config.in"
 source "package/boost/Config.in"
+source "package/gtest/Config.in"
 source "package/libatomic_ops/Config.in"
 source "package/libcap/Config.in"
 source "package/libcap-ng/Config.in"
diff --git a/package/gtest/Config.in b/package/gtest/Config.in
new file mode 100644
index 0000000..c50b5f7
--- /dev/null
+++ b/package/gtest/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_GTEST
+	bool "gtest"
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Google's framework for writing C++ tests on a variety of
+	  platforms (Linux, Mac OS X, Windows, Cygwin, Windows CE, and
+	  Symbian). Based on the xUnit architecture. Supports
+	  automatic test discovery, a rich set of assertions,
+	  user-defined assertions, death tests, fatal and non-fatal
+	  failures, value- and type-parameterized tests, various
+	  options for running the tests, and XML test report
+	  generation.
+
+	  Gtest also allows to easily build testsuites for C programs.
+
+	  This package allows running testsuites on the target which
+	  might be advantageous in certain cases.
+
+	  http://code.google.com/p/googletest/
+
+comment "gtest requires a toolchain with c++, WCHAR and THREADS support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
new file mode 100644
index 0000000..6ede137
--- /dev/null
+++ b/package/gtest/gtest.mk
@@ -0,0 +1,23 @@
+#############################################################
+#
+# googletest
+#
+#############################################################
+
+GTEST_VERSION = 1.6.0
+GTEST_SOURCE = gtest-$(GTEST_VERSION).zip
+GTEST_SITE = http://googletest.googlecode.com/files/
+GTEST_INSTALL_STAGING = YES
+GTEST_INSTALL_TARGET = NO
+
+define GTEST_EXTRACT_CMDS
+	unzip $(DL_DIR)/$(GTEST_SOURCE) -d $(BUILD_DIR)
+endef
+
+define GTEST_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/libgtest.a $(STAGING_DIR)/usr/lib/libgtest.a
+	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/gtest/
+	cp -rp $(@D)/include/gtest/* $(STAGING_DIR)/usr/include/gtest/
+endef
+
+$(eval $(cmake-package))
