From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Feb 2016 23:05:40 +0100
Subject: [Buildroot] [git commit branch/next] package/kexec: Fix musl build
	issue related to loff_t
Message-ID: <20160220220650.19605801DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae047147e8a08a769ab5491b1aa00db57645e458
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes
http://autobuild.buildroot.net/results/c19/c19a016b7fd50b8cef110e70e6f3af7cd0369368/

[Peter: extend commit message]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-vmcore-dmesg-Define-_GNU_SOURCE.patch     | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/kexec/0001-vmcore-dmesg-Define-_GNU_SOURCE.patch b/package/kexec/0001-vmcore-dmesg-Define-_GNU_SOURCE.patch
new file mode 100644
index 0000000..adaac2f
--- /dev/null
+++ b/package/kexec/0001-vmcore-dmesg-Define-_GNU_SOURCE.patch
@@ -0,0 +1,38 @@
+Fix musl build
+
+Downloaded from http://patchwork.openembedded.org/patch/112685/
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+
+From d811875a41b4628040abaada3da29b7b9592e757 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 9 Jan 2016 17:16:16 -0800
+Subject: [PATCH] vmcore-dmesg: Define _GNU_SOURCE
+
+loff_t is guarded with _GNU_SOURCE on some C library implementations
+e.g. musl since this type is not defined by POSIX. Define _GNU_SOURCE to
+include this define, it should help compiling on musl while nothing
+changes for glibc based systems since there _GNU_SOURCE is already
+defined
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ vmcore-dmesg/vmcore-dmesg.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/vmcore-dmesg/vmcore-dmesg.c b/vmcore-dmesg/vmcore-dmesg.c
+index 0364636..a8f56df 100644
+--- a/vmcore-dmesg/vmcore-dmesg.c
++++ b/vmcore-dmesg/vmcore-dmesg.c
+@@ -1,4 +1,5 @@
+ #define _XOPEN_SOURCE 600
++#define _GNU_SOURCE
+ #define _LARGEFILE_SOURCE 1
+ #define _FILE_OFFSET_BITS 64
+ #include <endian.h>
+-- 
+2.7.0
+
