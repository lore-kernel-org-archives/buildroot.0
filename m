From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  3 May 2020 09:53:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/minidlna: fix build with musl-1.2.0
Message-ID: <20200503075312.703486-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/31b/31bf9814a5a45081cf58675a9f7fa7183b4ef0bf/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...nistd.h-include-to-fix-build-with-mu.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/minidlna/0001-uuid.c-add-asm-unistd.h-include-to-fix-build-with-mu.patch

diff --git a/package/minidlna/0001-uuid.c-add-asm-unistd.h-include-to-fix-build-with-mu.patch b/package/minidlna/0001-uuid.c-add-asm-unistd.h-include-to-fix-build-with-mu.patch
new file mode 100644
index 0000000000..5e64103c34
--- /dev/null
+++ b/package/minidlna/0001-uuid.c-add-asm-unistd.h-include-to-fix-build-with-mu.patch
@@ -0,0 +1,34 @@
+From 9e21f3f91195a7c4a73ebf112823f7dbb94732db Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 3 May 2020 09:42:57 +0200
+Subject: [PATCH] uuid.c: add asm/unistd.h include to fix build with
+ musl-1.2.0
+
+Build was broken due to musl commit
+https://git.musl-libc.org/cgit/musl/commit/?id=5a105f19b5aae79dd302899e634b6b18b3dcd0d6
+
+To fix also include asm/unistd.h following the configure.ac check for
+the __NR_clock_gettime syscall.
+
+Patch sent upstream: https://sourceforge.net/p/minidlna/patches/182/
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ uuid.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/uuid.c b/uuid.c
+index 6e6a9ec..78f110c 100644
+--- a/uuid.c
++++ b/uuid.c
+@@ -36,6 +36,7 @@
+ #if HAVE_MACH_MACH_TIME_H
+ #include <mach/mach_time.h>
+ #elif HAVE_CLOCK_GETTIME_SYSCALL
++#include <asm/unistd.h>
+ #include <sys/syscall.h>
+ #endif
+ 
+-- 
+2.26.2
+
-- 
2.26.2
