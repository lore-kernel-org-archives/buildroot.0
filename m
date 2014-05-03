From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat,  3 May 2014 19:48:00 +0200
Subject: [Buildroot] [PATCH] linux-zigbee: new package
Message-ID: <1399139280-9258-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

linux-zigbee is a mix of utility tools that implements a 802.15.4 stack
along with a usefull library for any program that would need to use this
stack.

Note that the name is mislead, for licensing reason, this does *NOT*
implement the ZigBee protocol.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/Config.in                                  |  1 +
 package/linux-zigbee/Config.in                     | 28 ++++++++++++
 ...igbee-0001-test-serial-Remove-test-serial.patch | 52 ++++++++++++++++++++++
 package/linux-zigbee/linux-zigbee.mk               | 28 ++++++++++++
 4 files changed, 109 insertions(+)
 create mode 100644 package/linux-zigbee/Config.in
 create mode 100644 package/linux-zigbee/linux-zigbee-0001-test-serial-Remove-test-serial.patch
 create mode 100644 package/linux-zigbee/linux-zigbee.mk

diff --git a/package/Config.in b/package/Config.in
index 4430241..f5df132 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -939,6 +939,7 @@ source "package/lighttpd/Config.in"
 source "package/linknx/Config.in"
 source "package/links/Config.in"
 source "package/linphone/Config.in"
+source "package/linux-zigbee/Config.in"
 source "package/lrzsz/Config.in"
 source "package/macchanger/Config.in"
 source "package/mii-diag/Config.in"
diff --git a/package/linux-zigbee/Config.in b/package/linux-zigbee/Config.in
new file mode 100644
index 0000000..2917c46
--- /dev/null
+++ b/package/linux-zigbee/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_LINUX_ZIGBEE
+	bool "linux-zigbee"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBNL
+	help
+	  IEEE 802.15.4 userspace tools.
+
+	  Note: The name's project is somewhat of a misnomer, because of licensing
+	  issues this does *NOT* implement ZigBee, only IEEE 802.15.4 and 6LoWPAN.
+
+	  http://sourceforge.net/apps/trac/linux-zigbee/
+
+if BR2_PACKAGE_LINUX_ZIGBEE
+
+config BR2_PACKAGE_LINUX_ZIGBEE_TESTS
+	bool "Install tests programs"
+	help
+		Linux-ZigBee build tests programs, select this if you want to install
+		them.
+
+config BR2_PACKAGE_LINUX_ZIGBEE_OLD_KERNEL_COMPAT
+	bool "Enable compatibility with older kernels"
+
+config BR2_PACKAGE_LINUX_ZIGBEE_LEASEFILE
+	string "Specify path for persistent lease storage."
+	default "/var/run/izcoordinator.leases"
+
+endif
diff --git a/package/linux-zigbee/linux-zigbee-0001-test-serial-Remove-test-serial.patch b/package/linux-zigbee/linux-zigbee-0001-test-serial-Remove-test-serial.patch
new file mode 100644
index 0000000..7258ff4
--- /dev/null
+++ b/package/linux-zigbee/linux-zigbee-0001-test-serial-Remove-test-serial.patch
@@ -0,0 +1,52 @@
+From 98187a5238939edc889fdaad93b00628b55d1e08 Mon Sep 17 00:00:00 2001
+From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+Date: Sat, 3 May 2014 19:43:20 +0200
+Subject: [PATCH] test-serial: Remove test-serial
+
+This folders only contains python tests scripts which would force us to
+enable a dependency to host-python which seems kind of silly since
+theses are only tests scripts.
+---
+ Makefile.am  | 2 +-
+ configure.ac | 6 ------
+ 2 files changed, 1 insertion(+), 7 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 265f0d7..e7bb1a1 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -2,7 +2,7 @@ include $(top_srcdir)/Makefile.common
+ 
+ ACLOCAL_AMFLAGS = -I m4
+ 
+-SUBDIRS = lib addrdb src tests test-serial
++SUBDIRS = lib addrdb src tests
+ 
+ include_HEADERS = include/ieee802154.h include/nl802154.h
+ noinst_HEADERS = include/libcommon.h include/addrdb.h include/logging.h
+diff --git a/configure.ac b/configure.ac
+index 17658af..506b289 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -77,11 +77,6 @@ AC_PROG_LIBTOOL
+ AM_PROG_LEX
+ AC_PROG_YACC
+ AC_SUBST(LIBTOOL_DEPS)
+-# Currently the scripts works with python2.x only
+-# Check for this at first
+-AC_PATH_PROG(PYTHON, python2 python2.7 python2.6 python2.5 python)
+-AM_PATH_PYTHON(,, [:])
+-py_CHECK_MAJOR_VERSION([PYTHON_VERSION], [2])
+ AM_MISSING_PROG(HELP2MAN, help2man, $missing_dir)
+ 
+ # Checks for libraries.
+@@ -135,6 +130,5 @@ AC_CONFIG_FILES([
+ 	addrdb/Makefile
+ 	src/Makefile
+ 	tests/Makefile
+-	test-serial/Makefile
+ ])
+ AC_OUTPUT
+-- 
+1.9.2
+
diff --git a/package/linux-zigbee/linux-zigbee.mk b/package/linux-zigbee/linux-zigbee.mk
new file mode 100644
index 0000000..9aa4da9
--- /dev/null
+++ b/package/linux-zigbee/linux-zigbee.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# linux-zigbee
+#
+################################################################################
+
+LINUX_ZIGBEE_VERSION = v0.3.1
+LINUX_ZIGBEE_SITE = git://linux-zigbee.git.sourceforge.net/gitroot/linux-zigbee/linux-zigbee
+LINUX_ZIGBEE_LICENSE = GPLv2
+LINUX_ZIGBEE_LICENSE_FILES = COPYING
+LINUX_ZIGBEE_AUTORECONF = YES
+LINUX_ZIGBEE_INSTALL_STAGING = YES
+LINUX_ZIGBEE_DEPENDENCIES = libnl
+
+LINUX_ZIGBEE_CONF_OPT += --disable-manpages\
+        --with-leasefile="$(call qstrip,$(BR2_PACKAGE_LINUX_ZIGBEE_LEASEFILE))"
+
+ifeq ($(BR2_PACKAGE_LINUX_ZIGBEE_TESTS),y)
+LINUX_ZIGBEE_CONF_OPT += --with-zbtestdir='/usr/sbin/'
+else
+LINUX_ZIGBEE_CONF_OPT += --with-zbtestdir=''
+endif
+
+ifeq ($(BR2_PACKAGE_LINUX_ZIGBEE_OLD_KERNEL_COMPAT),y)
+LINUX_ZIGBEE_CONF_OPT += --enable-kernel-compat
+endif
+
+$(eval $(autotools-package))
-- 
1.9.2
