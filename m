From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 May 2021 21:36:13 +0200
Subject: [Buildroot] [git commit] package/iostat: drop package
Message-ID: <20210502191018.3B387814DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=281e5af3481378c91e71506560f1556d9525450f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is not maintained anymore and even upstream site is dead.
As iostat can also be provided by sysstat, just drop the package.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                 |  6 ++++++
 package/Config.in                |  1 -
 package/iostat/0001-cpunum.patch | 27 ---------------------------
 package/iostat/Config.in         |  6 ------
 package/iostat/iostat.hash       |  3 ---
 package/iostat/iostat.mk         | 21 ---------------------
 6 files changed, 6 insertions(+), 58 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 629d02dbf2..05b0e0d0da 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2021.05"
 
+config BR2_PACKAGE_IOSTAT
+	bool "iostat removed"
+	select BR2_LEGACY
+	help
+	  This package has been removed, use sysstat instead.
+
 config BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE
 	bool "sconeserver http::sconesite::image removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 6181aaac2c..7ac10b9d42 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -483,7 +483,6 @@ endmenu
 	source "package/i7z/Config.in"
 	source "package/input-event-daemon/Config.in"
 	source "package/intel-microcode/Config.in"
-	source "package/iostat/Config.in"
 	source "package/ipmitool/Config.in"
 	source "package/ipmiutil/Config.in"
 	source "package/irda-utils/Config.in"
diff --git a/package/iostat/0001-cpunum.patch b/package/iostat/0001-cpunum.patch
deleted file mode 100644
index 0e75dbf71a..0000000000
--- a/package/iostat/0001-cpunum.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From bf646965f75cdad77a45fa3b0046e093b202b2ce Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Thu, 22 Jul 2010 12:42:10 -0300
-Subject: [PATCH] Make cpu number counter more reliable
-
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- iostat.c |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/iostat.c b/iostat.c
-index 13e2af7..5d74085 100644
---- a/iostat.c
-+++ b/iostat.c
-@@ -140,7 +140,7 @@ void get_number_of_cpus()
- 
- 	handle_error("Can't open /proc/cpuinfo", !ncpufp);
- 	while (fgets(buffer, sizeof(buffer), ncpufp)) {
--		if (!strncmp(buffer, "processor\t:", 11))
-+		if (!strncasecmp(buffer, "processor\t", 10))
- 			ncpu++;
- 	}
- 	fclose(ncpufp);
--- 
-1.7.1
-
diff --git a/package/iostat/Config.in b/package/iostat/Config.in
deleted file mode 100644
index 1aa1464581..0000000000
--- a/package/iostat/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_IOSTAT
-	bool "iostat"
-	help
-	  An I/O performance monitoring utility.
-
-	  http://www.linuxinsight.com/iostat_utility.html
diff --git a/package/iostat/iostat.hash b/package/iostat/iostat.hash
deleted file mode 100644
index 0f58bbf793..0000000000
--- a/package/iostat/iostat.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256	edc5aa73f43bd6c7d49f2c1d5906a0a68c0b28bc4dfdaf1f2aa5ae4a2449c58e	iostat-2.2.tar.gz
-sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670	LICENSE
diff --git a/package/iostat/iostat.mk b/package/iostat/iostat.mk
deleted file mode 100644
index 4953c73ec4..0000000000
--- a/package/iostat/iostat.mk
+++ /dev/null
@@ -1,21 +0,0 @@
-################################################################################
-#
-# iostat
-#
-################################################################################
-
-IOSTAT_VERSION = 2.2
-IOSTAT_SITE = http://linuxinsight.com/sites/default/files
-IOSTAT_LICENSE = GPL
-IOSTAT_LICENSE_FILES = LICENSE
-
-define IOSTAT_BUILD_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS) -DHZ=100"
-endef
-
-define IOSTAT_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(IOSTAT_DIR)/iostat $(TARGET_DIR)/usr/bin/iostat
-endef
-
-$(eval $(generic-package))
