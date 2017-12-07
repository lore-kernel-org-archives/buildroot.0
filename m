From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  7 Dec 2017 21:41:46 +0200
Subject: [Buildroot] [PATCH] screen: bump to version 4.6.2
Message-ID: <bea55ed64ef5e639bd66f9f55249d33233a7a550.1512675706.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Refresh patch #6.

Drop patch #9, parallel build fixed in upstream commit 7dad1f268f12.
Renumber the next patch.

Add reference to upstream signature, and license hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/screen/0006-install-no-backup-binary.patch |  4 +-
 package/screen/0009-install-dir-dependency.patch   | 43 ----------------------
 ...ame-sched_h.patch => 0009-rename-sched_h.patch} |  0
 package/screen/screen.hash                         |  5 ++-
 package/screen/screen.mk                           |  2 +-
 5 files changed, 8 insertions(+), 46 deletions(-)
 delete mode 100644 package/screen/0009-install-dir-dependency.patch
 rename package/screen/{0010-rename-sched_h.patch => 0009-rename-sched_h.patch} (100%)

diff --git a/package/screen/0006-install-no-backup-binary.patch b/package/screen/0006-install-no-backup-binary.patch
index 504862a29964..7842662b5767 100644
--- a/package/screen/0006-install-no-backup-binary.patch
+++ b/package/screen/0006-install-no-backup-binary.patch
@@ -5,6 +5,8 @@ Subject: Do not create backup of old installed binary
 This is a rather unusual feature that packagers will not expect.
 
 Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
+[baruch: update for 4.6.2]
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 ---
  Makefile.in | 4 ----
  1 file changed, 4 deletions(-)
@@ -16,7 +18,7 @@ index 187a69b..65549e9 100644
 @@ -83,12 +83,9 @@ screen: $(OFILES)
  	    $(OPTIONS) $(CFLAGS) $<
  
- install_bin: .version screen
+ install_bin: .version screen installdirs
 -	-if [ -f $(DESTDIR)$(bindir)/$(SCREEN) ] && [ ! -f $(DESTDIR)$(bindir)/$(SCREEN).old ]; \
 -		then mv $(DESTDIR)$(bindir)/$(SCREEN) $(DESTDIR)$(bindir)/$(SCREEN).old; fi
  	$(INSTALL_PROGRAM) screen $(DESTDIR)$(bindir)/$(SCREEN)
diff --git a/package/screen/0009-install-dir-dependency.patch b/package/screen/0009-install-dir-dependency.patch
deleted file mode 100644
index 9016cb90be29..000000000000
--- a/package/screen/0009-install-dir-dependency.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From: Maarten ter Huurne <maarten@treewalker.org>
-Date: Mon, 15 Sep 2014 02:27:09 +0200
-Subject: Ensure that installation dirs exist before copying files into them
-
-Since the "install_bin" target requires the installation directories
-to exist, it should depend on the "installdirs" target. The previous
-approach of having "install" depend on "installdirs" is not reliable.
-
-For example, in a parallel build, there was no guarantee that
-"installdirs" would be finished before "install_bin" runs. Also if
-the user requested only "install_bin" to be made, "installdirs" would
-be skipped altogether.
-
-Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
----
- Makefile.in | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 860f351..f0fe08d 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -82,7 +82,7 @@ screen: $(OFILES)
- 	$(CC) -c -I. -I$(srcdir) $(M_CFLAGS) $(CPPFLAGS) $(DEFS) \
- 	    $(OPTIONS) $(CFLAGS) $<
- 
--install_bin: .version screen
-+install_bin: .version screen installdirs
- 	$(INSTALL_PROGRAM) screen $(DESTDIR)$(bindir)/$(SCREEN)
- 	-chown root $(DESTDIR)$(bindir)/$(SCREEN)
- 	-chmod 4755 $(DESTDIR)$(bindir)/$(SCREEN)
-@@ -94,7 +94,7 @@ endif
- 	cp $(srcdir)/utf8encodings/?? $(DESTDIR)$(SCREENENCODINGS)
- 
- ###############################################################################
--install: installdirs install_bin
-+install: install_bin
- 	cd doc ; $(MAKE) install
- 	-if [ -d /usr/lib/terminfo ]; then \
- 		PATH="$$PATH:/usr/5bin" tic ${srcdir}/terminfo/screeninfo.src; \
--- 
-1.8.4.5
-
diff --git a/package/screen/0010-rename-sched_h.patch b/package/screen/0009-rename-sched_h.patch
similarity index 100%
rename from package/screen/0010-rename-sched_h.patch
rename to package/screen/0009-rename-sched_h.patch
diff --git a/package/screen/screen.hash b/package/screen/screen.hash
index 168611731f7c..0e1613b28adc 100644
--- a/package/screen/screen.hash
+++ b/package/screen/screen.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256 97db2114dd963b016cd4ded34831955dcbe3251e5eee45ac2606e67e9f097b2d  screen-4.5.1.tar.gz
+# https://ftp.gnu.org/gnu/screen/screen-4.6.2.tar.gz.sig
+sha256 1b6922520e6a0ce5e28768d620b0f640a6631397f95ccb043b70b91bb503fa3a  screen-4.6.2.tar.gz
+# Locally calculated
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index f22f8a6b7efa..8d67c04b636c 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SCREEN_VERSION = 4.5.1
+SCREEN_VERSION = 4.6.2
 SCREEN_SITE = $(BR2_GNU_MIRROR)/screen
 SCREEN_LICENSE = GPL-3.0+
 SCREEN_LICENSE_FILES = COPYING
-- 
2.15.0
