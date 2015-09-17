From: Markos Chandras <markos.chandras@imgtec.com>
Date: Thu, 17 Sep 2015 14:53:40 +0100
Subject: [Buildroot] [PATCH] libseccomp: Add new config option to build and
	install tests
Message-ID: <1442498020-661-1-git-send-email-markos.chandras@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add new config option to allow building and installing the libseccomp
testsuite on the target. It's useful for testing the kernels'
seccomp behavior for the target architecture.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/libseccomp/Config.in     |  9 +++++++++
 package/libseccomp/libseccomp.mk | 19 +++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/package/libseccomp/Config.in b/package/libseccomp/Config.in
index 4c34c5466592..760a6f321142 100644
--- a/package/libseccomp/Config.in
+++ b/package/libseccomp/Config.in
@@ -15,6 +15,15 @@ config BR2_PACKAGE_LIBSECCOMP
 
 	  https://github.com/seccomp/libseccomp
 
+config BR2_PACKAGE_LIBSECCOMP_TESTS
+	bool "Install libseccomp tests"
+	depends on BR2_PACKAGE_BASH && BR2_PACKAGE_LIBSECCOMP
+	help
+	  Build and install the libseccomp testsuite.
+
+comment "libseccomp testsuite needs bash as running shell"
+	depends on !BR2_PACKAGE_BASH && BR2_PACKAGE_LIBSECCOMP
+
 comment "libseccomp needs a toolchain w/ headers >= 3.12"
 	depends on BR2_aarch64 || BR2_mips || BR2_mipsel || BR2_mips64 || \
 		BR2_mips64el || BR2_i386 || BR2_x86_64
diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
index a188298006b1..6edf96f92bfa 100644
--- a/package/libseccomp/libseccomp.mk
+++ b/package/libseccomp/libseccomp.mk
@@ -17,4 +17,23 @@ define LIBSECCOMP_FIXUP_M4_DIR
 endef
 LIBSECCOMP_POST_EXTRACT_HOOKS += LIBSECCOMP_FIXUP_M4_DIR
 
+ifeq ($(BR2_PACKAGE_LIBSECCOMP_TESTS),y)
+
+define LIBSECCOMP_TESTS_BUILD
+	$(MAKE) -C $(@D)/tests check-build
+endef
+
+define LIBSECCOMP_TESTS_INSTALL
+	mkdir -p $(TARGET_DIR)/usr/libseccomp/{tests,tools} && \
+	for x in tests tools; do \
+		find $(@D)/$$x -maxdepth 1 \( -name "*.tests" -o -perm -a=x \) \
+			-type f -exec cp {} $(TARGET_DIR)/usr/libseccomp/$$x/ \; ; \
+	done
+endef
+
+LIBSECCOMP_POST_BUILD_HOOKS += LIBSECCOMP_TESTS_BUILD
+LIBSECCOMP_POST_INSTALL_TARGET_HOOKS += LIBSECCOMP_TESTS_INSTALL
+
+endif
+
 $(eval $(autotools-package))
-- 
2.5.2
