From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Mar 2013 09:25:53 +0100
Subject: [Buildroot] [git commit] ltp-testsuite: fix build on uClibc exp10
Message-ID: <20130304093035.1742B9AE7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b49e2c11f66254502c5071a5ded611ccd702e2bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...tsuite-20101031-fix-build-on-uClibc-exp10.patch |   22 ++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite-20101031-fix-build-on-uClibc-exp10.patch b/package/ltp-testsuite/ltp-testsuite-20101031-fix-build-on-uClibc-exp10.patch
new file mode 100644
index 0000000..7a02d95
--- /dev/null
+++ b/package/ltp-testsuite/ltp-testsuite-20101031-fix-build-on-uClibc-exp10.patch
@@ -0,0 +1,22 @@
+Inspired by: http://peter.korsgaard.com/patches/alsa-utils/alsamixer-fix-build-on-uClibc-exp10.patch
+
+exp10 extension is not part of uClibc, so compute it.
+
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+
+diff -purN ltp-testsuite-20101031.orig/testcases/realtime/lib/libstats.c ltp-testsuite-20101031/testcases/realtime/lib/libstats.c
+--- ltp-testsuite-20101031.orig/testcases/realtime/lib/libstats.c	2012-10-22 23:19:02.306646174 +0200
++++ ltp-testsuite-20101031/testcases/realtime/lib/libstats.c	2012-10-22 23:25:41.554847766 +0200
+@@ -46,6 +46,11 @@
+ #include <libstats.h>
+ #include <librttest.h>
+ 
++#ifdef __UCLIBC__
++/* 10^x = 10^(log e^x) = (e^x)^log10 = e^(x * log 10) */
++#define exp10(x) (exp((x) * log(10)))
++#endif /* __UCLIBC__ */
++
+ int save_stats = 0;
+ 
+ /* static helper functions */
