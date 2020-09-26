From: Dagg Stompler <daggs@gmx.com>
Date: Sat, 26 Sep 2020 12:55:50 +0300
Subject: [Buildroot] [PATCH] dvb-apps: fix build failure with glibc 2.31
Message-ID: <20200926095550.27437-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dvb-apps fails to build with glibc 2.31 with the following error:
| dvbdate.c: In function set_time:
| dvbdate.c:312:6: warning: implicit declaration of function stime; did you mean ctime? [-Wimplicit-function-declaration]
|   312 |  if (stime(new_time)) {
|       |      ^~~~~
|       |      ctime

this patch takes from the first entry in the reference fixes it.

reference:
 1. https://gitweb.gentoo.org/repo/gentoo.git/commit/media-tv/linuxtv-dvb-apps/files/linuxtv-dvb-apps-glibc-2.31.patch?id=eb705f892eae45b93306c1de1407c1c22ac23956
 2. https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=964223

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 package/dvb-apps/0006-fix-glibc-2.31.patch | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 package/dvb-apps/0006-fix-glibc-2.31.patch

diff --git a/package/dvb-apps/0006-fix-glibc-2.31.patch b/package/dvb-apps/0006-fix-glibc-2.31.patch
new file mode 100644
index 0000000000..d404212b5e
--- /dev/null
+++ b/package/dvb-apps/0006-fix-glibc-2.31.patch
@@ -0,0 +1,14 @@
+--- a/util/dvbdate/dvbdate.c
++++ b/util/dvbdate/dvbdate.c
+@@ -309,7 +309,10 @@
+  */
+ int set_time(time_t * new_time)
+ {
+-	if (stime(new_time)) {
++	struct timespec s = {0};
++	s.tv_sec = new_time;
++
++	if (clock_settime(CLOCK_REALTIME, &s)) {
+ 		perror("Unable to set time");
+ 		return -1;
+ 	}
--
2.28.0
