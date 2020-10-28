From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Oct 2020 18:07:39 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/dvb-apps: fix
 build failure with glibc 2.31
Message-ID: <20201028165630.EA6E082AF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31388dc836e68f9f81762e2943fbbcd24507691a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

dvb-apps fails to build with glibc 2.31 with the following error:
| dvbdate.c: In function set_time:
| dvbdate.c:312:6: warning: implicit declaration of function stime; did you mean ctime? [-Wimplicit-function-declaration]
| 312 | if (stime(new_time)) {
| | ^~~~~
| | ctime

Fixes:

http://autobuild.buildroot.net/results/95f30c5e6af2274418bb44a20da7caac69f1dd68/

references:
1. https://gitweb.gentoo.org/repo/gentoo.git/commit/media-tv/linuxtv-dvb-apps/files/linuxtv-dvb-apps-glibc-2.31.patch?id=eb705f892eae45b93306c1de1407c1c22ac23956
2. https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=964223

Signed-off-by: Dagg Stompler <daggs@gmx.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bbe170dbcf4ddb63e76299214e2c18b16e5cf016)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dvb-apps/0006-fix-glibc-2.31.patch | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/package/dvb-apps/0006-fix-glibc-2.31.patch b/package/dvb-apps/0006-fix-glibc-2.31.patch
new file mode 100644
index 0000000000..079a24f149
--- /dev/null
+++ b/package/dvb-apps/0006-fix-glibc-2.31.patch
@@ -0,0 +1,21 @@
+dvbdate: fix compilation error with glibc 2.31
+
+as stime func doesn't exists anymore in newer versions of glibc >= 2.31 due
+to obseletion, a replacment with clock_settime is inorder to fix the issue.
+
+Signed-off-by: Dagg Stompler <daggs@gmx.com>
+
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
