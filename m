From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Jun 2015 03:08:29 +0200
Subject: [Buildroot] [git commit] opkg: bump to version 0.3.0
Message-ID: <20150606011307.369A181E25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2f9bbe6599233a99ab819f865ad09946b7998590
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove "Disable tests and manpages" patch because opkg no longer
builds C tests into libopkg as of commit
ef8ae066cfa898b6366198e429cbeb4c94c92939.

Remove "Fix libtool issue with recent libtool" patch because the patch
comments indicate that it is no longer required with opkg version
0.3.0.

Select libarchive package dependency, as opkg requires it as of
release opkg-0.3.0-rc0 (see the opkg NEWS file).

[Thomas: add missing wchar dependency inherited from libarchive.]

Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opkg/0001-Disable-tests-and-manpages.patch |   35 --------------------
 ...002-Fix-libtool-issue-with-recent-libtool.patch |   35 --------------------
 package/opkg/Config.in                             |    6 +++
 package/opkg/opkg.mk                               |    2 +-
 4 files changed, 7 insertions(+), 71 deletions(-)

diff --git a/package/opkg/0001-Disable-tests-and-manpages.patch b/package/opkg/0001-Disable-tests-and-manpages.patch
deleted file mode 100644
index b816766..0000000
--- a/package/opkg/0001-Disable-tests-and-manpages.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 1c8e21e220ed0af6de3ab776d3edf8f0be69e779 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Mon, 22 Dec 2014 09:45:08 +0100
-Subject: [PATCH 1/2] Disable tests and manpages
-
-Tests are forcibly statically linked to libopkg, which does not work in
-a shared-only build.
-
-Since Buildroot does not care about testsuites, just disable building the
-tests. Disable manpages at the same time for the same reason.
-
-Note: dynamically linking with libopkg is also possible, but that would
-not be upstreamable (too much changes already in upstream).
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 8baa62c..497b774 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,6 +1,6 @@
- ACLOCAL_AMFLAGS = -I shave -I m4
- 
--SUBDIRS = libbb libopkg src tests utils man
-+SUBDIRS = libbb libopkg src utils
- 
- 
- HOST_CPU=@host_cpu@
--- 
-2.1.0
-
diff --git a/package/opkg/0002-Fix-libtool-issue-with-recent-libtool.patch b/package/opkg/0002-Fix-libtool-issue-with-recent-libtool.patch
deleted file mode 100644
index 4ba2bd3..0000000
--- a/package/opkg/0002-Fix-libtool-issue-with-recent-libtool.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 932bf10f259a82ffc17060c032bfdddd0436ca2d Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Mon, 22 Dec 2014 09:45:33 +0100
-Subject: [PATCH 2/2] Fix libtool issue with recent libtool
-
-With recent libtool versions, autoreconf complains that the set of
-directories in AC_CONFIG_MACRO_DIR doesn't match the ones passed in
-ACLOCAL_AMFLAGS. This patch fixes that by using AC_CONFIG_MACRO_DIRS
-instead.
-
-Note that this patch will no longer be needed once we bump to opkg
-0.3.0, since the shave/ macro directory has been removed.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 1ea2e78..0e3964d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3,8 +3,7 @@ AC_INIT([opkg], [0.2.4])
- AC_CONFIG_SRCDIR([libopkg/pkg.c])
- 
- AC_CONFIG_AUX_DIR([conf])
--AC_CONFIG_MACRO_DIR([m4])
--AC_CONFIG_MACRO_DIR([shave])
-+AC_CONFIG_MACRO_DIRS([shave m4])
- 
- AM_INIT_AUTOMAKE
- AC_CONFIG_HEADERS(config.h)
--- 
-2.1.0
-
diff --git a/package/opkg/Config.in b/package/opkg/Config.in
index afc13f2..df6ebff 100644
--- a/package/opkg/Config.in
+++ b/package/opkg/Config.in
@@ -1,6 +1,12 @@
+comment "opkg needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR
+
 config BR2_PACKAGE_OPKG
 	bool "opkg"
+	select BR2_PACKAGE_LIBARCHIVE
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR # libarchive
 	help
 	  Opkg is a lightweight package management system, based on ipkg. It is
 	  written in C and resembles apt/dpkg in operation. It is intended for
diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index dcc625a..5c79fc7 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPKG_VERSION = v0.2.4
+OPKG_VERSION = v0.3.0
 OPKG_SITE = http://git.yoctoproject.org/git/opkg
 OPKG_SITE_METHOD = git
 # Uses PKG_CHECK_MODULES() in configure.ac
