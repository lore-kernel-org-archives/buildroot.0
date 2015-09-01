From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  1 Sep 2015 09:43:36 +0300
Subject: [Buildroot] [PATCH 1/2] dos2unix: add target support
Message-ID: <d04d05bf5fb09fd02747689fe348375cdff4fc6a.1441089817.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Knight <james.knight@rockwellcollins.com>

Allow the `dos2unix` utility to be built and installed on the target
system.

[baruch: properly handle target gettext]
Signed-off-by: James Knight <james.knight@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2:
   * Fix static build with gettext
   * Support build without locale support
---
 package/Config.in            |  3 +++
 package/dos2unix/Config.in   | 11 +++++++++++
 package/dos2unix/dos2unix.mk | 24 +++++++++++++++++++++---
 3 files changed, 35 insertions(+), 3 deletions(-)
 create mode 100644 package/dos2unix/Config.in

diff --git a/package/Config.in b/package/Config.in
index 914b83833d3e..7c5fe4ec36b2 100644
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
index 000000000000..fdcd0700509b
--- /dev/null
+++ b/package/dos2unix/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_DOS2UNIX
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
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
index 2d7fcbbc6958..34777d0bceda 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -6,17 +6,35 @@
 
 DOS2UNIX_VERSION = 7.0
 DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
-DOS2UNIX_DEPENDENCIES = host-gettext
 DOS2UNIX_LICENSE = BSD-2c
 DOS2UNIX_LICENSE_FILES = COPYING.txt
+HOST_DOS2UNIX_DEPENDENCIES = host-gettext
+
+ifeq ($(BR2_ENABLE_LOCALE),)
+DOS2UNIX_MAKE_OPTS += ENABLE_NLS=
+endif
+
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+DOS2UNIX_DEPENDENCIES += gettext
+DOS2UNIX_MAKE_OPTS += LIBS_EXTRA=-lintl
+endif
+
+define DOS2UNIX_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(DOS2UNIX_MAKE_OPTS)
+endef
+
+define DOS2UNIX_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) \
+		$(DOS2UNIX_MAKE_OPTS) install
+endef
 
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
2.5.0
