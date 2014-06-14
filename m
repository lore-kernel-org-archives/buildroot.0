From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 14 Jun 2014 07:56:48 -0300
Subject: [Buildroot] [PATCH] dialog: fix build failure
Message-ID: <1402743408-13111-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The old ncurses trick is no longer needed for this version, in fact it's
harmful. Switch to proper configure options.
Also disable rpath hackery since it's not required and could be
problematic. Fixes:
http://autobuild.buildroot.net/results/411/411f6171e972eab4486143dedbfd078136886ab0/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dialog/dialog.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index 6dc9066..fb00c9c 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -7,9 +7,9 @@
 DIALOG_VERSION = 1.2-20140219
 DIALOG_SOURCE = dialog-$(DIALOG_VERSION).tgz
 DIALOG_SITE = ftp://invisible-island.net/dialog
-DIALOG_CONF_OPT = --with-ncurses
-DIALOG_CONF_ENV = ac_cv_path_NCURSES_CONFIG=true LIBS=-lncurses
-DIALOG_DEPENDENCIES = ncurses
+DIALOG_CONF_OPT = --with-ncurses --with-curses-dir=$(STAGING_DIR)/usr \
+	--disable-rpath-hack
+DIALOG_DEPENDENCIES = host-pkgconf ncurses
 DIALOG_LICENSE = LGPLv2.1
 DIALOG_LICENSE_FILES = COPYING
 
-- 
1.8.5.5
