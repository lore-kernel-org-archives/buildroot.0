From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 20 Mar 2012 11:54:08 -0300
Subject: [Buildroot] [PATCH] libupnp: bump to version 1.6.15
Message-ID: <1332255248-12534-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libupnp/Config.in                          |    5 +++--
 .../libupnp/libupnp-1.6.6-remove-sys_timeb.h.patch |   11 -----------
 package/libupnp/libupnp.mk                         |    9 ++++-----
 3 files changed, 7 insertions(+), 18 deletions(-)
 delete mode 100644 package/libupnp/libupnp-1.6.6-remove-sys_timeb.h.patch

diff --git a/package/libupnp/Config.in b/package/libupnp/Config.in
index 2e6edcd..9f73798 100644
--- a/package/libupnp/Config.in
+++ b/package/libupnp/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBUPNP
 	bool "libupnp"
+	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE
 	help
 	  The portable SDK for UPnP(tm) Devices (libupnp) provides developers
@@ -9,5 +10,5 @@ config BR2_PACKAGE_LIBUPNP
 
 	  http://pupnp.sourceforge.net/
 
-comment "libupnp requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+comment "libupnp requires a toolchain with IPV6 and LARGEFILE support"
+	depends on !(BR2_INET_IPV6 && BR2_LARGEFILE)
diff --git a/package/libupnp/libupnp-1.6.6-remove-sys_timeb.h.patch b/package/libupnp/libupnp-1.6.6-remove-sys_timeb.h.patch
deleted file mode 100644
index e425392..0000000
--- a/package/libupnp/libupnp-1.6.6-remove-sys_timeb.h.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-diff -urN libupnp-1.6.6-0rig/configure libupnp-1.6.6/configure
---- libupnp-1.6.6-0rig/configure	2008-04-25 13:47:24.000000000 +0200
-+++ libupnp-1.6.6/configure	2009-01-14 21:55:16.000000000 +0100
-@@ -21096,7 +21096,6 @@
- 	sys/ioctl.h \
- 	sys/socket.h \
- 	sys/time.h \
--	sys/timeb.h \
- 	syslog.h \
- 	unistd.h \
- 
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index d5b4ee1..1fa07ca 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -3,12 +3,11 @@
 # libupnp
 #
 #############################################################
-LIBUPNP_VERSION:=1.6.6
-LIBUPNP_SOURCE:=libupnp-$(LIBUPNP_VERSION).tar.bz2
-LIBUPNP_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/pupnp
 
+LIBUPNP_VERSION = 1.6.15
+LIBUPNP_SOURCE = libupnp-$(LIBUPNP_VERSION).tar.bz2
+LIBUPNP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/pupnp/pupnp/libUPnP%20$(LIBUPNP_VERSION)
 LIBUPNP_CONF_ENV = ac_cv_lib_compat_ftime=no
-
-LIBUPNP_INSTALL_STAGING:=YES
+LIBUPNP_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.3.4
