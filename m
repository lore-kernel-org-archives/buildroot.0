From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Dec 2016 15:01:11 +0100
Subject: [Buildroot] [git commit] util-linux: fix ncurses/wchar handling
Message-ID: <20161223142516.3F1947FB32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a18eabdf08564688761a9b2f35892d69d8f9a18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 006a328ad6bed214ec3c4d92120510ea37329dd1 ("util-linux: fix
build with ncurses"), we have a build failure that occurs with musl
toolchains when wide-char support is not enabled in ncurses.

The problem comes from the fact that musl provides wchar support (so it
defines wchar_t). But when ncursesw is not available, we currently pass
--disable-widechar which tells util-linux that wchar support is not
available at all (not only in ncurses). When this gets passed to
util-linux configure script, then it defines its own wchar_t, which
conflicts with the musl definition.

So, we should not pass --disable-widechar when BR2_USE_WCHAR=y, which is
what this commit does: it moves the BR2_USE_WCHAR logic outside of the
ncurses logic, and passes --enable-widechar/--disable-widechar as
appropriate.

However, there's a gotcha: util-linux really wants the ncursesw variant
of ncurses when the system has wchar support enabled. We take this into
account by:

 - Enabling ncursesw when BR2_PACKAGE_NCURSES_WCHAR=y. In this case, we
   have ncurses and we have BR2_USE_WCHAR=y, so everything is fine.

 - Otherwise, enabling ncurses when BR2_PACKAGE_NCURSES=y but
   BR2_USE_WCHAR is disabled.

To make sure that the existing util-linux programs that need ncurses
support still build fine, we adjust the Config.in to select
BR2_PACKAGE_NCURSES_WCHAR on BR2_USE_WCHAR=y configurations.

Fixes:

  http://autobuild.buildroot.net/results/19de2a0b12380ddc86dbba0dae3a3877b25f83ff/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/Config.in     |  5 +++++
 package/util-linux/util-linux.mk | 20 ++++++++++----------
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index e957f84..cfb2451 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -207,6 +207,7 @@ config BR2_PACKAGE_UTIL_LINUX_MORE
 	bool "more"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_WCHAR if BR2_USE_WCHAR
 	help
 	  File perusal filter for crt viewing
 
@@ -252,6 +253,7 @@ config BR2_PACKAGE_UTIL_LINUX_PG
 	bool "pg"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_WCHAR if BR2_USE_WCHAR
 	help
 	  Browse pagewise through text files
 
@@ -298,6 +300,7 @@ config BR2_PACKAGE_UTIL_LINUX_SETPRIV
 config BR2_PACKAGE_UTIL_LINUX_SETTERM
 	bool "setterm"
 	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_WCHAR if BR2_USE_WCHAR
 	help
 	  Set terminal attributes
 
@@ -310,12 +313,14 @@ config BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT
 config BR2_PACKAGE_UTIL_LINUX_TUNELP
 	bool "tunelp"
 	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_WCHAR if BR2_USE_WCHAR
 	help
 	  Set various parameters for the lp device
 
 config BR2_PACKAGE_UTIL_LINUX_UL
 	bool "ul"
 	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_WCHAR if BR2_USE_WCHAR
 	help
 	  Do underlining
 
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 51ece90..414465c 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -45,21 +45,21 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 UTIL_LINUX_DEPENDENCIES += busybox
 endif
 
-ifeq ($(BR2_PACKAGE_NCURSES),y)
-UTIL_LINUX_DEPENDENCIES += ncurses
-ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
-UTIL_LINUX_CONF_OPTS += --with-ncursesw
-UTIL_LINUX_CONF_ENV += NCURSESW5_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
-else
-UTIL_LINUX_CONF_OPTS += --without-ncursesw --with-ncurses --disable-widechar
-UTIL_LINUX_CONF_ENV += NCURSES5_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
-endif
-else
 ifeq ($(BR2_USE_WCHAR),y)
 UTIL_LINUX_CONF_OPTS += --enable-widechar
 else
 UTIL_LINUX_CONF_OPTS += --disable-widechar
 endif
+
+ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
+UTIL_LINUX_DEPENDENCIES += ncurses
+UTIL_LINUX_CONF_OPTS += --with-ncursesw
+UTIL_LINUX_CONF_ENV += NCURSESW5_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
+else ifeq ($(BR2_PACKAGE_NCURSES):$(BR2_USE_WCHAR),y:)
+UTIL_LINUX_DEPENDENCIES += ncurses
+UTIL_LINUX_CONF_OPTS += --without-ncursesw --with-ncurses
+UTIL_LINUX_CONF_ENV += NCURSES5_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
+else
 UTIL_LINUX_CONF_OPTS += --without-ncursesw --without-ncurses
 endif
 
