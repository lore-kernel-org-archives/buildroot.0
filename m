From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Nov 2012 19:06:54 +0100
Subject: [Buildroot] [git commit] libnetfilter_conntrack: bump to version
	1.0.2
Message-ID: <20121103182338.ED87299A6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6ee86f603bd449f81c9e262e01750d3ba4c9767f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: adjust dnsmasq dependency]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dnsmasq/Config.in                          |    4 ++++
 package/libnetfilter_conntrack/Config.in           |    5 +++++
 .../libnetfilter-conntrack.mk                      |    6 ++++--
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/package/dnsmasq/Config.in b/package/dnsmasq/Config.in
index b76ddb2..a6f5d96 100644
--- a/package/dnsmasq/Config.in
+++ b/package/dnsmasq/Config.in
@@ -38,7 +38,11 @@ config BR2_PACKAGE_DNSMASQ_LUA
 config BR2_PACKAGE_DNSMASQ_CONNTRACK
 	bool "conntrack marking support"
 	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
+	depends on BR2_LARGEFILE
 	help
 	  Enable DNS query connection marking in netfilter.
 
+comment "conntrack marking support requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
+
 endif
diff --git a/package/libnetfilter_conntrack/Config.in b/package/libnetfilter_conntrack/Config.in
index caf8a8a..9f7b42a 100644
--- a/package/libnetfilter_conntrack/Config.in
+++ b/package/libnetfilter_conntrack/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_LIBNETFILTER_CONNTRACK
 	bool "libnetfilter_conntrack"
+	depends on BR2_LARGEFILE
+	select BR2_PACKAGE_LIBMNL
 	select BR2_PACKAGE_LIBNFNETLINK
 	help
 	  libnetfilter_conntrack is a userspace library providing
@@ -7,3 +9,6 @@ config BR2_PACKAGE_LIBNETFILTER_CONNTRACK
 	  connection tracking state table.
 
 	  http://www.netfilter.org/projects/libnetfilter_conntrack/
+
+comment "libnetfilter_conntrack requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
diff --git a/package/libnetfilter_conntrack/libnetfilter-conntrack.mk b/package/libnetfilter_conntrack/libnetfilter-conntrack.mk
index a5d832f..725c39e 100644
--- a/package/libnetfilter_conntrack/libnetfilter-conntrack.mk
+++ b/package/libnetfilter_conntrack/libnetfilter-conntrack.mk
@@ -4,10 +4,12 @@
 #
 #############################################################
 
-LIBNETFILTER_CONNTRACK_VERSION = 1.0.1
+LIBNETFILTER_CONNTRACK_VERSION = 1.0.2
 LIBNETFILTER_CONNTRACK_SOURCE = libnetfilter_conntrack-$(LIBNETFILTER_CONNTRACK_VERSION).tar.bz2
 LIBNETFILTER_CONNTRACK_SITE = http://www.netfilter.org/projects/libnetfilter_conntrack/files
 LIBNETFILTER_CONNTRACK_INSTALL_STAGING = YES
-LIBNETFILTER_CONNTRACK_DEPENDENCIES = host-pkgconf libnfnetlink
+LIBNETFILTER_CONNTRACK_DEPENDENCIES = host-pkgconf libnfnetlink libmnl
+LIBNETFILTER_CONNTRACK_LICENSE = GPLv2+
+LIBNETFILTER_CONNTRACK_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
