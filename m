From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Apr 2010 06:04:59 +0200
Subject: [Buildroot] [PATCH 03/25] Update config.{guess, sub} unconditionally
In-Reply-To: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0ed643665f03cee817f82cb13023a5210149def2.1270958653.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove the BR2_UPDATE_CONFIG option which allowed to globally
enable/disable the replacement of config.{guess,sub} for
autotools-based packages. Doing it unconditionnally just works.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in                     |    2 --
 package/Makefile.autotools.in |    2 --
 package/gnuconfig/Config.in   |    8 --------
 3 files changed, 0 insertions(+), 12 deletions(-)
 delete mode 100644 package/gnuconfig/Config.in

diff --git a/Config.in b/Config.in
index b82a11b..f2d4a50 100644
--- a/Config.in
+++ b/Config.in
@@ -327,8 +327,6 @@ config BR2_HAVE_DEVFILES
 	  Install headers and static libraries in the
 	  target filesystem
 
-source package/gnuconfig/Config.in
-
 endmenu
 
 source "toolchain/Config.in"
diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index a8dd051..a4be8c8 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -128,9 +128,7 @@ define UPDATE_CONFIG_HOOK
 	done
 endef
 
-ifeq ($(BR2_UPDATE_CONFIG),y)
 $(2)_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
-endif
 
 #
 # Hook to patch libtool to make it work properly for cross-compilation
diff --git a/package/gnuconfig/Config.in b/package/gnuconfig/Config.in
deleted file mode 100644
index 5ac0bb3..0000000
--- a/package/gnuconfig/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_UPDATE_CONFIG
-	bool "update config.sub and config.guess"
-	default y
-	help
-		This just exists to easily update the config.sub / config.guess
-		files in packages to the latest version (since many bundled ones
-		don't support the latest possible targets)
-
-- 
1.6.3.3
