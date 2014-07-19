From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 14:47:27 +0200
Subject: [Buildroot] [git commit] make: bump to version 4.0
Message-ID: <20140719124734.5508B9D288@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1aa42ad4aed013c03d1e17f4cfe2ace2194f423d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit bumps make to version 4.0. This version now uses fork(),
so it is no longer available on non-MMU platforms, which consequently
works around:

  http://autobuild.buildroot.org/results/2e1/2e1b11ccb501f1ab431c04435be52a6538d035cb/

The glob special options seem to no longer be needed, at least make
4.0 builds fine with both an ARM uClibc toolchain and an ARM glibc
toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/make/Config.in   |    1 +
 package/make/make.mk     |    6 +-----
 package/uclibc/Config.in |    1 +
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/make/Config.in b/package/make/Config.in
index aea72e3..f576b7b 100644
--- a/package/make/Config.in
+++ b/package/make/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_MAKE
 	bool "make"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  A tool which controls the generation of executables and other
diff --git a/package/make/make.mk b/package/make/make.mk
index 74726e2..803595f 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MAKE_VERSION = 3.82
+MAKE_VERSION = 4.0
 MAKE_SOURCE = make-$(MAKE_VERSION).tar.bz2
 MAKE_SITE = $(BR2_GNU_MIRROR)/make
 MAKE_LICENSE = GPLv3+
@@ -12,8 +12,4 @@ MAKE_LICENSE_FILES = COPYING
 
 MAKE_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
-MAKE_CONF_ENV = make_cv_sys_gnu_glob=no \
-		GLOBINC='-I$(@D)/glob' \
-		GLOBLIB=glob/libglob.a
-
 $(eval $(autotools-package))
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index cda6e0b..0838b6c 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -157,6 +157,7 @@ config BR2_UCLIBC_INSTALL_UTILS
 config BR2_UCLIBC_INSTALL_TEST_SUITE
 	bool "Compile and install uClibc tests"
 	select BR2_PACKAGE_MAKE
+	depends on BR2_USE_MMU # make
 	help
 	  Enabling this option will compile and install the uClibc test suite.
 	  This is useful if you want to check if the uClibc library is working
