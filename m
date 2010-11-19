From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 19 Nov 2010 15:44:35 +0100
Subject: [Buildroot] [git commit master 1/1] sysstat: bump to 9.1.6,
	fix libintl problems
Message-ID: <20101119144513.A17BF8D3C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=474166298e97c0488dc201b8062327cfc0689f61
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #759

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    3 ++-
 package/sysstat/Config.in  |    2 ++
 package/sysstat/sysstat.mk |   11 ++++++-----
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index 0d67202..1cfe3b1 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,10 +4,11 @@
 
 	Updated/fixed packages: bash, bind, busybox, libglib2, libmad,
 	midori, module-init-tools, mtd-utils, openssh, pciutils, qt,
-	sqlite, webkit
+	sqlite, sysstat, webkit
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#759:  Sysstat build broken without libintl
 	#2479: host-module-init-tools 3.11 fails to build
 	#2785: mtd-utils build fails due to missing libmtd
 	#2797: pciutils dependencies on zlib not taken into account
diff --git a/package/sysstat/Config.in b/package/sysstat/Config.in
index b084b41..28274d9 100644
--- a/package/sysstat/Config.in
+++ b/package/sysstat/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_SYSSTAT
 	bool "sysstat"
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
           The sysstat utilities are a collection of performance
           monitoring tools for Linux. These include sar, sadf, mpstat,
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 7294b86..4f2f663 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -4,19 +4,20 @@
 #
 #############################################################
 
-SYSSTAT_VERSION = 9.1.5
+SYSSTAT_VERSION = 9.1.6
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.bz2
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard/
-SYSSTAT_AUTORECONF = NO
-SYSSTAT_LIBTOOL_PATCH = NO
-SYSSTAT_INSTALL_STAGING = NO
-SYSSTAT_INSTALL_TARGET = YES
 
 SYSSTAT_CONF_OPT = --disable-man-group
 ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 SYSSTAT_CONF_OPT += --disable-documentation
 endif
 
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+SYSSTAT_DEPENDENCIES += gettext libintl
+SYSSTAT_MAKE_OPT += CFLAGS+=-lintl
+endif
+
 # The isag tool is a post processing script that depends on tcl/tk
 # among other things. So we don't install it.
 SYSSTAT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) INSTALL_ISAG=n install
-- 
1.7.2.2
