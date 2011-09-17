From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2011 22:22:53 +0200
Subject: [Buildroot] [PATCH 3/8] xenomai: add support to keep or remove
	testsuite programs
In-Reply-To: <cover.1316290714.git.thomas.petazzoni@free-electrons.com>
References: <cover.1316290714.git.thomas.petazzoni@free-electrons.com>
Message-ID: <64463d3817c06356a16216ca72ab907073e14531.1316290714.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xenomai/Config.in  |    5 +++++
 package/xenomai/xenomai.mk |   17 +++++++++++++++++
 2 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index b5737b8..26c6b51 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -103,4 +103,9 @@ config BR2_PACKAGE_XENOMAI_CPU_TYPE
 	default "mx3"         if BR2_PACKAGE_XENOMAI_CPU_MX3
 	default "s3c2410"     if BR2_PACKAGE_XENOMAI_CPU_S3C2410
 
+config BR2_PACKAGE_XENOMAI_TESTSUITE
+       bool "Install testsuite"
+       help
+         This option allows to install the Xenomai test programs.
+
 endif
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 8f78333..cb73740 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -62,6 +62,23 @@ endef
 XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_REMOVE_DEVFILES
 endif
 
+ifeq ($(BR2_PACKAGE_XENOMAI_TESTSUITE),)
+define XENOMAI_REMOVE_TESTSUITE
+	rm -rf $(TARGET_DIR)/usr/xenomai/share/xenomai/testsuite/
+	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/xenomai/share/xenomai/
+	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/xenomai/share/
+	for i in klatency rtdm xeno xeno-load check-vdso \
+		irqloop cond-torture-posix switchtest arith \
+		sigtest clocktest cyclictest latency wakeup-time \
+		xeno-test cond-torture-native mutex-torture-posix \
+		mutex-torture-native ; do \
+		rm -f $(TARGET_DIR)/usr/xenomai/bin/$$i ; \
+	done
+endef
+
+XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_REMOVE_TESTSUITE
+endif
+
 define XENOMAI_ADD_LD_SO_CONF
 	# Add /usr/xenomai/lib in the library search path
 	grep -q "^/usr/xenomai/lib" $(TARGET_DIR)/etc/ld.so.conf || \
-- 
1.7.4.1
