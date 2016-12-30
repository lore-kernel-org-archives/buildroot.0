From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:25 +0100
Subject: [Buildroot] [PATCH 24/52] package/dahdi-tools: new package
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <d9d4fb907f1d986b6c18b45f86c48d8168595c09.1483093662.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also provides libraries, so install in staging as well.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in                               |  1 +
 package/dahdi-tools/0001-no-build-docs.patch    | 16 +++++++++++
 package/dahdi-tools/0002-no-perl-manpages.patch | 37 +++++++++++++++++++++++++
 package/dahdi-tools/Config.in                   | 23 +++++++++++++++
 package/dahdi-tools/dahdi-tools.hash            |  4 +++
 package/dahdi-tools/dahdi-tools.mk              | 32 +++++++++++++++++++++
 6 files changed, 113 insertions(+)
 create mode 100644 package/dahdi-tools/0001-no-build-docs.patch
 create mode 100644 package/dahdi-tools/0002-no-perl-manpages.patch
 create mode 100644 package/dahdi-tools/Config.in
 create mode 100644 package/dahdi-tools/dahdi-tools.hash
 create mode 100644 package/dahdi-tools/dahdi-tools.mk

diff --git a/package/Config.in b/package/Config.in
index 3de7c57..0f5d767 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -357,6 +357,7 @@ endmenu
 	source "package/cryptsetup/Config.in"
 	source "package/cwiid/Config.in"
 	source "package/dahdi-linux/Config.in"
+	source "package/dahdi-tools/Config.in"
 	source "package/dbus/Config.in"
 	source "package/dbus-cpp/Config.in"
 	source "package/dbus-glib/Config.in"
diff --git a/package/dahdi-tools/0001-no-build-docs.patch b/package/dahdi-tools/0001-no-build-docs.patch
new file mode 100644
index 0000000..311a129
--- /dev/null
+++ b/package/dahdi-tools/0001-no-build-docs.patch
@@ -0,0 +1,16 @@
+Do not build the documentation.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN dahdi-tools-2.11.0.orig/Makefile.am dahdi-tools-2.11.0/Makefile.am
+--- dahdi-tools-2.11.0.orig/Makefile.am	2015-12-22 21:19:12.000000000 +0100
++++ dahdi-tools-2.11.0/Makefile.am	2016-01-04 23:23:34.201304133 +0100
+@@ -17,7 +17,7 @@
+ 	#-Wformat=2
+ endif
+ 
+-SUBDIRS	= xpp doc hotplug
++SUBDIRS	= xpp hotplug
+ 
+ if PPPD
+ SUBDIRS	+= ppp
diff --git a/package/dahdi-tools/0002-no-perl-manpages.patch b/package/dahdi-tools/0002-no-perl-manpages.patch
new file mode 100644
index 0000000..dae1b6c
--- /dev/null
+++ b/package/dahdi-tools/0002-no-perl-manpages.patch
@@ -0,0 +1,37 @@
+xpp: do not try to install the manpages for the perl tools
+
+The man pages are generated neither at build time nor at install time,
+so the install step fails.
+
+Just disable them.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN dahdi-tools-2.11.0.orig/xpp/Makefile.am dahdi-tools-2.11.0/xpp/Makefile.am
+--- dahdi-tools-2.11.0.orig/xpp/Makefile.am	2015-12-22 21:19:12.000000000 +0100
++++ dahdi-tools-2.11.0/xpp/Makefile.am	2016-01-04 23:56:31.851820973 +0100
+@@ -3,7 +3,6 @@
+ 
+ SUBDIRS		=
+ 
+-man_MANS	=
+ 
+ 
+ # FIXME: try to improve code, so we can use $(PEDANTIC)
+@@ -59,7 +58,6 @@
+ udevrules_DATA	= xpp.rules
+ 
+ dist_sbin_SCRIPTS	= $(perl_scripts)
+-man_MANS		+= $(perl_mans)
+ CLEANFILES		= $(perl_checks) $(perl_mans)
+ 
+ if	PBX_USB
+@@ -147,8 +145,6 @@
+ 		astribank_allow.8 \
+ 		astribank_is_starting.8
+ 
+-man_MANS	+= $(man_pages)
+-
+ endif
+ 
+ EXTRA_DIST	= \
diff --git a/package/dahdi-tools/Config.in b/package/dahdi-tools/Config.in
new file mode 100644
index 0000000..9799ed4
--- /dev/null
+++ b/package/dahdi-tools/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_DAHDI_TOOLS
+	bool "dahdi-tools"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_LINUX_KERNEL # dahdi-linux
+	depends on BR2_USE_MMU # perl
+	select BR2_PACKAGE_DAHDI_LINUX
+        select BR2_PACKAGE_PERL
+	help
+	  DAHDI (Digium/Asterisk Hardware Device Interface) is the open
+	  source device interface technology used to control Digium and
+	  other legacy telephony interface cards.
+
+	  DAHDI Tools is a package of utilities for managing and
+	  monitoring DAHDI devices.
+
+	  http://www.asterisk.org/downloads/dahdi
+
+# Two comments, otherwise it may not fit in menuconfig for narrow terminals
+comment "dahdi-tools needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LINUX_KERNEL
+
+comment "dahdi-tools needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/dahdi-tools/dahdi-tools.hash b/package/dahdi-tools/dahdi-tools.hash
new file mode 100644
index 0000000..10e122a
--- /dev/null
+++ b/package/dahdi-tools/dahdi-tools.hash
@@ -0,0 +1,4 @@
+# sha1 from http://downloads.asterisk.org/pub/telephony/dahdi-tools/releases
+# sha256 locally computed
+sha1    5da944e6d59a977f814230253f3ddf2847e7f31b                          dahdi-tools-2.11.1.tar.gz
+sha256  53ffeb333f3e44b0c88e5b17475cdbf87d3f652eb81a6422de76250c061e2909  dahdi-tools-2.11.1.tar.gz
diff --git a/package/dahdi-tools/dahdi-tools.mk b/package/dahdi-tools/dahdi-tools.mk
new file mode 100644
index 0000000..e97d944
--- /dev/null
+++ b/package/dahdi-tools/dahdi-tools.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# dahdi-tools
+#
+################################################################################
+
+DAHDI_TOOLS_VERSION = 2.11.1
+DAHDI_TOOLS_SITE = http://downloads.asterisk.org/pub/telephony/dahdi-tools/releases
+
+DAHDI_TOOLS_LICENSE = GPLv2, LGPLv2.1
+DAHDI_TOOLS_LICENSE_FILES = LICENSE LICENSE.LGPL
+
+DAHDI_TOOLS_DEPENDENCIES = dahdi-linux perl
+
+DAHDI_TOOLS_INSTALL_STAGING = YES
+DAHDI_TOOLS_AUTORECONF = YES
+
+# Buildroot globally exports PERL with the value it has on the host, so we need
+# to override it with the location where it will be on the target.
+DAHDI_TOOLS_CONF_ENV = PERL=/usr/bin/perl
+
+DAHDI_TOOLS_CONF_OPTS = \
+	--without-newt \
+	--without-usb \
+	--without-pcap \
+	--without-libusbx \
+	--without-libusb \
+	--without-selinux \
+	--without-ppp \
+	--with-perllib=/usr/lib/perl5/$(PERL_VERSION)
+
+$(eval $(autotools-package))
-- 
2.7.4
