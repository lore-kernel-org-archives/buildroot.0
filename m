From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 4 Jun 2016 22:49:32 +0200
Subject: [Buildroot] [PATCH] uclibc: use shell script testsuite runner
Message-ID: <20160604204932.GA22985@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no need for GNU make to run the testsuite.
The benefit is you can even try it on noMMU targets as
the script runs with busybox hush.
Parallel build of the testsuite seems to work well.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc/Config.in | 4 +---
 package/uclibc/uclibc.mk | 7 +++----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 6e611db..e3d033e 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -98,8 +98,6 @@ config BR2_UCLIBC_INSTALL_UTILS
 
 config BR2_UCLIBC_INSTALL_TEST_SUITE
 	bool "Compile and install uClibc tests"
-	select BR2_PACKAGE_MAKE
-	depends on BR2_USE_MMU # make
 	help
 	  Enabling this option will compile and install the uClibc test suite.
 	  This is useful if you want to check if the uClibc library is working
@@ -107,7 +105,7 @@ config BR2_UCLIBC_INSTALL_TEST_SUITE
 
 	  The test suite will be installed into /root/uClibc directory. To run
 	  the test suite enter the /root/uClibc/test directory and type
-	  "make UCLIBC_ONLY=1 CC=/bin/true check".
+	  "sh uclibcng-testrunner.sh".
 
 	  See the /root/uClibc/test/README for additional information.
 
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index cf343a4..e20e8a8 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -444,11 +444,11 @@ endef
 
 ifeq ($(BR2_UCLIBC_INSTALL_TEST_SUITE),y)
 define UCLIBC_BUILD_TEST_SUITE
-	$(MAKE1) -C $(@D) \
+	$(MAKE) -C $(@D) \
 		$(UCLIBC_MAKE_FLAGS) \
 		TEST_INSTALLED_UCLIBC=1 \
 		UCLIBC_ONLY=1 \
-		test_compile
+		test_compile test_gen
 endef
 endif
 
@@ -464,8 +464,7 @@ ifeq ($(BR2_UCLIBC_INSTALL_TEST_SUITE),y)
 define UCLIBC_INSTALL_TEST_SUITE
 	mkdir -p $(TARGET_DIR)/root/uClibc
 	cp -rdpf $(@D)/test $(TARGET_DIR)/root/uClibc
-	$(INSTALL) -D -m 0644 $(@D)/Rules.mak $(TARGET_DIR)/root/uClibc/Rules.mak
-	$(INSTALL) -D -m 0644 $(@D)/.config $(TARGET_DIR)/root/uClibc/.config
+	find $(TARGET_DIR)/root/uClibc -name \*.o -exec rm {} \;
 endef
 endif
 
-- 
2.1.4
