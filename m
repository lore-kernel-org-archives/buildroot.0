From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Wed, 29 Jan 2014 14:02:05 +0100
Subject: [Buildroot] [PATCH v3] Add gpm (general purpose mouse) server
	package
Message-ID: <1391000525-5179-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Boibessot <julien.boibessot@armadeus.com>

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 Changes since v2:
 - As recommended by Yann:
   * spell check
   * use BR autoconf/make/libtool but in SDL package way
   * put optionnal GPM_REMOVE_TEST_TOOLS_FROM_TARGET into ifeq

 Changes since v1:
 - 80x # in gpm.mk banner
 - As recommended by Romain:
   * remove possible circular dependency with ncurses
   * don't allow package selection when BR2_PREFER_STATIC_LIB=y
   * fixes headers path when gpm wants to build its dependencies rules

 package/Config.in     |    1 +
 package/gpm/Config.in |   24 ++++++++++++++++++++++
 package/gpm/gpm.mk    |   52 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 77 insertions(+), 0 deletions(-)
 create mode 100644 package/gpm/Config.in
 create mode 100644 package/gpm/gpm.mk

diff --git a/package/Config.in b/package/Config.in
index 78c0e06..d52c65e 100644
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
index 0000000..d20e392
--- /dev/null
+++ b/package/gpm/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_GPM
+	bool "gpm mouse server"
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
+	bool "install gpm test tools also"
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
index 0000000..01b30d4
--- /dev/null
+++ b/package/gpm/gpm.mk
@@ -0,0 +1,52 @@
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
+
+GPM_POST_PATCH_HOOKS += GPM_RUN_AUTOGEN
+GPM_DEPENDENCIES += host-automake host-autoconf host-libtool
+
+ifeq ($(BR2_PACKAGE_GPM_INSTALL_TEST_TOOLS),)
+define GPM_REMOVE_TEST_TOOLS_FROM_TARGET
+	for tools in mev hltest mouse-test display-buttons \
+			get-versions display-coords; do \
+		rm -f $(TARGET_DIR)/usr/bin/$$tools ; \
+	done
+endef
+
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
-- 
1.7.5.4
