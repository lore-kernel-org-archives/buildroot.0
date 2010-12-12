From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 Dec 2010 08:51:58 +0100
Subject: [Buildroot] [git commit master 1/1] zlib: really fix install for
	static only builds
Message-ID: <20101212081028.305EE8E25B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cc37a07f289f56a81195933810af705d77e95ee4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit ab2f5567c1 (cleanup, fix install for static only build) forgot
to add the patch for static only builds, even though the commit message
mentioned it.

Thanks to Mike for noticing.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                          |    2 +-
 package/zlib/zlib-1.2.5-fix-static-install.patch |   24 ++++++++++++++++++++++
 2 files changed, 25 insertions(+), 1 deletions(-)
 create mode 100644 package/zlib/zlib-1.2.5-fix-static-install.patch

diff --git a/CHANGES b/CHANGES
index 399dba2..7d79c27 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,7 +4,7 @@
 	compilation, and cache is stored in ~/.buildroot-ccache.
 
 	Updated/fixed packages: busybox, cloop, libconfig, m4,
-	openssh, openssl, qt, usbutils, xz
+	openssh, openssl, qt, usbutils, xz, zlib
 
 	New packages: dhrystone, lsuio, rsh-redone, whetstone
 
diff --git a/package/zlib/zlib-1.2.5-fix-static-install.patch b/package/zlib/zlib-1.2.5-fix-static-install.patch
new file mode 100644
index 0000000..0a885f7
--- /dev/null
+++ b/package/zlib/zlib-1.2.5-fix-static-install.patch
@@ -0,0 +1,24 @@
+[PATCH] fix make install for static builds
+
+Only try to install shared lib if we've built one.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ Makefile.in |    4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+Index: zlib-1.2.5/Makefile.in
+===================================================================
+--- zlib-1.2.5.orig/Makefile.in
++++ zlib-1.2.5/Makefile.in
+@@ -168,7 +168,9 @@ install-libs: $(LIBS)
+ 	- at if [ ! -d $(DESTDIR)$(man3dir)      ]; then mkdir -p $(DESTDIR)$(man3dir); fi
+ 	- at if [ ! -d $(DESTDIR)$(pkgconfigdir) ]; then mkdir -p $(DESTDIR)$(pkgconfigdir); fi
+ 	cp $(STATICLIB) $(DESTDIR)$(libdir)
+-	cp $(SHAREDLIBV) $(DESTDIR)$(sharedlibdir)
++	if test "$(SHAREDLIBV)" -a -f $(SHAREDLIBV); then \
++	  cp $(SHAREDLIBV) $(DESTDIR)$(sharedlibdir); \
++	fi
+ 	cd $(DESTDIR)$(libdir); chmod u=rw,go=r $(STATICLIB)
+ 	-@(cd $(DESTDIR)$(libdir); $(RANLIB) libz.a || true) >/dev/null 2>&1
+ 	- at cd $(DESTDIR)$(sharedlibdir); if test "$(SHAREDLIBV)" -a -f $(SHAREDLIBV); then \
-- 
1.7.2.2
