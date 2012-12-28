From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Dec 2012 21:41:22 +0100
Subject: [Buildroot] [PATCH 2/2] diffutils: fix build with recent glibc
Message-ID: <1356727282-13118-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 ...tils-gets-no-longer-exists-in-eglibc-2.16.patch |   26 ++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/diffutils/diffutils-gets-no-longer-exists-in-eglibc-2.16.patch

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
-- 
1.7.9.5
