From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  1 Aug 2020 14:26:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/vdr: fix build with glibc 2.31
Message-ID: <20200801122604.1010057-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/b8475cfddee94d2938be98356e53328b5cd064b5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ility-with-current-versions-of-glibc.patch | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/vdr/0002-Fixed-compatibility-with-current-versions-of-glibc.patch

diff --git a/package/vdr/0002-Fixed-compatibility-with-current-versions-of-glibc.patch b/package/vdr/0002-Fixed-compatibility-with-current-versions-of-glibc.patch
new file mode 100644
index 0000000000..32c0e97ac1
--- /dev/null
+++ b/package/vdr/0002-Fixed-compatibility-with-current-versions-of-glibc.patch
@@ -0,0 +1,27 @@
+From 930c2cd2eb8947413e88404fa94c66e4e1db5ad6 Mon Sep 17 00:00:00 2001
+From: Klaus Schmidinger <vdr@tvdr.de>
+Date: Mon, 4 May 2020 12:28:31 +0200
+Subject: Fixed compatibility with current versions of glibc
+
+[Retrieved (and updated to remove CONTRIBUTORS and HISTORY) from:
+https://projects.vdr-developer.org/git/vdr.git/commit?id=930c2cd2eb8947413e88404fa94c66e4e1db5ad6]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+diff --git a/eit.c b/eit.c
+index 72a45e5..d437b44 100644
+--- a/eit.c
++++ b/eit.c
+@@ -391,7 +391,9 @@ cTDT::cTDT(const u_char *Data)
+   if (abs(diff) > MAX_TIME_DIFF) {
+      mutex.Lock();
+      if (abs(diff) > MAX_ADJ_DIFF) {
+-        if (stime(&dvbtim) == 0)
++        timespec ts = { 0 };
++        ts.tv_sec = dvbtim;
++        if (clock_settime(CLOCK_REALTIME, &ts) == 0)
+            isyslog("system time changed from %s (%ld) to %s (%ld)", *TimeToString(loctim), loctim, *TimeToString(dvbtim), dvbtim);
+         else
+            esyslog("ERROR while setting system time: %m");
+-- 
+cgit v0.10.2
+
-- 
2.27.0
