From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 18 Dec 2019 21:39:06 +0100
Subject: [Buildroot] [PATCH 4/5] package/libselinux: add dependency on
 host-coreutils for ln --relative
In-Reply-To: <cover.1576701539.git.yann.morin.1998@free.fr>
References: <cover.1576701539.git.yann.morin.1998@free.fr>
Message-ID: <a8b439fc62ec7ce467672dd3a83d543be7208cc1.1576701539.git.yann.morin.1998@free.fr>
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
 .../libselinux/0002-revert-ln-relative.patch  | 26 ------------------
 ...-ln-relative-usage-in-install-pywrap.patch | 27 -------------------
 package/libselinux/libselinux.mk              |  2 +-
 3 files changed, 1 insertion(+), 54 deletions(-)
 delete mode 100644 package/libselinux/0002-revert-ln-relative.patch
 delete mode 100644 package/libselinux/0005-Remove-ln-relative-usage-in-install-pywrap.patch

diff --git a/package/libselinux/0002-revert-ln-relative.patch b/package/libselinux/0002-revert-ln-relative.patch
deleted file mode 100644
index f7beab2697..0000000000
--- a/package/libselinux/0002-revert-ln-relative.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Makefile: revert libselinux: use ln --relative to create .so symlinks
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
-diff -durNw libselinux-2.7.orig/src/Makefile libselinux-2.7/src/Makefile
---- libselinux-2.7.orig/src/Makefile	2018-01-15 20:53:50.168525700 +0100
-+++ libselinux-2.7/src/Makefile	2018-01-15 20:55:27.061858005 +0100
-@@ -181,7 +181,7 @@
-	install -m 755 $(LIBSO) $(DESTDIR)$(SHLIBDIR)
-	test -d $(DESTDIR)$(LIBDIR)/pkgconfig || install -m 755 -d $(DESTDIR)$(LIBDIR)/pkgconfig
-	install -m 644 $(LIBPC) $(DESTDIR)$(LIBDIR)/pkgconfig
--	ln -sf --relative $(DESTDIR)$(SHLIBDIR)/$(LIBSO) $(DESTDIR)$(LIBDIR)/$(TARGET)
-+	cd $(DESTDIR)$(LIBDIR) && ln -sf $(LIBSO) $(TARGET)
- 
- install-pywrap: pywrap
-	test -d $(DESTDIR)$(PYTHONLIBDIR)/selinux || install -m 755 -d $(DESTDIR)$(PYTHONLIBDIR)/selinux
diff --git a/package/libselinux/0005-Remove-ln-relative-usage-in-install-pywrap.patch b/package/libselinux/0005-Remove-ln-relative-usage-in-install-pywrap.patch
deleted file mode 100644
index bf482af68a..0000000000
--- a/package/libselinux/0005-Remove-ln-relative-usage-in-install-pywrap.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From af2284b8510161e8742787a632ebb2aaef8fc045 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Fri, 25 Oct 2019 13:36:29 +0200
-Subject: [PATCH] Remove ln --relative usage in install-pywrap
-
-[Upstream: https://github.com/SELinuxProject/selinux/pull/184]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index 2b1696a0..799df2b0 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -175,7 +175,7 @@ install: all
- install-pywrap: pywrap
- 	$(PYTHON) setup.py install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR)`
- 	install -m 644 $(SWIGPYOUT) $(DESTDIR)$(PYTHONLIBDIR)/selinux/__init__.py
--	ln -sf --relative $(DESTDIR)$(PYTHONLIBDIR)/selinux/_selinux$(PYCEXT) $(DESTDIR)$(PYTHONLIBDIR)/_selinux$(PYCEXT)
-+	cd $(DESTDIR)$(PYTHONLIBDIR) && ln -sf selinux/_selinux$(PYCEXT) _selinux$(PYCEXT)
- 
- install-rubywrap: rubywrap
- 	test -d $(DESTDIR)$(RUBYINSTALL) || install -m 755 -d $(DESTDIR)$(RUBYINSTALL) 
--- 
-2.21.0
-
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index b8ef4f5fba..1461e34539 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -9,7 +9,7 @@ LIBSELINUX_SITE = https://github.com/SELinuxProject/selinux/releases/download/20
 LIBSELINUX_LICENSE = Public Domain
 LIBSELINUX_LICENSE_FILES = LICENSE
 
-LIBSELINUX_DEPENDENCIES = libsepol pcre
+LIBSELINUX_DEPENDENCIES = $(BR2_COREUTILS_HOST_DEPENDENCY) libsepol pcre
 
 LIBSELINUX_INSTALL_STAGING = YES
 
-- 
2.20.1
