From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2015 21:05:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: Fix
	sdksyms.sh to cope with gcc5
Message-ID: <1434308727-3959-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch |   52 ++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 package/x11r7/xserver_xorg-server/1.17.1/0002-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch

diff --git a/package/x11r7/xserver_xorg-server/1.17.1/0002-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch b/package/x11r7/xserver_xorg-server/1.17.1/0002-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch
new file mode 100644
index 0000000..01eefe5
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/1.17.1/0002-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch
@@ -0,0 +1,52 @@
+backported from upstream
+http://cgit.freedesktop.org/xorg/xserver/commit/hw/xfree86/sdksyms.sh?id=21b896939c5bb242f3aacc37baf12379e43254b6
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+
+From 21b896939c5bb242f3aacc37baf12379e43254b6 Mon Sep 17 00:00:00 2001
+From: Egbert Eich <eich@freedesktop.org>
+Date: Tue, 3 Mar 2015 16:27:05 +0100
+Subject: symbols: Fix sdksyms.sh to cope with gcc5
+
+Gcc5 adds additional lines stating line numbers before and
+after __attribute__() which need to be skipped.
+
+Signed-off-by: Egbert Eich <eich@freedesktop.org>
+Tested-by: Daniel Stone <daniels@collabora.com>
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+
+diff --git a/hw/xfree86/sdksyms.sh b/hw/xfree86/sdksyms.sh
+index 2305073..05ac410 100755
+--- a/hw/xfree86/sdksyms.sh
++++ b/hw/xfree86/sdksyms.sh
+@@ -350,13 +350,25 @@ BEGIN {
+     if (sdk) {
+ 	n = 3;
+ 
++        # skip line numbers GCC 5 adds before __attribute__
++        while ($n == "" || $0 ~ /^# [0-9]+ "/) {
++           getline;
++           n = 1;
++        }
++
+ 	# skip attribute, if any
+ 	while ($n ~ /^(__attribute__|__global)/ ||
+ 	    # skip modifiers, if any
+ 	    $n ~ /^\*?(unsigned|const|volatile|struct|_X_EXPORT)$/ ||
+ 	    # skip pointer
+-	    $n ~ /^[a-zA-Z0-9_]*\*$/)
++	    $n ~ /^[a-zA-Z0-9_]*\*$/) {
+ 	    n++;
++            # skip line numbers GCC 5 adds after __attribute__
++            while ($n == "" || $0 ~ /^# [0-9]+ "/) {
++               getline;
++               n = 1;
++            }
++        }
+ 
+ 	# type specifier may not be set, as in
+ 	#   extern _X_EXPORT unsigned name(...)
+-- 
+cgit v0.10.2
+
-- 
1.7.10.4
