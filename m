From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2016 23:28:25 +0100
Subject: [Buildroot] [git commit branch/next] uclibc-ng-test: new package
Message-ID: <20161121223657.19F8480089@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a6978c38d56611c3098530c48f4cbd212733b416
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The next release of uClibc-ng (1.0.20) will remove the test suite.
Add a separate package before the next release.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Thomas: rewrap Config.in help text.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |  1 +
 package/uclibc-ng-test/Config.in         | 22 ++++++++++++++++
 package/uclibc-ng-test/uclibc-ng-test.mk | 45 ++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+)

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
index 0000000..0f093d1
--- /dev/null
+++ b/package/uclibc-ng-test/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_UCLIBC_NG_TEST
+	bool "uclibc-ng-test"
+	help
+	  Enabling this option will compile and install the uClibc-ng
+	  test suite. This is useful if you want to check if the
+	  uClibc-ng library is working for your architecture and/or
+	  help developing uClibc-ng.
+
+	  The test suite will be installed into
+	  /usr/lib/uclibc-ng-test directory. To run the test suite
+	  enter the /usr/lib/uclibc-ng-test/test directory and type
+	  "sh uclibcng-testrunner.sh".
+
+	  See the /usr/lib/uclibc-ng-test/test/README for additional
+	  information.
+
+	  This is not needed at all for normal builds, so you can
+	  safely say no if you do not plan to dig into your C library.
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
