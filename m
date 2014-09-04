From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 4 Sep 2014 12:18:46 +0100
Subject: [Buildroot] [PATCH 2/2] setserial: Disable manpages
In-Reply-To: <1409829526-49853-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1409829526-49853-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1409829526-49853-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no configure option to disable the manpages, so we use this
patch to disable them. Otherwise this package would fail to build on
systems without the groff package installed because the build system
calls 'nroff' in the Makefile.

Fixes:
  http://autobuild.buildroot.net/results/c73/c736933d4110865008f2d1e8b531b6e392c68285/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
---
 .../setserial-0003-disable-manpages.patch          |   61 ++++++++++++++++++++
 1 files changed, 61 insertions(+), 0 deletions(-)
 create mode 100644 package/setserial/setserial-0003-disable-manpages.patch

diff --git a/package/setserial/setserial-0003-disable-manpages.patch b/package/setserial/setserial-0003-disable-manpages.patch
new file mode 100644
index 0000000..ebd3cb2
--- /dev/null
+++ b/package/setserial/setserial-0003-disable-manpages.patch
@@ -0,0 +1,61 @@
+setserial: Disable manpages
+
+There is no configure option to disable the manpages, so we use this 
+patch to disable them. Otherwise this package would fail to build on 
+systems without the groff package installed because the build system 
+calls 'nroff' in the Makefile.
+
+Fixes:
+  http://autobuild.buildroot.net/results/c73/c736933d4110865008f2d1e8b531b6e392c68285/
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+--- setserial-2.17/Makefile.in.orig	2014-09-04 11:58:05.685475241 +0100
++++ setserial-2.17/Makefile.in	2014-09-04 11:59:14.508641155 +0100
+@@ -17,26 +17,20 @@ DEFS = @DEFS@
+ INCS = -I.
+ TAR = tar
+ 
+-all: setserial setserial.cat
++all: setserial
+ 
+ setserial: setserial.c
+ 	$(CC) $(CFLAGS) $(DEFS) $(INCS) setserial.c -o setserial
+ 
+-setserial.cat: setserial.8
+-	nroff -man setserial.8 > setserial.cat
+-
+-install: setserial setserial.8
++install: setserial
+ 	mkdir -p $(DESTDIR)/usr/bin
+ 	$(INSTALL_PROGRAM) setserial $(DESTDIR)/usr/bin
+-	mkdir -p $(DESTDIR)/usr/share/man/man8
+-	$(INSTALL_DATA) setserial.8 $(DESTDIR)/usr/share/man/man8
+ 
+ clean:
+-	$(RM) setserial setserial.o setserial.cat *~
++	$(RM) setserial setserial.o *~
+ 
+ distclean: clean
+-	$(RM) config.status config.log config.cache MCONFIG Makefile \
+-		setserial.8
++	$(RM) config.status config.log config.cache MCONFIG Makefile
+ 
+ realclean: distclean
+ 	$(RM) configure
+@@ -57,7 +51,6 @@ $(srcdir)/.exclude-file:
+ 	echo "$(SRCROOT)/config.cache" >> $(srcdir)/.exclude-file
+ 	echo "$(SRCROOT)/config.status" >> $(srcdir)/.exclude-file
+ 	echo "$(SRCROOT)/setserial" >> $(srcdir)/.exclude-file
+-	echo "$(SRCROOT)/setserial.cat" >> $(srcdir)/.exclude-file
+ 	echo "$(SRCROOT)/setserial.o" >> $(srcdir)/.exclude-file
+ 	echo "$(SRCROOT)/.exclude-file" >> $(srcdir)/.exclude-file
+ 	echo $(SRCROOT)/e2fsprogs-$(VERSION).tar.gz \
+@@ -76,8 +69,5 @@ ${srcdir}/configure: configure.in # aclo
+ Makefile: Makefile.in config.status
+ 	CONFIG_FILES=Makefile ./config.status
+ 
+-setserial.8: setserial.8.in config.status
+-	CONFIG_FILES=setserial.8 ./config.status
+-     
+ config.status: configure
+ 	./config.status --recheck
-- 
1.7.1
