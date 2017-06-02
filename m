From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  2 Jun 2017 20:04:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/bdwgc: re-add fix for pthread
	detection on uclinux platforms
Message-ID: <20170602180434.991-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/d63/d63ee2d03421cc671455be553ab35ada7ff78267/
http://autobuild.buildroot.net/results/d8f/d8f97fd92cd971a0d125f983765ef27c5ac87acb/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Apparently I misread the github changelog: our uclinux patch was not
applied to the 7.6.0 release, we still need the backported patch, sorry.

 .../0003-configure-match-uclinux-pattern.patch     | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/bdwgc/0003-configure-match-uclinux-pattern.patch

diff --git a/package/bdwgc/0003-configure-match-uclinux-pattern.patch b/package/bdwgc/0003-configure-match-uclinux-pattern.patch
new file mode 100644
index 000000000..b2c61982a
--- /dev/null
+++ b/package/bdwgc/0003-configure-match-uclinux-pattern.patch
@@ -0,0 +1,27 @@
+From a628c90bdbf397465ac2ab2b11f14eb2e853651c Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 6 Aug 2016 23:24:35 +0200
+Subject: [PATCH] configure: match uclinux pattern
+
+BDWGC does not recognize "uclinux" as a valid OS part of the target
+tuple which is used by some arm cortex-M toolchains.
+
+* configure.ac [$THREADS=pthreads] (GC_LINUX_THREADS, _REENTRANT): Define
+for hosts matching "*-*-*linux*" (instead of "*-*-linux*").
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 22353547..fa745b56 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -190,7 +190,7 @@ case "$THREADS" in
+         AC_DEFINE(THREAD_LOCAL_ALLOC)
+         AC_MSG_WARN("Explicit GC_INIT() calls may be required.");
+         ;;
+-     *-*-linux* | *-*-nacl*)
++     *-*-*linux* | *-*-nacl*)
+         AC_DEFINE(GC_LINUX_THREADS)
+         AC_DEFINE(_REENTRANT)
+         ;;
-- 
2.11.0
