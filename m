From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Oct 2013 21:28:18 +0200
Subject: [Buildroot] [git commit] diffutils: bump to version 3.3
Message-ID: <20131001193429.899E09B313@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=51243f52e10326e872ecbd57b10fe30317f215f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also drop diffutils-gets-no-longer-exists-in-eglibc-2.16.patch because
gets is unconditionally undefined now so we don't need the patch.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...tils-gets-no-longer-exists-in-eglibc-2.16.patch |   26 --------------------
 package/diffutils/diffutils.mk                     |    2 +-
 2 files changed, 1 insertions(+), 27 deletions(-)

diff --git a/package/diffutils/diffutils-gets-no-longer-exists-in-eglibc-2.16.patch b/package/diffutils/diffutils-gets-no-longer-exists-in-eglibc-2.16.patch
deleted file mode 100644
index 4785718..0000000
--- a/package/diffutils/diffutils-gets-no-longer-exists-in-eglibc-2.16.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Handle the fact that gets() no longer exists in glibc >= 2.16
-
-The problem has been fixed upstream, but no release containing the fix
-has been made so far.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/lib/stdio.in.h
-===================================================================
---- a/lib/stdio.in.h
-+++ b/lib/stdio.in.h
-@@ -693,12 +693,14 @@
- _GL_CXXALIAS_SYS (gets, char *, (char *s));
- #  undef gets
- # endif
-+# if defined gets
- _GL_CXXALIASWARN (gets);
- /* It is very rare that the developer ever has full control of stdin,
-    so any use of gets warrants an unconditional warning.  Assume it is
-    always declared, since it is required by C89.  */
- _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
- #endif
-+#endif
- 
- 
- #if @GNULIB_OBSTACK_PRINTF@ || @GNULIB_OBSTACK_PRINTF_POSIX@
diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index 6934532..191fd2e 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DIFFUTILS_VERSION = 3.2
+DIFFUTILS_VERSION = 3.3
 DIFFUTILS_SOURCE = diffutils-$(DIFFUTILS_VERSION).tar.xz
 DIFFUTILS_SITE = $(BR2_GNU_MIRROR)/diffutils
 DIFFUTILS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
