From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri,  9 Aug 2013 11:36:59 +0200
Subject: [Buildroot] [PATCH 3/3] ltrace: Fix "strndup not declared" build
	failure on powerpc/uclibc
In-Reply-To: <1376041019-26688-1-git-send-email-jezz@sysmic.org>
References: <1376041019-26688-1-git-send-email-jezz@sysmic.org>
Message-ID: <1376041019-26688-4-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On some systems, strndup is declared only if _GNU_SOURCE is defined

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/ltrace/ltrace-fix-strndup-usage.patch |   15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 package/ltrace/ltrace-fix-strndup-usage.patch

diff --git a/package/ltrace/ltrace-fix-strndup-usage.patch b/package/ltrace/ltrace-fix-strndup-usage.patch
new file mode 100644
index 0000000..ccc0e2c
--- /dev/null
+++ b/package/ltrace/ltrace-fix-strndup-usage.patch
@@ -0,0 +1,15 @@
+With some systems, strndup is declared only if __USE_GNU is defined.
+
+--- a/sysdeps/linux-gnu/ppc/plt.c	2012-11-29 18:46:57.000000000 +0100
++++ b/sysdeps/linux-gnu/ppc/plt.c	2013-08-09 10:30:07.452044496 +0200
+@@ -20,6 +20,10 @@
+  * 02110-1301 USA
+  */
+ 
++#ifndef _GNU_SOURCE
++#  define _GNU_SOURCE 1
++#endif
++
+ #include <gelf.h>
+ #include <sys/ptrace.h>
+ #include <errno.h>
-- 
1.7.9.5
