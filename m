From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Sat,  3 Jan 2009 16:30:09 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/screen
Message-ID: <20090103163009.A051C76BC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2009-01-03 16:30:09 +0000 (Sat, 03 Jan 2009)
New Revision: 24678

Log:
* Simplify the screen install, no versioned binaries, no symlink to versioned binary


Modified:
   trunk/buildroot/package/screen/screen-4.0.2_install-fix.patch


Changeset:
Modified: trunk/buildroot/package/screen/screen-4.0.2_install-fix.patch
===================================================================
--- trunk/buildroot/package/screen/screen-4.0.2_install-fix.patch	2009-01-03 16:25:47 UTC (rev 24677)
+++ trunk/buildroot/package/screen/screen-4.0.2_install-fix.patch	2009-01-03 16:30:09 UTC (rev 24678)
@@ -1,16 +1,20 @@
-diff -ru screen-4.0.2_vanilla/Makefile.in screen-4.0.2_install-fix/Makefile.in
+diff -ru screen-4.0.2_vanilla/Makefile.in screen-4.0.2_install-fixup/Makefile.in
 --- screen-4.0.2_vanilla/Makefile.in	2003-12-05 13:59:39.000000000 +0000
-+++ screen-4.0.2_install-fix/Makefile.in	2008-05-01 10:47:49.000000000 +0000
-@@ -74,11 +74,12 @@
- 	-if [ -f $(DESTDIR)$(bindir)/$(SCREEN) ] && [ ! -f $(DESTDIR)$(bindir)/$(SCREEN).old ]; \
- 		then mv $(DESTDIR)$(bindir)/$(SCREEN) $(DESTDIR)$(bindir)/$(SCREEN).old; fi
- 	$(INSTALL_PROGRAM) screen $(DESTDIR)$(bindir)/$(SCREEN)
++++ screen-4.0.2_install-fixup/Makefile.in	2009-01-03 15:20:22.000000000 +0000
+@@ -71,14 +71,9 @@
+ 	$(CC) -c -I. -I$(srcdir) $(M_CFLAGS) $(DEFS) $(OPTIONS) $(CFLAGS) $<
+ 
+ install_bin: .version screen
+-	-if [ -f $(DESTDIR)$(bindir)/$(SCREEN) ] && [ ! -f $(DESTDIR)$(bindir)/$(SCREEN).old ]; \
+-		then mv $(DESTDIR)$(bindir)/$(SCREEN) $(DESTDIR)$(bindir)/$(SCREEN).old; fi
+-	$(INSTALL_PROGRAM) screen $(DESTDIR)$(bindir)/$(SCREEN)
 -	-chown root $(DESTDIR)$(bindir)/$(SCREEN) && chmod 4755 $(DESTDIR)$(bindir)/$(SCREEN)
-+	-chmod 4755 $(DESTDIR)$(bindir)/$(SCREEN)
- # This doesn't work if $(bindir)/screen is a symlink
- 	-if [ -f $(DESTDIR)$(bindir)/screen ] && [ ! -f $(DESTDIR)$(bindir)/screen.old ]; then mv $(DESTDIR)$(bindir)/screen $(DESTDIR)$(bindir)/screen.old; fi
- 	rm -f $(DESTDIR)$(bindir)/screen
- 	(cd $(DESTDIR)$(bindir) && ln -sf $(SCREEN) screen)
+-# This doesn't work if $(bindir)/screen is a symlink
+-	-if [ -f $(DESTDIR)$(bindir)/screen ] && [ ! -f $(DESTDIR)$(bindir)/screen.old ]; then mv $(DESTDIR)$(bindir)/screen $(DESTDIR)$(bindir)/screen.old; fi
+-	rm -f $(DESTDIR)$(bindir)/screen
+-	(cd $(DESTDIR)$(bindir) && ln -sf $(SCREEN) screen)
++	$(INSTALL_PROGRAM) screen $(DESTDIR)$(bindir)/screen
++	-chmod 4755 $(DESTDIR)$(bindir)/screen
 +	mkdir -p $(DESTDIR)$(SCREENENCODINGS)
  	cp $(srcdir)/utf8encodings/?? $(DESTDIR)$(SCREENENCODINGS)
  
