From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Jul 2018 18:44:34 +0200
Subject: [Buildroot] [git commit] zstd: bump to version 1.3.5
Message-ID: <20180710164050.A3F808822A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8ea239d6d32c9018d8fa060519253d0e161c63c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patches.

Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ry-install-target-into-pc-static-shared-a.patch | 51 ----------------------
 ...e-create-include-directory-before-headers.patch | 45 -------------------
 package/zstd/zstd.hash                             |  2 +-
 package/zstd/zstd.mk                               |  2 +-
 4 files changed, 2 insertions(+), 98 deletions(-)

diff --git a/package/zstd/0001-Split-library-install-target-into-pc-static-shared-a.patch b/package/zstd/0001-Split-library-install-target-into-pc-static-shared-a.patch
deleted file mode 100644
index af9b2bf3f9..0000000000
--- a/package/zstd/0001-Split-library-install-target-into-pc-static-shared-a.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 2623a12bff19049b6ad5bc066e3ef9c6259d415c Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Mon, 16 Apr 2018 20:44:49 +0200
-Subject: [PATCH] Split library install target into pc, static, shared and
- include only target
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- lib/Makefile | 15 ++++++++++++---
- 1 file changed, 12 insertions(+), 3 deletions(-)
-
-diff --git a/lib/Makefile b/lib/Makefile
-index cdfdc5c..b592aa6 100644
---- a/lib/Makefile
-+++ b/lib/Makefile
-@@ -159,20 +159,29 @@ libzstd.pc: libzstd.pc.in
-              -e 's|@VERSION@|$(VERSION)|' \
-              $< >$@
- 
--install: libzstd.a libzstd libzstd.pc
-+install: install-pc install-static install-shared install-includes
-+	@echo zstd static and shared library installed
-+
-+install-pc: libzstd.pc
- 	@$(INSTALL) -d -m 755 $(DESTDIR)$(PKGCONFIGDIR)/ $(DESTDIR)$(INCLUDEDIR)/
- 	@$(INSTALL_DATA) libzstd.pc $(DESTDIR)$(PKGCONFIGDIR)/
--	@echo Installing libraries
-+
-+install-static: libzstd.a
-+	@echo Installing static library
- 	@$(INSTALL_DATA) libzstd.a $(DESTDIR)$(LIBDIR)
-+
-+install-shared: libzstd
-+	@echo Installing shared library
- 	@$(INSTALL_PROGRAM) $(LIBZSTD) $(DESTDIR)$(LIBDIR)
- 	@ln -sf $(LIBZSTD) $(DESTDIR)$(LIBDIR)/libzstd.$(SHARED_EXT_MAJOR)
- 	@ln -sf $(LIBZSTD) $(DESTDIR)$(LIBDIR)/libzstd.$(SHARED_EXT)
-+
-+install-includes:
- 	@echo Installing includes
- 	@$(INSTALL_DATA) zstd.h $(DESTDIR)$(INCLUDEDIR)
- 	@$(INSTALL_DATA) common/zstd_errors.h $(DESTDIR)$(INCLUDEDIR)
- 	@$(INSTALL_DATA) deprecated/zbuff.h $(DESTDIR)$(INCLUDEDIR)     # prototypes generate deprecation warnings
- 	@$(INSTALL_DATA) dictBuilder/zdict.h $(DESTDIR)$(INCLUDEDIR)
--	@echo zstd static and shared library installed
- 
- uninstall:
- 	@$(RM) $(DESTDIR)$(LIBDIR)/libzstd.a
--- 
-2.16.3
-
diff --git a/package/zstd/0002-lib-Makefile-create-include-directory-before-headers.patch b/package/zstd/0002-lib-Makefile-create-include-directory-before-headers.patch
deleted file mode 100644
index e95f8c0be4..0000000000
--- a/package/zstd/0002-lib-Makefile-create-include-directory-before-headers.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 9a0643b633c00e86db059e3790bdea7155fb6dc9 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 8 May 2018 20:43:28 +0300
-Subject: [PATCH] lib/Makefile: create include directory before headers
- installation
-
-Make sure that $(INCLUDEDIR) exists before copying the headers there.
-Otherwise, the contest of header files is copied over
-$(DESTDIR)$(INCLUDEDIR), making it a regular file.
-
-While at it, remove $(DESTDIR)$(INCLUDEDIR) from the list of directories
-to create in the install-pc target. The install-pc target does not need
-this directory.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://github.com/facebook/zstd/pull/1123
-
- lib/Makefile | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/lib/Makefile b/lib/Makefile
-index f64f192d4724..d8178c7a58a0 100644
---- a/lib/Makefile
-+++ b/lib/Makefile
-@@ -163,7 +163,7 @@ install: install-pc install-static install-shared install-includes
- 	@echo zstd static and shared library installed
- 
- install-pc: libzstd.pc
--	@$(INSTALL) -d -m 755 $(DESTDIR)$(PKGCONFIGDIR)/ $(DESTDIR)$(INCLUDEDIR)/
-+	@$(INSTALL) -d -m 755 $(DESTDIR)$(PKGCONFIGDIR)/
- 	@$(INSTALL_DATA) libzstd.pc $(DESTDIR)$(PKGCONFIGDIR)/
- 
- install-static: libzstd.a
-@@ -178,6 +178,7 @@ install-shared: libzstd
- 
- install-includes:
- 	@echo Installing includes
-+	@$(INSTALL) -d -m 755 $(DESTDIR)$(INCLUDEDIR)/
- 	@$(INSTALL_DATA) zstd.h $(DESTDIR)$(INCLUDEDIR)
- 	@$(INSTALL_DATA) common/zstd_errors.h $(DESTDIR)$(INCLUDEDIR)
- 	@$(INSTALL_DATA) deprecated/zbuff.h $(DESTDIR)$(INCLUDEDIR)     # prototypes generate deprecation warnings
--- 
-2.17.0
-
diff --git a/package/zstd/zstd.hash b/package/zstd/zstd.hash
index f7aadfb5db..95b2270981 100644
--- a/package/zstd/zstd.hash
+++ b/package/zstd/zstd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 92e41b6e8dd26bbd46248e8aa1d86f1551bc221a796277ae9362954f26d605a9 zstd-v1.3.4.tar.gz
+sha256 d6e1559e4cdb7c4226767d4ddc990bff5f9aab77085ff0d0490c828b025e2eea zstd-v1.3.5.tar.gz
 
 # License files (locally computed as well)
 sha256 2c1a7fa704df8f3a606f6fc010b8b5aaebf403f3aeec339a12048f1ba7331a0b LICENSE
diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 0b613a6da4..a1a11f9ab2 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZSTD_VERSION = v1.3.4
+ZSTD_VERSION = v1.3.5
 ZSTD_SITE = $(call github,facebook,zstd,$(ZSTD_VERSION))
 ZSTD_INSTALL_STAGING = YES
 ZSTD_LICENSE = BSD-3-Clause or GPL-2.0
