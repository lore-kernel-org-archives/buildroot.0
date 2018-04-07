From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Apr 2018 13:32:17 +0200
Subject: [Buildroot] [git commit] libglib2: add upstream patch to fix build
 issue
Message-ID: <20180407113233.0F2907F88C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd90def0ded4b71dbc40b78b8b4dacba32687885
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump of libglib2 to 2.56.0, it fails to build on uClibc with:

gthreadedresolver.c: In function 'do_lookup_records':
gthreadedresolver.c:875:16: error: 'res' undeclared (first use in this function); did you mean '_res'?
   res_nclose (&res);
                ^~~
                _res

This commit adds an upstream patch that fixes this problem.

Fixes:

  http://autobuild.buildroot.net/results/990e19e3500986263f99354215e33214a2e89116/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...solver-Fix-compilation-with-res_nclose-bu.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/libglib2/0003-gthreadedresolver-Fix-compilation-with-res_nclose-bu.patch b/package/libglib2/0003-gthreadedresolver-Fix-compilation-with-res_nclose-bu.patch
new file mode 100644
index 0000000000..a195b8fda1
--- /dev/null
+++ b/package/libglib2/0003-gthreadedresolver-Fix-compilation-with-res_nclose-bu.patch
@@ -0,0 +1,42 @@
+From fe939d2b704c0b7ea3f0c429528d29441f780fb8 Mon Sep 17 00:00:00 2001
+From: Sebastian <sebastian_ml@gmx.net>
+Date: Thu, 22 Mar 2018 19:41:00 +0000
+Subject: [PATCH] gthreadedresolver: Fix compilation with res_nclose() but no
+ res_nquery()
+
+Some very odd systems have the functions to initialise and destroy a
+struct __res_state, but apparently not to do a DNS query using it. Fix
+the compilation on those systems.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=794606
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ gio/gthreadedresolver.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/gio/gthreadedresolver.c b/gio/gthreadedresolver.c
+index fc5c1bb77..e89dc156c 100644
+--- a/gio/gthreadedresolver.c
++++ b/gio/gthreadedresolver.c
+@@ -869,6 +869,8 @@ do_lookup_records (GTask         *task,
+   records = g_resolver_records_from_res_query (lrd->rrname, rrtype, answer->data, len, herr, &error);
+   g_byte_array_free (answer, TRUE);
+ 
++#ifdef HAVE_RES_NQUERY
++
+ #if defined(HAVE_RES_NDESTROY)
+   res_ndestroy (&res);
+ #elif defined(HAVE_RES_NCLOSE)
+@@ -877,6 +879,8 @@ do_lookup_records (GTask         *task,
+ #error "Your platform has res_ninit() but not res_nclose() or res_ndestroy(). Please file a bug at https://bugzilla.gnome.org/enter_bug.cgi?product=glib"
+ #endif
+ 
++#endif  /* HAVE_RES_NQUERY */
++
+ #else
+ 
+   DNS_STATUS status;
+-- 
+2.14.3
+
