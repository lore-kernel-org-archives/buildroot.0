From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Dec 2014 22:14:47 +0100
Subject: [Buildroot] [git commit] package/ncurses: slight code re-arrangement
Message-ID: <20141215211813.0DF1A7FF39@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=43fa88ae90f7c8684456ff931dc0e57efbb5e3f4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move the definition of libraries to install before it is actually used.

Also, in a coming changeset, it will also be used to know which
pkg-config files to symlink.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncurses/ncurses.mk |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index ec64663..b870aa4 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -43,6 +43,11 @@ else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
 NCURSES_CONF_OPTS += --with-shared --with-normal
 endif
 
+NCURSES_LIBS-y = libncurses
+NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_MENU) += libmenu
+NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_PANEL) += libpanel
+NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_FORM) += libform
+
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
 NCURSES_CONF_OPTS += --enable-widec
 NCURSES_LIB_SUFFIX = w
@@ -76,11 +81,6 @@ NCURSES_POST_INSTALL_STAGING_HOOKS += NCURSES_LINK_STAGING_LIBS
 
 endif
 
-NCURSES_LIBS-y = libncurses
-NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_MENU) += libmenu
-NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_PANEL) += libpanel
-NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_FORM) += libform
-
 ifneq ($(BR2_ENABLE_DEBUG),y)
 NCURSES_CONF_OPTS += --without-debug
 endif
