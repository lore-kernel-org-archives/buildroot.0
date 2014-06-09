From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 14:21:06 +0200
Subject: [Buildroot] [git commit] linux-zigbee: new package
Message-ID: <20140609122134.523F09CF77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=df3125737b95e66f8ef6a3c3574ce6a3cf138998
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

linux-zigbee is a mix of utility tools that implements a 802.15.4 stack
along with a usefull library for any program that would need to use this
stack.

Note that the name is mislead, for licensing reason, this does *NOT*
implement the ZigBee protocol.

[Thomas:
 - add dependency on threads, propagated from libnl
 - improve the Config.in description by borrowing more text from the
   upstream website
 - fix the prompt of sub-options to be more consistent, and add help
   texts where appropriate
 - fix indentation of the BR2_PACKAGE_LINUX_ZIGBEE_TESTS option help
   text
 - add missing dependencies on host-pkgconf, host-flex and host-bison
 - add missing SoB line in the patch disabling test-serial. Maxime is
   a well-known contributor, so I assumed we had his SoB.
 - fix indentation of <pkg>_CONF_OPT.
 - remove <pkg>_INSTALL_STAGING = YES since the package does not
   install any library, and the two headers it installs are available
   through the toolchain kernel headers.
 - add comment to explain <pkg>_AUTORECONF = YES.]

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/linux-zigbee/Config.in                     |   52 +++++++++++++++++++
 ...igbee-0001-test-serial-Remove-test-serial.patch |   54 ++++++++++++++++++++
 package/linux-zigbee/linux-zigbee.mk               |   30 +++++++++++
 4 files changed, 137 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index d73eaed..0440ce8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -947,6 +947,7 @@ source "package/lighttpd/Config.in"
 source "package/linknx/Config.in"
 source "package/links/Config.in"
 source "package/linphone/Config.in"
+source "package/linux-zigbee/Config.in"
 source "package/lrzsz/Config.in"
 source "package/macchanger/Config.in"
 source "package/mii-diag/Config.in"
diff --git a/package/linux-zigbee/Config.in b/package/linux-zigbee/Config.in
new file mode 100644
index 0000000..ef7c760
--- /dev/null
+++ b/package/linux-zigbee/Config.in
@@ -0,0 +1,52 @@
+config BR2_PACKAGE_LINUX_ZIGBEE
+	bool "linux-zigbee"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+	select BR2_PACKAGE_LIBNL
+	help
+	  IEEE 802.15.4 is a standard for communication in small
+	  low-rate wireless personal area networks (WPAN). While
+	  802.15.4 is a MAC- and PHY- layer standard only, several
+	  common protocols commonly sit on top of it such as ZigBee,
+	  MiWi, and 6LoWPAN. The goal of this project is to create an
+	  implementation of 802.15.4 and several of the protocols
+	  which run on top of it (primarily 6LoWPAN) for Linux.
+
+	  It's worth noting that the name linux-zigbee is somewhat of
+	  a misnomer. While this project was originally started to
+	  create a ZigBee implementation for Linux, licensing
+	  restrictions put in place by the ZigBee Alliance make it
+	  impossible for an implementation of ZigBee to ever become
+	  part of the Linux kernel. Once this licensing issue was
+	  discovered, this project's primary focus shifted to IEEE
+	  802.15.4 and 6LoWPAN. Other higher-layer standards may be
+	  added at a future time.
+
+	  The 802.15.4 stack contains kernel components, which are
+	  part of the mainline Linux kernel, and userspace components,
+	  available in this package.
+
+	  http://sourceforge.net/apps/trac/linux-zigbee/
+
+if BR2_PACKAGE_LINUX_ZIGBEE
+
+config BR2_PACKAGE_LINUX_ZIGBEE_TESTS
+	bool "tests programs"
+	help
+	  Enable this option to install the Linux-ZigBee test programs
+	  to the target.
+
+
+config BR2_PACKAGE_LINUX_ZIGBEE_OLD_KERNEL_COMPAT
+	bool "compatibility with older kernels"
+	help
+	  Enable this option to get compatibility of the Linux-ZigBee
+	  userspace tools with old kernels. Recent kernels know the
+	  802.15.4 line discipline as N_IEEE802154 with the value 25,
+	  but some older kernels had it with the values 22 or 19.
+
+config BR2_PACKAGE_LINUX_ZIGBEE_LEASEFILE
+	string "path for persistent lease storage"
+	default "/var/run/izcoordinator.leases"
+
+endif
diff --git a/package/linux-zigbee/linux-zigbee-0001-test-serial-Remove-test-serial.patch b/package/linux-zigbee/linux-zigbee-0001-test-serial-Remove-test-serial.patch
new file mode 100644
index 0000000..8cd9d75
--- /dev/null
+++ b/package/linux-zigbee/linux-zigbee-0001-test-serial-Remove-test-serial.patch
@@ -0,0 +1,54 @@
+From 98187a5238939edc889fdaad93b00628b55d1e08 Mon Sep 17 00:00:00 2001
+From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+Date: Sat, 3 May 2014 19:43:20 +0200
+Subject: [PATCH] test-serial: Remove test-serial
+
+This folders only contains python tests scripts which would force us to
+enable a dependency to host-python which seems kind of silly since
+theses are only tests scripts.
+
+Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
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
index 0000000..3001eef
--- /dev/null
+++ b/package/linux-zigbee/linux-zigbee.mk
@@ -0,0 +1,30 @@
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
+LINUX_ZIGBEE_DEPENDENCIES = libnl host-pkgconf host-flex host-bison
+
+# We patch configure.ac/Makefile.am
+LINUX_ZIGBEE_AUTORECONF = YES
+
+LINUX_ZIGBEE_CONF_OPT = \
+	--disable-manpages \
+	--with-leasefile="$(call qstrip,$(BR2_PACKAGE_LINUX_ZIGBEE_LEASEFILE))"
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
