From: Damian Kaczmarek <damian@veritymedical.co.uk>
Date: Wed, 19 Oct 2011 23:16:59 +0200
Subject: [Buildroot] [PATCH] New package: mc
Message-ID: <1319059019-20685-1-git-send-email-damian@veritymedical.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NOTE: wanted to allow linking with slang, but slang-mini is somehow
different from normal slang and the build was broken.

Signed-off-by: Damian Kaczmarek <damian@veritymedical.co.uk>
---
 package/Config.in    |    1 +
 package/mc/Config.in |   13 +++++++++++++
 package/mc/mc.mk     |   35 +++++++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+), 0 deletions(-)
 create mode 100644 package/mc/Config.in
 create mode 100644 package/mc/mc.mk

diff --git a/package/Config.in b/package/Config.in
index 3b2769d..645a88c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -522,6 +522,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/which/Config.in"
 endif
 source "package/xmlstarlet/Config.in"
+source "package/mc/Config.in"
 endmenu
 
 menu "System tools"
diff --git a/package/mc/Config.in b/package/mc/Config.in
new file mode 100644
index 0000000..fd2f33c
--- /dev/null
+++ b/package/mc/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_MC
+	bool "mc"
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  GNU Midnight Commander is a visual file manager, licensed under 
+	  GNU General Public License and therefore qualifies as Free Software. 
+	  It's a feature rich full-screen text mode application that allows 
+	  you to copy, move and delete files and whole directory trees, search 
+	  for files and run commands in the subshell. Internal viewer and 
+	  editor are included.
+
+	  http://www.midnight-commander.org/
diff --git a/package/mc/mc.mk b/package/mc/mc.mk
new file mode 100644
index 0000000..1ecf299
--- /dev/null
+++ b/package/mc/mc.mk
@@ -0,0 +1,35 @@
+#############################################################
+#
+# mc
+#
+#############################################################
+MC_VERSION:=4.8.0
+MC_SOURCE:=mc-$(MC_VERSION).tar.bz2
+MC_SITE:=http://www.midnight-commander.org/downloads
+MC_INSTALL_TARGET=YES
+MC_DEPENDENCIES = host-pkg-config libglib2 ncurses
+MC_CONF_OPT += --with-screen=ncurses \
+	--with-ncurses-libs=$(STAGING_DIR)/usr/lib \
+	--with-ncurses-includes=$(STAGING_DIR)/usr/include \
+
+ifeq ($(BR2_PACKAGE_PCRE),y)
+  MC_CONF_OPT += --with-search-engine=pcre
+  MC_DEPENDENCIES += pcre
+endif
+
+ifneq ($(BR2_LARGEFILE),y)
+  MC_CONF_OPT += --disable-largefile
+endif
+
+# MC requires ncurses includes to be instlled in .../usr/include/ncurses 
+# folder but not in .../usr/include.
+define MC_FIX_NCURSES_INCLUDE_DIR
+  /bin/mkdir -p $(STAGING_DIR)/usr/include/ncurses
+  /bin/cp -dpf $(STAGING_DIR)/usr/include/curses.h $(STAGING_DIR)/usr/include/ncurses/curses.h
+  /bin/cp -dpf $(STAGING_DIR)/usr/include/term.h $(STAGING_DIR)/usr/include/ncurses/term.h
+  (cd $(STAGING_DIR)/usr/include/ncurses; /bin/ln -fs curses.h ncurses.h)
+endef
+
+MC_PRE_CONFIGURE_HOOKS += MC_FIX_NCURSES_INCLUDE_DIR
+
+$(eval $(call AUTOTARGETS,package,mc))
-- 
1.7.3.4
