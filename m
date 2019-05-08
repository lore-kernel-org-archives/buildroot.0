From: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Date: Thu,  9 May 2019 00:09:25 +0200
Subject: [Buildroot] [PATCH 01/13] new package: openrc-0.41.2
Message-ID: <20190508220937.23200-1-michal.lyszczek@bofc.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds openrc init system package. This performs default openrc
installation with openrc-init that acts as pid1.

Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/openrc/Config.in   | 14 ++++++++++++
 package/openrc/openrc.hash |  2 ++
 package/openrc/openrc.mk   | 46 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 64 insertions(+)
 create mode 100644 package/openrc/Config.in
 create mode 100644 package/openrc/openrc.hash
 create mode 100644 package/openrc/openrc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6ccb0afaf6..0f89e49b92 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1615,6 +1615,7 @@ F:	board/altera/socrates_cyclone5/
 F:	board/pine64/rock64
 F:	configs/rock64_defconfig
 F:	configs/socrates_cyclone5_defconfig
+F:	package/openrc/
 
 N:	Michel Stempin <michel.stempin@wanadoo.fr>
 F:	board/licheepi/
diff --git a/package/Config.in b/package/Config.in
index f592e74a99..d9cb755d68 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2194,6 +2194,7 @@ menu "System tools"
 	source "package/ncdu/Config.in"
 	source "package/numactl/Config.in"
 	source "package/nut/Config.in"
+	source "package/openrc/Config.in"
 	source "package/openvmtools/Config.in"
 	source "package/pamtester/Config.in"
 	source "package/polkit/Config.in"
diff --git a/package/openrc/Config.in b/package/openrc/Config.in
new file mode 100644
index 0000000000..e98ed624c9
--- /dev/null
+++ b/package/openrc/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_OPENRC
+	bool "OpenRC"
+	select BR2_PACKAGE_NCURSES
+	help
+	  Init that works on top of pid 1 (for example openrc-init). By default
+	  it does quite a lot on startup (like setting hwclock, mounting
+	  directories, configuring interfaces and so on). So for this init to
+	  properly work you need at least these tools on the root filesystem
+	  (default busybox configuration provides them all):
+
+	  swapon, fsck, hwclock, getty, login, grep, mount, coreutils, procps,
+	  modprobe (kmod), net-tools
+
+	  Number of tools may be decreased by removing services that use them.
diff --git a/package/openrc/openrc.hash b/package/openrc/openrc.hash
new file mode 100644
index 0000000000..0d813b6a14
--- /dev/null
+++ b/package/openrc/openrc.hash
@@ -0,0 +1,2 @@
+# Calculated manually
+sha256	c99488ca54f2b795328d07bbd456ade49b571136bba7501f7eaaeb1ca9f9ecc4	openrc-0.41.2.tar.gz
diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
new file mode 100644
index 0000000000..faffb5beb0
--- /dev/null
+++ b/package/openrc/openrc.mk
@@ -0,0 +1,46 @@
+################################################################################
+#
+# openrc
+#
+################################################################################
+
+OPENRC_VERSION = 0.41.2
+OPENRC_SOURCE = openrc-$(OPENRC_VERSION).tar.gz
+OPENRC_SITE = $(call github,OpenRC,openrc,$(OPENRC_VERSION))
+OPENRC_LICENSE = BSD-2-Clause
+OPENRC_LICENSE_FILES = LICENSE
+
+OPENRC_DEPENDENCIES += ncurses
+
+ifeq ($(BR2_SHARED_LIBS),y)
+OPENRC_MAKE_OPTS += MKSTATICLIBS=no
+else
+OPENRC_MAKE_OPTS += MKSTATICLIBS=yes
+endif
+
+# set LIBNAME so openrc puts files in proper directories and sets proper
+# paths in installed files. Since in buildroot /lib64 and /lib32 always
+# points to /lib, it's safe to hardcode it to "lib"
+OPENRC_MAKE_OPTS += LIBNAME=lib
+OPENRC_MAKE_OPTS += LIBEXECDIR=/usr/libexec/rc
+OPENRC_MAKE_OPTS += TARGETDIR=$(TARGET_DIR)
+OPENRC_MAKE_OPTS += MKPKGCONFIG=no
+OPENRC_MAKE_OPTS += MKSELINUX=no
+OPENRC_MAKE_OPTS += MKSYSVINIT=yes
+OPENRC_MAKE_OPTS += BRANDING="Buildroot $(BR2_VERSION_FULL)"
+OPENRC_MAKE_OPTS += CC=$(TARGET_CC)
+
+define OPENRC_BUILD_CMDS
+	$(MAKE) $(OPENRC_MAKE_OPTS) -C $(@D)
+endef
+
+define OPENRC_INSTALL_TARGET_CMDS
+	DESTDIR=$(TARGET_DIR) $(MAKE) $(OPENRC_MAKE_OPTS) -C $(@D) install
+endef
+
+define OPENRC_REMOVE_UNNEEDED
+	$(RM) -r $(TARGET_DIR)/usr/share/openrc
+endef
+OPENRC_TARGET_FINALIZE_HOOKS += OPENRC_REMOVE_UNNEEDED
+
+$(eval $(generic-package))
-- 
2.18.1
