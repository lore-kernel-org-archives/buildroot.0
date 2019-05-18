From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 22:43:44 +0200
Subject: [Buildroot] [git commit branch/next] package/openrc: new package
Message-ID: <20190518204846.E94FD881B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6cf0897418d1c471376737209e82179f77c9ffe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This adds openrc init system package. This performs default openrc
installation with openrc-init that acts as pid1.

MKPKGCONFIG=no:
openrc does not use pkg-config per se, if MKPKGCONFIG is enabled,
it will just install *.pc files on rootfs for other programs to
find librc and libeinfo. These libs expose C api to control openrc
(al rc-* functions use it). From the looks of it, these libs would
be usefull if user wanted to write his own programs to manage
services, and vast majority of people using openrc won't need it.
Also, that's the reason why there is not INSTALL_STAGING=yes.

Signed-off-by: Micha?? ??yszczek <michal.lyszczek@bofc.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/openrc/Config.in   | 18 ++++++++++++++++++
 package/openrc/openrc.hash |  3 +++
 package/openrc/openrc.mk   | 45 +++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 68 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f1bed77fe9..3b5d2faae2 100644
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
index 3df091b608..ff07dce000 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2195,6 +2195,7 @@ menu "System tools"
 	source "package/ncdu/Config.in"
 	source "package/numactl/Config.in"
 	source "package/nut/Config.in"
+	source "package/openrc/Config.in"
 	source "package/openvmtools/Config.in"
 	source "package/pamtester/Config.in"
 	source "package/polkit/Config.in"
diff --git a/package/openrc/Config.in b/package/openrc/Config.in
new file mode 100644
index 0000000000..ec536c8692
--- /dev/null
+++ b/package/openrc/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_OPENRC
+	bool "openrc"
+	select BR2_PACKAGE_NCURSES
+	help
+	  Init that works on top of pid 1 (for example
+	  openrc-init). By default it does quite a lot on startup
+	  (like setting hwclock, mounting directories, configuring
+	  interfaces and so on). So for this init to properly work you
+	  need at least these tools on the root filesystem (default
+	  busybox configuration provides them all):
+
+	  swapon, fsck, hwclock, getty, login, grep, mount, coreutils,
+	  procps, modprobe (kmod), net-tools
+
+	  Number of tools may be decreased by removing services that
+	  use them.
+
+	  https://github.com/OpenRC/openrc
diff --git a/package/openrc/openrc.hash b/package/openrc/openrc.hash
new file mode 100644
index 0000000000..7d58e254c4
--- /dev/null
+++ b/package/openrc/openrc.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256	c99488ca54f2b795328d07bbd456ade49b571136bba7501f7eaaeb1ca9f9ecc4	openrc-0.41.2.tar.gz
+sha256	96862463f4e77e2508e4fc2c83773fd24807cb699368b63fd93a5e2b466dd624	LICENSE
diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
new file mode 100644
index 0000000000..53f2947dcc
--- /dev/null
+++ b/package/openrc/openrc.mk
@@ -0,0 +1,45 @@
+################################################################################
+#
+# openrc
+#
+################################################################################
+
+OPENRC_VERSION = 0.41.2
+OPENRC_SITE = $(call github,OpenRC,openrc,$(OPENRC_VERSION))
+OPENRC_LICENSE = BSD-2-Clause
+OPENRC_LICENSE_FILES = LICENSE
+
+OPENRC_DEPENDENCIES = ncurses
+
+# set LIBNAME so openrc puts files in proper directories and sets proper
+# paths in installed files. Since in buildroot /lib64 and /lib32 always
+# points to /lib, it's safe to hardcode it to "lib"
+OPENRC_MAKE_OPTS = \
+	LIBNAME=lib \
+	LIBEXECDIR=/usr/libexec/rc \
+	MKPKGCONFIG=no \
+	MKSELINUX=no \
+	MKSYSVINIT=yes \
+	BRANDING="Buildroot $(BR2_VERSION_FULL)" \
+	CC=$(TARGET_CC)
+
+ifeq ($(BR2_SHARED_LIBS),y)
+OPENRC_MAKE_OPTS += MKSTATICLIBS=no
+else
+OPENRC_MAKE_OPTS += MKSTATICLIBS=yes
+endif
+
+define OPENRC_BUILD_CMDS
+	$(MAKE) $(OPENRC_MAKE_OPTS) -C $(@D)
+endef
+
+define OPENRC_INSTALL_TARGET_CMDS
+	$(MAKE) $(OPENRC_MAKE_OPTS) DESTDIR=$(TARGET_DIR) -C $(@D) install
+endef
+
+define OPENRC_REMOVE_UNNEEDED
+	$(RM) -r $(TARGET_DIR)/usr/share/openrc
+endef
+OPENRC_TARGET_FINALIZE_HOOKS += OPENRC_REMOVE_UNNEEDED
+
+$(eval $(generic-package))
