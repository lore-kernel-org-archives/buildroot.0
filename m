From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Jul 2017 00:05:18 +0200
Subject: [Buildroot] [git commit] rpm: don't download patches from Github
Message-ID: <20170702220304.C80307FF0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e4df30ff97eb21b8b3ab1c0b454389d846fc9bdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patches downloaded from Github are not stable, so bring them in the
tree.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ink-instead-of-compile-for-gcc-flags-test.patch | 33 ++++++++++++++++
 ...onfigure-ac-correct-stack-protector-check.patch | 45 ++++++++++++++++++++++
 ...-to-enable-disable-sepdebugcrcfix-buildi.patch} |  0
 ...ugcrcfix.c-fix-build-with-recent-binutil.patch} |  0
 package/rpm/rpm.hash                               |  3 --
 package/rpm/rpm.mk                                 |  7 +---
 6 files changed, 80 insertions(+), 8 deletions(-)

diff --git a/package/rpm/0001-configure-ac-use-link-instead-of-compile-for-gcc-flags-test.patch b/package/rpm/0001-configure-ac-use-link-instead-of-compile-for-gcc-flags-test.patch
new file mode 100644
index 0000000..6f6a2ab
--- /dev/null
+++ b/package/rpm/0001-configure-ac-use-link-instead-of-compile-for-gcc-flags-test.patch
@@ -0,0 +1,33 @@
+From b5f1895aae096836d6e8e155ee289e1b10fcabcb Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 10 Oct 2015 23:17:44 +0200
+Subject: [PATCH] configure.ac: use link instead of compile for gcc flags test
+
+The logic that tests whether gcc supports or not certain flags uses
+AC_COMPILE_IFELSE(). However, when checking for stack smashing
+protection support, an AC_LINK_IFELSE() test is needed, since the
+build might work but not the link stage if certain libraries are
+missing for proper stack smashing protection support.
+
+Therefore, this commit switches to use AC_LINK_IFELSE().
+
+[Upstream commit: https://github.com/rpm-software-management/rpm/commit/b5f1895aae096836d6e8e155ee289e1b10fcabcb]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: James Knight <james.d.knight@live.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6ece8c9fd..822294c3f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -43,7 +43,7 @@ if test "$GCC" = yes; then
+     echo
+     for flag in $cflags_to_try; do
+         CFLAGS="$CFLAGS $flag -Werror"
+-        AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[return 0;]])],[
++        AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[return 0;]])],[
+                 echo "   $flag"
+                 RPMCFLAGS="$RPMCFLAGS $flag"
+         ],[])
diff --git a/package/rpm/0002-configure-ac-correct-stack-protector-check.patch b/package/rpm/0002-configure-ac-correct-stack-protector-check.patch
new file mode 100644
index 0000000..9d2942b
--- /dev/null
+++ b/package/rpm/0002-configure-ac-correct-stack-protector-check.patch
@@ -0,0 +1,45 @@
+From c810a0aca3f1148d2072d44b91b8cc9caeb4cf19 Mon Sep 17 00:00:00 2001
+From: James Knight <james.knight@rockwellcollins.com>
+Date: Wed, 16 Nov 2016 15:54:46 -0500
+Subject: [PATCH] configure.ac: correct stack protector check
+
+If a used toolchain accepts the `-fstack-protector` option but does not
+provide a stack smashing protector implementation (ex. libssp), linking
+will fail:
+
+ .libs/rpmio.o: In function `Fdescr':
+ rpmio.c:(.text+0x672): undefined reference to `__stack_chk_fail_local'
+ .libs/rpmio.o: In function `Fdopen':
+ rpmio.c:(.text+0xce9): undefined reference to `__stack_chk_fail_local'
+ .libs/rpmio.o: In function `ufdCopy':
+ rpmio.c:(.text+0x10f7): undefined reference to `__stack_chk_fail_local'
+ ...
+
+This is a result of testing for `-fstack-protector` support using a main
+that GCC does not inject guards. GCC's manual notes that stack protector
+code is only added when "[functions] that call alloca, and functions
+with buffers larger than 8 bytes" [1]. This commit adjusts the stack
+protector check to allocate memory on the stack (via `alloca`).
+
+[1]: https://gcc.gnu.org/onlinedocs/gcc-4.4.2/gcc/Optimize-Options.html
+
+Signed-off-by: James Knight <james.knight@rockwellcollins.com>
+[Upstream commit: https://github.com/rpm-software-management/rpm/commit/c810a0aca3f1148d2072d44b91b8cc9caeb4cf19]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index a9730d3bc..b4b3fe8fb 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -43,7 +43,7 @@ if test "$GCC" = yes; then
+     echo
+     for flag in $cflags_to_try; do
+         CFLAGS="$CFLAGS $flag -Werror"
+-        AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[return 0;]])],[
++        AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[alloca(100);]])],[
+                 echo "   $flag"
+                 RPMCFLAGS="$RPMCFLAGS $flag"
+         ],[])
diff --git a/package/rpm/0001-Detect-bfd.h-to-enable-disable-sepdebugcrcfix-buildi.patch b/package/rpm/0003-Detect-bfd.h-to-enable-disable-sepdebugcrcfix-buildi.patch
similarity index 100%
rename from package/rpm/0001-Detect-bfd.h-to-enable-disable-sepdebugcrcfix-buildi.patch
rename to package/rpm/0003-Detect-bfd.h-to-enable-disable-sepdebugcrcfix-buildi.patch
diff --git a/package/rpm/0002-tools-sepdebugcrcfix.c-fix-build-with-recent-binutil.patch b/package/rpm/0004-tools-sepdebugcrcfix.c-fix-build-with-recent-binutil.patch
similarity index 100%
rename from package/rpm/0002-tools-sepdebugcrcfix.c-fix-build-with-recent-binutil.patch
rename to package/rpm/0004-tools-sepdebugcrcfix.c-fix-build-with-recent-binutil.patch
diff --git a/package/rpm/rpm.hash b/package/rpm/rpm.hash
index fd77d33..7ae9ec7 100644
--- a/package/rpm/rpm.hash
+++ b/package/rpm/rpm.hash
@@ -1,5 +1,2 @@
 # From http://rpm.org/wiki/Releases/4.13.0.1
 sha1 9566f95f38fcb214e439c552f378c2f64ba0aff9  rpm-4.13.0.1.tar.bz2
