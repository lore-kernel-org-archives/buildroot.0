From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 17 Sep 2017 18:45:58 -0300
Subject: [Buildroot] [PATCH v2] nc: new virtual package providing "netcat"
	functionality
In-Reply-To: <20170917071546.5111-1-casantos@datacom.ind.br>
References: <20170917071546.5111-1-casantos@datacom.ind.br>
Message-ID: <20170917214558.11061-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the "nc" virtual package and modify netcat, netcat-openbsd and nmap
to become providers.

Make the nmap recipe install "ncat" (with a symbolic link to nc) if the
BR2_PACKAGE_NMAP_NCAT option is set. Other programs (ncat, ndiff, etc.)
are still chosen via BR2_PACKAGE_NMAP, in the "Networking applications"
menu.

So far the "nc" options available to build with uClibc were the ancient
GNU netcat and its Busybox double. Both lack features available in more
modern netcats like IPv6, proxies, and Unix sockets.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
Changes v1->v2:
  - Prevent build error
    Makefile:537: *** nmap is in the dependency chain of nc that has \
    added it to its _DEPENDENCIES variable without selecting it or \
    depending on it from Config.in.  Stop.
---
 package/Config.in                        |  3 +-
 package/nc/Config.in                     | 84 ++++++++++++++++++++++++++++++++
 package/nc/nc.mk                         |  7 +++
 package/netcat-openbsd/Config.in         | 25 ----------
 package/netcat-openbsd/netcat-openbsd.mk |  2 +
 package/netcat/Config.in                 | 13 -----
 package/netcat/netcat.mk                 |  1 +
 package/nmap/Config.in                   |  4 ++
 package/nmap/nmap.mk                     | 30 +++++++++++-
 9 files changed, 127 insertions(+), 42 deletions(-)
 create mode 100644 package/nc/Config.in
 create mode 100644 package/nc/nc.mk

diff --git a/package/Config.in b/package/Config.in
index d4e40a6326..275461321f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1676,11 +1676,10 @@ menu "Networking applications"
 	source "package/mrouted/Config.in"
 	source "package/mtr/Config.in"
 	source "package/nbd/Config.in"
+	source "package/nc/Config.in"
 	source "package/ncftp/Config.in"
 	source "package/ndisc6/Config.in"
 	source "package/netatalk/Config.in"
-	source "package/netcat/Config.in"
-	source "package/netcat-openbsd/Config.in"
 	source "package/netplug/Config.in"
 	source "package/netsnmp/Config.in"
 	source "package/netstat-nat/Config.in"
diff --git a/package/nc/Config.in b/package/nc/Config.in
new file mode 100644
index 0000000000..c599f0d8bc
--- /dev/null
+++ b/package/nc/Config.in
@@ -0,0 +1,84 @@
+config BR2_PACKAGE_NC
+	bool "nc (netcat)"
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	help
+	  Select the desired "nc" command provider.
+
+if BR2_PACKAGE_NC
+
+choice
+	prompt "nc variant"
+	default BR2_PACKAGE_NETCAT
+	help
+	  Select either the venerable netcat (default), netcat-openbsd
+	  or nmap-ncat.
+
+config BR2_PACKAGE_NETCAT
+	bool "netcat"
+	select BR2_PACKAGE_HAS_NC
+	help
+	  Netcat is a featured networking utility which reads and writes
+	  data across network connections, using the TCP/IP protocol.
+	  It is designed to be a reliable "back-end" tool that can be
+	  used directly or easily driven by other programs and scripts.
+	  At the same time, it is a feature-rich network debugging and
+	  exploration tool, since it can create almost any kind of
+	  connection you would need and has several interesting built-in
+	  capabilities.
+
+	  http://netcat.sourceforge.net/download.php
+
+config BR2_PACKAGE_NETCAT_OPENBSD
+	bool "netcat-openbsd"
+	select BR2_PACKAGE_HAS_NC
+	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_LIBBSD
+	help
+	  This OpenBSD rewrite of netcat, including support for IPv6,
+	  proxies, and Unix sockets. Reads and writes data using TCP or
+	  UDP protocol. It is designed to be a reliable "back-end" tool
+	  that can be used directly or easily driven by other programs
+	  and scripts. At the same time it is a feature-rich network
+	  debugging and exploration tool, since it can create almost any
+	  kind of connection you would need and has several interesting
+	  built-in capabilities.
+
+	  https://packages.debian.org/sid/netcat-openbsd
+
+comment "netcat-openbsd needs a toolchain w/ glibc, threads"
+	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+
+config BR2_PACKAGE_NMAP_NCAT
+	bool "nmap-ncat"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_NMAP
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  Ncat is a feature-packed networking utility which reads and
+	  writes data across networks from the command line. Ncat was
+	  written for the Nmap Project as a much-improved
+	  reimplementation of the venerable Netcat.
+
+comment "nmap-nmap needs a toolchain w/ C++, threads"
+	depends on BR2_USE_MMU
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
+
+endchoice
+
+config BR2_PACKAGE_HAS_NC
+	bool
+
+config BR2_PACKAGE_PROVIDES_NC
+	string
+	default "netcat"         if BR2_PACKAGE_NETCAT
+	default "netcat-openbsd" if BR2_PACKAGE_NETCAT_OPENBSD
+	default "nmap"           if BR2_PACKAGE_NMAP_NCAT
+
+endif
diff --git a/package/nc/nc.mk b/package/nc/nc.mk
new file mode 100644
index 0000000000..e04b2bd017
--- /dev/null
+++ b/package/nc/nc.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# nc
+#
+################################################################################
+
+$(eval $(virtual-package))
diff --git a/package/netcat-openbsd/Config.in b/package/netcat-openbsd/Config.in
index 6df87ec688..e69de29bb2 100644
--- a/package/netcat-openbsd/Config.in
+++ b/package/netcat-openbsd/Config.in
@@ -1,25 +0,0 @@
-config BR2_PACKAGE_NETCAT_OPENBSD
-	bool "netcat-openbsd"
-	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_USES_GLIBC
-	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-	select BR2_PACKAGE_LIBBSD
-	help
-	  A simple Unix utility which reads and writes data across network
-	  connections using TCP or UDP protocol. It is designed to be a
-	  reliable "back-end" tool that can be used directly or easily driven
-	  by other programs and scripts. At the same time it is a feature-rich
-	  network debugging and exploration tool, since it can create almost
-	  any kind of connection you would need and has several interesting
-	  built-in capabilities.
-
-	  This package contains the OpenBSD rewrite of netcat, including
-	  support for IPv6, proxies, and Unix sockets.
-
-	  https://packages.debian.org/sid/netcat-openbsd
-
-comment "netcat-openbsd needs a glibc toolchain w/ threads"
-	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
-	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/netcat-openbsd/netcat-openbsd.mk b/package/netcat-openbsd/netcat-openbsd.mk
index e1a6fee574..5395f85e92 100644
--- a/package/netcat-openbsd/netcat-openbsd.mk
+++ b/package/netcat-openbsd/netcat-openbsd.mk
@@ -8,6 +8,8 @@ NETCAT_OPENBSD_VERSION = debian/1.105-7
 NETCAT_OPENBSD_SITE = git://anonscm.debian.org/collab-maint/netcat-openbsd
 NETCAT_OPENBSD_LICENSE = BSD-3-Clause
 NETCAT_OPENBSD_LICENSE_FILES = debian/copyright
