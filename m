From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  6 Sep 2016 12:29:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv: Fix compiling VFP assembler
	code
Message-ID: <20160906102909.17812-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes build errors in ffmpeg
http://autobuild.buildroot.net/results/c32/c32a21240a9933796ee850349a62ff3c2314f25c/
http://autobuild.buildroot.net/results/22a/22a9769d83d2a398bb6b264d342b2077c41c9cc5/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...ypes_c.h-Fix-compiling-VFP-assembler-code.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/opencv/0003-types_c.h-Fix-compiling-VFP-assembler-code.patch

diff --git a/package/opencv/0003-types_c.h-Fix-compiling-VFP-assembler-code.patch b/package/opencv/0003-types_c.h-Fix-compiling-VFP-assembler-code.patch
new file mode 100644
index 0000000..85a23a0
--- /dev/null
+++ b/package/opencv/0003-types_c.h-Fix-compiling-VFP-assembler-code.patch
@@ -0,0 +1,37 @@
+From 18c868c47307b786d1bea729dccaad7f8d696cb7 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Tue, 6 Sep 2016 11:49:00 +0200
+Subject: [PATCH 1/1] types_c.h: Fix compiling VFP assembler code
+
+Replace asm by __asm__ according to
+https://gcc.gnu.org/onlinedocs/gcc/Alternate-Keywords.html#Alternate-Keywords
+as suggested by Arnout Vandecappelle:
+http://lists.busybox.net/pipermail/buildroot/2016-September/171491.html
+
+to fix build errors in ffmpeg with opencv2 support detected by
+buildroot autobuilders:
+http://autobuild.buildroot.net/results/c32/c32a21240a9933796ee850349a62ff3c2314f25c/build-end.log
+
+Patch sent upstream: https://github.com/opencv/opencv/pull/7242
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ modules/core/include/opencv2/core/types_c.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/modules/core/include/opencv2/core/types_c.h b/modules/core/include/opencv2/core/types_c.h
+index c21cd2c..771715d 100644
+--- a/modules/core/include/opencv2/core/types_c.h
++++ b/modules/core/include/opencv2/core/types_c.h
+@@ -318,7 +318,7 @@ enum {
+     int res; \
+     float temp; \
+     (void)temp; \
+-    asm(_asm_string : [res] "=r" (res), [temp] "=w" (temp) : [value] "w" (_value)); \
++    __asm__(_asm_string : [res] "=r" (res), [temp] "=w" (temp) : [value] "w" (_value)); \
+     return res;
+ // 2. version for double
+ #ifdef __clang__
+-- 
+2.9.3
+
-- 
2.9.3
