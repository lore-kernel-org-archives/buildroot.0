From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Dec 2014 17:04:38 +0100
Subject: [Buildroot] [PATCH 3/5] package/ncurses: slight code re-arrangement
In-Reply-To: <cover.1418572993.git.yann.morin.1998@free.fr>
References: <cover.1418572993.git.yann.morin.1998@free.fr>
Message-ID: <7477c81ac14541b175b2d42b2cc94fbc80ca8ed0.1418572993.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move the definition of libraries to install before it is actually used.

Also, in a coming changeset, it will also be used to know which
pkg-config files to symlink.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ncurses/ncurses.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

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
-- 
1.9.1