+NETCAT_OPENBSD_PROVIDES = nc
+
 NETCAT_OPENBSD_DEPENDENCIES = host-pkgconf libbsd
 
 # Ensure Busybox gets built/installed before, so that this package
diff --git a/package/netcat/Config.in b/package/netcat/Config.in
index 924069ee1f..e69de29bb2 100644
--- a/package/netcat/Config.in
+++ b/package/netcat/Config.in
@@ -1,13 +0,0 @@
-config BR2_PACKAGE_NETCAT
-	bool "netcat"
-	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-	help
-	  Netcat is a featured networking utility which reads and writes data
-	  across network connections, using the TCP/IP protocol.
-	  It is designed to be a reliable "back-end" tool that can be used
-	  directly or easily driven by other programs and scripts. At the
-	  same time, it is a feature-rich network debugging and exploration
-	  tool, since it can create almost any kind of connection you would
-	  need and has several interesting built-in capabilities.
-
-	  http://netcat.sourceforge.net/download.php
diff --git a/package/netcat/netcat.mk b/package/netcat/netcat.mk
index eb7ddcac27..94786fc124 100644
--- a/package/netcat/netcat.mk
+++ b/package/netcat/netcat.mk
@@ -8,5 +8,6 @@ NETCAT_VERSION = 0.7.1
 NETCAT_SITE = http://downloads.sourceforge.net/project/netcat/netcat/$(NETCAT_VERSION)
 NETCAT_LICENSE = GPL-2.0+
 NETCAT_LICENSE_FILES = COPYING
+NETCAT_PROVIDES = nc
 
 $(eval $(autotools-package))
diff --git a/package/nmap/Config.in b/package/nmap/Config.in
index 79f587afd1..3203c3e24b 100644
--- a/package/nmap/Config.in
+++ b/package/nmap/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_NMAP
+	bool
+
+config BR2_PACKAGE_NMAP_NMAP
 	bool "nmap"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_NMAP
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_PCRE
 	help
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 37720e2cad..705687d9d0 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -7,12 +7,14 @@
 NMAP_VERSION = 7.40
 NMAP_SITE = http://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
-NMAP_DEPENDENCIES = libpcap pcre
+NMAP_DEPENDENCIES = libpcap
 NMAP_CONF_OPTS = --without-liblua --without-zenmap \
 	--with-libdnet=included --with-liblinear=included \
-	--with-libpcre="$(STAGING_DIR)/usr" --without-ncat
+	--with-libpcre="$(STAGING_DIR)/usr"
 NMAP_LICENSE = GPL-2.0
 NMAP_LICENSE_FILES = COPYING
+NMAP_PROVIDES = nc
+
 
 # needed by libpcap
 NMAP_LIBS_FOR_STATIC_LINK += `$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`
@@ -35,6 +37,9 @@ else
 NMAP_CONF_OPTS += --without-openssl
 endif
 
+ifeq ($(BR2_PACKAGE_NMAP_NMAP),y)
+
+NMAP_DEPENDENCIES += pcre
 # ndiff only works with python2.x
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 NMAP_DEPENDENCIES += python
@@ -42,4 +47,25 @@ else
 NMAP_CONF_OPTS += --without-ndiff
 endif
 
+else # only ncat
+
+NMAP_CONF_OPTS += --without-ndiff --without-zenmap --without-nping --without-nmap-update
+define NMAP_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) build-ncat
+endef
+define NMAP_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install-ncat
+endef
+
+endif
+
+ifeq ($(BR2_PACKAGE_NMAP_NCAT),y)
+define NMAP_INSTALL_NCAT_SYMLINK
+        ln -fs ncat $(TARGET_DIR)/usr/bin/nc
+endef
+NMAP_POST_INSTALL_TARGET_HOOKS += NMAP_INSTALL_NCAT_SYMLINK
+else
+NMAP_CONF_OPTS += --without-ncat
+endif
+
 $(eval $(autotools-package))
-- 
2.13.5
