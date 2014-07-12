From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 12 Jul 2014 14:28:37 -0300
Subject: [Buildroot] [PATCH] nano: bump to version 2.3.5
Message-ID: <1405186117-8218-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to the full-blown install when tiny is not selected, we really
want all of it in that case.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nano/nano.mk | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 130fe83..3a17e7f 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,20 +5,15 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 2.3
-NANO_VERSION = $(NANO_VERSION_MAJOR).2
+NANO_VERSION = $(NANO_VERSION_MAJOR).5
 NANO_SITE = http://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_LICENSE = GPLv3+
 NANO_LICENSE_FILES = COPYING
+NANO_MAKE_ENV = CURSES_LIB="-lncurses"
 NANO_CONF_OPT = --without-slang
+NANO_CONF_ENV = ac_cv_prog_NCURSESW_CONFIG=false
 NANO_DEPENDENCIES = ncurses
 
-ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
-	NANO_CONF_ENV += ac_cv_prog_NCURSESW_CONFIG="$(STAGING_DIR)/usr/bin/ncursesw5-config"
-else
-	NANO_CONF_ENV += ac_cv_prog_NCURSESW_CONFIG=false
-	NANO_MAKE_ENV += CURSES_LIB="-lncurses"
-endif
-
 ifeq ($(BR2_PACKAGE_FILE),y)
 	NANO_DEPENDENCIES += file
 else
@@ -27,10 +22,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_NANO_TINY),y)
 	NANO_CONF_OPT += --enable-tiny
-endif
-
 define NANO_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/src/nano $(TARGET_DIR)/usr/bin/nano
 endef
+endif
 
 $(eval $(autotools-package))
-- 
1.8.5.5
