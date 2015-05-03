From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 May 2015 10:55:15 +0200
Subject: [Buildroot] [git commit] cc-tool: new package
Message-ID: <20150503085529.D170781894@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=993991e2ed746f2dba350fdd90b79e10c10e4b51
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cc-tool provides support for Texas Instruments CC Debugger

Signed-off-by: Marcin Bis <marcin@bis.org.pl>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 [Arnout: avoid adding /usr/local to library path]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |    1 +
 package/cc-tool/Config.in    |   20 ++++++++++++++++++++
 package/cc-tool/cc-tool.hash |    3 +++
 package/cc-tool/cc-tool.mk   |   17 +++++++++++++++++
 4 files changed, 41 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 8b02486..af4d2b7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -316,6 +316,7 @@ endmenu
 	source "package/avrdude/Config.in"
 	source "package/bcache-tools/Config.in"
 	source "package/biosdevname/Config.in"
+	source "package/cc-tool/Config.in"
 	source "package/cdrkit/Config.in"
 	source "package/cryptsetup/Config.in"
 	source "package/cwiid/Config.in"
diff --git a/package/cc-tool/Config.in b/package/cc-tool/Config.in
new file mode 100644
index 0000000..5087f4a
--- /dev/null
+++ b/package/cc-tool/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_CC_TOOL
+	bool "cc-tool"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
+	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_BOOST_REGEX
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_SIGNALS
+	help
+	  cc-tool provides support for Texas Instruments CC Debugger
+	  for Linux OS in order to program 8051-based System-On-Chip
+	  devices: CC254x CC253x CC243x CC251x CC111x
+
+	  http://sourceforge.net/projects/cctool/
+
+comment "cc-tool needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/cc-tool/cc-tool.hash b/package/cc-tool/cc-tool.hash
new file mode 100644
index 0000000..81844ee
--- /dev/null
+++ b/package/cc-tool/cc-tool.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/cctool/files/
+sha1 f313e55f019ea5338438633f5b5e689b699343e1  cc-tool-0.26-src.tgz
+md5 26960676f3e6264e612c299fbf8ec5ea  cc-tool-0.26-src.tgz
diff --git a/package/cc-tool/cc-tool.mk b/package/cc-tool/cc-tool.mk
new file mode 100644
index 0000000..7312bd3
--- /dev/null
+++ b/package/cc-tool/cc-tool.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# cc-tool
+#
+################################################################################
+
+CC_TOOL_VERSION = 0.26
+CC_TOOL_SITE = http://downloads.sourceforge.net/project/cctool
+CC_TOOL_SOURCE = cc-tool-$(CC_TOOL_VERSION)-src.tgz
+CC_TOOL_LICENSE = GPLv2
+CC_TOOL_LICENSE_FILES = COPYING
+CC_TOOL_DEPENDENCIES = boost libusb
+
+# Configure script "discovers" boost in /usr/local if not given explicitly
+CC_TOOL_CONF_OPTS = --with-boost=$(STAGING_DIR)/usr
+
+$(eval $(autotools-package))
