From: Brendan Heading <brendanheading@gmail.com>
Date: Sun, 26 Jul 2015 23:50:45 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/exfat-utils: fix compilation
	error with musl
Message-ID: <1437951045-14508-1-git-send-email-brendanheading@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

exfat-utils build would not build on Linux unless __GLIBC__ was defined.
Patch added to use more relaxed __linux__ instead.

See http://autobuild.buildroot.net/results/c60/c60d0f9a93c90d41c3c86c78b0a0

Signed-off-by: Brendan Heading <brendanheading@gmail.com>

---
Changes v1 -> v2 :
   - removed unnecessary dependency change
   - improvements (much simpler patch) as suggested by Thomas P

Signed-off-by: Brendan Heading <brendanheading@gmail.com>
---
 .../0001-fix-compiling-with-non-glibc-libcs.patch  | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 package/exfat-utils/0001-fix-compiling-with-non-glibc-libcs.patch

diff --git a/package/exfat-utils/0001-fix-compiling-with-non-glibc-libcs.patch b/package/exfat-utils/0001-fix-compiling-with-non-glibc-libcs.patch
new file mode 100644
index 0000000..6244b16
--- /dev/null
+++ b/package/exfat-utils/0001-fix-compiling-with-non-glibc-libcs.patch
@@ -0,0 +1,23 @@
+[PATCH] fix compilation when libc does not define __GLIBC__
+
+libexfat would only compile on Linux with __GLIBC__ defined. Changed
+to use __linux__ which likely better fits the original intent.
+
+Signed-off-by: Brendan Heading <brendanheading@gmail.com>
+---
+ platform.h |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: libexfat/libexfat/platform.h
+===================================================================
+--- libexfat/libexfat/platform.h	(revision 422)
++++ libexfat/libexfat/platform.h	(working copy)
+@@ -24,7 +24,7 @@
+ #ifndef PLATFORM_H_INCLUDED
+ #define PLATFORM_H_INCLUDED
+ 
+-#if defined(__GLIBC__)
++#if defined(__linux__)
+ 
+ #include <endian.h>
+ #include <byteswap.h>
-- 
2.4.3
