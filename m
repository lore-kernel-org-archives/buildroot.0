From: Steve Kenton <skenton@ou.edu>
Date: Sun, 18 Jan 2015 10:00:53 -0600
Subject: [Buildroot] [PATCH][RFC] cdrtools: new package
Message-ID: <54BBD8B5.5090102@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cdrtools is a set of command line programs that
allows to record CD/DVD/BluRay media. This
package contains the cdrecord & mkisofs programs.
	
http://sourceforge.net/projects/cdrtools

Signed-off-by Stephen M. Kenton <skenton@ou.edu>
---
OK, here is an RFC patch to add cdrtools v3.00
against last night's snapshot.

Can someone point me at an example of how to
Let dvd+rw-tools select either cdrtools or
xorriso as the back end at build time?

diff -pruN buildroot.ori/package/cdrtools/cdrtools.mk buildroot/package/cdrtools/cdrtools.mk
--- buildroot.ori/package/cdrtools/cdrtools.mk	1969-12-31 18:00:00.000000000 -0600
+++ buildroot/package/cdrtools/cdrtools.mk	2015-01-18 09:55:43.788713482 -0600
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
diff -pruN buildroot.ori/package/cdrtools/Config.in buildroot/package/cdrtools/Config.in
--- buildroot.ori/package/cdrtools/Config.in	1969-12-31 18:00:00.000000000 -0600
+++ buildroot/package/cdrtools/Config.in	2015-01-18 09:55:43.788713482 -0600
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
diff -pruN buildroot.ori/package/Config.in buildroot/package/Config.in
--- buildroot.ori/package/Config.in	2015-01-16 15:37:56.000000000 -0600
+++ buildroot/package/Config.in	2015-01-18 09:55:31.644713249 -0600
@@ -6,6 +6,7 @@ menu "Audio and video applications"
 	source "package/alsa-utils/Config.in"
 	source "package/aumix/Config.in"
 	source "package/bellagio/Config.in"
+	source "package/cdrtools/Config.in"
 	source "package/dvdauthor/Config.in"
 	source "package/espeak/Config.in"
 	source "package/faad2/Config.in"
