From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jan 2017 17:53:19 +1100
Subject: [Buildroot] [git commit] Revert "util-linux: fix ncurses/wchar
	handling"
Message-ID: <20170122065355.ED3DF8188A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=051fde24e47e92873ba36f5a692c1f6da78496d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 5a18eabdf08564688761a9b2f35892d69d8f9a18.

It did not take into account all the possible situations. A different fix
will be provided in a forthcomming patch.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/Config.in     |  5 -----
 package/util-linux/util-linux.mk | 20 ++++++++++----------
 2 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index cfb2451..e957f84 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -207,7 +207,6 @@ config BR2_PACKAGE_UTIL_LINUX_MORE
 	bool "more"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_NCURSES_WCHAR if BR2_USE_WCHAR
 	help
 	  File perusal filter for crt viewing
 
@@ -253,7 +252,6 @@ config BR2_PACKAGE_UTIL_LINUX_PG
 	bool "pg"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_NCURSES_WCHAR if BR2_USE_WCHAR
 	help
 	  Browse pagewise through text files
 
@@ -300,7 +298,6 @@ config BR2_PACKAGE_UTIL_LINUX_SETPRIV
 config BR2_PACKAGE_UTIL_LINUX_SETTERM
 	bool "setterm"
 	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_NCURSES_WCHAR if BR2_USE_WCHAR
 	help
 	  Set terminal attributes
 
@@ -313,14 +310,12 @@ config BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT
 config BR2_PACKAGE_UTIL_LINUX_TUNELP
 	bool "tunelp"
 	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_NCURSES_WCHAR if BR2_USE_WCHAR
 	help
 	  Set various parameters for the lp device
 
 config BR2_PACKAGE_UTIL_LINUX_UL
 	bool "ul"
 	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_NCURSES_WCHAR if BR2_USE_WCHAR
 	help
 	  Do underlining
 
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 414465c..51ece90 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -45,21 +45,21 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 UTIL_LINUX_DEPENDENCIES += busybox
 endif
 
-ifeq ($(BR2_USE_WCHAR),y)
-UTIL_LINUX_CONF_OPTS += --enable-widechar
-else
-UTIL_LINUX_CONF_OPTS += --disable-widechar
-endif
-
-ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
+ifeq ($(BR2_PACKAGE_NCURSES),y)
 UTIL_LINUX_DEPENDENCIES += ncurses
+ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
 UTIL_LINUX_CONF_OPTS += --with-ncursesw
 UTIL_LINUX_CONF_ENV += NCURSESW5_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
-else ifeq ($(BR2_PACKAGE_NCURSES):$(BR2_USE_WCHAR),y:)
-UTIL_LINUX_DEPENDENCIES += ncurses
-UTIL_LINUX_CONF_OPTS += --without-ncursesw --with-ncurses
+else
+UTIL_LINUX_CONF_OPTS += --without-ncursesw --with-ncurses --disable-widechar
 UTIL_LINUX_CONF_ENV += NCURSES5_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
+endif
+else
+ifeq ($(BR2_USE_WCHAR),y)
+UTIL_LINUX_CONF_OPTS += --enable-widechar
 else
+UTIL_LINUX_CONF_OPTS += --disable-widechar
+endif
 UTIL_LINUX_CONF_OPTS += --without-ncursesw --without-ncurses
 endif
 
