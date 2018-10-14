From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 14 Oct 2018 20:11:38 +0200
Subject: [Buildroot] [PATCH 1/1] udftools: fix build with glibc 2.28
Message-ID: <20181014181138.22326-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

glibc 2.28 no longer includes <sys/sysmacros.h> from <sys/types.h>,
and therefore <sys/sysmacros.h> must be included explicitly when
major()/minor() are used.

Fixes:
 - http://autobuild.buildroot.org/results/33cb370ee80d0603974b6376f0364f914d150463

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...event-build-breakage-with-glibc-2-25.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/udftools/0003-Include-sys-sysmacros-h-to-prevent-build-breakage-with-glibc-2-25.patch

diff --git a/package/udftools/0003-Include-sys-sysmacros-h-to-prevent-build-breakage-with-glibc-2-25.patch b/package/udftools/0003-Include-sys-sysmacros-h-to-prevent-build-breakage-with-glibc-2-25.patch
new file mode 100644
index 0000000000..ac56715d62
--- /dev/null
+++ b/package/udftools/0003-Include-sys-sysmacros-h-to-prevent-build-breakage-with-glibc-2-25.patch
@@ -0,0 +1,38 @@
+From cca194f17fe2892c929acab2f1d5016ad38aa305 Mon Sep 17 00:00:00 2001
+From: Lars Wendler <polynomial-c@gentoo.org>
+Date: Tue, 2 Jan 2018 15:10:34 +0100
+Subject: [PATCH] Include <sys/sysmacros.h> to prevent build breakage with
+ >=glibc-2.25
+
+libtool: link: x86_64-pc-linux-gnu-gcc -march=native -mtune=native -O2
+-pipe -Wl,-O1 -Wl,--hash-style=gnu -Wl,--sort-common -Wl,--as-needed -o
+mkudffs main.o mkudffs.o defaults.o file.o options.o
+../libudffs/.libs/libudffs.a
+main.o: In function `is_whole_disk':
+main.c:(.text+0x2ce): undefined reference to `major'
+main.c:(.text+0x2dd): undefined reference to `minor'
+main.o: In function `main':
+main.c:(.text.startup+0x72f): undefined reference to `minor'
+main.c:(.text.startup+0x741): undefined reference to `major'
+collect2: error: ld returned 1 exit status
+make[1]: *** [Makefile:378: mkudffs] Error 1
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from
+https://github.com/pali/udftools/commit/cca194f17fe2892c929acab2f1d5016ad38aa305]
+---
+ mkudffs/main.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/mkudffs/main.c b/mkudffs/main.c
+index 066afac..3e306ac 100644
+--- a/mkudffs/main.c
++++ b/mkudffs/main.c
+@@ -43,6 +43,7 @@
+ #include <sys/ioctl.h>
+ #include <linux/fs.h>
+ #include <linux/fd.h>
++#include <sys/sysmacros.h>
+ 
+ #include "mkudffs.h"
+ #include "defaults.h"
-- 
2.17.1
