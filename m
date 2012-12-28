From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Dec 2012 22:47:03 +0100
Subject: [Buildroot] [git commit] diffutils: fix build with recent glibc
Message-ID: <20121228214705.460369A4EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=653d64c5094d34ade03d0c30ead151ac9223edbd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following build problem with recent toolchains:

In file included from exclude.c:31:0:
./stdio.h:1012:1: error: 'gets' undeclared here (not in a function)
  CC       hard-locale.o
make[4]: *** [exclude.o] Error 1
make[4]: *** Waiting for unfinished jobs....
In file included from stdio-safer.h:20:0,
                 from freopen-safer.c:22:
./stdio.h:1012:1: error: 'gets' undeclared here (not in a function)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...tils-gets-no-longer-exists-in-eglibc-2.16.patch |   26 ++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/diffutils/diffutils-gets-no-longer-exists-in-eglibc-2.16.patch b/package/diffutils/diffutils-gets-no-longer-exists-in-eglibc-2.16.patch
new file mode 100644
index 0000000..4785718
--- /dev/null
+++ b/package/diffutils/diffutils-gets-no-longer-exists-in-eglibc-2.16.patch
@@ -0,0 +1,26 @@
+Handle the fact that gets() no longer exists in glibc >= 2.16
+
+The problem has been fixed upstream, but no release containing the fix
+has been made so far.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/lib/stdio.in.h
+===================================================================
+--- a/lib/stdio.in.h
++++ b/lib/stdio.in.h
+@@ -693,12 +693,14 @@
+ _GL_CXXALIAS_SYS (gets, char *, (char *s));
+ #  undef gets
+ # endif
++# if defined gets
+ _GL_CXXALIASWARN (gets);
+ /* It is very rare that the developer ever has full control of stdin,
+    so any use of gets warrants an unconditional warning.  Assume it is
+    always declared, since it is required by C89.  */
+ _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
+ #endif
++#endif
+ 
+ 
+ #if @GNULIB_OBSTACK_PRINTF@ || @GNULIB_OBSTACK_PRINTF_POSIX@
