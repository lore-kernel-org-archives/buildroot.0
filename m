From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Feb 2010 11:30:54 +0100
Subject: [Buildroot] [git commit master] xboard: remove package
Message-ID: <20100219103249.4AE9A7772A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5f30c29b936b1974d9b03ba71e38bd980e827f0f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package requires Xaw3d, that has never been packaged in
Buildroot. As no-one seems to be using this package, it's probably not
worth the effort of packaging Xaw3d, a old-looking widget
toolkit. Therefore, just drop the package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/games/Config.in                           |    1 -
 package/games/xboard/Config.in                    |    8 ---
 package/games/xboard/xboard-4.2.7-installer.patch |   55 ---------------------
 package/games/xboard/xboard.mk                    |   16 ------
 4 files changed, 0 insertions(+), 80 deletions(-)
 delete mode 100644 package/games/xboard/Config.in
 delete mode 100644 package/games/xboard/xboard-4.2.7-installer.patch
 delete mode 100644 package/games/xboard/xboard.mk

diff --git a/package/games/Config.in b/package/games/Config.in
index 000a014..16924a4 100644
--- a/package/games/Config.in
+++ b/package/games/Config.in
@@ -7,5 +7,4 @@ source "package/games/magiccube4d/Config.in"
 source "package/games/prboom/Config.in"
 source "package/games/rubix/Config.in"
 source "package/games/vice/Config.in"
-source "package/games/xboard/Config.in"
 endmenu
diff --git a/package/games/xboard/Config.in b/package/games/xboard/Config.in
deleted file mode 100644
index 1821aa0..0000000
--- a/package/games/xboard/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_XBOARD
-	bool "xboard"
-	depends on BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_GNUCHESS
-	help
-	  XBoard and WinBoard are graphical user interfaces for chess.
-
-	  http://ftp.gnu.org/gnu/xboard
diff --git a/package/games/xboard/xboard-4.2.7-installer.patch b/package/games/xboard/xboard-4.2.7-installer.patch
deleted file mode 100644
index 477b8a2..0000000
--- a/package/games/xboard/xboard-4.2.7-installer.patch
+++ /dev/null
@@ -1,55 +0,0 @@
---- a/Makefile.in	2003-11-28 16:12:57.000000000 -0500
-+++ b/Makefile.in	2008-02-13 13:18:34.000000000 -0500
-@@ -63,27 +63,27 @@ default: xboard zic2xpm
- all: default pseudosource info FAQ html dvi ps
- 
- install: installdirs default
--	$(INSTALL_PROGRAM) -s xboard $(bindir)/xboard
--	$(INSTALL_PROGRAM) -s zic2xpm $(bindir)/zic2xpm
--	$(INSTALL_PROGRAM) cmail $(bindir)/cmail
--	$(INSTALL_PROGRAM) $(srcdir)/pxboard $(bindir)/pxboard
--	$(INSTALL_DATA) $(srcdir)/xboard.man $(man6dir)/xboard$(man6ext)
--	$(INSTALL_DATA) $(srcdir)/zic2xpm.man $(man6dir)/zic2xpm$(man6ext)
--	$(INSTALL_DATA) xboard.info $(infodir)/xboard.info
-+	$(INSTALL_PROGRAM) xboard $(DESTDIR)$(bindir)/xboard
-+	$(INSTALL_PROGRAM) zic2xpm $(DESTDIR)$(bindir)/zic2xpm
-+	$(INSTALL_PROGRAM) cmail $(DESTDIR)$(bindir)/cmail
-+	$(INSTALL_PROGRAM) $(srcdir)/pxboard $(DESTDIR)$(bindir)/pxboard
-+	$(INSTALL_DATA) $(srcdir)/xboard.man $(DESTDIR)$(man6dir)/xboard$(man6ext)
-+	$(INSTALL_DATA) $(srcdir)/zic2xpm.man $(DESTDIR)$(man6dir)/zic2xpm$(man6ext)
-+	$(INSTALL_DATA) xboard.info $(DESTDIR)$(infodir)/xboard.info
- 	-PATH=$$PATH:/sbin:/usr/sbin install-info \
--		$(infodir)/xboard.info $(infodir)/dir
-+		$(infodir)/xboard.info $(DESTDIR)$(infodir)/dir
- 
- installdirs: mkinstalldirs
- 	$(srcdir)/mkinstalldirs $(bindir) $(mandir) $(man6dir) $(infodir)
- 
- uninstall:
--	rm -f $(bindir)/xboard $(bindir)/cmail $(bindir)/pxboard
--	rm -f $(bindir)/zic2xpm
--	rm -f $(man6dir)/xboard$(man6ext) $(man6dir)/cmail$(man6ext)
--	rm -f $(man6dir)/zic2xpm$(man6ext)
--	rm -f $(infodir)/xboard.info
-+	rm -f $(DESTDIR)$(bindir)/xboard $(DESTDIR)$(bindir)/cmail $(DESTDIR)$(bindir)/pxboard
-+	rm -f $(DESTDIR)$(bindir)/zic2xpm
-+	rm -f $(DESTDIR)$(man6dir)/xboard$(man6ext) $(DESTDIR)$(man6dir)/cmail$(man6ext)
-+	rm -f $(DESTDIR)$(man6dir)/zic2xpm$(man6ext)
-+	rm -f $(DESTDIR)$(infodir)/xboard.info
- 	-PATH=$$PATH:/sbin:/usr/sbin install-info --delete \
--		$(infodir)/xboard.info $(infodir)/dir
-+		$(DESTDIR)$(infodir)/xboard.info $(DESTDIR)$(infodir)/dir
- 
- clean:
- 	rm -f xboard zic2xpm *.o xboard.txt zic2xpm.txt $(LEX_OUTPUT_ROOT).c
---- a/Makefile.in	2008-02-13 13:20:14.000000000 -0500
-+++ b/Makefile.in	2008-02-13 13:21:25.000000000 -0500
-@@ -74,7 +74,7 @@ install: installdirs default
- 		$(infodir)/xboard.info $(DESTDIR)/$(infodir)/dir
- 
- installdirs: mkinstalldirs
--	$(srcdir)/mkinstalldirs $(bindir) $(mandir) $(man6dir) $(infodir)
-+	$(srcdir)/mkinstalldirs $(DESTDIR)$(bindir) $(DESTDIR)$(mandir) $(DESTDIR)$(man6dir) $(DESTDIR)$(infodir)
- 
- uninstall:
- 	rm -f $(DESTDIR)/$(bindir)/xboard $(DESTDIR)/$(bindir)/cmail $(DESTDIR)/$(bindir)/pxboard
diff --git a/package/games/xboard/xboard.mk b/package/games/xboard/xboard.mk
deleted file mode 100644
index 078e37c..0000000
--- a/package/games/xboard/xboard.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-#############################################################
-#
-# xboard
-#
-#############################################################
-XBOARD_VERSION = 4.2.7
-XBOARD_SOURCE = xboard-$(XBOARD_VERSION).tar.gz
-XBOARD_SITE = $(BR2_GNU_MIRROR)/xboard
-XBOARD_INSTALL_STAGING = NO
-XBOARD_INSTALL_TARGET = YES
-XBOARD_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-
-XBOARD_DEPENDENCIES = gnuchess xserver_xorg-server
-
-$(eval $(call AUTOTARGETS,package/games,xboard))
-
-- 
1.6.3.3
