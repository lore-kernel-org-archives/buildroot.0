From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 23 Jun 2012 21:39:09 +0200
Subject: [Buildroot] [git commit] xinetd: expand DESTDIR patch to fix
	uninstall target
Message-ID: <20120623201135.3B9FF88E4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2d177d4852ec5549f93671273f07ba60dbabdcc2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Expand the openWRT patch to fix xinetd's "uninstall" target,
so that buildroot's "xinetd-clean" removes the correct files.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/xinetd/xinetd-2.3.15/002-destdir.patch |   28 ++++++++++++++++++++---
 1 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/package/xinetd/xinetd-2.3.15/002-destdir.patch b/package/xinetd/xinetd-2.3.15/002-destdir.patch
index 15ff4b8..7a323eb 100644
--- a/package/xinetd/xinetd-2.3.15/002-destdir.patch
+++ b/package/xinetd/xinetd-2.3.15/002-destdir.patch
@@ -1,14 +1,15 @@
 This patch adds $(DESTDIR) to xinetd's installation paths, to support 
 installation to a cross-compiled RFS area.
 
-The content of this patch was copied from the OpenWrt project:
+The content of this patch was inspired by the OpenWrt project:
 https://dev.openwrt.org/browser/packages/net/xinetd/patches/002-destdir.patch
 
 Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
 
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -75,15 +75,15 @@ dlibxlog: dlibsio dlibstr
+diff -urN xinetd-2.3.15.ORIG/Makefile.in xinetd-2.3.15/Makefile.in
+--- xinetd-2.3.15.ORIG/Makefile.in	2007-09-20 13:01:52.000000000 -0400
++++ xinetd-2.3.15/Makefile.in	2012-06-18 10:20:00.540864388 -0400
+@@ -75,27 +75,27 @@
  
  install: build
  	for i in $(DAEMONDIR) $(BINDIR) $(MANDIR)/man5 $(MANDIR)/man8 ; do \
@@ -33,3 +34,22 @@ Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
  	@echo "You must put your xinetd.conf in /etc/xinetd.conf"
  	@echo "There is a sample config file in xinetd/sample.conf and you can"
  	@echo "use xconv.pl to convert your old inetd.conf file to an xinetd format"
+ 
+ uninstall:
+-	rm -f $(DAEMONDIR)/xinetd
+-	rm -f $(DAEMONDIR)/itox
+-	rm -f $(DAEMONDIR)/xconv.pl
+-	rm -f $(MANDIR)/man5/xinetd.conf.5
+-	rm -f $(MANDIR)/man8/xinetd.log.8
+-	rm -f $(MANDIR)/man8/xinetd.8
+-	rm -f $(MANDIR)/man8/itox.8
++	rm -f $(DESTDIR)$(DAEMONDIR)/xinetd
++	rm -f $(DESTDIR)$(DAEMONDIR)/itox
++	rm -f $(DESTDIR)$(DAEMONDIR)/xconv.pl
++	rm -f $(DESTDIR)$(MANDIR)/man5/xinetd.conf.5
++	rm -f $(DESTDIR)$(MANDIR)/man8/xinetd.log.8
++	rm -f $(DESTDIR)$(MANDIR)/man8/xinetd.8
++	rm -f $(DESTDIR)$(MANDIR)/man8/itox.8
+  
+ distclean: clean
+ 	rm -f config.cache config.log Makefile config.status xinetd/itox
