From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 5 Jul 2010 11:01:55 +0200
Subject: [Buildroot] [git commit master 1/1] package: add libsvgtiny library
Message-ID: <20100705092711.C34D78253A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ab10ed8c87c38c54940ee5418b996b7a6ca79642
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No official releases, so use svn snapshot like tremor :/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                         |    4 +-
 package/Config.in               |    1 +
 package/libsvgtiny/Config.in    |    9 +++++++
 package/libsvgtiny/libsvtiny.mk |   47 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 59 insertions(+), 2 deletions(-)
 create mode 100644 package/libsvgtiny/Config.in
 create mode 100644 package/libsvgtiny/libsvtiny.mk

diff --git a/CHANGES b/CHANGES
index 6120d25..2d8253c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -10,8 +10,8 @@
 
 	New GTK-based configurator, usable using 'make gconfig'.
 
-	New packages: cgilua, copas, coxpcall, ffmpeg, luafilesystem,
-	luasocket, rings, wsapi, xavante, xterm
+	New packages: cgilua, copas, coxpcall, ffmpeg, libsvgtiny,
+	luafilesystem, luasocket, rings, wsapi, xavante, xterm
 
 	Updated/fixed packages: berkeleydb, bash, blackbox, busybox,
 	cdrkit, dash, dialog, diffutils, distcc, dmalloc, dnsmasq,
diff --git a/package/Config.in b/package/Config.in
index 253f47a..eba21da 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -271,6 +271,7 @@ source "package/libglade/Config.in"
 source "package/libgtk12/Config.in"
 source "package/libgtk2/Config.in"
 source "package/libpng/Config.in"
+source "package/libsvgtiny/Config.in"
 source "package/libungif/Config.in"
 source "package/pango/Config.in"
 source "package/pixman/Config.in"
diff --git a/package/libsvgtiny/Config.in b/package/libsvgtiny/Config.in
new file mode 100644
index 0000000..836dec2
--- /dev/null
+++ b/package/libsvgtiny/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBSVGTINY
+	bool "libsvgtiny"
+	select BR2_PACKAGE_LIBXML2
+	help
+	  Libsvgtiny is an implementation of SVG Tiny, written in C.
+	  It is currently in development for use with NetSurf and is
+	  intended to be suitable for use in other projects too.
+
+	  http://www.netsurf-browser.org/projects/libsvgtiny/
diff --git a/package/libsvgtiny/libsvtiny.mk b/package/libsvgtiny/libsvtiny.mk
new file mode 100644
index 0000000..57430fe
--- /dev/null
+++ b/package/libsvgtiny/libsvtiny.mk
@@ -0,0 +1,47 @@
+############################################################
+#
+# libsvgtiny
+#
+############################################################
+
+LIBSVGTINY_SITE = svn://svn.netsurf-browser.org/trunk/libsvgtiny
+LIBSVGTINY_VERSION = 9800
+LIBSVGTINY_SVNDIR = libsvgtiny-svn-r$(LIBSVGTINY_VERSION)
+LIBSVGTINY_SOURCE = $(LIBSVGTINY_SVNDIR).tar.bz2
+LIBSVGTINY_INSTALL_STAGING = YES
+LIBSVGTINY_INSTALL_TARGET = YES
+LIBSVGTINY_DEPENDENCIES = libxml2
+
+$(DL_DIR)/$(LIBSVGTINY_SOURCE):
+	$(SVN_CO) -r $(LIBSVGTINY_VERSION) $(LIBSVGTINY_SITE) $(BUILD_DIR)/$(LIBSVGTINY_SVNDIR)
+	tar -cv -C $(BUILD_DIR) $(LIBSVGTINY_SVNDIR) | bzip2 - -c > $@
+	rm -rf $(BUILD_DIR)/$(LIBSVGTINY_SVNDIR)
+
+# use custom download step
+LIBSVGTINY_TARGET_SOURCE := $(DL_DIR)/$(LIBSVGTINY_SOURCE)
+
+define LIBSVGTINY_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=/usr
+endef
+
+define LIBSVGTINY_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(STAGING_DIR) install
+endef
+
+define LIBSVGTINY_UNINSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(STAGING_DIR) uninstall
+endef
+
+define LIBSVGTINY_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) install
+endef
+
+define LIBSVGTINY_UNINSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) uninstall
+endef
+
+define BZIP2_CLEAN_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) clean
+endef
+
+$(eval $(call GENTARGETS,package,libsvgtiny))
-- 
1.7.1