-# Locally computed
-sha256	a3e5568d721737a24141737e6036bb39ba9dfbeaa03fa4a51cc7881a243e0c5d b5f1895aae096836d6e8e155ee289e1b10fcabcb.patch
-sha256	7ab0e08e143bb2d43d5b0553ee22ea34da15a611c597860a6110745467d20fa8 c810a0aca3f1148d2072d44b91b8cc9caeb4cf19.patch
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index fdaf27c..317ec14 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -11,12 +11,9 @@ RPM_SITE = http://ftp.rpm.org/releases/rpm-$(RPM_VERSION_MAJOR).x
 RPM_DEPENDENCIES = host-pkgconf berkeleydb file popt zlib
 RPM_LICENSE = GPL-2.0 or LGPL-2.0 (library only)
 RPM_LICENSE_FILES = COPYING
-RPM_PATCH = \
-	https://github.com/rpm-software-management/rpm/commit/b5f1895aae096836d6e8e155ee289e1b10fcabcb.patch \
-	https://github.com/rpm-software-management/rpm/commit/c810a0aca3f1148d2072d44b91b8cc9caeb4cf19.patch
 
-# b5f1895aae096836d6e8e155ee289e1b10fcabcb.patch
-# c810a0aca3f1148d2072d44b91b8cc9caeb4cf19.patch
+# 0001-configure-ac-use-link-instead-of-compile-for-gcc-flags-test.patch
+# 0002-configure-ac-correct-stack-protector-check.patch
 RPM_AUTORECONF = YES
 
 RPM_CONF_OPTS = \
