From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 21:49:33 +0100
Subject: [Buildroot] [git commit] package/proftpd: fix build with gcc 10
Message-ID: <20210316202904.ABB1F83C5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f6428c072bb1c552e2e0fc52325dabefab0b059c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/d6ce64245c2724cbd94583490bf009c188182b1b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...quotatab-fix-build-failure-against-gcc-10.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/proftpd/0001-mod_quotatab-fix-build-failure-against-gcc-10.patch b/package/proftpd/0001-mod_quotatab-fix-build-failure-against-gcc-10.patch
new file mode 100644
index 0000000000..5f4eb66c71
--- /dev/null
+++ b/package/proftpd/0001-mod_quotatab-fix-build-failure-against-gcc-10.patch
@@ -0,0 +1,56 @@
+From 9c9623c8a47fb5580dfea1a59296c6d224479504 Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyfox@gentoo.org>
+Date: Mon, 2 Mar 2020 23:45:22 +0000
+Subject: [PATCH] mod_quotatab: fix build failure against gcc-10
+
+On gcc-10 (and gcc-9 -fno-common) build fails as:
+
+```
+$ ./configure --with-modules=mod_quotatab && make
+...
+ld: modules/module_glue.o:(.data.rel+0x68):
+  undefined reference to `quotatab_file_module'
+collect2: error: ld returned 1 exit status
+make: *** [Makefile:56: proftpd] Error 1
+```
+
+gcc-10 will change the default from -fcommon to fno-common:
+https://gcc.gnu.org/PR85678.
+
+The error also happens if CFLAGS=-fno-common passed explicitly.
+
+Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
+
+[Retrieved from:
+https://github.com/proftpd/proftpd/commit/9c9623c8a47fb5580dfea1a59296c6d224479504]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ contrib/mod_quotatab.c | 1 +
+ contrib/mod_quotatab.h | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/contrib/mod_quotatab.c b/contrib/mod_quotatab.c
+index 4fa6c1f44..0ee480163 100644
+--- a/contrib/mod_quotatab.c
++++ b/contrib/mod_quotatab.c
+@@ -50,6 +50,7 @@ typedef struct regtab_obj {
+ module quotatab_module;
+ 
+ /* Quota objects for the current session */
++quota_deltas_t quotatab_deltas;
+ static quota_table_t *limit_tab = NULL;
+ static quota_limit_t sess_limit;
+ 
+diff --git a/contrib/mod_quotatab.h b/contrib/mod_quotatab.h
+index ed30333f5..c818395a0 100644
+--- a/contrib/mod_quotatab.h
++++ b/contrib/mod_quotatab.h
+@@ -188,7 +188,7 @@ typedef struct table_obj {
+ #define QUOTATAB_TALLY_SRC      0x0002
+ 
+ /* Quota objects for the current session. */
+-quota_deltas_t quotatab_deltas;
++extern quota_deltas_t quotatab_deltas;
+ 
+ /* Function prototypes necessary for quotatab sub-modules */
+ int quotatab_log(const char *, ...)
