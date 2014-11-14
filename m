From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 14 Nov 2014 09:44:51 -0300
Subject: [Buildroot] [PATCH 05/10] start-stop-daemon: new package
In-Reply-To: <1415969096-3032-1-git-send-email-gustavo@zacarias.com.ar>
References: <1415969096-3032-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1415969096-3032-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                                  |  3 ++
 .../0001-add-uclibc-alias-and-musl.patch           | 42 ++++++++++++++++++++++
 package/start-stop-daemon/Config.in                |  8 +++++
 package/start-stop-daemon/start-stop-daemon.hash   |  2 ++
 package/start-stop-daemon/start-stop-daemon.mk     | 27 ++++++++++++++
 5 files changed, 82 insertions(+)
 create mode 100644 package/start-stop-daemon/0001-add-uclibc-alias-and-musl.patch
 create mode 100644 package/start-stop-daemon/Config.in
 create mode 100644 package/start-stop-daemon/start-stop-daemon.hash
 create mode 100644 package/start-stop-daemon/start-stop-daemon.mk

diff --git a/package/Config.in b/package/Config.in
index 8f3cc3c..ce161cf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1229,6 +1229,9 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/rsyslog/Config.in"
 endif
 	source "package/smack/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	source "package/start-stop-daemon/Config.in"
+endif
 	source "package/supervisor/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/sysklogd/Config.in"
diff --git a/package/start-stop-daemon/0001-add-uclibc-alias-and-musl.patch b/package/start-stop-daemon/0001-add-uclibc-alias-and-musl.patch
new file mode 100644
index 0000000..0b726d4
--- /dev/null
+++ b/package/start-stop-daemon/0001-add-uclibc-alias-and-musl.patch
@@ -0,0 +1,42 @@
+Make linux-uclibcgnueabi an alias for linux-uclibceabi since it's
+what we use in buildroot toolchains.
+Also add support for musl libc which is a backport from 1.17.x with
+a slight tweak for musleabi (non-hf).
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura dpkg-1.16.15.orig/ostable dpkg-1.16.15/ostable
+--- dpkg-1.16.15.orig/ostable	2014-11-07 08:09:07.358304926 -0300
++++ dpkg-1.16.15/ostable	2014-11-07 09:35:06.158580079 -0300
+@@ -14,8 +14,10 @@
+ # system part of the output of the GNU config.guess script.
+ #
+ # <Debian name>		<GNU name>		<config.guess regex>
+-uclibceabi-linux	linux-uclibceabi	linux[^-]*-uclibceabi
++uclibceabi-linux	linux-uclibceabi	linux[^-]*-uclibc.*eabi
+ uclibc-linux		linux-uclibc		linux[^-]*-uclibc
++musleabihf-linux	linux-musleabihf	linux[^-]*-musleabihf
++musl-linux		linux-musl		linux[^-]*-musl[^-]*
+ gnueabihf-linux		linux-gnueabihf		linux[^-]*-gnueabihf
+ gnueabi-linux		linux-gnueabi		linux[^-]*-gnueabi
+ gnuabin32-linux		linux-gnuabin32		linux[^-]*-gnuabin32
+@@ -33,6 +35,6 @@
+ bsd-netbsd		netbsd			netbsd[^-]*
+ bsd-openbsd		openbsd			openbsd[^-]*
+ sysv-solaris		solaris			solaris[^-]*
+-uclibceabi-uclinux	uclinux-uclibceabi	uclinux[^-]*-uclibceabi
++uclibceabi-uclinux	uclinux-uclibceabi	uclinux[^-]*-uclibc.*eabi
+ uclibc-uclinux		uclinux-uclibc		uclinux[^-]*(-uclibc.*)?
+ tos-mint		mint			mint[^-]*
+diff -Nura dpkg-1.16.15.orig/triplettable dpkg-1.16.15/triplettable
+--- dpkg-1.16.15.orig/triplettable	2014-11-07 08:09:07.345304482 -0300
++++ dpkg-1.16.15/triplettable	2014-11-07 09:35:29.098364036 -0300
+@@ -5,6 +5,8 @@
+ # <Debian triplet>	<Debian arch>
+ uclibceabi-linux-arm	uclibc-linux-armel
+ uclibc-linux-<cpu>	uclibc-linux-<cpu>
++musleabihf-linux-arm	musl-linux-armhf
++musl-linux-<cpu>	musl-linux-<cpu>
+ gnueabihf-linux-arm	armhf
+ gnueabi-linux-arm	armel
+ gnuabin32-linux-mips64el	mipsn32el
diff --git a/package/start-stop-daemon/Config.in b/package/start-stop-daemon/Config.in
new file mode 100644
index 0000000..7d8eb34
--- /dev/null
+++ b/package/start-stop-daemon/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_START_STOP_DAEMON
+	bool "start-stop-daemon"
+	depends on BR2_USE_MMU # fork()
+	help
+	  start-stop-daemon is used to control the creation and termination
+	  of system-level processes.
+
+	  https://tracker.debian.org/pkg/dpkg
diff --git a/package/start-stop-daemon/start-stop-daemon.hash b/package/start-stop-daemon/start-stop-daemon.hash
new file mode 100644
index 0000000..e3ab29f
--- /dev/null
+++ b/package/start-stop-daemon/start-stop-daemon.hash
@@ -0,0 +1,2 @@
+# From http://ftp.de.debian.org/debian/pool/main/d/dpkg/dpkg_1.16.15.dsc
+sha256	92bca9901ba2d9300be42f6de8dbea59b8367a918a2abeeb47d2176c9cf86b55	dpkg_1.16.15.tar.xz
diff --git a/package/start-stop-daemon/start-stop-daemon.mk b/package/start-stop-daemon/start-stop-daemon.mk
new file mode 100644
index 0000000..7a699d0
--- /dev/null
+++ b/package/start-stop-daemon/start-stop-daemon.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# start-stop-daemon
+#
+################################################################################
+
+START_STOP_DAEMON_VERSION = 1.16.15
+START_STOP_DAEMON_SOURCE = dpkg_$(START_STOP_DAEMON_VERSION).tar.xz
+START_STOP_DAEMON_SITE = http://snapshot.debian.org/archive/debian/20140616T044945Z/pool/main/d/dpkg
+START_STOP_DAEMON_CONF_OPTS = --disable-dselect --disable-update-alternatives \
+	--exec-prefix=/
+START_STOP_DAEMON_DEPENDENCIES = host-pkgconf \
+	$(if $(BR2_PACKAGE_BUSYBOX),busybox)
+START_STOP_DAEMON_LICENSE = GPLv2+
+START_STOP_DAEMON_LICENSE_FILES = debian/copyright
+
+define START_STOP_DAEMON_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/lib/compat
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/utils
+endef
+
+define START_STOP_DAEMON_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/utils/start-stop-daemon \
+		$(TARGET_DIR)/sbin/start-stop-daemon
+endef
+
+$(eval $(autotools-package))
-- 
2.0.4
