From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Dec 2017 14:01:31 +0100
Subject: [Buildroot] [RFC 2/2] packages: drop no longer needed busybox
 dependencies
In-Reply-To: <20171213130131.15744-1-thomas.petazzoni@free-electrons.com>
References: <20171213130131.15744-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20171213130131.15744-3-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that the busybox package is careful to not build and install
applets that will conflict with the full-featured programs installed
by various packages, we can drop the optional dependency those
packages had on busybox.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Note: the list of packages is not complete, this is just a RFC version
to find out if that's the direction we want to take.
---
 package/bc/bc.mk                   | 5 -----
 package/binutils/binutils.mk       | 5 -----
 package/coreutils/coreutils.mk     | 6 ------
 package/cpio/cpio.mk               | 1 -
 package/dcron/dcron.mk             | 5 -----
 package/debianutils/debianutils.mk | 2 --
 package/diffutils/diffutils.mk     | 4 ----
 package/fbset/fbset.mk             | 5 -----
 package/kmod/kmod.mk               | 3 ---
 package/util-linux/util-linux.mk   | 6 ------
 10 files changed, 42 deletions(-)

diff --git a/package/bc/bc.mk b/package/bc/bc.mk
index a6446cef66..ee0e43848b 100644
--- a/package/bc/bc.mk
+++ b/package/bc/bc.mk
@@ -11,9 +11,4 @@ BC_DEPENDENCIES = host-flex
 BC_LICENSE = GPL-2.0+, LGPL-2.1+
 BC_LICENSE_FILES = COPYING COPYING.LIB
 
-# Build after busybox so target ends up with bc's "dc" version
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-BC_DEPENDENCIES += busybox
-endif
-
 $(eval $(autotools-package))
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 473fcac181..8fb1a53437 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -84,11 +84,6 @@ ifeq ($(BR2_ARM_CPU_ARMV7M)$(BR2_OPTIMIZE_S),yy)
 BINUTILS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O2"
 endif
 
-# Install binutils after busybox to prefer full-blown utilities
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-BINUTILS_DEPENDENCIES += busybox
-endif
-
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 BINUTILS_DEPENDENCIES += zlib
 endif
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 6a8a31b061..3f41e6f1a4 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -59,12 +59,6 @@ COREUTILS_BIN_PROGS = cat chgrp chmod chown cp date dd df dir echo false \
 	ln ls mkdir mknod mv pwd rm rmdir vdir sleep stty sync touch true \
 	uname join
 
-# If both coreutils and busybox are selected, make certain coreutils
-# wins the fight over who gets to have their utils actually installed.
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-COREUTILS_DEPENDENCIES = busybox
-endif
-
 ifeq ($(BR2_PACKAGE_ACL),y)
 COREUTILS_DEPENDENCIES += acl
 else
diff --git a/package/cpio/cpio.mk b/package/cpio/cpio.mk
index 7e8549dbd8..9a09279572 100644
--- a/package/cpio/cpio.mk
+++ b/package/cpio/cpio.mk
@@ -7,7 +7,6 @@
 CPIO_VERSION = 2.12
 CPIO_SITE = $(BR2_GNU_MIRROR)/cpio
 CPIO_CONF_OPTS = --bindir=/bin
-CPIO_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 CPIO_LICENSE = GPL-3.0+
 CPIO_LICENSE_FILES = COPYING
 
diff --git a/package/dcron/dcron.mk b/package/dcron/dcron.mk
index 7e81b63803..2ee0709af5 100644
--- a/package/dcron/dcron.mk
+++ b/package/dcron/dcron.mk
@@ -9,11 +9,6 @@ DCRON_SITE = http://www.jimpryor.net/linux/releases
 # The source code does not specify the version of the GPL that is used.
 DCRON_LICENSE = GPL
 
-# Overwrite cron-related Busybox commands if available
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-DCRON_DEPENDENCIES = busybox
-endif
-
 define DCRON_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
 endef
diff --git a/package/debianutils/debianutils.mk b/package/debianutils/debianutils.mk
index 86f201da1c..189d983732 100644
--- a/package/debianutils/debianutils.mk
+++ b/package/debianutils/debianutils.mk
@@ -8,8 +8,6 @@ DEBIANUTILS_VERSION = 4.8.1
 DEBIANUTILS_SOURCE = debianutils_$(DEBIANUTILS_VERSION).tar.xz
 DEBIANUTILS_SITE = http://snapshot.debian.org/archive/debian/20161118T033019Z/pool/main/d/debianutils
 DEBIANUTILS_CONF_OPTS = --exec-prefix=/
-# Make sure we override the busybox tools, such as which
-DEBIANUTILS_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 DEBIANUTILS_LICENSE = GPL-2.0+, SMAIL (savelog)
 DEBIANUTILS_LICENSE_FILES = debian/copyright
 
diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index 79785d6f01..9a41c985df 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -17,8 +17,4 @@ ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
 DIFFUTILS_CONF_ENV += gl_cv_func_getopt_gnu=yes
 endif
 
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-DIFFUTILS_DEPENDENCIES += busybox
-endif
-
 $(eval $(autotools-package))
diff --git a/package/fbset/fbset.mk b/package/fbset/fbset.mk
index d6ee104a22..787b4e1dca 100644
--- a/package/fbset/fbset.mk
+++ b/package/fbset/fbset.mk
@@ -9,11 +9,6 @@ FBSET_SITE = http://users.telenet.be/geertu/Linux/fbdev
 FBSET_DEPENDENCIES = host-bison host-flex
 FBSET_LICENSE = GPL-2.0
 
-# Make sure full fbset wins over busybox fbset
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-FBSET_DEPENDENCIES += busybox
-endif
-
 define FBSET_BUILD_CMDS
 	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 endef
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index bd676108aa..0b67460a13 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -49,9 +49,6 @@ ifeq ($(BR2_PACKAGE_KMOD_TOOLS),y)
 KMOD_LICENSE := $(KMOD_LICENSE), GPL-2.0+ (tools)
 KMOD_LICENSE_FILES += COPYING
 
-# take precedence over busybox implementation
-KMOD_DEPENDENCIES += $(if $(BR2_PACKAGE_BUSYBOX),busybox)
-
 # /sbin is really /usr/sbin with merged /usr, so adjust relative symlink
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
 KMOD_BIN_PATH = ../bin/kmod
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 31a3fe47ab..16137f4791 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -35,12 +35,6 @@ HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
 # We also don't want the host-python dependency
 HOST_UTIL_LINUX_CONF_OPTS = --without-python
 
-# If both util-linux and busybox are selected, make certain util-linux
-# wins the fight over who gets to have their utils actually installed
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-UTIL_LINUX_DEPENDENCIES += busybox
-endif
-
 # Prevent the installation from attempting to move shared libraries from
 # ${usrlib_execdir} (/usr/lib) to ${libdir} (/lib), since both paths are
 # the same when merged usr is in use.
-- 
2.14.3
