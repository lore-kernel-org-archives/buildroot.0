From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Nov 2011 12:10:36 +0100
Subject: [Buildroot] [git commit] uClibc: add patches to fix daylight saving
	issues
Message-ID: <20111102114939.E9A988F415@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a43020192fb49ff49b9b3d2b6b1c7c0b0f13ce1c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ....9.31.1-fix-daylight-saving-time-handling.patch |   36 ++++++++++++++++++++
 ...-0.9.32-fix-daylight-saving-time-handling.patch |   36 ++++++++++++++++++++
 2 files changed, 72 insertions(+), 0 deletions(-)

diff --git a/toolchain/uClibc/uClibc-0.9.31.1-fix-daylight-saving-time-handling.patch b/toolchain/uClibc/uClibc-0.9.31.1-fix-daylight-saving-time-handling.patch
new file mode 100644
index 0000000..5a96113
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.31.1-fix-daylight-saving-time-handling.patch
@@ -0,0 +1,36 @@
+From 47f3da1cf49377c25772bb54d07db55225bbb142 Mon Sep 17 00:00:00 2001
+From: Guillaume Bourcier <guillaumebourcier@free.fr>
+Date: Tue, 11 Oct 2011 13:45:33 +0200
+Subject: [PATCH] libc: fix daylight saving time handling
+
+The algorithm computing daylight saving time incorrectly adds a day for
+each month after January for leap years. The clock shift from/to DST can
+be delayed if the last Sunday of a transition month is exactly seven
+days before the first of the following month.
+
+This change adds a day for the February month only.
+
+Signed-off-by: Guillaume Bourcier <guillaumebourcier@free.fr>
+Signed-off-by: Richard Braun <rbraun@sceen.net>
+Signed-off-by: Carmelo Amoroso <carmelo.amoroso@st.com>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ libc/misc/time/time.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/libc/misc/time/time.c b/libc/misc/time/time.c
+index 19d68e1..8e2ebf1 100644
+--- a/libc/misc/time/time.c
++++ b/libc/misc/time/time.c
+@@ -689,7 +689,7 @@ static int tm_isdst(register const struct tm *__restrict ptm,
+ 					++day;
+ 				}
+ 				monlen = 31 + day_cor[r->month -1] - day_cor[r->month];
+-				if (isleap && (r->month > 1)) {
++				if (isleap && (r->month == 2)) {
+ 					++monlen;
+ 				}
+ 				/* Wweekday (0 is Sunday) of 1st of the month
+-- 
+1.7.3.4
+
diff --git a/toolchain/uClibc/uClibc-0.9.32-fix-daylight-saving-time-handling.patch b/toolchain/uClibc/uClibc-0.9.32-fix-daylight-saving-time-handling.patch
new file mode 100644
index 0000000..5a96113
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.32-fix-daylight-saving-time-handling.patch
@@ -0,0 +1,36 @@
+From 47f3da1cf49377c25772bb54d07db55225bbb142 Mon Sep 17 00:00:00 2001
+From: Guillaume Bourcier <guillaumebourcier@free.fr>
+Date: Tue, 11 Oct 2011 13:45:33 +0200
+Subject: [PATCH] libc: fix daylight saving time handling
+
+The algorithm computing daylight saving time incorrectly adds a day for
+each month after January for leap years. The clock shift from/to DST can
+be delayed if the last Sunday of a transition month is exactly seven
+days before the first of the following month.
+
+This change adds a day for the February month only.
+
+Signed-off-by: Guillaume Bourcier <guillaumebourcier@free.fr>
+Signed-off-by: Richard Braun <rbraun@sceen.net>
+Signed-off-by: Carmelo Amoroso <carmelo.amoroso@st.com>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ libc/misc/time/time.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/libc/misc/time/time.c b/libc/misc/time/time.c
+index 19d68e1..8e2ebf1 100644
+--- a/libc/misc/time/time.c
++++ b/libc/misc/time/time.c
+@@ -689,7 +689,7 @@ static int tm_isdst(register const struct tm *__restrict ptm,
+ 					++day;
+ 				}
+ 				monlen = 31 + day_cor[r->month -1] - day_cor[r->month];
+-				if (isleap && (r->month > 1)) {
++				if (isleap && (r->month == 2)) {
+ 					++monlen;
+ 				}
+ 				/* Wweekday (0 is Sunday) of 1st of the month
+-- 
+1.7.3.4
+
