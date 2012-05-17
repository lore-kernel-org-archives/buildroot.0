From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 May 2012 13:15:58 +0200
Subject: [Buildroot] [PATCH 2/2] socat: disable documentation
	build/installation
In-Reply-To: <1337253358-5050-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1337253358-5050-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1337253358-5050-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The documentation generation process requires a special yold2man
program, for which we don't have a package in Buildroot. Since we
generally don't care much about documentation of packages, just adjust
the package Makefile.in to not build/install its documentation.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/socat/socat-no-documentation.patch |   37 ++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/socat/socat-no-documentation.patch

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
-- 
1.7.9.5
