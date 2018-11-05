From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon,  5 Nov 2018 02:02:29 +0100
Subject: [Buildroot] [PATCH 1/2] package/libnfs: add patch to fix musl build
 issue
Message-ID: <20181105010230.18425-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch to fix build issues with the musl C library.

This patch fixes an autobuild issue when linking the mpd package
against libnfs. The header file libnfs.h uses `struct timeval` which is
defined in `<sys/time.h>` for POSIX systems. Unfortunately, upstream
only includes it conditionally, based on the system. Therefore, we
remove the check in the first patch.

Reported upstream:
https://github.com/sahlberg/libnfs/issues/272

Fixes:
http://autobuild.buildroot.org/results/452/4522014698b9fe50720a71b663e47a75805bcf54
http://autobuild.buildroot.org/results/b0a/b0a0c20ad1705e9fa7ba4a12eb9c182e8077ab0c
http://autobuild.buildroot.org/results/53c/53c87361923cc177de7889523b3d16ba6b1d3d0f
.. and more.

Previous patch: Changes requested
http://patchwork.ozlabs.org/patch/973605/

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 .../libnfs/0001-Fix-include-sys-time.h.patch  | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/libnfs/0001-Fix-include-sys-time.h.patch

diff --git a/package/libnfs/0001-Fix-include-sys-time.h.patch b/package/libnfs/0001-Fix-include-sys-time.h.patch
new file mode 100644
index 0000000000..15b281672a
--- /dev/null
+++ b/package/libnfs/0001-Fix-include-sys-time.h.patch
@@ -0,0 +1,41 @@
+From 9df082012cba1dc32d83e5e8b0bdc0892f250058 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Mon, 5 Nov 2018 00:43:07 +0100
+Subject: [PATCH] Fix include sys/time.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+POSIX says `struct timeval` is defined if <sys/time.h> is included.
+
+Instead of the mess that is currently done based on the system on which
+the stuff is being compiled, include it unconditionally.
+
+Reported upstream:
+https://github.com/sahlberg/libnfs/issues/272
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ include/nfsc/libnfs.h | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/include/nfsc/libnfs.h b/include/nfsc/libnfs.h
+index 09dcf1c..b6db58c 100755
+--- a/include/nfsc/libnfs.h
++++ b/include/nfsc/libnfs.h
+@@ -24,12 +24,7 @@
+ #define _LIBNFS_H_
+ 
+ #include <stdint.h>
+-#if defined(__ANDROID__) || defined(AROS) \
+- || ( defined(__APPLE__) && defined(__MACH__) )
+ #include <sys/time.h>
+-#else
+-#include <time.h>
+-#endif
+ 
+ #ifdef __cplusplus
+ extern "C" {
+-- 
+2.19.1
+
-- 
2.19.1
