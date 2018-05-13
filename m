From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 22:39:52 +0200
Subject: [Buildroot] [git commit] zstd: fix host headers installation
Message-ID: <20180513203919.ABB2E8A4E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a557aedad2d8b4735afe709e68ed58f7304580d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If host-zstd builds when $(HOST_DIR)/include has not been created yet,
the install-includes target does not create this directory. Instead, the
install command copies the headers over $(HOST_DIR)/include, thus
creating a regular file instead of a directory. This leads to the
following installation failure:

Installing includes
install: cannot create directory ???.../host/usr/include/???: File exists
Makefile:166: recipe for target 'install-pc' failed
make[1]: *** [install-pc] Error 1

Add a patch to fix that.

Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...e-create-include-directory-before-headers.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/zstd/0002-lib-Makefile-create-include-directory-before-headers.patch b/package/zstd/0002-lib-Makefile-create-include-directory-before-headers.patch
new file mode 100644
index 0000000000..e95f8c0be4
--- /dev/null
+++ b/package/zstd/0002-lib-Makefile-create-include-directory-before-headers.patch
@@ -0,0 +1,45 @@
+From 9a0643b633c00e86db059e3790bdea7155fb6dc9 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 8 May 2018 20:43:28 +0300
+Subject: [PATCH] lib/Makefile: create include directory before headers
+ installation
+
+Make sure that $(INCLUDEDIR) exists before copying the headers there.
+Otherwise, the contest of header files is copied over
+$(DESTDIR)$(INCLUDEDIR), making it a regular file.
+
+While at it, remove $(DESTDIR)$(INCLUDEDIR) from the list of directories
+to create in the install-pc target. The install-pc target does not need
+this directory.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://github.com/facebook/zstd/pull/1123
+
+ lib/Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/Makefile b/lib/Makefile
+index f64f192d4724..d8178c7a58a0 100644
+--- a/lib/Makefile
++++ b/lib/Makefile
+@@ -163,7 +163,7 @@ install: install-pc install-static install-shared install-includes
+ 	@echo zstd static and shared library installed
+ 
+ install-pc: libzstd.pc
+-	@$(INSTALL) -d -m 755 $(DESTDIR)$(PKGCONFIGDIR)/ $(DESTDIR)$(INCLUDEDIR)/
++	@$(INSTALL) -d -m 755 $(DESTDIR)$(PKGCONFIGDIR)/
+ 	@$(INSTALL_DATA) libzstd.pc $(DESTDIR)$(PKGCONFIGDIR)/
+ 
+ install-static: libzstd.a
+@@ -178,6 +178,7 @@ install-shared: libzstd
+ 
+ install-includes:
+ 	@echo Installing includes
++	@$(INSTALL) -d -m 755 $(DESTDIR)$(INCLUDEDIR)/
+ 	@$(INSTALL_DATA) zstd.h $(DESTDIR)$(INCLUDEDIR)
+ 	@$(INSTALL_DATA) common/zstd_errors.h $(DESTDIR)$(INCLUDEDIR)
+ 	@$(INSTALL_DATA) deprecated/zbuff.h $(DESTDIR)$(INCLUDEDIR)     # prototypes generate deprecation warnings
+-- 
+2.17.0
+
