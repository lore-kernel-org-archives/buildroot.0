From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 18 Dec 2019 21:39:07 +0100
Subject: [Buildroot] [PATCH 5/5] package/libsepol: add dependency on
 host-coreutils for ln --relative
In-Reply-To: <cover.1576701539.git.yann.morin.1998@free.fr>
References: <cover.1576701539.git.yann.morin.1998@free.fr>
Message-ID: <b22ede353f1065e52c6098cc1750386a5ac12fda.1576701539.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 .../libsepol/0002-revert-ln-relative.patch    | 29 -------------------
 package/libsepol/libsepol.mk                  |  2 +-
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 package/libsepol/0002-revert-ln-relative.patch

diff --git a/package/libsepol/0002-revert-ln-relative.patch b/package/libsepol/0002-revert-ln-relative.patch
deleted file mode 100644
index 40dabc38de..0000000000
--- a/package/libsepol/0002-revert-ln-relative.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 16b2b0e21e10727065042a1baabd1a887757c65c Mon Sep 17 00:00:00 2001
-From: Adam Duskett <aduskett@gmail.com>
-Date: Mon, 9 Oct 2017 16:29:36 -0400
-Subject: [PATCH] Makefile: revert libsepol: use ln --relative to create .so symlinks
-
-This reverts 71393a181d63c9baae5fe8dcaeb9411d1f253998
-
-ln --relative is too recent to be available in all distributions,
-especially enterprise-grade distros that can stick around as long as
-they are maintained (up to 10 years in some cases?).
-
-For the sake of Buildroot, revert the upstream patch.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Update for 2.8 (with assumption that SHLIBDIR=LIBDIR)]
-
-diff -durNw libsepol-2.7.orig/src/Makefile libsepol-2.7/src/Makefile
---- libsepol-2.7.orig/src/Makefile	2018-01-15 21:37:12.821831315 +0100
-+++ libsepol-2.7/src/Makefile	2018-01-15 21:38:03.838497434 +0100
-@@ -92,7 +92,7 @@
- endif
-	test -d $(DESTDIR)$(LIBDIR)/pkgconfig || install -m 755 -d $(DESTDIR)$(LIBDIR)/pkgconfig
-	install -m 644 $(LIBPC) $(DESTDIR)$(LIBDIR)/pkgconfig
--	$(LN) -sf --relative $(DESTDIR)$(SHLIBDIR)/$(LIBSO) $(DESTDIR)$(LIBDIR)/$(TARGET)
-+	cd $(DESTDIR)$(LIBDIR) && ln -sf $(LIBSO) $(TARGET)
- 
- relabel:
- 	/sbin/restorecon $(LIBINSTALL)/$(LIBSO)
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index 58b9b9c374..62b0744aa3 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -11,7 +11,7 @@ LIBSEPOL_LICENSE_FILES = COPYING
 
 LIBSEPOL_INSTALL_STAGING = YES
 LIBSEPOL_DEPENDENCIES = host-flex
-HOST_LIBSEPOL_DEPENDENCIES = host-flex
+HOST_LIBSEPOL_DEPENDENCIES = $(BR2_COREUTILS_HOST_DEPENDENCY) host-flex
 
 LIBSEPOL_MAKE_FLAGS = $(TARGET_CONFIGURE_OPTS)
 
-- 
2.20.1
