From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue,  4 Feb 2014 10:25:57 +0100
Subject: [Buildroot] [PATCH 1/2] intel-microcode: new package
Message-ID: <1391505958-17221-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The intel microcode is a proprietary package which provides a data file
used to correct processors errors.
It was originally sent by Richard Braun <rbraun@sceen.net>

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Richard Braun <rbraun@sceen.net>
---
 package/Config.in                          |  1 +
 package/intel-microcode/Config.in          |  7 +++++++
 package/intel-microcode/intel-microcode.mk | 25 +++++++++++++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 package/intel-microcode/Config.in
 create mode 100644 package/intel-microcode/intel-microcode.mk

diff --git a/package/Config.in b/package/Config.in
index 93d23cb..e452c1e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -301,6 +301,7 @@ source "package/hwdata/Config.in"
 source "package/i2c-tools/Config.in"
 source "package/input-event-daemon/Config.in"
 source "package/input-tools/Config.in"
+source "package/intel-microcode/Config.in"
 source "package/iostat/Config.in"
 source "package/irda-utils/Config.in"
 source "package/kbd/Config.in"
diff --git a/package/intel-microcode/Config.in b/package/intel-microcode/Config.in
new file mode 100644
index 0000000..495ebd7
--- /dev/null
+++ b/package/intel-microcode/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_INTEL_MICROCODE
+	bool "intel-microcode"
+	depends on BR2_x86_64 || BR2_i386
+	help
+	  This package provides an Intel microcode data file that can be
+	  used to correct processor errors. The iucode-tool package and
+	  proper kernel support are required to upload the microcode.
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
new file mode 100644
index 0000000..c6cf51d
--- /dev/null
+++ b/package/intel-microcode/intel-microcode.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# intel-microcode
+#
+################################################################################
+
+INTEL_MICROCODE_VERSION = 20140122
+INTEL_MICROCODE_SOURCE = microcode-$(INTEL_MICROCODE_VERSION).tgz
+INTEL_MICROCODE_SITE = http://downloadmirror.intel.com/23574/eng
+INTEL_MICROCODE_LICENSE = PROPRIETARY
+INTEL_MICROCODE_REDISTRIBUTE = NO
+
+# N.B. Don't strip any path components during extraction.
+define INTEL_MICROCODE_EXTRACT_CMDS
+	gzip -d -c $(DL_DIR)/$(INTEL_MICROCODE_SOURCE) | \
+	tar --strip-components=0 -C $(@D) -xf -
+	head -n 33 $(@D)/microcode.dat > $(@D)/license.txt
+endef
+
+define INTEL_MICROCODE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/microcode.dat \
+		$(TARGET_DIR)/usr/share/misc/intel-microcode.dat
+endef
+
+$(eval $(generic-package))
-- 
1.8.5.3
