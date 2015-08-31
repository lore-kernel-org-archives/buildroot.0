From: James Knight <james.knight@rockwellcollins.com>
Date: Mon, 31 Aug 2015 13:12:40 -0400
Subject: [Buildroot] [PATCH 1/1] dos2unix: add target support
Message-ID: <1441041160-8652-1-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow the `dos2unix` utility to be built and installed on the target
system.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 package/Config.in            |  3 +++
 package/dos2unix/Config.in   | 11 +++++++++++
 package/dos2unix/dos2unix.mk | 16 +++++++++++++---
 3 files changed, 27 insertions(+), 3 deletions(-)
 create mode 100644 package/dos2unix/Config.in

diff --git a/package/Config.in b/package/Config.in
index 783fbb4..c63add2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -115,6 +115,9 @@ menu "Development tools"
 	source "package/cvs/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/diffutils/Config.in"
+endif
+	source "package/dos2unix/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/findutils/Config.in"
 endif
 	source "package/flex/Config.in"
diff --git a/package/dos2unix/Config.in b/package/dos2unix/Config.in
new file mode 100644
index 0000000..128b5cd
--- /dev/null
+++ b/package/dos2unix/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_DOS2UNIX
+	select BR2_PACKAGE_GETTEXT
+	depends on BR2_USE_WCHAR # gettext
+	bool "dos2unix"
+	help
+	  dos2unix converts text file line endings between CRLF and LF
+
+	  http://freshmeat.net/projects/dos2unix
+
+comment "dos2unix needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index 2d7fcbb..13abd05 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -6,17 +6,27 @@
 
 DOS2UNIX_VERSION = 7.0
 DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
-DOS2UNIX_DEPENDENCIES = host-gettext
 DOS2UNIX_LICENSE = BSD-2c
 DOS2UNIX_LICENSE_FILES = COPYING.txt
 
+DOS2UNIX_DEPENDENCIES = gettext
+HOST_DOS2UNIX_DEPENDENCIES = host-gettext
+
+define DOS2UNIX_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define DOS2UNIX_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
 define HOST_DOS2UNIX_BUILD_CMDS
 	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 endef
 
 define HOST_DOS2UNIX_INSTALL_CMDS
-	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		install DESTDIR=$(HOST_DIR)
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) install
 endef
 
+$(eval $(generic-package))
 $(eval $(host-generic-package))
-- 
1.9.5.msysgit.1
