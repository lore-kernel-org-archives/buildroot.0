From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Jul 2017 00:05:18 +0200
Subject: [Buildroot] [git commit] efibootmgr: don't download patch from
	Github
Message-ID: <20170702220304.11C847FF0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57180155ca8c1381946508130fe2292325e3dffe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patches downloaded from Github are not stable, so bring them in the
tree.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-dont-use-fshort-wchar-when-building.patch | 28 ++++++++++++++++++++++
 ...bc.patch => 0002-Allow-build-with-uClibc.patch} |  0
 package/efibootmgr/efibootmgr.hash                 |  1 -
 package/efibootmgr/efibootmgr.mk                   |  3 ---
 4 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/package/efibootmgr/0001-dont-use-fshort-wchar-when-building.patch b/package/efibootmgr/0001-dont-use-fshort-wchar-when-building.patch
new file mode 100644
index 0000000..abafcec
--- /dev/null
+++ b/package/efibootmgr/0001-dont-use-fshort-wchar-when-building.patch
@@ -0,0 +1,28 @@
+From 3466fd05c8c6f1052e0426d64eed40f8a88fd78f Mon Sep 17 00:00:00 2001
+From: steve-mcintyre <steve-github@einval.com>
+Date: Fri, 6 Jan 2017 18:18:47 +0000
+Subject: [PATCH] Don't use -fshort-wchar when building (#63)
+
+It's not needed and is causing build failures with gcc 6. Closes
+Debian bug #849651
+
+Signed-off-by: Steve McIntyre <steve@einval.com>
+[Upstream commit: https://github.com/rhinstaller/efibootmgr/commit/3466fd05c8c6f1052e0426d64eed40f8a88fd78f]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Make.defaults | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Make.defaults b/Make.defaults
+index 50f1f4d..0ac50ef 100644
+--- a/Make.defaults
++++ b/Make.defaults
+@@ -26,7 +26,7 @@ clang_cflags =
+ gcc_cflags =
+ cflags	= $(CFLAGS) $(SUBDIR_CFLAGS) \
+ 	-Werror -Wall -Wextra -Wsign-compare -Wstrict-aliasing \
+-	-std=gnu11 -fshort-wchar -fPIC \
++	-std=gnu11 -fPIC \
+ 	-D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DLOCALEDIR=\"$(localedir)\" \
+ 	-DEFIBOOTMGR_VERSION="\"$(VERSION)\"" \
+ 	$(if $(findstring clang,$(CC)),$(clang_cflags),) \
diff --git a/package/efibootmgr/0001-Allow-build-with-uClibc.patch b/package/efibootmgr/0002-Allow-build-with-uClibc.patch
similarity index 100%
rename from package/efibootmgr/0001-Allow-build-with-uClibc.patch
rename to package/efibootmgr/0002-Allow-build-with-uClibc.patch
diff --git a/package/efibootmgr/efibootmgr.hash b/package/efibootmgr/efibootmgr.hash
index 3f934ba..f71dced 100644
--- a/package/efibootmgr/efibootmgr.hash
+++ b/package/efibootmgr/efibootmgr.hash
@@ -1,3 +1,2 @@
 # locally computed hash
 sha256 3f260491e2c62e93cb6347ea6f21aaa5f93152e9e7f0269d314623769d82e473 efibootmgr-14.tar.gz
-sha256 8e91f16927d296ffebd4f7fafda2f84c0f6201aba089a35e8090abd5aacdc58e	3466fd05c8c6f1052e0426d64eed40f8a88fd78f.patch
diff --git a/package/efibootmgr/efibootmgr.mk b/package/efibootmgr/efibootmgr.mk
index a946d5f..094dd28 100644
--- a/package/efibootmgr/efibootmgr.mk
+++ b/package/efibootmgr/efibootmgr.mk
@@ -6,9 +6,6 @@
 
 EFIBOOTMGR_VERSION = 14
 EFIBOOTMGR_SITE = $(call github,rhinstaller,efibootmgr,$(EFIBOOTMGR_VERSION))
-# Patch fixes the build with gcc 6.x.
-EFIBOOTMGR_PATCH = \
-	https://github.com/rhinstaller/efibootmgr/commit/3466fd05c8c6f1052e0426d64eed40f8a88fd78f.patch
 EFIBOOTMGR_LICENSE = GPL-2.0+
 EFIBOOTMGR_LICENSE_FILES = COPYING
 EFIBOOTMGR_DEPENDENCIES = efivar $(if $(BR2_NEEDS_GETTEXT),gettext)
