From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 20 Aug 2014 11:06:20 -0300
Subject: [Buildroot] [PATCHv2 3/4] nano: enable ncursesw support
In-Reply-To: <1408543581-15702-1-git-send-email-gustavo@zacarias.com.ar>
References: <1408543581-15702-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1408543581-15702-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable support for ncurses widechar by specifying the proper
ncursesw-config when it's enabled, otherwise keep the old trick in place
when it's not to avoid automatically picking up the host/distro one.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nano/nano.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 9557a93..038aaa5 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -9,11 +9,16 @@ NANO_VERSION = $(NANO_VERSION_MAJOR).6
 NANO_SITE = http://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_LICENSE = GPLv3+
 NANO_LICENSE_FILES = COPYING
-NANO_MAKE_ENV = CURSES_LIB="-lncurses"
 NANO_CONF_OPT = --without-slang
-NANO_CONF_ENV = ac_cv_prog_NCURSESW_CONFIG=false
 NANO_DEPENDENCIES = ncurses
 
+ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
+	NANO_CONF_ENV += ac_cv_prog_NCURSESW_CONFIG="$(STAGING_DIR)/usr/bin/ncursesw5-config"
+else
+	NANO_CONF_ENV += ac_cv_prog_NCURSESW_CONFIG=false
+	NANO_MAKE_ENV += CURSES_LIB="-lncurses"
+endif
+
 ifeq ($(BR2_PACKAGE_FILE),y)
 	NANO_DEPENDENCIES += file
 else
-- 
1.8.5.5
