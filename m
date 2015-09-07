From: Francesco Nwokeka <francesco.nwokeka@gmail.com>
Date: Mon,  7 Sep 2015 10:35:48 +0200
Subject: [Buildroot] [PATCH 4/5] package/at: added reworked "Makefile.in:
	fix make install for non-root, don't strip" patch
Message-ID: <1441614948-10603-1-git-send-email-francesco.nwokeka@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francesco Nwokeka <francesco.nwokeka@gmail.com>
---
 ...-fix-make-install-for-non-root-don-t-stri.patch | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 package/at/0002-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch

diff --git a/package/at/0002-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch b/package/at/0002-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch
new file mode 100644
index 0000000..1ba68be
--- /dev/null
+++ b/package/at/0002-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch
@@ -0,0 +1,87 @@
+From 4d23d04285ac3e9152746fb6f6589de17be7057a Mon Sep 17 00:00:00 2001
+From: Francesco Nwokeka <francesco.nwokeka@gmail.com>
+Date: Fri, 4 Sep 2015 19:23:15 +0200
+Subject: [PATCH 2/2] Makefile.in: fix make install for non-root, don't strip
+
+Buildroot will ensure all files are owned by root and stripped anyway
+(if needed) before the rootfs is created.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+
+Adjusted patch to v3.1.16
+
+Signed-off-by: Francesco Nwokeka <francesco.nwokeka@gmail.com>
+---
+ Makefile.in | 43 +++++++++++++++++++++----------------------
+ 1 file changed, 21 insertions(+), 22 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 4297f87..5d82f18 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -95,41 +95,40 @@ atrun: atrun.in
+ 	$(CC) -c $(CFLAGS) $(DEFS) $*.c
+ 
+ install: all
+-	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(etcdir)
+-	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(bindir)
+-	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(sbindir)
+-	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(docdir)
+-	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(atdocdir)
+-	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(ATSPOOL_DIR) $(DESTDIR)$(ATJOB_DIR)
++	$(INSTALL) -m 755 -d $(DESTDIR)$(etcdir)
++	$(INSTALL) -m 755 -d $(DESTDIR)$(bindir)
++	$(INSTALL) -m 755 -d $(DESTDIR)$(sbindir)
++	$(INSTALL) -m 755 -d $(DESTDIR)$(docdir)
++	$(INSTALL) -m 755 -d $(DESTDIR)$(atdocdir)
++	$(INSTALL) -m 755 -d $(DESTDIR)$(ATSPOOL_DIR) $(DESTDIR)$(ATJOB_DIR)
+ 	chmod 1770 $(DESTDIR)$(ATSPOOL_DIR) $(DESTDIR)$(ATJOB_DIR)
+ 	touch $(DESTDIR)$(LFILE)
+ 	chmod 600 $(DESTDIR)$(LFILE)
+-	chown $(DAEMON_USERNAME):$(DAEMON_GROUPNAME) $(DESTDIR)$(LFILE)
+-	test -f $(DESTDIR)$(etcdir)/at.allow || test -f $(DESTDIR)$(etcdir)/at.deny || $(INSTALL) -o root -g $(DAEMON_GROUPNAME) -m 640 at.deny $(DESTDIR)$(etcdir)/
+-	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 6755 at $(DESTDIR)$(bindir)
++	test -f $(DESTDIR)$(etcdir)/at.allow || test -f $(DESTDIR)$(etcdir)/at.deny || $(INSTALL) -m 640 at.deny $(DESTDIR)$(etcdir)/
++	$(INSTALL) -m 6755 at $(DESTDIR)$(bindir)
+ 	$(LN_S) -f at $(DESTDIR)$(bindir)/atq
+ 	$(LN_S) -f at $(DESTDIR)$(bindir)/atrm
+-	$(INSTALL) -g root -o root -m 755 batch $(DESTDIR)$(bindir)
+-	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man1dir)
+-	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man5dir)
+-	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man8dir)
+-	$(INSTALL) -g root -o root -m 755 atd $(DESTDIR)$(sbindir)
+-	$(INSTALL) -g root -o root -m 755 atrun $(DESTDIR)$(sbindir)
+-	$(INSTALL) -g root -o root -m 644 at.1 $(DESTDIR)$(man1dir)/
++	$(INSTALL) -m 755 batch $(DESTDIR)$(bindir)
++	$(INSTALL) -d -m 755 $(DESTDIR)$(man1dir)
++	$(INSTALL) -d -m 755 $(DESTDIR)$(man5dir)
++	$(INSTALL) -d -m 755 $(DESTDIR)$(man8dir)
++	$(INSTALL) -m 755 atd $(DESTDIR)$(sbindir)
++	$(INSTALL) -m 755 atrun $(DESTDIR)$(sbindir)
++	$(INSTALL) -m 644 at.1 $(DESTDIR)$(man1dir)/
+ 	cd $(DESTDIR)$(man1dir) && $(LN_S) -f at.1 atq.1 && $(LN_S) -f at.1 batch.1 && $(LN_S) -f at.1 atrm.1
+-	$(INSTALL) -g root -o root -m 644 atd.8 $(DESTDIR)$(man8dir)/
++	$(INSTALL) -m 644 atd.8 $(DESTDIR)$(man8dir)/
+ 	sed "s,\$${exec_prefix},$(exec_prefix),g" <atrun.8>tmpman
+-	$(INSTALL) -g root -o root -m 644 tmpman $(DESTDIR)$(man8dir)/atrun.8
++	$(INSTALL) -m 644 tmpman $(DESTDIR)$(man8dir)/atrun.8
+ 	rm -f tmpman
+-	$(INSTALL) -g root -o root -m 644 at.allow.5 $(DESTDIR)$(man5dir)/
++	$(INSTALL) -m 644 at.allow.5 $(DESTDIR)$(man5dir)/
+ 	cd $(DESTDIR)$(man5dir) && $(LN_S) -f at.allow.5 at.deny.5
+-	$(INSTALL) -g root -o root -m 644 $(DOCS) $(DESTDIR)$(atdocdir)
++	$(INSTALL) -m 644 $(DOCS) $(DESTDIR)$(atdocdir)
+ 	rm -f $(DESTDIR)$(mandir)/cat1/at.1* $(DESTDIR)$(mandir)/cat1/batch.1* \
+ 		$(DESTDIR)$(mandir)/cat1/atq.1*
+ 	rm -f $(DESTDIR)$(mandir)/cat1/atd.8*
+ 	if test x"$(systemdsystemunitdir)" != xno; then \
+-		$(INSTALL) -o root -g root -m 755 -d $(DESTDIR)$(systemdsystemunitdir); \
+-		$(INSTALL) -o root -g root -m 644 atd.service $(DESTDIR)$(systemdsystemunitdir); \
++		$(INSTALL) -m 755 -d $(DESTDIR)$(systemdsystemunitdir); \
++		$(INSTALL) -m 644 atd.service $(DESTDIR)$(systemdsystemunitdir); \
+ 	fi
+ 
+ dist: checkin $(DIST) $(LIST) Filelist.asc
+-- 
+2.5.1
+
-- 
2.5.1
