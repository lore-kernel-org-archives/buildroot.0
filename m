From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 18 May 2020 18:15:25 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/libpam-tacplus: fix build when time_t is 64 bits
Message-ID: <20200518161525.2935223-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/874433d8cb30d21332f23024081a8b6d7b3254ae

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Update patch to avoid a build failure when time_t is 32 bits

 ...build-failure-when-time_t-is-64-bits.patch | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 package/libpam-tacplus/0004-fix-build-failure-when-time_t-is-64-bits.patch

diff --git a/package/libpam-tacplus/0004-fix-build-failure-when-time_t-is-64-bits.patch b/package/libpam-tacplus/0004-fix-build-failure-when-time_t-is-64-bits.patch
new file mode 100644
index 0000000000..c349674d16
--- /dev/null
+++ b/package/libpam-tacplus/0004-fix-build-failure-when-time_t-is-64-bits.patch
@@ -0,0 +1,80 @@
+From 74a6cc484a83270273b373da17c05c1e394d3dd9 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 17 May 2020 21:55:11 +0200
+Subject: [PATCH] fix build failure when time_t is 64 bits
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
+Instead of casting time_t to unsigned long as already done in
+pam_tacplus.c, use strftime which seems the right approach to
+convert time_t into a string. While at it, also update pam_tacplus.c.
+
+Fixes:
+ - http://autobuild.buildroot.org/results/874433d8cb30d21332f23024081a8b6d7b3254ae
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/kravietz/pam_tacplus/commit/74a6cc484a83270273b373da17c05c1e394d3dd9]
+---
+ pam_tacplus.c |  6 +++++-
+ tacc.c        | 12 ++++++++++--
+ 2 files changed, 15 insertions(+), 3 deletions(-)
+
+diff --git a/pam_tacplus.c b/pam_tacplus.c
+index 7d8bb5f..a0cb83d 100644
+--- a/pam_tacplus.c
++++ b/pam_tacplus.c
+@@ -86,10 +86,14 @@ int _pam_send_account(int tac_fd, int type, const char *user, char *tty,
+ 	char buf[64];
+ 	struct tac_attrib *attr;
+ 	int retval;
++	time_t t;
++	struct tm tm;
+ 
+ 	attr = (struct tac_attrib *) xcalloc(1, sizeof(struct tac_attrib));
+ 
+-	sprintf(buf, "%lu", (unsigned long) time(NULL));
++	t = time(NULL);
++	gmtime_r(&t, &tm);
++	strftime(buf, sizeof(buf), "%s", &tm);
+ 
+ 	if (type == TAC_PLUS_ACCT_FLAG_START) {
+ 		tac_add_attrib(&attr, "start_time", buf);
+diff --git a/tacc.c b/tacc.c
+index ef9d081..affc649 100644
+--- a/tacc.c
++++ b/tacc.c
+@@ -342,8 +342,12 @@ int main(int argc, char **argv) {
+     if (do_account) {
+         /* start accounting */
+         struct tac_attrib *attr = NULL;
++        time_t t;
++        struct tm tm;
+ 
+-        sprintf(buf, "%lu", time(0));
++        t = time(0);
++        gmtime_r(&t, &tm);
++        strftime(buf, sizeof(buf), "%s", &tm);
+         tac_add_attrib(&attr, "start_time", buf);
+ 
+         // this is not crypto but merely an identifier
+@@ -452,7 +456,11 @@ int main(int argc, char **argv) {
+     if (do_account) {
+         /* stop accounting */
+         struct tac_attrib *attr = NULL;
+-        sprintf(buf, "%lu", time(0));
++        time_t t;
++        struct tm tm;
++        t = time(0);
++        gmtime_r(&t, &tm);
++        strftime(buf, sizeof(buf), "%s", &tm);
+         tac_add_attrib(&attr, "stop_time", buf);
+         sprintf(buf, "%hu", task_id);
+         tac_add_attrib(&attr, "task_id", buf);
-- 
2.26.2
