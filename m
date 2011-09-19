From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2011 22:57:39 +0200
Subject: [Buildroot] [PATCH 3/5] mesa3d: add patch to fix build on !locale
	toolchains
In-Reply-To: <cover.1316465857.git.thomas.petazzoni@free-electrons.com>
References: <cover.1316465857.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f08b73124ef8e797878851102a0f915e06dc4fd1.1316465857.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes bug #3313.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../x11r7/mesa3d/mesa3d-7.6.1-fix-no-locale.patch  |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 package/x11r7/mesa3d/mesa3d-7.6.1-fix-no-locale.patch

diff --git a/package/x11r7/mesa3d/mesa3d-7.6.1-fix-no-locale.patch b/package/x11r7/mesa3d/mesa3d-7.6.1-fix-no-locale.patch
new file mode 100644
index 0000000..6b481d2
--- /dev/null
+++ b/package/x11r7/mesa3d/mesa3d-7.6.1-fix-no-locale.patch
@@ -0,0 +1,14 @@
+Index: Mesa-7.6.1/src/mesa/main/imports.c
+===================================================================
+--- Mesa-7.6.1.orig/src/mesa/main/imports.c
++++ Mesa-7.6.1/src/mesa/main/imports.c
+@@ -915,7 +915,8 @@
+ double
+ _mesa_strtod( const char *s, char **end )
+ {
+-#ifdef _GNU_SOURCE
++  /* We need either a glibc/eglibc library, or uClibc with locales */
++#if defined(_GNU_SOURCE) && (!defined(__UCLIBC__) || defined(__UCLIBC_HAS_LOCALE__))
+    static locale_t loc = NULL;
+    if (!loc) {
+       loc = newlocale(LC_CTYPE_MASK, "C", NULL);
-- 
1.7.4.1
