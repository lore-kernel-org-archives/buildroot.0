From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Mar 2018 18:11:07 +0200
Subject: [Buildroot] [git commit] gawk: bump to version 4.2.1
Message-ID: <20180329161216.B415483DBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22e27da26590adb203ad2cb14e986ff5c2592727
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable static build. gawk builds statically just fine. The shared
library check has been removed in 4.1.1.

Remove the symlink force hunk from the no-versioned patch. The only user
of LN is in the part that this patch disables.

Add license file hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gawk/0001-no-versioned.patch | 10 ----------
 package/gawk/Config.in               |  5 ++---
 package/gawk/gawk.hash               |  5 ++++-
 package/gawk/gawk.mk                 | 10 +---------
 4 files changed, 7 insertions(+), 23 deletions(-)

diff --git a/package/gawk/0001-no-versioned.patch b/package/gawk/0001-no-versioned.patch
index 0c35088e86..c5bbdddeb5 100644
--- a/package/gawk/0001-no-versioned.patch
+++ b/package/gawk/0001-no-versioned.patch
@@ -1,5 +1,4 @@
 Disabled versioned installation of binaries to save space.
-Also use symlinks where it's appropiate.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 [Gustavo: update for 4.1.2]
@@ -7,15 +6,6 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 diff -Nura gawk-4.1.2.orig/Makefile.in gawk-4.1.2/Makefile.in
 --- gawk-4.1.2.orig/Makefile.in	2015-04-29 16:11:09.367925925 -0300
 +++ gawk-4.1.2/Makefile.in	2015-04-29 16:11:25.308466495 -0300
-@@ -554,7 +554,7 @@
- CLEANFILES = core core.*
- 
- # We want hard links for install-exec-hook, below
--LN = ln
-+LN = $(LN_S)
- 
- # For some make's, e.g. OpenBSD, that don't define this
- RM = rm -f
 @@ -1173,6 +1173,7 @@
  # (This is done universally, which may not always be right, but
  # there's no easy way to distinguish GNU from non-GNU systems.)
diff --git a/package/gawk/Config.in b/package/gawk/Config.in
index a065243b7d..e9cf4c5ff7 100644
--- a/package/gawk/Config.in
+++ b/package/gawk/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_GAWK
 	bool "gawk"
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
-	depends on !BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  A special-purpose programming language which is data driven
@@ -11,7 +10,7 @@ config BR2_PACKAGE_GAWK
 
 	  http://www.gnu.org/software/gawk/
 
-comment "gawk needs a toolchain w/ wchar, dynamic library"
+comment "gawk needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
+	depends on !BR2_USE_WCHAR
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/gawk/gawk.hash b/package/gawk/gawk.hash
index e2c7806cc5..d8dd27c17c 100644
--- a/package/gawk/gawk.hash
+++ b/package/gawk/gawk.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	53e184e2d0f90def9207860531802456322be091c7b48f23fdc79cda65adc266	gawk-4.1.4.tar.xz
+# https://ftp.gnu.org/gnu/gawk/gawk-4.2.1.tar.xz.sig
+sha256	d1119785e746d46a8209d28b2de404a57f983aa48670f4e225531d3bdc175551	gawk-4.2.1.tar.xz
+# Locally calculated
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index a3a2927373..0779736882 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GAWK_VERSION = 4.1.4
+GAWK_VERSION = 4.2.1
 GAWK_SOURCE = gawk-$(GAWK_VERSION).tar.xz
 GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_DEPENDENCIES = host-gawk
@@ -44,13 +44,5 @@ endef
 
 GAWK_POST_INSTALL_TARGET_HOOKS += GAWK_CREATE_SYMLINK
 
-# Assume we support shared libs
-# The check isn't cross-compile friendly and it's mandatory anyway
-define GAWK_DISABLE_SHARED_CHECK
-	$(SED) 's/ check-for-shared-lib-support//' $(@D)/extension/Makefile.in
-endef
-
-GAWK_POST_PATCH_HOOKS += GAWK_DISABLE_SHARED_CHECK
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
