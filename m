From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Nov 2012 23:41:56 +0100
Subject: [Buildroot] [git commit] gnutls: fix build failure due to
	non-existing gets in recent C libraries
Message-ID: <20121117225526.26A1F9A081@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=29b792690b4939b414fef1ad06f71c53feb1ed75
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/7414989c182f8fd5b3ac849b7897b8e15df0024f/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...001-gets-no-longer-exists-in-e-glibc-2.16.patch |   56 ++++++++++++++++++++
 1 files changed, 56 insertions(+), 0 deletions(-)

diff --git a/package/gnutls/gnutls-0001-gets-no-longer-exists-in-e-glibc-2.16.patch b/package/gnutls/gnutls-0001-gets-no-longer-exists-in-e-glibc-2.16.patch
new file mode 100644
index 0000000..802e7ac
--- /dev/null
+++ b/package/gnutls/gnutls-0001-gets-no-longer-exists-in-e-glibc-2.16.patch
@@ -0,0 +1,56 @@
+From 855f72c4fe7f4bbf2137ab60357ae3b27bb65185 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 17 Nov 2012 17:45:41 +0100
+Subject: [PATCH] gets() no longer exists in (e)glibc >= 2.16
+
+gnutls has already updated gnulib upstream in more recent versions
+(3.x) but apparently not in the 2.x branch that we are using.
+
+This patch comes from OpenEmbedded, and has originally been written by
+Khem Raj <raj.khem@gmail.com>.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ gl/stdio.in.h     |    2 ++
+ lib/gl/stdio.in.h |    2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/gl/stdio.in.h b/gl/stdio.in.h
+index 9dc7c4a..8cb19d7 100644
+--- a/gl/stdio.in.h
++++ b/gl/stdio.in.h
+@@ -710,11 +710,13 @@ _GL_CXXALIAS_RPL (gets, char *, (char *s));
+ _GL_CXXALIAS_SYS (gets, char *, (char *s));
+ #  undef gets
+ # endif
++# if defined gets
+ _GL_CXXALIASWARN (gets);
+ /* It is very rare that the developer ever has full control of stdin,
+    so any use of gets warrants an unconditional warning.  Assume it is
+    always declared, since it is required by C89.  */
+ _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
++# endif
+ #endif
+ 
+ 
+diff --git a/lib/gl/stdio.in.h b/lib/gl/stdio.in.h
+index 03bea2a..cb6483b 100644
+--- a/lib/gl/stdio.in.h
++++ b/lib/gl/stdio.in.h
+@@ -710,11 +710,13 @@ _GL_CXXALIAS_RPL (gets, char *, (char *s));
+ _GL_CXXALIAS_SYS (gets, char *, (char *s));
+ #  undef gets
+ # endif
++# if defined gets
+ _GL_CXXALIASWARN (gets);
+ /* It is very rare that the developer ever has full control of stdin,
+    so any use of gets warrants an unconditional warning.  Assume it is
+    always declared, since it is required by C89.  */
+ _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
++# endif
+ #endif
+ 
+ 
+-- 
+1.7.9.5
+
