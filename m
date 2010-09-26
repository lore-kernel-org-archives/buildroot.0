From: Martin Banky <martin.banky@gmail.com>
Date: Sun, 26 Sep 2010 00:19:57 -0700
Subject: [Buildroot] [PATCH 2/4] pkg-config: bump to 0.25
In-Reply-To: <1285485599-29412-1-git-send-email-Martin.Banky@gmail.com>
References: <1285485599-29412-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1285485599-29412-2-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 .../pkg-config/pkg-config-0.23-fix-sysroot.patch   |   34 --------------------
 package/pkg-config/pkg-config.mk                   |    2 +-
 2 files changed, 1 insertions(+), 35 deletions(-)
 delete mode 100644 package/pkg-config/pkg-config-0.23-fix-sysroot.patch

diff --git a/package/pkg-config/pkg-config-0.23-fix-sysroot.patch b/package/pkg-config/pkg-config-0.23-fix-sysroot.patch
deleted file mode 100644
index 3653811..0000000
--- a/package/pkg-config/pkg-config-0.23-fix-sysroot.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-[PATCH] fix PKG_CONFIG_SYSROOT_DIR handling
-
-With PKG_CONFIG_SYSROOT_DIR enabled, everything else than -L and -I words
-gets stripped away.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- pkg.c |    8 ++------
- 1 file changed, 2 insertions(+), 6 deletions(-)
-
-Index: pkg-config-0.23/pkg.c
-===================================================================
---- pkg-config-0.23.orig/pkg.c
-+++ pkg-config-0.23/pkg.c
-@@ -472,17 +472,13 @@
-   while (tmp != NULL)
-     {
-       char *tmpstr = (char*) tmp->data;
--      if (pcsysrootdir != NULL)
-+      if (pcsysrootdir != NULL && tmpstr[0] == '-' &&
-+          (tmpstr[1] == 'I' || tmpstr[1] == 'L'))
- 	{
--	  if (tmpstr[0] == '-' &&
--	      (tmpstr[1] == 'I' ||
--	       tmpstr[1] == 'L'))
--	    {
- 	      g_string_append_c (str, '-');
- 	      g_string_append_c (str, tmpstr[1]);
- 	      g_string_append (str, pcsysrootdir);
- 	      g_string_append (str, tmpstr+2);
--	    }
- 	}
-       else 
- 	{
diff --git a/package/pkg-config/pkg-config.mk b/package/pkg-config/pkg-config.mk
index 7caf37b..76d7179 100644
--- a/package/pkg-config/pkg-config.mk
+++ b/package/pkg-config/pkg-config.mk
@@ -3,7 +3,7 @@
 # pkgconfig
 #
 #############################################################
-PKG_CONFIG_VERSION = 0.23
+PKG_CONFIG_VERSION = 0.25
 PKG_CONFIG_SOURCE = pkg-config-$(PKG_CONFIG_VERSION).tar.gz
 PKG_CONFIG_SITE = http://pkgconfig.freedesktop.org/releases/
 
-- 
1.7.3
