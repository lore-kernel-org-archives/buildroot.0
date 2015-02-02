From: Steve Kenton <skenton@ou.edu>
Date: Mon,  2 Feb 2015 05:40:52 +0000
Subject: [Buildroot] [PATCH 1/2] Cdrtools is a set of command line programs
	that allows to record CD/DVD/BluRay media. This package
	contains the cdrecord & mkisofs programs.
Message-ID: <1422855653-6338-1-git-send-email-skenton@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

http://sourceforge.net/projects/cdrtools
Signed-off-by: Steve Kenton <skenton@ou.edu>
---
 package/Config.in            |  1 +
 package/cdrtools/Config.in   | 12 ++++++++++++
 package/cdrtools/cdrtools.mk | 21 +++++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 package/cdrtools/Config.in
 create mode 100644 package/cdrtools/cdrtools.mk

diff --git a/package/Config.in b/package/Config.in
index dd011be..1748e88 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -6,6 +6,7 @@ menu "Audio and video applications"
 	source "package/alsa-utils/Config.in"
 	source "package/aumix/Config.in"
 	source "package/bellagio/Config.in"
+	source "package/cdrtools/Config.in"
 	source "package/dvdauthor/Config.in"
 	source "package/espeak/Config.in"
 	source "package/faad2/Config.in"
diff --git a/package/cdrtools/Config.in b/package/cdrtools/Config.in
new file mode 100644
index 0000000..8583cec
--- /dev/null
+++ b/package/cdrtools/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_CDRTOOLS
+	bool "cdrtools"
+	depends on BR2_USE_WCHAR && BR2_LARGEFILE
+	help
+	  Cdrtools is a set of command line programs that
+	  allows to record CD/DVD/BluRay media. This
+	  package contains the cdrecord & mkisofs programs.
+	  
+	  http://sourceforge.net/projects/cdrtools
+
+comment "cdrtools needs a toolchain w/ wchar, largefile"
+	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE
diff --git a/package/cdrtools/cdrtools.mk b/package/cdrtools/cdrtools.mk
new file mode 100644
index 0000000..a732e69
--- /dev/null
+++ b/package/cdrtools/cdrtools.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# cdrtools
+#
+#############################################################
+CDRTOOLS_VERSION = 3.00
+CDRTOOLS_SITE = http://sourceforge.net/projects/cdrtools/files
+CDRTOOLS_LICENSE = Various parts under GPLv2.0, LGPLv2.1, CDDL - see COPYING
+CDRTOOLS_LICENSE_FILES = COPYING
+
+define CDRTOOLS_BUILD_CMDS
+	$(MAKE) -C $(@D)
+endef
+
+define CDRTOOLS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/cdrecord/OBJ/x86_64-linux-cc/cdrecord $(TARGET_DIR)/usr/bin/cdrecord
+	$(INSTALL) -m 0755 -D $(@D)/readcd/OBJ/x86_64-linux-cc/readcd $(TARGET_DIR)/usr/bin/readcd
+	$(INSTALL) -m 0755 -D $(@D)/mkisofs/OBJ/x86_64-linux-cc/mkisofs $(TARGET_DIR)/usr/bin/mkisofs
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
