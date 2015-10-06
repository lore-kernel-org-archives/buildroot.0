From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Oct 2015 11:47:12 +0200
Subject: [Buildroot] [git commit] python-numpy: uClibc patch to avoid ldexpl
	and frexpl
Message-ID: <20151006084246.2866781E82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7ed04d21d610ff03fa9f3edac8a2ba42ea1a0e8b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It turns out that uClibc only enables the long double math functions
for some architectures (god know why, so what if long double is the
same as double, these functions should still be defined). Since
python-numpy links with those functions, the module will fail to load
on ARM, MIPS and SH.

However, python-numpy actually checks for each function if it is really
available. Only, it overrides that check for ldexpl and frexpl when
long double is the same as double (i.e. in exactly the case the uClibc
doesn't have these functions).

So add another exception for this.

Upstream-status: not applicable (code has changed too much)

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...indly-enable-frexpl-and-ldexpl-for-uClibc.patch |   33 ++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/package/python-numpy/0002-Don-t-blindly-enable-frexpl-and-ldexpl-for-uClibc.patch b/package/python-numpy/0002-Don-t-blindly-enable-frexpl-and-ldexpl-for-uClibc.patch
new file mode 100644
index 0000000..42d1941
--- /dev/null
+++ b/package/python-numpy/0002-Don-t-blindly-enable-frexpl-and-ldexpl-for-uClibc.patch
@@ -0,0 +1,33 @@
+From b0a1b9628d17251bb417a063ec6c6e09f32393c2 Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Tue, 6 Oct 2015 01:20:48 +0100
+Subject: [PATCH] Don't blindly enable frexpl and ldexpl for uClibc
+
+When the size of double and long double are equal, numpy blindly
+assumes that frexpl and ldexpl will be available as well. But for
+uClibc, that's not true: it only defines the long double functions
+when long double "exists" on the architecture.
+
+So make an exception for uClibc.
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ numpy/core/src/private/npy_config.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/numpy/core/src/private/npy_config.h b/numpy/core/src/private/npy_config.h
+index 453dbd0..7ecf72c 100644
+--- a/numpy/core/src/private/npy_config.h
++++ b/numpy/core/src/private/npy_config.h
+@@ -11,7 +11,7 @@
+ #endif
+ 
+ /* Safe to use ldexp and frexp for long double for MSVC builds */
+-#if (NPY_SIZEOF_LONGDOUBLE == NPY_SIZEOF_DOUBLE) || defined(_MSC_VER)
++#if ((NPY_SIZEOF_LONGDOUBLE == NPY_SIZEOF_DOUBLE) && !defined(__UCLIBC__)) || defined(_MSC_VER)
+     #ifdef HAVE_LDEXP
+         #define HAVE_LDEXPL 1
+     #endif
+-- 
+2.5.3
+
