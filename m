From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 18 Nov 2016 07:03:48 +0100
Subject: [Buildroot] [PATCH v2 next] uclibc-ng-test: new package
Message-ID: <20161118060348.GA11282@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The next release of uClibc-ng (1.0.20) will remove the test suite.
Add a separate package before the next release.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1 -> v2:
  - rename package suggested by Arnout and Thomas P.
  - add better description to Config.in
  - use upstream provided install target suggested by Arnout
  - add more comments   
  - refresh to latest upstream git hash
---
 package/Config.in                        |  1 +
 package/uclibc-ng-test/Config.in         | 19 ++++++++++++++
 package/uclibc-ng-test/uclibc-ng-test.mk | 45 ++++++++++++++++++++++++++++++++
 3 files changed, 65 insertions(+)
 create mode 100644 package/uclibc-ng-test/Config.in
 create mode 100644 package/uclibc-ng-test/uclibc-ng-test.mk

diff --git a/package/Config.in b/package/Config.in
index 7c91215..b2e1a2a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -114,6 +114,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/tinymembench/Config.in"
 	source "package/trace-cmd/Config.in"
 	source "package/trinity/Config.in"
+	source "package/uclibc-ng-test/Config.in"
 	source "package/valgrind/Config.in"
 	source "package/whetstone/Config.in"
 endmenu
diff --git a/package/uclibc-ng-test/Config.in b/package/uclibc-ng-test/Config.in
new file mode 100644
index 0000000..2ab6967
--- /dev/null
+++ b/package/uclibc-ng-test/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_UCLIBC_NG_TEST
+	bool "uclibc-ng-test"
+	help
+	  Enabling this option will compile and install the uClibc-ng test suite.
+	  This is useful if you want to check if the uClibc-ng library is working
+	  for your architecture and/or help developing uClibc-ng.
+
+	  The test suite will be installed into /usr/lib/uclibc-ng-test directory.
+	  To run the test suite enter the /usr/lib/uclibc-ng-test/test directory
+	  and type "sh uclibcng-testrunner.sh".
+
+	  See the /usr/lib/uclibc-ng-test/test/README for additional information.
+
+	  This is not needed at all for normal builds, so you can safely say no
+	  if you do not plan to dig into your C library.
+
+	  The tests can also be used for GNU libc or musl.
+
+	  http://www.uclibc-ng.org
diff --git a/package/uclibc-ng-test/uclibc-ng-test.mk b/package/uclibc-ng-test/uclibc-ng-test.mk
new file mode 100644
index 0000000..f6700a9
--- /dev/null
+++ b/package/uclibc-ng-test/uclibc-ng-test.mk
@@ -0,0 +1,45 @@
+################################################################################
+#
+# uclibc-ng-test
+#
+################################################################################
+
+UCLIBC_NG_TEST_VERSION = 4ad1c23ae2eb30888cda520c739cc26150512487
+UCLIBC_NG_TEST_SITE = git://uclibc-ng.org/git/uclibc-ng-test
+UCLIBC_NG_TEST_LICENSE = LGPLv2.1+
+UCLIBC_NG_TEST_LICENSE_FILES = COPYING.LIB
+
+ifeq ($(BR2_USE_WCHAR),)
+UCLIBC_NG_TEST_MAKE_ENV += NO_WCHAR=1
+endif
+ifeq ($(BR2_ENABLE_LOCALE),)
+UCLIBC_NG_TEST_MAKE_ENV += NO_LOCALE=1
+endif
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
+UCLIBC_NG_TEST_MAKE_ENV += NO_TLS=1 NO_THREADS=1
+endif
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),)
+UCLIBC_NG_TEST_MAKE_ENV += NO_TLS=1 NO_NPTL=1
+endif
+# most NPTL/TLS tests use dlopen
+ifeq ($(BR2_STATIC_LIBS),y)
+UCLIBC_NG_TEST_MAKE_ENV += NO_TLS=1 NO_NPTL=1 NO_DL=1
+endif
+
+# to execute tests in a deterministic order, call test_gen separately
+define UCLIBC_NG_TEST_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(UCLIBC_NG_TEST_MAKE_ENV) $(MAKE) -C $(@D) \
+		CC="$(TARGET_CC)" \
+		UCLIBC_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
+		test_compile
+	$(TARGET_MAKE_ENV) $(UCLIBC_NG_TEST_MAKE_ENV) $(MAKE1) -C $(@D) \
+		CC="$(TARGET_CC)" \
+		UCLIBC_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
+		test_gen
+endef
+
+define UCLIBC_NG_TEST_INSTALL_TARGET_CMDS
+        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
+endef
+
+$(eval $(generic-package))
-- 
2.1.4
