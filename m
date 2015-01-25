From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Jan 2015 23:56:34 +0100
Subject: [Buildroot] [git commit] haserl: remove deprecated 0.8.x version
Message-ID: <20150125233550.7C71D7FF09@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b64cde6079896a37cba65a93e84517c1c6f9e593
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It'll be a year for the 2015.02 release so remove the old/deprecated
0.8.x version for the release.

Also update hash to match sourceforge (original) one.

And rename patch to new naming convention.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                   |    8 +++++
 package/haserl/0.8.0/haserl-0.8.0-legacy.patch     |   12 --------
 ....inc.patch => 0001-add-haserl_lualib.inc.patch} |    0
 package/haserl/Config.in                           |   30 +-------------------
 package/haserl/haserl.hash                         |    6 ++--
 package/haserl/haserl.mk                           |    6 +---
 6 files changed, 13 insertions(+), 49 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 69608c7..db8c3b1 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -102,6 +102,14 @@ endif
 
 comment "Legacy options removed in 2015.02"
 
+config BR2_PACKAGE_HASERL_VERSION_0_8_X
+	bool "haserl 0.8.x version removed"
+	select BR2_LEGACY
+	help
+	  The 0.8.x version option for haserl has been removed since it
+	  has been deprecated for some time now.
+	  You should be able to use the 0.9.x version without issues.
+
 config BR2_PACKAGE_STRONGSWAN_TOOLS
 	bool "strongswan option has been removed"
 	select BR2_LEGACY
diff --git a/package/haserl/0.8.0/haserl-0.8.0-legacy.patch b/package/haserl/0.8.0/haserl-0.8.0-legacy.patch
deleted file mode 100644
index bb6f3b0..0000000
--- a/package/haserl/0.8.0/haserl-0.8.0-legacy.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -urN haserl-0.8.0-0rig/src/haserl.c haserl-0.8.0/src/haserl.c
---- haserl-0.8.0-0rig/src/haserl.c	2004-11-10 18:59:35.000000000 +0100
-+++ haserl-0.8.0/src/haserl.c	2007-10-12 14:36:28.000000000 +0200
-@@ -131,7 +131,7 @@
- 	if (strlen(prefix)) { memcpy (entry, prefix, strlen(prefix)); }
- 	memcpy ((char *) (entry + strlen(prefix)), newbuf, strlen(newbuf));
- 
--	keylen = (size_t) (index (entry, '=') - entry);
-+	keylen = (size_t) (strchr (entry, '=') - entry);
- 	
- 	if ( keylen <= 0 ) {
- 			free (entry);
diff --git a/package/haserl/0.9.33/haserl-001-add-haserl_lualib.inc.patch b/package/haserl/0001-add-haserl_lualib.inc.patch
similarity index 100%
rename from package/haserl/0.9.33/haserl-001-add-haserl_lualib.inc.patch
rename to package/haserl/0001-add-haserl_lualib.inc.patch
diff --git a/package/haserl/Config.in b/package/haserl/Config.in
index 680e280..1620d72 100644
--- a/package/haserl/Config.in
+++ b/package/haserl/Config.in
@@ -8,37 +8,9 @@ config BR2_PACKAGE_HASERL
 
 	  http://haserl.sourceforge.net/
 
-if BR2_PACKAGE_HASERL
-
 config BR2_PACKAGE_HASERL_WITH_LUA
 	bool "Lua support"
-	depends on BR2_PACKAGE_HASERL_VERSION_0_9_X
+	depends on BR2_PACKAGE_HASERL
 	select BR2_PACKAGE_LUA
 	help
 	  Enable Lua support for haserl
-
-choice
-	prompt "Haserl version"
-	default BR2_PACKAGE_HASERL_VERSION_0_9_X
-	help
-	  Select the older stable version, or the newer developer version
-
-config BR2_PACKAGE_HASERL_VERSION_0_8_X
-	bool	"v 0.8.x"
-	depends on BR2_DEPRECATED_SINCE_2014_02
-	help
-	  stable version
-
-config BR2_PACKAGE_HASERL_VERSION_0_9_X
-	bool	"v 0.9.x"
-	help
-	  developer version - seems OK though
-
-endchoice
-
-endif
-
-config BR2_PACKAGE_HASERL_VERSION
-	string
-	default "0.8.0"		if BR2_PACKAGE_HASERL_VERSION_0_8_X
-	default "0.9.33"	if BR2_PACKAGE_HASERL_VERSION_0_9_X
diff --git a/package/haserl/haserl.hash b/package/haserl/haserl.hash
index 3573fa9..7b1bfa2 100644
--- a/package/haserl/haserl.hash
+++ b/package/haserl/haserl.hash
@@ -1,3 +1,3 @@
-# Locally computed:
-sha256  ba261a21539e1f204ba74590d313c501007e546b54aa9ae7210a99eaf3c097be  haserl-0.8.0.tar.gz
-sha256  9a65b14dc721643fc5b85c79117cb6d824bd3683b246744137bb5d978df7621b  haserl-0.9.33.tar.gz
+# From http://sourceforge.net/projects/haserl/files/haserl-devel/
+md5	a9decddb508944d56f71dd2f821e2ec5	haserl-0.9.33.tar.gz
+sha1	bbb5d55db911fdb854828794181e57a1a275e65d	haserl-0.9.33.tar.gz
diff --git a/package/haserl/haserl.mk b/package/haserl/haserl.mk
index f0de790..4985c09 100644
--- a/package/haserl/haserl.mk
+++ b/package/haserl/haserl.mk
@@ -4,12 +4,8 @@
 #
 ################################################################################
 
-HASERL_VERSION = $(call qstrip,$(BR2_PACKAGE_HASERL_VERSION))
-ifeq ($(BR2_PACKAGE_HASERL_VERSION_0_8_X),y)
-HASERL_SITE = http://downloads.sourceforge.net/project/haserl/haserl/$(HASERL_VERSION)
-else
+HASERL_VERSION = 0.9.33
 HASERL_SITE = http://downloads.sourceforge.net/project/haserl/haserl-devel
-endif
 HASERL_LICENSE = GPLv2
 HASERL_LICENSE_FILES = COPYING
 HASERL_DEPENDENCIES = host-pkgconf
