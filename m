From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Jul 2014 15:38:13 +0200
Subject: [Buildroot] [git commit] lxc: bump to version 1.0.4
Message-ID: <20140704144657.85A999D11E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=065c7fcd7a16b4e4c908c975112dc3fb1265c415
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also switch to new homepage and github download, and specify distro
variant since host distro != target distro and sample configs for each
case aren't useful anyway.
It sometimes failed to autodetect because some of the tests can't be
executed when cross compiling (happened on gentoo host).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lxc/Config.in                |    2 +-
 package/lxc/lxc-01-drop-werror.patch |   16 ++++++++++++++++
 package/lxc/lxc.mk                   |   10 ++++++----
 3 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/package/lxc/Config.in b/package/lxc/Config.in
index d0937e6..3eae64a 100644
--- a/package/lxc/Config.in
+++ b/package/lxc/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_LXC
 	  of a set of processes in a jail by virtualizing and accounting the
 	  kernel resources. It is similar to Linux-Vserver or Openvz.
 
-	  http://lxc.sourceforge.net/
+	  https://linuxcontainers.org/
 
 comment "lxc needs a toolchain w/ IPv6, threads, largefile"
 	depends on BR2_USE_MMU
diff --git a/package/lxc/lxc-01-drop-werror.patch b/package/lxc/lxc-01-drop-werror.patch
new file mode 100644
index 0000000..d2a8673
--- /dev/null
+++ b/package/lxc/lxc-01-drop-werror.patch
@@ -0,0 +1,16 @@
+Don't do -Werror it breaks builds on some scenarios with trivialities.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura lxc-lxc-1.0.4/configure.ac lxc-lxc-1.0.4.orig/configure.ac
+--- lxc-lxc-1.0.4.orig/configure.ac	2014-07-04 10:31:19.821029891 -0300
++++ lxc-lxc-1.0.4/configure.ac	2014-06-13 14:07:45.000000000 -0300
+@@ -560,7 +560,7 @@
+ LXC_CHECK_TLS
+ 
+ if test "x$GCC" = "xyes"; then
+-	CFLAGS="$CFLAGS -Wall -Werror"
++	CFLAGS="$CFLAGS -Wall"
+ fi
+ 
+ # Files requiring some variable expansion
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 4e06902..b251b14 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-LXC_VERSION = 0.9.0
-LXC_SITE = http://downloads.sourceforge.net/project/lxc/lxc/lxc-$(LXC_VERSION)
+LXC_VERSION = 1.0.4
+LXC_SITE = $(call github,lxc,lxc,lxc-$(LXC_VERSION))
 LXC_LICENSE = LGPLv2.1+
 LXC_LICENSE_FILES = COPYING
-LXC_DEPENDENCIES = libcap
-LXC_CONF_OPT = --disable-apparmor
+LXC_DEPENDENCIES = libcap host-pkgconf
+# configure not shipped
+LXC_AUTORECONF = YES
+LXC_CONF_OPT = --disable-apparmor --with-distro=buildroot
 
 $(eval $(autotools-package))
