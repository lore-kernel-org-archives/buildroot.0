From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Nov 2020 22:03:20 +0100
Subject: [Buildroot] [git commit branch/next] package/busybox: Fix hwclock
 for glibc 2.31+
Message-ID: <20201117203828.A240286C67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b4b9289aac5b6d77a8c8e4644326dafe88bc335
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Pick the below patch from upstream, in order to fix
'settimeofday: Invalid argument' introduced by using glibc v2.31+.
(busybox hasn't tagged a new version since).

See https://bugs.busybox.net/show_bug.cgi?id=12756 for more info.

Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-hwclock-Fix-settimeofday-for-glibc-v2.31.patch | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/package/busybox/0003-hwclock-Fix-settimeofday-for-glibc-v2.31.patch b/package/busybox/0003-hwclock-Fix-settimeofday-for-glibc-v2.31.patch
new file mode 100644
index 0000000000..cab346acf3
--- /dev/null
+++ b/package/busybox/0003-hwclock-Fix-settimeofday-for-glibc-v2.31.patch
@@ -0,0 +1,58 @@
+From 1a5d6fcbb5e606ab4acdf22afa26361a25f1d43b Mon Sep 17 00:00:00 2001
+From: Eddie James <eajames@linux.ibm.com>
+Date: Mon, 10 Aug 2020 09:59:02 -0500
+Subject: [PATCH] hwclock: Fix settimeofday for glibc v2.31+
+
+The glibc implementation changed for settimeofday, resulting in "invalid
+argument" error when attempting to set both timezone and time with a single
+call. Fix this by calling settimeofday twice
+
+Signed-off-by: Eddie James <eajames@linux.ibm.com>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+---
+ util-linux/hwclock.c | 14 +++++++++++---
+ 1 file changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/util-linux/hwclock.c b/util-linux/hwclock.c
+index dc97d8fb4..2479e7416 100644
+--- a/util-linux/hwclock.c
++++ b/util-linux/hwclock.c
+@@ -122,16 +122,20 @@ static void to_sys_clock(const char **pp_rtcname, int utc)
+ 	struct timeval tv;
+ 	struct timezone tz;
+ 
+-	tz.tz_minuteswest = timezone/60;
++	tz.tz_minuteswest = timezone / 60;
+ 	/* ^^^ used to also subtract 60*daylight, but it's wrong:
+ 	 * daylight!=0 means "this timezone has some DST
+ 	 * during the year", not "DST is in effect now".
+ 	 */
+ 	tz.tz_dsttime = 0;
+ 
++	/* glibc v2.31+ returns an error if both args are non-NULL */
++	if (settimeofday(NULL, &tz))
++		bb_simple_perror_msg_and_die("settimeofday");
++
+ 	tv.tv_sec = read_rtc(pp_rtcname, NULL, utc);
+ 	tv.tv_usec = 0;
+-	if (settimeofday(&tv, &tz))
++	if (settimeofday(&tv, NULL))
+ 		bb_simple_perror_msg_and_die("settimeofday");
+ }
+ 
+@@ -283,7 +287,11 @@ static void set_system_clock_timezone(int utc)
+ 	gettimeofday(&tv, NULL);
+ 	if (!utc)
+ 		tv.tv_sec += tz.tz_minuteswest * 60;
+-	if (settimeofday(&tv, &tz))
++
++	/* glibc v2.31+ returns an error if both args are non-NULL */
++	if (settimeofday(NULL, &tz))
++		bb_simple_perror_msg_and_die("settimeofday");
++	if (settimeofday(&tv, NULL))
+ 		bb_simple_perror_msg_and_die("settimeofday");
+ }
+ 
+-- 
+2.17.1
+
