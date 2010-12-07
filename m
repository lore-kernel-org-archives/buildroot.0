From: Mike Frysinger <vapier@gentoo.org>
Date: Tue,  7 Dec 2010 16:57:12 -0500
Subject: [Buildroot] [PATCH] zlib: fix installing when static-only
Message-ID: <1291759032-1336-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The switch from manual targets to using zlib's targets to fix shared
building/installing doesn't work quite right as zlib itself doesn't
handle static-only installs fully.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 package/zlib/zlib-1.2.5-no-shared.patch |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 package/zlib/zlib-1.2.5-no-shared.patch

diff --git a/package/zlib/zlib-1.2.5-no-shared.patch b/package/zlib/zlib-1.2.5-no-shared.patch
new file mode 100644
index 0000000..2b82f49
--- /dev/null
+++ b/package/zlib/zlib-1.2.5-no-shared.patch
@@ -0,0 +1,15 @@
+only install the shared lib if it's enabled
+
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -168,7 +168,9 @@
+ 	- at if [ ! -d $(DESTDIR)$(man3dir)      ]; then mkdir -p $(DESTDIR)$(man3dir); fi
+ 	- at if [ ! -d $(DESTDIR)$(pkgconfigdir) ]; then mkdir -p $(DESTDIR)$(pkgconfigdir); fi
+ 	cp $(STATICLIB) $(DESTDIR)$(libdir)
+-	cp $(SHAREDLIBV) $(DESTDIR)$(sharedlibdir)
++	if test "$(SHAREDLIBV)" ; then \
++	  cp $(SHAREDLIBV) $(DESTDIR)$(sharedlibdir); \
++	fi
+ 	cd $(DESTDIR)$(libdir); chmod u=rw,go=r $(STATICLIB)
+ 	-@(cd $(DESTDIR)$(libdir); $(RANLIB) libz.a || true) >/dev/null 2>&1
+ 	- at cd $(DESTDIR)$(sharedlibdir); if test "$(SHAREDLIBV)" -a -f $(SHAREDLIBV); then \
-- 
1.7.3.3
