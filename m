From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 17 May 2012 23:43:43 +0200
Subject: [Buildroot] [git commit] socat: disable documentation
	build/installation
Message-ID: <20120517214727.AB7B196D27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=556fd4f81588dff2e9ff288a87517d4ae18bf0ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The documentation generation process requires a special yold2man
program, for which we don't have a package in Buildroot. Since we
generally don't care much about documentation of packages, just adjust
the package Makefile.in to not build/install its documentation.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/socat/socat-no-documentation.patch |   37 ++++++++++++++++++++++++++++
 1 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/package/socat/socat-no-documentation.patch b/package/socat/socat-no-documentation.patch
new file mode 100644
index 0000000..ce088df
--- /dev/null
+++ b/package/socat/socat-no-documentation.patch
@@ -0,0 +1,37 @@
+socat: disable documentation build/installation
+
+The documentation generation process requires a special yold2man
+program, for which we don't have a package in Buildroot. Since we
+generally don't care much about documentation of packages, just adjust
+the package Makefile.in to not build/install its documentation.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/Makefile.in
+===================================================================
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -93,7 +93,7 @@
+ 	Config/Makefile.Cygwin-1-5-25 Config/config.Cygwin-1-5-25.h \
+ 	Config/Makefile.MacOSX-10-5 Config/config.MacOSX-10-5.h
+ 
+-all: progs doc
++all: progs
+ 
+ scmclean: gitclean
+ 
+@@ -136,13 +136,11 @@
+ strip: progs
+ 	strip $(PROGS)
+ 
+-install: progs $(srcdir)/doc/socat.1
++install: progs
+ 	mkdir -p $(DESTDIR)$(BINDEST)
+ 	$(INSTALL) -m 755 socat $(DESTDIR)$(BINDEST)
+ 	$(INSTALL) -m 755 procan $(DESTDIR)$(BINDEST)
+ 	$(INSTALL) -m 755 filan $(DESTDIR)$(BINDEST)
+-	mkdir -p $(DESTDIR)$(MANDEST)/man1
+-	$(INSTALL) -m 644 $(srcdir)/doc/socat.1 $(DESTDIR)$(MANDEST)/man1/
+ 
+ uninstall:
+ 	rm -f $(DESTDIR)$(BINDEST)/socat
