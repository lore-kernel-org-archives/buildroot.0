From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 25 Nov 2010 11:07:08 +0100
Subject: [Buildroot] [git commit master 1/1] dialog: fix build,
	ensure host includes aren't used
Message-ID: <20101125100907.ECF1A8BE7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b9c5809a0bd697612da9185df03a17a0f699eb73
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

configure looks for libintl, so ensure it is available. Also make sure
the host ncurses headers aren't used.
Fix up Config.in indentation while we're at it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    8 ++++----
 package/dialog/Config.in |   16 ++++++++--------
 package/dialog/dialog.mk |    5 +++++
 3 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/CHANGES b/CHANGES
index e703a07..8218e3d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,10 +4,10 @@
 
 	Add support for LEON Sparc architecture variants.
 
-	Updated/fixed packages: bash, bind, busybox, gpsd, libglib2,
-	libcurl, libmad, lrzsz, midori, module-init-tools, mtd-utils,
-	openssh, openssl, pciutils, php, qt, sqlite, sysstat, webkit,
-	zlib
+	Updated/fixed packages: bash, bind, busybox, dialog, gpsd,
+	libglib2, libcurl, libmad, lrzsz, midori, module-init-tools,
+	mtd-utils, openssh, openssl, pciutils, php, qt, sqlite,
+	sysstat, webkit, zlib
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/dialog/Config.in b/package/dialog/Config.in
index 5681d1e..9d3462e 100644
--- a/package/dialog/Config.in
+++ b/package/dialog/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_DIALOG
-    bool "dialog"
-    select BR2_PACKAGE_NCURSES
-    help
-	dialog - display dialog boxes from shell scripts
-
-	This application provides a method of displaying several different
-	types of dialog boxes from shell scripts.  This allows a developer
-	of a script to interact with the user in a much friendlier manner.
+	bool "dialog"
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	help
+	  dialog - display dialog boxes from shell scripts
 
+	  This application provides a method of displaying several different
+	  types of dialog boxes from shell scripts.  This allows a developer
+	  of a script to interact with the user in a much friendlier manner.
diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index e8c2a0d..e8f025f 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -7,8 +7,13 @@ DIALOG_VERSION:=1.1-20100428
 DIALOG_SOURCE:=dialog-$(DIALOG_VERSION).tgz
 DIALOG_SITE:=ftp://invisible-island.net/dialog
 DIALOG_CONF_OPT = --with-ncurses
+DIALOG_CONF_ENV = ac_cv_path_NCURSES_CONFIG=true LIBS=-lncurses
 DIALOG_DEPENDENCIES = ncurses
 
+ifneq ($(BR2_ENABLE_LOCALE),y)
+DIALOG_DEPENDENCIES+=libiconv
+endif
+
 define DIALOG_INSTALL_TARGET_CMDS
 	install -c $(@D)/dialog $(TARGET_DIR)/usr/bin/dialog
 endef
-- 
1.7.2.2
