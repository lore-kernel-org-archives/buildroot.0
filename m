From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Feb 2014 21:53:03 +0100
Subject: [Buildroot] [git commit] Add gpm (general purpose mouse) server
	package
Message-ID: <20140202205418.BA8039C754@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bc8ede2bb335d83029a2ad15515fa4e44fbd4e0a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: small white space fixes as pointed out by Yann]
Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in     |    1 +
 package/gpm/Config.in |   24 +++++++++++++++++++++++
 package/gpm/gpm.mk    |   51 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 76 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2a437f7..49b3488 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -290,6 +290,7 @@ source "package/fmtools/Config.in"
 source "package/freescale-imx/Config.in"
 source "package/fxload/Config.in"
 source "package/gadgetfs-test/Config.in"
+source "package/gpm/Config.in"
 source "package/gpsd/Config.in"
 source "package/gptfdisk/Config.in"
 source "package/gvfs/Config.in"
diff --git a/package/gpm/Config.in b/package/gpm/Config.in
new file mode 100644
index 0000000..2121e71
--- /dev/null
+++ b/package/gpm/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_GPM
+	bool "gpm"
+	depends on !BR2_PREFER_STATIC_LIB
+	help
+	  "gpm" means general purpose mouse (server) and provides mouse support
+	  for Linux virtual consoles.
+	  gpm-root (to draw menus in current virtual console; config file in
+	  /etc/gpm-root.conf) and disable-paste (to disable paste buffer for
+	  security reasons), will also be installed.
+
+	  http://www.nico.schottelius.org/software/gpm/
+
+if BR2_PACKAGE_GPM
+
+config BR2_PACKAGE_GPM_INSTALL_TEST_TOOLS
+	bool "install test tools"
+	help
+	  Install gpm test tools (get-versions, mev, hltest, mouse-test,
+	  display-buttons & display-coords).
+
+endif
+
+comment "gpm mouse server needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
diff --git a/package/gpm/gpm.mk b/package/gpm/gpm.mk
new file mode 100644
index 0000000..6fd5a3f
--- /dev/null
+++ b/package/gpm/gpm.mk
@@ -0,0 +1,51 @@
+###############################################################################
+#
+# gpm
+#
+###############################################################################
+
+GPM_VERSION = 1.20.7
+GPM_SOURCE = gpm-$(GPM_VERSION).tar.bz2
+GPM_SITE = http://www.nico.schottelius.org/software/gpm/archives/
+GPM_LICENSE = GPLv2+
+GPM_LICENSE_FILES = COPYING
+GPM_INSTALL_STAGING = YES
+
+# if not already installed in staging dir, gpm Makefile may fail to find some
+# of the headers needed to generate build dependencies, the first time it is
+# built. CPPFLAGS is used to pass the right include path to dependency rules.
+GPM_CONF_ENV = CPPFLAGS="$(TARGET_CPPFLAGS) -I$(@D)/src/headers/"
+
+# gpm and ncurses have a circular dependency. As gpm function GPM_Wgetch()
+# (requiring ncurses) is not recommended for use by ncurses people themselves
+# and as it's better to have gpm support in ncurses that the contrary, we force
+# gpm to not look after ncurses explicitly.
+# http://invisible-island.net/ncurses/ncurses.faq.html#using_gpm_lib
+GPM_CONF_OPT = --without-curses
+
+# configure is missing but gpm seems not compatible with our autoreconf
+# mechanism so we have to do it manually instead of using GPM_AUTORECONF = YES
+define GPM_RUN_AUTOGEN
+	cd $(@D) && PATH=$(HOST_PATH) ./autogen.sh
+endef
+GPM_POST_PATCH_HOOKS += GPM_RUN_AUTOGEN
+
+GPM_DEPENDENCIES += host-automake host-autoconf host-libtool
+
+ifeq ($(BR2_PACKAGE_GPM_INSTALL_TEST_TOOLS),)
+define GPM_REMOVE_TEST_TOOLS_FROM_TARGET
+	for tools in mev hltest mouse-test display-buttons \
+			get-versions display-coords; do \
+		rm -f $(TARGET_DIR)/usr/bin/$$tools ; \
+	done
+endef
+GPM_POST_INSTALL_TARGET_HOOKS += GPM_REMOVE_TEST_TOOLS_FROM_TARGET
+endif
+
+define GPM_INSTALL_GPM_ROOT_CONF_ON_TARGET
+	$(INSTALL) -m 0644 -D $(@D)/conf/gpm-root.conf $(TARGET_DIR)/etc/
+endef
+
+GPM_POST_INSTALL_TARGET_HOOKS += GPM_INSTALL_GPM_ROOT_CONF_ON_TARGET
+
+$(eval $(autotools-package))
