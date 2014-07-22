From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 Jul 2014 10:26:52 -0300
Subject: [Buildroot] [PATCH] radvd: bump to version 2.1
Message-ID: <1406035612-16130-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It doesn't need libdaemon any longer, so drop that dependency.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/radvd/Config.in                           |  6 ++----
 package/radvd/radvd-01-drop-check.patch           | 15 +++++++++++++++
 package/radvd/radvd-02-drop-stack-protector.patch | 15 +++++++++++++++
 package/radvd/radvd.mk                            |  7 +++++--
 4 files changed, 37 insertions(+), 6 deletions(-)
 create mode 100644 package/radvd/radvd-01-drop-check.patch
 create mode 100644 package/radvd/radvd-02-drop-stack-protector.patch

diff --git a/package/radvd/Config.in b/package/radvd/Config.in
index 71f2f34..e74777c 100644
--- a/package/radvd/Config.in
+++ b/package/radvd/Config.in
@@ -1,12 +1,10 @@
 config BR2_PACKAGE_RADVD
 	bool "radvd"
-	# libdaemon uses fork()
-	depends on BR2_USE_MMU
-	select BR2_PACKAGE_FLEX
-	select BR2_PACKAGE_LIBDAEMON
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_INET_IPV6
 	# uClibc too old, does not define ARPHRD_IEEE802154
 	depends on !BR2_avr32
+	select BR2_PACKAGE_FLEX
 	help
 	  IPv6 Router Advertisement Daemon.
 
diff --git a/package/radvd/radvd-01-drop-check.patch b/package/radvd/radvd-01-drop-check.patch
new file mode 100644
index 0000000..2b5d008
--- /dev/null
+++ b/package/radvd/radvd-01-drop-check.patch
@@ -0,0 +1,15 @@
+Drop check requirement, we don't do unit tests.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura radvd-2.1.orig/configure.ac radvd-2.1/configure.ac
+--- radvd-2.1.orig/configure.ac	2014-07-22 08:23:12.642260069 -0300
++++ radvd-2.1/configure.ac	2014-07-22 08:23:21.270552628 -0300
+@@ -49,7 +49,6 @@
+ dnl Determine CC and preset CFLAGS
+ AC_PROG_CC_C99
+ AC_PROG_RANLIB
+-PKG_CHECK_MODULES([CHECK], [check >= 0.9.4])
+ 
+ dnl Determine of netlink is available
+ AC_MSG_CHECKING(netlink)
diff --git a/package/radvd/radvd-02-drop-stack-protector.patch b/package/radvd/radvd-02-drop-stack-protector.patch
new file mode 100644
index 0000000..532c1b6
--- /dev/null
+++ b/package/radvd/radvd-02-drop-stack-protector.patch
@@ -0,0 +1,15 @@
+Don't force -fstack-protector, the toolchain might lack support for it.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura radvd-2.1.orig/Makefile.am radvd-2.1/Makefile.am
+--- radvd-2.1.orig/Makefile.am	2014-07-22 08:23:12.642260069 -0300
++++ radvd-2.1/Makefile.am	2014-07-22 08:26:42.651380759 -0300
+@@ -43,7 +43,6 @@
+ 
+ AM_CFLAGS = \
+ 	-fno-strict-aliasing \
+-	-fstack-protector \
+ 	$(ENABLE_WARNINGS) \
+ 	$(DISABLE_WARNINGS)
+ 
diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index ecca879..ace6529 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -4,10 +4,13 @@
 #
 ################################################################################
 
-RADVD_VERSION = 1.14
+RADVD_VERSION = 2.1
 RADVD_SOURCE = radvd-$(RADVD_VERSION).tar.xz
 RADVD_SITE = http://www.litech.org/radvd/dist
-RADVD_DEPENDENCIES = host-bison flex libdaemon host-flex host-pkgconf
+RADVD_DEPENDENCIES = host-bison flex host-flex host-pkgconf
+RADVD_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
+# For radvd-01-drop-check.patch & radvd-02-drop-stack-protector.patch
+RADVD_AUTORECONF = YES
 
 define RADVD_INSTALL_INITSCRIPT
 	$(INSTALL) -m 0755 package/radvd/S50radvd $(TARGET_DIR)/etc/init.d
-- 
1.8.5.5
