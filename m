From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 May 2020 19:05:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/libpam-tacplus: fix build when
 time_t is 64 bits
Message-ID: <20200517170507.2796394-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/874433d8cb30d21332f23024081a8b6d7b3254ae

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...build-failure-when-time_t-is-64-bits.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/libpam-tacplus/0004-tacc-c-fix-build-failure-when-time_t-is-64-bits.patch

diff --git a/package/libpam-tacplus/0004-tacc-c-fix-build-failure-when-time_t-is-64-bits.patch b/package/libpam-tacplus/0004-tacc-c-fix-build-failure-when-time_t-is-64-bits.patch
new file mode 100644
index 0000000000..327cc82b4e
--- /dev/null
+++ b/package/libpam-tacplus/0004-tacc-c-fix-build-failure-when-time_t-is-64-bits.patch
@@ -0,0 +1,48 @@
+From f3913777ea8373c58981061a01a7eda187ffc9d9 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 17 May 2020 14:41:47 +0200
+Subject: [PATCH] tacc.c: fix build failure when time_t is 64 bits
+
+Build can fail if time_t is 64 bits and not 32 bits because of the
+following warning (which results in a build failure due to -Werror):
+
+tacc.c: In function 'main':
+tacc.c:346:25: error: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'time_t' {aka 'long long int'} [-Werror=format=]
+         sprintf(buf, "%lu", time(0));
+                       ~~^   ~~~~~~~
+                       %llu
+
+So replace %lu by %llu
+
+Fixes:
+ - http://autobuild.buildroot.org/results/874433d8cb30d21332f23024081a8b6d7b3254ae
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/kravietz/pam_tacplus/commit/f3913777ea8373c58981061a01a7eda187ffc9d9]
+---
+ tacc.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tacc.c b/tacc.c
+index ef9d081..9260373 100644
+--- a/tacc.c
++++ b/tacc.c
+@@ -343,7 +343,7 @@ int main(int argc, char **argv) {
+         /* start accounting */
+         struct tac_attrib *attr = NULL;
+ 
+-        sprintf(buf, "%lu", time(0));
++        sprintf(buf, "%llu", time(0));
+         tac_add_attrib(&attr, "start_time", buf);
+ 
+         // this is not crypto but merely an identifier
+@@ -452,7 +452,7 @@ int main(int argc, char **argv) {
+     if (do_account) {
+         /* stop accounting */
+         struct tac_attrib *attr = NULL;
+-        sprintf(buf, "%lu", time(0));
++        sprintf(buf, "%llu", time(0));
+         tac_add_attrib(&attr, "stop_time", buf);
+         sprintf(buf, "%hu", task_id);
+         tac_add_attrib(&attr, "task_id", buf);
-- 
2.26.2
