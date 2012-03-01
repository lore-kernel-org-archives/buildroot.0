From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 01 Mar 2012 13:06:37 -0000
Subject: [Buildroot] [git commit] zlib: bump version
Message-ID: <20120301130634.E19CC90BF7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b462167eefb25138669c9ed632cd9ed16d5550f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch is now upstream.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/zlib/zlib-1.2.5-fix-static-install.patch |   24 ----------------------
 package/zlib/zlib.mk                             |    9 ++++---
 2 files changed, 5 insertions(+), 28 deletions(-)

diff --git a/package/zlib/zlib-1.2.5-fix-static-install.patch b/package/zlib/zlib-1.2.5-fix-static-install.patch
deleted file mode 100644
index 0a885f7..0000000
--- a/package/zlib/zlib-1.2.5-fix-static-install.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-[PATCH] fix make install for static builds
-
-Only try to install shared lib if we've built one.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- Makefile.in |    4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-Index: zlib-1.2.5/Makefile.in
-===================================================================
---- zlib-1.2.5.orig/Makefile.in
-+++ zlib-1.2.5/Makefile.in
-@@ -168,7 +168,9 @@ install-libs: $(LIBS)
- 	- at if [ ! -d $(DESTDIR)$(man3dir)      ]; then mkdir -p $(DESTDIR)$(man3dir); fi
- 	- at if [ ! -d $(DESTDIR)$(pkgconfigdir) ]; then mkdir -p $(DESTDIR)$(pkgconfigdir); fi
- 	cp $(STATICLIB) $(DESTDIR)$(libdir)
--	cp $(SHAREDLIBV) $(DESTDIR)$(sharedlibdir)
-+	if test "$(SHAREDLIBV)" -a -f $(SHAREDLIBV); then \
-+	  cp $(SHAREDLIBV) $(DESTDIR)$(sharedlibdir); \
-+	fi
- 	cd $(DESTDIR)$(libdir); chmod u=rw,go=r $(STATICLIB)
- 	-@(cd $(DESTDIR)$(libdir); $(RANLIB) libz.a || true) >/dev/null 2>&1
- 	- at cd $(DESTDIR)$(sharedlibdir); if test "$(SHAREDLIBV)" -a -f $(SHAREDLIBV); then \
diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index fbe923e..eca98b8 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -3,10 +3,11 @@
 # zlib
 #
 #############################################################
-ZLIB_VERSION:=1.2.5
-ZLIB_SOURCE:=zlib-$(ZLIB_VERSION).tar.bz2
-ZLIB_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
-ZLIB_INSTALL_STAGING=YES
+
+ZLIB_VERSION = 1.2.6
+ZLIB_SOURCE =zlib-$(ZLIB_VERSION).tar.bz2
+ZLIB_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
+ZLIB_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 ZLIB_PIC :=
