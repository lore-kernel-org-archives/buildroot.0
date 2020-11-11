From: Chris Packham <judge.packham@gmail.com>
Date: Thu, 12 Nov 2020 11:41:02 +1300
Subject: [Buildroot] [PATCH v2 2/2] package/coremark-pro: new package
In-Reply-To: <20201111224102.28799-1-judge.packham@gmail.com>
References: <20201111224102.28799-1-judge.packham@gmail.com>
Message-ID: <20201111224102.28799-2-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CoreMark-Pro is a comprehensive, advanced processor benchmark that
works with and enhances the market-proven industry-standard EEMBC
CoreMark benchmark.

https://www.eembc.org/coremark-pro/

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
Changes in v2:
- Add depends on BR2_USE_MMU (thanks Matt)

 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/coremark-pro/Config.in         |  8 +++++
 package/coremark-pro/coremark-pro.hash |  3 ++
 package/coremark-pro/coremark-pro.mk   | 42 ++++++++++++++++++++++++++
 package/coremark-pro/coremark-pro.sh   | 36 ++++++++++++++++++++++
 6 files changed, 91 insertions(+)
 create mode 100644 package/coremark-pro/Config.in
 create mode 100644 package/coremark-pro/coremark-pro.hash
 create mode 100644 package/coremark-pro/coremark-pro.mk
 create mode 100755 package/coremark-pro/coremark-pro.sh

diff --git a/DEVELOPERS b/DEVELOPERS
index ff823a2e3d..291dd41286 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -491,6 +491,7 @@ F:	configs/orangepi_plus_defconfig
 
 N:	Chris Packham <judge.packham@gmail.com>
 F:	package/coremark/
+F:	package/coremark-pro/
 F:	package/gstreamer1/gst1-shark/
 F:	package/micropython/
 F:	package/micropython-lib/
diff --git a/package/Config.in b/package/Config.in
index 16fd95fe38..0011ccd684 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -88,6 +88,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/cache-calibrator/Config.in"
 	source "package/clinfo/Config.in"
 	source "package/coremark/Config.in"
+	source "package/coremark-pro/Config.in"
 	source "package/dacapo/Config.in"
 	source "package/dhrystone/Config.in"
 	source "package/dieharder/Config.in"
