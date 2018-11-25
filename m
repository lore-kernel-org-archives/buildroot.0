From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Nov 2018 09:39:20 +0100
Subject: [Buildroot] [git commit] package/keepalived: fix build with uclibc
Message-ID: <20181202071559.49316815BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b0176cc7d5a407a750b6f3886e4889632367129
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Retrieve patch from upstream to fix build on uclibc

Fixes:
 - http://autobuild.buildroot.org/results/067ef9ae106b3e0740a70f6f9591b9da00d3da6a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Rename-TIMER_MAX-to-TIMER_MAXIMUM.patch   | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/package/keepalived/0001-Rename-TIMER_MAX-to-TIMER_MAXIMUM.patch b/package/keepalived/0001-Rename-TIMER_MAX-to-TIMER_MAXIMUM.patch
new file mode 100644
index 0000000000..4402b48a8b
--- /dev/null
+++ b/package/keepalived/0001-Rename-TIMER_MAX-to-TIMER_MAXIMUM.patch
@@ -0,0 +1,61 @@
+From 7d4856e213f349bcd97b3644b01d6170b226de16 Mon Sep 17 00:00:00 2001
+From: Quentin Armitage <quentin@armitage.org.uk>
+Date: Tue, 20 Nov 2018 17:24:58 +0000
+Subject: [PATCH] Rename TIMER_MAX to TIMER_MAXIMUM
+
+ulibC defines TIMER_MAX, so to avoid naming conflict rename it.
+
+This issue was reported by Paul Gildea <gildeap@tcd.ie> who also
+provided the patch.
+
+Signed-off-by: Quentin Armitage <quentin@armitage.org.uk>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/acassen/keepalived/commit/7d4856e213f349bcd97b3644b01d6170b226de16]
+---
+ lib/parser.c | 8 ++++----
+ lib/parser.h | 2 +-
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/lib/parser.c b/lib/parser.c
+index 1d53595c0..cc9b644e2 100644
+--- a/lib/parser.c
++++ b/lib/parser.c
+@@ -1915,20 +1915,20 @@ read_timer(vector_t *strvec, size_t index, unsigned long *res, unsigned long min
+ #endif
+ 
+ 	if (!max_time)
+-		max_time = TIMER_MAX;
++		max_time = TIMER_MAXIMUM;
+ 
+ 	errno = 0;
+ 	timer = strtoul(vector_slot(strvec, index), &endptr, 10);
+-	*res = (timer > TIMER_MAX ? TIMER_MAX : timer) * TIMER_HZ;
++	*res = (timer > TIMER_MAXIMUM ? TIMER_MAXIMUM : timer) * TIMER_HZ;
+ 
+ 	if (FMT_STR_VSLOT(strvec, index)[0] == '-')
+ 		report_config_error(CONFIG_INVALID_NUMBER, "%snegative number '%s'", warn, FMT_STR_VSLOT(strvec, index));
+ 	else if (*endptr)
+ 		report_config_error(CONFIG_INVALID_NUMBER, "%sinvalid number '%s'", warn, FMT_STR_VSLOT(strvec, index));
+-	else if (errno == ERANGE || timer > TIMER_MAX)
++	else if (errno == ERANGE || timer > TIMER_MAXIMUM)
+ 		report_config_error(CONFIG_INVALID_NUMBER, "%snumber '%s' outside timer range", warn, FMT_STR_VSLOT(strvec, index));
+ 	else if (timer < min_time || timer > max_time)
+-		report_config_error(CONFIG_INVALID_NUMBER, "number '%s' outside range [%ld, %ld]", FMT_STR_VSLOT(strvec, index), min_time, max_time ? max_time : TIMER_MAX);
++		report_config_error(CONFIG_INVALID_NUMBER, "number '%s' outside range [%ld, %ld]", FMT_STR_VSLOT(strvec, index), min_time, max_time ? max_time : TIMER_MAXIMUM);
+ 	else
+ 		return true;
+ 
+diff --git a/lib/parser.h b/lib/parser.h
+index 88a74474a..291aa8ffe 100644
+--- a/lib/parser.h
++++ b/lib/parser.h
+@@ -38,7 +38,7 @@
+ #define MAXBUF	1024
+ 
+ /* Maximum time read_timer can return */
+-#define TIMER_MAX (ULONG_MAX / TIMER_HZ)
++#define TIMER_MAXIMUM (ULONG_MAX / TIMER_HZ)
+ 
+ /* Configuration test errors. These should be in decreasing order of severity */
+ typedef enum {
