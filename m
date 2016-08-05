From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  5 Aug 2016 22:52:36 +0200
Subject: [Buildroot] [PATCH] netplug: add two patches to fix musl build
	issues
Message-ID: <1470430356-29349-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds two patches to netplug that are needed for this package
to build with musl:

 - One patch to add a missing header inclusion
 - One patch to fix a conflicting prototype on __assert_fail().

Fixes:

  http://autobuild.buildroot.net/results/c2a5dfedba46cc8eb3d0c5c43f1f76fe0bb1805f/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../netplug/0002-add-missing-time-include.patch    | 20 +++++++++
 package/netplug/0003-remove-assert-fail.patch      | 51 ++++++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 package/netplug/0002-add-missing-time-include.patch
 create mode 100644 package/netplug/0003-remove-assert-fail.patch

diff --git a/package/netplug/0002-add-missing-time-include.patch b/package/netplug/0002-add-missing-time-include.patch
new file mode 100644
index 0000000..f204c92
--- /dev/null
+++ b/package/netplug/0002-add-missing-time-include.patch
@@ -0,0 +1,20 @@
+Add missing <time.h> include
+
+netplug.h uses time_t, so it must include <time.h>. This fixes a build
+issue with the musl C library.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/netplug.h
+===================================================================
+--- a/netplug.h
++++ b/netplug.h
+@@ -20,7 +20,7 @@
+ #ifndef __netplug_h
+ #define __netplug_h
+ 
+-
++#include <time.h>
+ #include <asm/types.h>
+ #include <sys/socket.h>
+ #include <linux/netlink.h>
diff --git a/package/netplug/0003-remove-assert-fail.patch b/package/netplug/0003-remove-assert-fail.patch
new file mode 100644
index 0000000..635c462
--- /dev/null
+++ b/package/netplug/0003-remove-assert-fail.patch
@@ -0,0 +1,51 @@
+Remove __assert_fail()
+
+The netplug code uses the assert() macro in various places. In glibc
+internally, assert() uses a function called __assert_fail() to print a
+message and abort. Relying on internal glibc details, netplug
+re-defines __assert_fail() in the hope that it will get called instead
+of glibc internal version.
+
+This attempt:
+
+ * Doesn't work with uClibc, which doesn't use any __assert_fail()
+   function at all. It doesn't fail to build, but it is entirely
+   useless.
+
+ * Fails to build with musl, which also defines __assert_fail(), but
+   with a different prototype.
+
+We simply remove the __assert_fail() implementation, so that the C
+library implementation of assert() just does its normal work. The only
+functionality lost is that the message is displayed on the standard
+output rather than in netplug's logs (and this was only working with
+glibc anyway).
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/lib.c
+===================================================================
+--- a/lib.c
++++ b/lib.c
+@@ -199,21 +199,6 @@
+     return x;
+ }
+ 
+-
+-void
+-__assert_fail(const char *assertion, const char *file,
+-              unsigned int line, const char *function)
+-{
+-    do_log(LOG_CRIT, "%s:%u: %s%sAssertion `%s' failed",
+-           file, line,
+-           function ? function : "",
+-           function ? ": " : "",
+-           assertion);
+-
+-    abort();
+-}
+-
+-
+ /*
+  * Local variables:
+  * c-file-style: "stroustrup"
-- 
2.7.4
