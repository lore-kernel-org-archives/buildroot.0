From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Sep 2015 16:51:49 +0200
Subject: [Buildroot] [git commit] dos2unix: add target support
Message-ID: <20150904150747.7850C8016D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9669819efdf885fa279f3e99c03bbb4c311de068
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow the `dos2unix` utility to be built and installed on the target
system.

[baruch: properly handle target gettext]
Signed-off-by: James Knight <james.knight@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in            |    1 +
 package/dos2unix/Config.in   |   11 +++++++++++
 package/dos2unix/dos2unix.mk |   25 ++++++++++++++++++++++---
 3 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 58b7380..9bd4190 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -115,6 +115,7 @@ menu "Development tools"
 	source "package/cvs/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/diffutils/Config.in"
+	source "package/dos2unix/Config.in"
 	source "package/findutils/Config.in"
 endif
 	source "package/flex/Config.in"
diff --git a/package/dos2unix/Config.in b/package/dos2unix/Config.in
new file mode 100644
index 0000000..fdcd070
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
index 2d7fcbb..b1d21f2 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -6,17 +6,36 @@
 
 DOS2UNIX_VERSION = 7.0
 DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
-DOS2UNIX_DEPENDENCIES = host-gettext
 DOS2UNIX_LICENSE = BSD-2c
 DOS2UNIX_LICENSE_FILES = COPYING.txt
+DOS2UNIX_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
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
