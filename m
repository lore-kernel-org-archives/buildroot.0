From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Sep 2014 21:53:12 +0200
Subject: [Buildroot] [git commit] jq: add patch to fix y0, y1,
	j0 and j1 related build issue on uClibc
Message-ID: <20140907195715.55A3D9D3B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=df2a60e5ca39d6f31e361bb57cb526e58576eb45
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Our default uClibc configuration does not have DO_XSI_MATH=y, so it
lacks certain math functions. jq generates some wrappers for the libm
functions, even for functions that are not actually used by jq. By
simply removing those wrappers, we get jq to build on uClibc that have
DO_XSI_MATH disabled.

Fixes:

  http://autobuild.buildroot.org/results/831/831ffb0a37a8007b2a824659e46dbe9e6e710d6f/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../jq-0001-libm.h-comment-j0-j1-y0-and-y1.patch   |   49 ++++++++++++++++++++
 1 files changed, 49 insertions(+), 0 deletions(-)

diff --git a/package/jq/jq-0001-libm.h-comment-j0-j1-y0-and-y1.patch b/package/jq/jq-0001-libm.h-comment-j0-j1-y0-and-y1.patch
new file mode 100644
index 0000000..dfc2f4c
--- /dev/null
+++ b/package/jq/jq-0001-libm.h-comment-j0-j1-y0-and-y1.patch
@@ -0,0 +1,49 @@
+From e87163425a67938afde96f01b19587ac3348b369 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 7 Sep 2014 10:49:57 +0200
+Subject: [PATCH] libm.h: comment j0, j1, y0 and y1
+
+Those functions are currently not used by jq, but having them in
+libm.h prevents building with the uClibc C library when it doesn't
+have DO_XSI_MATH option enabled.
+
+This issue was spotted by the Buildroot autobuilder system:
+
+  http://autobuild.buildroot.org/results/aaf/aaf3c114e0ca3e265ae32c646ba67f01aaf608bd/build-end.log
+
+Submitted upstream at https://github.com/stedolan/jq/pull/570.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ libm.h | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libm.h b/libm.h
+index f8c52be..8e82fb7 100644
+--- a/libm.h
++++ b/libm.h
+@@ -10,8 +10,8 @@ LIBM_DD(cosh)
+ LIBM_DD(exp2)
+ LIBM_DD(exp)
+ LIBM_DD(floor)
+-LIBM_DD(j0)
+-LIBM_DD(j1)
++/* LIBM_DD(j0) */
++/* LIBM_DD(j1) */
+ LIBM_DD(log10)
+ LIBM_DD(log2)
+ LIBM_DD(log)
+@@ -21,8 +21,8 @@ LIBM_DD(sqrt)
+ LIBM_DD(tan)
+ LIBM_DD(tanh)
+ LIBM_DD(tgamma)
+-LIBM_DD(y0)
+-LIBM_DD(y1)
++/* LIBM_DD(y0) */
++/* LIBM_DD(y1) */
+ /* LIBM_DID(jn) */
+ /* LIBM_DID(yn) */
+ /* LIBM_DDD(pow) */
+-- 
+2.0.0
+
