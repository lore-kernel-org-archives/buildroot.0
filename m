From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 5 Nov 2016 11:53:43 +0100
Subject: [Buildroot] [PATCH] uclibc-test: new package
Message-ID: <20161105105343.GA27187@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The next release of uClibc-ng will have the test suite removed.
Add a separate package for a chance of testing it before the next release.
The test suite can be used to do reference testing on a GNU libc
system.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/Config.in                  |  1 +
 package/uclibc-test/Config.in      |  7 ++++++
 package/uclibc-test/uclibc-test.mk | 45 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 53 insertions(+)
 create mode 100644 package/uclibc-test/Config.in
 create mode 100644 package/uclibc-test/uclibc-test.mk

diff --git a/package/Config.in b/package/Config.in
index 9ed296f..6451f58 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -114,6 +114,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/tinymembench/Config.in"
 	source "package/trace-cmd/Config.in"
 	source "package/trinity/Config.in"
+	source "package/uclibc-test/Config.in"
 	source "package/valgrind/Config.in"
 	source "package/whetstone/Config.in"
 endmenu
diff --git a/package/uclibc-test/Config.in b/package/uclibc-test/Config.in
new file mode 100644
index 0000000..6e73701
--- /dev/null
+++ b/package/uclibc-test/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_UCLIBC_TEST
+	bool "uclibc-test"
+	help
+	  Test suite for uClibc.
+	  Can also be used for GNU libc.
+
+	  http://www.uclibc-ng.org
diff --git a/package/uclibc-test/uclibc-test.mk b/package/uclibc-test/uclibc-test.mk
new file mode 100644
index 0000000..1a3d651
--- /dev/null
+++ b/package/uclibc-test/uclibc-test.mk
@@ -0,0 +1,45 @@
+################################################################################
+#
+# uclibc-test
+#
+################################################################################
+
+UCLIBC_TEST_VERSION = 094224b6b6a11ae8cb5b7d47e62e25235704fe0b
+UCLIBC_TEST_SITE = git://uclibc-ng.org/git/uclibc-ng-test
+UCLIBC_TEST_LICENSE = LGPLv2.1+
+UCLIBC_TEST_LICENSE_FILES = COPYING.LIB
+
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_WCHAR),)
+UCLIBC_TEST_MAKE_ENV += NO_WCHAR=1
+endif
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_LOCALE),)
+UCLIBC_TEST_MAKE_ENV += NO_LOCALE=1
+endif
+ifeq ($(BR2_PTHREADS_NONE),y)
+UCLIBC_TEST_MAKE_ENV += NO_TLS=1 NO_THREADS=1
+endif
+ifeq ($(BR2_PTHREADS_OLD),y)
+UCLIBC_TEST_MAKE_ENV += NO_TLS=1 NO_NPTL=1
+endif
+ifeq ($(BR2_STATIC_LIBS),y)
+UCLIBC_TEST_MAKE_ENV += NO_TLS=1 NO_NPTL=1 NO_DL=1
+endif
+
+define UCLIBC_TEST_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(UCLIBC_TEST_MAKE_ENV) $(MAKE) -C $(@D) \
+		CC="$(TARGET_CC)" \
+		UCLIBC_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
+		test_compile
+	$(TARGET_MAKE_ENV) $(UCLIBC_TEST_MAKE_ENV) $(MAKE) -C $(@D) \
+		CC="$(TARGET_CC)" \
+		UCLIBC_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
+		test_gen
+endef
+
+define UCLIBC_TEST_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/root/uClibc
+	cp -rdpf $(@D)/test $(TARGET_DIR)/root/uClibc
+	find $(TARGET_DIR)/root/uClibc -name \*.o -exec rm {} \;
+endef
+
+$(eval $(generic-package))
-- 
2.1.4
