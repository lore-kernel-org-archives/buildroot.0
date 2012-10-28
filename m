From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Oct 2012 17:40:34 +0100
Subject: [Buildroot] =?utf-8?q?=5BPATCH_4/7=5D_busybox=3A_add_fix_for_buil?=
	=?utf-8?q?d_issue_with_recent_C_libraries?=
In-Reply-To: <1351442438-20639-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1351442438-20639-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1351442438-20639-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The AArch64 toolchain uses a recent C library, which requires a build
fix in Busybox, which has been sent upstream but hasn't been merged
yet.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../busybox-1.20.2-fix-resource-h-failure.patch    |   30 ++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/busybox/busybox-1.20.2/busybox-1.20.2-fix-resource-h-failure.patch

diff --git a/package/busybox/busybox-1.20.2/busybox-1.20.2-fix-resource-h-failure.patch b/package/busybox/busybox-1.20.2/busybox-1.20.2-fix-resource-h-failure.patch
new file mode 100644
index 0000000..7667640
--- /dev/null
+++ b/package/busybox/busybox-1.20.2/busybox-1.20.2-fix-resource-h-failure.patch
@@ -0,0 +1,30 @@
+On a system running glibc trunk busybox doesn't compile:
+
+loginutils/passwd.c: In function ?passwd_main?:
+loginutils/passwd.c:104:16: error: storage size of ?rlimit_fsize? isn?t known
+loginutils/passwd.c:188:2: warning: implicit declaration of function ?setrlimit? [-Wimplicit-function-declaration]
+loginutils/passwd.c:188:12: error: ?RLIMIT_FSIZE? undeclared (first use in this function)
+loginutils/passwd.c:188:12: note: each undeclared identifier is reported only once for each function it appears in
+loginutils/passwd.c:104:16: warning: unused variable ?rlimit_fsize? [-Wunused-variable]
+...
+miscutils/time.c:23:16: error: field ?ru? has incomplete type
+
+Fix this by including sys/resource.h.
+
+Signed-off-by: Markus Trippelsdorf <markus@trippelsdorf.de>
+---
+ include/libbb.h |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/libbb.h b/include/libbb.h
+index f12800f..e7806c2 100644
+--- a/include/libbb.h
++++ b/include/libbb.h
+@@ -40,6 +40,7 @@
+ #include <sys/poll.h>
+ #include <sys/ioctl.h>
+ #include <sys/mman.h>
++#include <sys/resource.h>
+ #include <sys/socket.h>
+ #include <sys/stat.h>
+ #include <sys/time.h>
-- 
1.7.9.5
