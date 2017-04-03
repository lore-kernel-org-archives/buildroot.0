From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Apr 2017 15:09:17 +0200
Subject: [Buildroot] [git commit] dc3dd: gettextize to match newer gettext
	version
Message-ID: <20170403130922.F12348263F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09c76342487c3d73abc771f71cbb216cc7252d9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Because dc3dd is being autoreconfigured and comes with an old gettext
infra, gettextize needs to be called so that the infra is updated to
match the newer version used in Buildroot.

Commit b36d57fab included a patch to add the definition of MKDIR_P to
po/Makefile.in.in in order to fix autobuild failures that ocurred when
host-gettext was built before dc3dd. This patch is no longer necessary
as gettextize adds a new Makefile template which contains the needed
definition, so drop it.

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../dc3dd/0003-po-fix-build-with-NLS-enabled.patch | 25 ----------------------
 package/dc3dd/dc3dd.mk                             |  4 +++-
 2 files changed, 3 insertions(+), 26 deletions(-)

diff --git a/package/dc3dd/0003-po-fix-build-with-NLS-enabled.patch b/package/dc3dd/0003-po-fix-build-with-NLS-enabled.patch
deleted file mode 100644
index 3026044..0000000
--- a/package/dc3dd/0003-po-fix-build-with-NLS-enabled.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 67d8ff286ebd0ea4c8ef5a02a819bbb6b6273ccd Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sun, 2 Apr 2017 10:58:42 +0200
-Subject: [PATCH] po: fix build with NLS enabled
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- po/Makefile.in.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/po/Makefile.in.in b/po/Makefile.in.in
-index 6a39807..2793c7e 100755
---- a/po/Makefile.in.in
-+++ b/po/Makefile.in.in
-@@ -34,6 +34,7 @@ gettextsrcdir = $(datadir)/gettext/po
- INSTALL = @INSTALL@
- INSTALL_DATA = @INSTALL_DATA@
- mkinstalldirs = $(SHELL) @install_sh@ -d
-+MKDIR_P = @MKDIR_P@
- mkdir_p = @mkdir_p@
- 
- GMSGFMT_ = @GMSGFMT@
--- 
-2.9.3
-
diff --git a/package/dc3dd/dc3dd.mk b/package/dc3dd/dc3dd.mk
index a695524..cc89bb6 100644
--- a/package/dc3dd/dc3dd.mk
+++ b/package/dc3dd/dc3dd.mk
@@ -10,7 +10,9 @@ DC3DD_SOURCE = dc3dd-$(DC3DD_VERSION).tar.xz
 DC3DD_SITE = https://downloads.sourceforge.net/project/dc3dd/dc3dd/$(DC3DD_VERSION_MAJOR)
 DC3DD_LICENSE = GPL-3.0+
 DC3DD_LICENSE_FILES = COPYING
-# We are patching the Makefile.am
+# We are patching Makefile.am, so we need to autoreconf. We also need to
+# enable gettextize as dc3dd comes with an old gettext infra.
 DC3DD_AUTORECONF = YES
+DC3DD_GETTEXTIZE = YES
 
 $(eval $(autotools-package))
