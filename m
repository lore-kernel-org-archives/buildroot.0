From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Thu,  8 Mar 2018 13:35:59 +0200
Subject: [Buildroot] [PATCH 2/2] cups-filters: Add patch to remove relative
 symbolic link from install
In-Reply-To: <20180308113559.3222-1-olivier.schonken@gmail.com>
References: <20180308113559.3222-1-olivier.schonken@gmail.com>
Message-ID: <20180308113559.3222-2-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On older build systems with old coreutils, using relative symbolic link
(ln -r) does not work, and causes failed builds. Workaround is to use
normal symbolic link with a relative path. e.g. ../../$(BINDIR)

This fix is dependent on bumping cups-filters version to 1.20.1 because
of autotools issue with Makefile.am changes.

Fixes:
http://autobuild.buildroot.net/results/77a6369f3530a2a6a055f7fd664f1ad424274d77

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 ...ce-relative-linking-with-absolute-linking.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/cups-filters/0001-Replace-relative-linking-with-absolute-linking.patch

diff --git a/package/cups-filters/0001-Replace-relative-linking-with-absolute-linking.patch b/package/cups-filters/0001-Replace-relative-linking-with-absolute-linking.patch
new file mode 100644
index 0000000000..e4b35cda39
--- /dev/null
+++ b/package/cups-filters/0001-Replace-relative-linking-with-absolute-linking.patch
@@ -0,0 +1,46 @@
+From c26b4c3550557442890f2f790d4f8b61a3734c1f Mon Sep 17 00:00:00 2001
+From: Olivier Schonken <olivier.schonken@gmail.com>
+Date: Thu, 8 Mar 2018 12:32:23 +0200
+Subject: [PATCH] install: don't use ln -r
+
+Oldish enterprise-class distributions have too old versions of
+coreutils, with ln not supporting -r.
+
+So we fake it.
+
+ln -r would create minimalist relative paths, but they are not
+trivial to generate. Instead, we always create paths relative to the
+root, i.e.:
+
+    ln -s -r /usr/bin/foo /usr/sbin/foo
+
+would create:  /usr/sbin/foo -> ../bin/foo
+while we do :  /usr/sbin/foo -> ../../usr/bin/foo
+
+Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
+---
+ Makefile.am | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index d959227..b49914a 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -998,11 +998,11 @@ install-exec-hook:
+ 	$(INSTALL) -d -m 755 $(DESTDIR)$(pkgfilterdir)
+ 	$(INSTALL) -d -m 755 $(DESTDIR)$(pkgbackenddir)
+ if ENABLE_FOOMATIC
+-	$(LN_S) -r -f $(DESTDIR)$(pkgfilterdir)/foomatic-rip $(DESTDIR)$(bindir)
++	$(LN_S) -f ../..$(pkgfilterdir)/foomatic-rip $(DESTDIR)$(bindir)
+ endif
+ if ENABLE_DRIVERLESS
+-	$(LN_S) -r -f $(DESTDIR)$(pkgppdgendir)/driverless $(DESTDIR)$(bindir)
+-	$(LN_S) -r -f $(DESTDIR)$(pkgppdgendir)/driverless $(DESTDIR)$(pkgbackenddir)
++	$(LN_S) -f ../..$(pkgppdgendir)/driverless $(DESTDIR)$(bindir)
++	$(LN_S) -f ../..$(pkgppdgendir)/driverless $(DESTDIR)$(pkgbackenddir)
+ endif
+ if ENABLE_BRAILLE
+ 	$(LN_S) -f imagetobrf $(DESTDIR)$(pkgfilterdir)/imagetoubrl
+-- 
+2.14.1
+
-- 
2.14.1
