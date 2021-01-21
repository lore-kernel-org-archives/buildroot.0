From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jan 2021 22:39:11 +0100
Subject: [Buildroot] [git commit] package/atop: bump to version 2.6.0
Message-ID: <20210121211949.AC35F88F36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9e377dd8071bd91d1548312074d967693fde915
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

wchar is needed since
https://github.com/Atoptool/atop/commit/fa101b4dc5d3729d84466f708c29959570bd0919

https://www.atoptool.nl/downloadatop.php

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-ifprop.c-fix-build-with-kernel-4.6.patch  | 51 ++++++++++++++++++++++
 .../atop/0002-photosyst.c-fix-build-on-musl.patch  | 38 ++++++++++++++++
 package/atop/Config.in                             |  7 ++-
 package/atop/atop.hash                             |  2 +-
 package/atop/atop.mk                               |  2 +-
 5 files changed, 96 insertions(+), 4 deletions(-)

diff --git a/package/atop/0001-ifprop.c-fix-build-with-kernel-4.6.patch b/package/atop/0001-ifprop.c-fix-build-with-kernel-4.6.patch
new file mode 100644
index 0000000000..0dfe4f4301
--- /dev/null
+++ b/package/atop/0001-ifprop.c-fix-build-with-kernel-4.6.patch
@@ -0,0 +1,51 @@
+From aff473ee28903775e1bb35793b9c4c50ee0c7270 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 22 Dec 2020 12:23:33 +0100
+Subject: [PATCH] ifprop.c: fix build with kernel < 4.6
+
+Build fails with kernel headers < 4.6 since version 2.6.0 and
+https://github.com/Atoptool/atop/commit/08c622ecaa5bb0bb260984ceaddc4730d1b312a7
+
+Indeed, ethtool_link_settings and ETHTOOL_GLINKSETTINGS are only
+available since
+https://github.com/torvalds/linux/commit/3f1ac7a700d039c61d8d8b99f28d605d489a60cf
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/Atoptool/atop/pull/142]
+---
+ ifprop.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/ifprop.c b/ifprop.c
+index 60fa3fa..63fce5a 100644
+--- a/ifprop.c
++++ b/ifprop.c
+@@ -104,7 +104,9 @@ initifprop(void)
+ 	char 				*cp, linebuf[2048];
+ 	int				i=0, sockfd;
+ 
++#ifdef ETHTOOL_GLINKSETTINGS
+ 	struct ethtool_link_settings 	ethlink;	// preferred!
++#endif
+ 	struct ethtool_cmd 		ethcmd;		// deprecated	
+ 
+ 	struct ifreq		 	ifreq;
+@@ -153,6 +155,7 @@ initifprop(void)
+ 		strncpy((void *)&ifreq.ifr_ifrn.ifrn_name, ifprops[i].name,
+ 				sizeof ifreq.ifr_ifrn.ifrn_name-1);
+ 
++#ifdef ETHTOOL_GLINKSETTINGS
+ 		ethlink.cmd              = ETHTOOL_GLINKSETTINGS;
+ 		ifreq.ifr_ifru.ifru_data = (void *)&ethlink;
+ 
+@@ -164,6 +167,7 @@ initifprop(void)
+ 			phy_addr = ethlink.phy_address;
+ 		}
+ 		else
++#endif
+ 		{
+ 			ethcmd.cmd               = ETHTOOL_GSET;
+ 			ifreq.ifr_ifru.ifru_data = (void *)&ethcmd;
+-- 
+2.29.2
+
diff --git a/package/atop/0002-photosyst.c-fix-build-on-musl.patch b/package/atop/0002-photosyst.c-fix-build-on-musl.patch
new file mode 100644
index 0000000000..8573d59d6b
--- /dev/null
+++ b/package/atop/0002-photosyst.c-fix-build-on-musl.patch
@@ -0,0 +1,38 @@
+From 34996ad1eb6d295382e7737ef34bd362abdd4944 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 19 Jan 2021 22:15:45 +0100
+Subject: [PATCH] photosyst.c: fix build on musl
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Build on musl is broken since version 2.6.0 and
+https://github.com/Atoptool/atop/commit/e889c66fbe1d0b7ae38fbcbaa46cea749257f486
+because limits.h is not included:
+
+photosyst.c: In function ???lvmmapname???:
+photosyst.c:1624:14: error: ???PATH_MAX??? undeclared (first use in this function); did you mean ???AF_MAX????
+   char  path[PATH_MAX];
+              ^~~~~~~~
+              AF_MAX
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ photosyst.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/photosyst.c b/photosyst.c
+index 3de874b..67ae92f 100644
+--- a/photosyst.c
++++ b/photosyst.c
+@@ -165,6 +165,7 @@
+ #include <dirent.h>
+ #include <sys/ioctl.h>
+ #include <sys/sysmacros.h>
++#include <limits.h>
+ 
+ #define SCALINGMAXCPU	8	// threshold for scaling info per CPU
+ 
+-- 
+2.29.2
+
diff --git a/package/atop/Config.in b/package/atop/Config.in
index 9e42eddb57..b8ee30c306 100644
--- a/package/atop/Config.in
+++ b/package/atop/Config.in
@@ -1,8 +1,10 @@
 config BR2_PACKAGE_ATOP
 	bool "atop"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR # ncurses wchar
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14 # PERF_FLAG_FD_CLOEXEC
 	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_WCHAR
 	select BR2_PACKAGE_ZLIB
 	help
 	  Atop is an ASCII full-screen performance monitor for Linux
@@ -18,6 +20,7 @@ config BR2_PACKAGE_ATOP
 
 	  http://www.atoptool.nl
 
-comment "atop needs a toolchain w/ headers >= 3.14"
+comment "atop needs a toolchain w/ wchar, headers >= 3.14"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
+	depends on !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
diff --git a/package/atop/atop.hash b/package/atop/atop.hash
index f404ed5d1b..65148b8578 100644
--- a/package/atop/atop.hash
+++ b/package/atop/atop.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  4b911057ce50463b6e8b3016c5963d48535c0cddeebc6eda817e292b22f93f33  atop-2.5.0.tar.gz
+sha256  9ec2ca3a571692f7efaa095f99a5106432bcb71cc22cd6c49597ef0481058f72  atop-2.6.0.tar.gz
 
 # Hash for license file:
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/atop/atop.mk b/package/atop/atop.mk
index 587a5b3604..acbaf2995a 100644
--- a/package/atop/atop.mk
+++ b/package/atop/atop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATOP_VERSION = 2.5.0
+ATOP_VERSION = 2.6.0
 ATOP_SITE = http://www.atoptool.nl/download
 ATOP_LICENSE = GPL-2.0+
 ATOP_LICENSE_FILES = COPYING
