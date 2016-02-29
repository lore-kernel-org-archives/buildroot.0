From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 29 Feb 2016 09:46:34 +0100
Subject: [Buildroot] [PATCH v2] lksctp-tools: new package
Message-ID: <1456735594-1170-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes:
	v2: - fix library licence (Arnout Vandecappelle)
	    - change package description and location (Arnout Vandecappelle)

 package/Config.in                      |  1 +
 package/lksctp-tools/Config.in         | 16 ++++++++++++++++
 package/lksctp-tools/lksctp-tools.hash |  2 ++
 package/lksctp-tools/lksctp-tools.mk   | 21 +++++++++++++++++++++
 4 files changed, 40 insertions(+)
 create mode 100644 package/lksctp-tools/Config.in
 create mode 100644 package/lksctp-tools/lksctp-tools.hash
 create mode 100644 package/lksctp-tools/lksctp-tools.mk

diff --git a/package/Config.in b/package/Config.in
index 67a2514..b01d3c9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1401,6 +1401,7 @@ endif
 	source "package/links/Config.in"
 	source "package/linphone/Config.in"
 	source "package/linux-zigbee/Config.in"
+	source "package/lksctp-tools/Config.in"
 	source "package/lldpd/Config.in"
 	source "package/lrzsz/Config.in"
 	source "package/macchanger/Config.in"
diff --git a/package/lksctp-tools/Config.in b/package/lksctp-tools/Config.in
new file mode 100644
index 0000000..670ff93
--- /dev/null
+++ b/package/lksctp-tools/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_LKSCTP_TOOLS
+	bool "lksctp-tools"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
+	help
+	  Libraries and command-line tools for the Linux kernel SCTP
+	  implementation. SCTP (Stream Control Transmission Protocol) is a
+	  message oriented, reliable transport protocol, with congestion
+	  control, support for transparent multi-homing, and multiple ordered
+	  streams of messages. RFC 2960 defines the core protocol.
+
+	  http://lksctp.sourceforge.net/
+
+comment "lksctp-tools package needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lksctp-tools/lksctp-tools.hash b/package/lksctp-tools/lksctp-tools.hash
new file mode 100644
index 0000000..f0b2852
--- /dev/null
+++ b/package/lksctp-tools/lksctp-tools.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 0903dd526b7f30a89d5031aa2c82757612becc38ed7bc6e4f972f8deae351f26  lksctp-tools-1.0.16.tar.gz
diff --git a/package/lksctp-tools/lksctp-tools.mk b/package/lksctp-tools/lksctp-tools.mk
new file mode 100644
index 0000000..45be1b2
--- /dev/null
+++ b/package/lksctp-tools/lksctp-tools.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# lksctp-tools
+#
+################################################################################
+
+LKSCTP_TOOLS_VERSION = 1.0.16
+LKSCTP_TOOLS_SITE = http://downloads.sourceforge.net/project/lksctp/lksctp-tools
+LKSCTP_TOOLS_LICENSE = GPLv2+ (tools), LGPLv2.1 (library)
+LKSCTP_TOOLS_LICENSE_FILES = COPYING COPYING.lib
+LKSCTP_TOOLS_INSTALL_STAGING = YES
+
+# release archive doesn't provide configure script
+LKSCTP_TOOLS_AUTORECONF = YES
+
+define LKSCTP_TOOLS_FIX_AUTORECONF
+	mkdir -p $(@D)/m4
+endef
+LKSCTP_TOOLS_POST_PATCH_HOOKS += LKSCTP_TOOLS_FIX_AUTORECONF
+
+$(eval $(autotools-package))
-- 
2.7.0
