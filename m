From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 12 Apr 2013 11:56:04 +0200
Subject: [Buildroot] [git commit] kismet: bump to version 2013-03-R1b
Message-ID: <20130412095544.219299B5CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d916b73ce84430ec9c0ee1a61b8d85f59ed8f37
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes issues in the configure script.
Also make libnl a mandatory dependency to fix:
http://autobuild.buildroot.net/results/c8bf63f4ee013bd3467934c87c61478a1f95e3eb/
Kismet isn't too useful without it anyway.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kismet/Config.in |    6 ++++--
 package/kismet/kismet.mk |    9 +++------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/kismet/Config.in b/package/kismet/Config.in
index 6954665..8de29be 100644
--- a/package/kismet/Config.in
+++ b/package/kismet/Config.in
@@ -1,12 +1,14 @@
-comment "Kismet requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "Kismet requires a toolchain with thread and C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_KISMET
 	bool "kismet"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_NCURSES_TARGET_PANEL
 	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_LIBNL
 	help
 	  Kismet - 802.11 layer2 wireless network detector, sniffer,
 	  and intrusion detection system.
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 5abc92c..1fb3f5a 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -4,16 +4,13 @@
 #
 #############################################################
 
-KISMET_VERSION = 2013-03-R1a
+KISMET_VERSION = 2013-03-R1b
 KISMET_SITE = http://www.kismetwireless.net/code
-KISMET_DEPENDENCIES = host-pkgconf libpcap ncurses
+KISMET_DEPENDENCIES = host-pkgconf libpcap ncurses libnl
+KISMET_CONF_OPT += --with-netlink-version=3
 KISMET_LICENSE = GPLv2+
 KISMET_LICENSE_FILES = debian/copyright
 
-ifeq ($(BR2_PACKAGE_LIBNL),y)
-	KISMET_DEPENDENCIES += libnl
-	KISMET_CONF_OPT += --with-netlink-version=3
-endif
 ifeq ($(BR2_PACKAGE_PCRE),y)
 	KISMET_DEPENDENCIES += pcre
 endif