diff --git a/package/coremark-pro/Config.in b/package/coremark-pro/Config.in
new file mode 100644
index 0000000000..dd6821056c
--- /dev/null
+++ b/package/coremark-pro/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_COREMARK_PRO
+	bool "coremark-pro"
+	depends on BR2_USE_MMU # perl uses fork()
+	select BR2_PACKAGE_PERL
+	help
+	  CoreMark-PRO is a comprehensive, advanced processor benchmark.
+
+	  https://www.eembc.org/coremark-pro/
diff --git a/package/coremark-pro/coremark-pro.hash b/package/coremark-pro/coremark-pro.hash
new file mode 100644
index 0000000000..16b121edb3
--- /dev/null
+++ b/package/coremark-pro/coremark-pro.hash
@@ -0,0 +1,3 @@
+#locally computed
+sha256  440223554134832efec4ad220795611769ded3869fbc3ce3c59b05b7ddeb9f6d  coremark-pro-1.1.2743.tar.gz
+sha256  0d7775bd793ea71fef3594c18164a08ed2f5f66c898958d0644f7a236a536f2b  LICENSE.md
diff --git a/package/coremark-pro/coremark-pro.mk b/package/coremark-pro/coremark-pro.mk
new file mode 100644
index 0000000000..d3e99fcdfd
--- /dev/null
+++ b/package/coremark-pro/coremark-pro.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# CoreMark-PRO
+#
+################################################################################
+
+COREMARK_PRO_VERSION = 1.1.2743
+COREMARK_PRO_SITE = $(call github,eembc,coremark-pro,v$(COREMARK_PRO_VERSION))
+COREMARK_PRO_LICENSE = Apache-2.0
+COREMARK_PRO_LICENSE_FILES = LICENSE.md
+COREMARK_PRO_DEPENDENCIES = perl
+
+ifeq ($(BR2_ENDIAN),"BIG")
+COREMARK_PRO_MAKE_OPTS += PLATFORM_DEFINES='EE_BIG_ENDIAN=1 EE_LITTLE_ENDIAN=0'
+else
+COREMARK_PRO_MAKE_OPTS += PLATFORM_DEFINES='EE_BIG_ENDIAN=0 EE_LITTLE_ENDIAN=1'
+endif
+
+COREMARK_PRO_MAKE_OPTS += \
+	TARGET=linux$(if $(BR2_ARCH_IS_64),64) \
+	EXE=
+
+define COREMARK_PRO_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_CC)" -C $(@D) \
+		$(COREMARK_PRO_MAKE_OPTS) build
+endef
+
+COREMARK_PRO_MARKS = cjpeg-rose7-preset core linear_alg-mid-100x100-sp loops-all-mid-10k-sp nnet_test parser-125k radix2-big-64k sha-test zip-test
+COREMARK_PRO_SCRIPTS = results_parser.pl cert_median.pl cert_mark.pl headings.txt
+
+define COREMARK_PRO_INSTALL_TARGET_CMDS
+	mkdir -p  $(TARGET_DIR)/usr/share/coremark-pro/logs
+	$(foreach m,$(COREMARK_PRO_MARKS),\
+		$(INSTALL) -D $(@D)/builds/linux$(if $(BR2_ARCH_IS_64),64)/gcc$(if $(BR2_ARCH_IS_64),64)/bin/$(m) $(TARGET_DIR)/usr/bin/$(m)$(sep) \
+		size $(TARGET_DIR)/usr/bin/$(m) > $(TARGET_DIR)/usr/share/coremark-pro/logs/$(m).size.log$(sep))
+	$(INSTALL) -D $(@D)/builds/linux$(if $(BR2_ARCH_IS_64),64)/gcc$(if $(BR2_ARCH_IS_64),64)/data/libbmp/Rose256.bmp $(TARGET_DIR)/usr/share/coremark-pro/Rose256.bmp
+	$(foreach s,$(COREMARK_PRO_SCRIPTS),\
+		$(INSTALL) -D $(@D)/util/perl/$(s) $(TARGET_DIR)/usr/share/coremark-pro/util/perl/$(s)$(sep))
+	$(Q)cp package/coremark-pro/coremark-pro.sh $(TARGET_DIR)/usr/bin/
+endef
+
+$(eval $(generic-package))
diff --git a/package/coremark-pro/coremark-pro.sh b/package/coremark-pro/coremark-pro.sh
new file mode 100755
index 0000000000..65ad9df645
--- /dev/null
+++ b/package/coremark-pro/coremark-pro.sh
@@ -0,0 +1,36 @@
+#!/bin/sh
+# SPDX-License-Identifier: Apache-2.0
+
+workloads="cjpeg-rose7-preset core linear_alg-mid-100x100-sp \
+    loops-all-mid-10k-sp nnet_test parser-125k radix2-big-64k sha-test zip-test"
+
+rm -rf /tmp/coremark-pro
+mkdir -p /tmp/coremark-pro
+cp /usr/share/coremark-pro/Rose256.bmp /tmp/coremark-pro
+cp /usr/share/coremark-pro/logs/*.size.log /tmp/coremark-pro
+
+cd /tmp/coremark-pro
+
+for contype in single best; do
+    cat /usr/share/coremark-pro/util/perl/headings.txt >>result.log
+    for wld in $workloads; do
+        [ "$contype" = "single" ] && XCMD="-c1 -w1"
+        [ "$contype" = "best" ] && XCMD="-c$(nproc) -w$(nproc)"
+        echo "#Results for verification run started at $(date +%y%j:%H:%M:%S) XCMD=$XCMD" >$wld-$contype-result.log
+        echo "Verification run for $wld"
+        $wld $XCMD -v1 > $wld.run.log
+        LC_ALL=C perl /usr/share/coremark-pro/util/perl/results_parser.pl $wld-$contype-result.log $wld.run.log
+        echo "#Results for performance runs started at $(date +%y%j:%H:%M:%S) XCMD=$XCMD" >>$wld-$contype-result.log
+        echo "Performance run for $wld"
+        for i in 1 2 3; do
+            $wld $XCMD -v0 > $wld.run.log
+            LC_ALL=C perl /usr/share/coremark-pro/util/perl/results_parser.pl $wld-$contype-result.log $wld.run.log
+        done
+        echo "#Median for final result $wld" >>$wld-$contype-result.log
+        LC_ALL=C perl /usr/share/coremark-pro/util/perl/cert_median.pl $wld-$contype-result.log $contype >>$wld-$contype-result.log
+        cat $wld-$contype-result.log >>result.log
+    done
+done
+LC_ALL=C perl /usr/share/coremark-pro/util/perl/cert_mark.pl -i result.log -s coremarkpro > result.mark
+cat result.mark
+cd - >/dev/null
-- 
2.29.2
