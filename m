From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Dec 2012 17:56:08 +0100
Subject: [Buildroot] =?utf-8?q?=5BPATCH_01/19=5D_package/vde2=3A_new_packa?=
	=?utf-8?q?ge?=
In-Reply-To: <cover.1355676845.git.yann.morin.1998@free.fr>
References: <cover.1355676845.git.yann.morin.1998@free.fr>
Message-ID: <38d9c4091850fdb0ee049feab6f7a33bf3b09850.1355676845.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

VDE is an ethernet compliant virtual network that can be
spawned over a set of physical computer over the Internet.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <jacmet@uclibc.org>
---
 package/Config.in              |    1 +
 package/vde2/Config.in         |    8 ++++++++
 package/vde2/vde2-no-cxx.patch |   22 ++++++++++++++++++++++
 package/vde2/vde2.mk           |   39 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 70 insertions(+), 0 deletions(-)
 create mode 100644 package/vde2/Config.in
 create mode 100644 package/vde2/vde2-no-cxx.patch
 create mode 100644 package/vde2/vde2.mk

diff --git a/package/Config.in b/package/Config.in
index c605e6f..70a572b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -675,6 +675,7 @@ source "package/ttcp/Config.in"
 source "package/udpcast/Config.in"
 source "package/ulogd/Config.in"
 source "package/ushare/Config.in"
+source "package/vde2/Config.in"
 source "package/vpnc/Config.in"
 source "package/vsftpd/Config.in"
 source "package/vtun/Config.in"
diff --git a/package/vde2/Config.in b/package/vde2/Config.in
new file mode 100644
index 0000000..f069a79
--- /dev/null
+++ b/package/vde2/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_VDE2
+	bool "vde2"
+	help
+	  VDE is an ethernet compliant virtual network that can be
+	  spawned over a set of physical computers over the Internet.
+	  VDE is part of the virtualsquare project.
+	  
+	  http://vde.sourceforge.net/
diff --git a/package/vde2/vde2-no-cxx.patch b/package/vde2/vde2-no-cxx.patch
new file mode 100644
index 0000000..67cefa2
--- /dev/null
+++ b/package/vde2/vde2-no-cxx.patch
@@ -0,0 +1,22 @@
+configure: do not test for CXX, it's not needed
+
+There is no C++ source file, so no reason to require a C++ compiler.
+
+Reported-by: Peter Korsgaard <jacmet@uclibc.org>
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+---
+Patch sent upstream
+( not yet in archives, awaits moderator approval... :-/ )
+
+diff -durN vde2-2.3.2.orig/configure.ac vde2-2.3.2/configure.ac
+--- vde2-2.3.2.orig/configure.ac	2011-11-23 17:41:19.000000000 +0100
++++ vde2-2.3.2/configure.ac	2012-12-14 21:56:47.146319686 +0100
+@@ -11,7 +11,6 @@
+ AC_CONFIG_LIBOBJ_DIR(src/common)
+ 
+ # Checks for programs.
+-AC_PROG_CXX
+ AC_PROG_CC
+ AC_PROG_INSTALL
+ AC_PROG_LN_S
diff --git a/package/vde2/vde2.mk b/package/vde2/vde2.mk
new file mode 100644
index 0000000..cb85f57
--- /dev/null
+++ b/package/vde2/vde2.mk
@@ -0,0 +1,39 @@
+#############################################################
+#
+# vde2
+#
+#############################################################
+
+VDE2_VERSION         = 2.3.2
+VDE2_SOURCE          = vde2-$(VDE2_VERSION).tar.bz2
+VDE2_SITE            = http://downloads.sourceforge.net/project/vde/vde2/$(VDE2_VERSION)
+VDE2_LICENSE         = GPLv2+ LGPLv2.1+ BSD-3c
+VDE2_LICENSE_FILES   = COPYING COPYING.libvdeplug COPYING.slirpvde
+VDE2_INSTALL_STAGING = YES
+
+# We touch configure.ac, so we need to autoreconf
+VDE2_AUTORECONF      = YES
+
+# Reasons for enabling/disabling stuff:
+#?- tuntap is enabled in the hope we're using a recent-enough toolchain
+#   that does have if_tun.h (virtually everything these days)
+# - kvde_switch is disabled because it requires a patched kernel
+# - cryptcab is disabled to not depend on openSSL
+# - python is disabled to not depend on Python
+# - pcap is disabled to not depend on libpcap
+# - profiling is disabled because we do not want to debug/profile
+#
+# Note: disabled features can be added with corresponding dependencies
+#       in future commits.
+VDE2_CONF_OPT = --disable-experimental  \
+                --disable-cryptcab      \
+                --disable-pcap          \
+                --disable-python        \
+                --disable-profile       \
+                --disable-kernel-switch \
+                --enable-tuntap         \
+
+#?Package does not build in parallel due to improper make rules
+VDE2_MAKE = $(MAKE1)
+
+$(eval $(autotools-package))
-- 
1.7.2.5
