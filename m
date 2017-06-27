From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 27 Jun 2017 21:08:33 +0200
Subject: [Buildroot] [PATCH] ndisc6: patch no longer required
Message-ID: <20170627190833.GA5404@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In uClibc-ng 1.0.25 the issue was fixed and FAVOR_BSD is gone.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/ndisc6/0001-trace-tcp-upd-uClibc-fix.patch | 64 ----------------------
 1 file changed, 64 deletions(-)
 delete mode 100644 package/ndisc6/0001-trace-tcp-upd-uClibc-fix.patch

diff --git a/package/ndisc6/0001-trace-tcp-upd-uClibc-fix.patch b/package/ndisc6/0001-trace-tcp-upd-uClibc-fix.patch
deleted file mode 100644
index f84719c..0000000
--- a/package/ndisc6/0001-trace-tcp-upd-uClibc-fix.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 0be2fe3a750b62cafca9794e37f040624d3a59de Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <jacmet@sunsite.dk>
-Date: Thu, 26 Apr 2012 23:45:25 +0200
-Subject: [PATCH] trace-{tcp,udp}.c: fix build on uClibc
-
-Selection of the BSD variant of struct tcphdr/udphdr on uClibc fails
-because of config.h. This is caused by config.h setting _GNU_SOURCE
-and the compat handling (uClibc doesn't have inet6_rth_*) including
-sys/types.h which in term includes features.h, which figures out
-what bsd/gnu/posix variant to use because of:
-
- /* If _BSD_SOURCE was defined by the user, favor BSD over POSIX.  */
- #if defined _BSD_SOURCE && \
-    !(defined _POSIX_SOURCE || defined _POSIX_C_SOURCE || \
-      defined _XOPEN_SOURCE || defined _XOPEN_SOURCE_EXTENDED || \
-      defined _GNU_SOURCE || defined _SVID_SOURCE)
- # define __FAVOR_BSD    1
- #endif
-
-The current workaround of undefining _GNU_SOURCE after config.h doesn't
-work as features.h has already been evaluated by then. Instead, simply
-don't include config.h as it isn't needed in these two files.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- src/trace-tcp.c |    5 -----
- src/trace-udp.c |    5 -----
- 2 files changed, 10 deletions(-)
-
-diff --git a/src/trace-tcp.c b/src/trace-tcp.c
-index 6a7732d..91b64c2 100644
---- a/src/trace-tcp.c
-+++ b/src/trace-tcp.c
-@@ -17,11 +17,6 @@
-  *  along with this program. If not, see <http://www.gnu.org/licenses/>. *
-  *************************************************************************/
- 
--#ifdef HAVE_CONFIG_H
--# include <config.h>
--#endif
--
--#undef _GNU_SOURCE
- #define _BSD_SOURCE 1
- 
- #include <string.h>
-diff --git a/src/trace-udp.c b/src/trace-udp.c
-index 821c24c..1754338 100644
---- a/src/trace-udp.c
-+++ b/src/trace-udp.c
-@@ -17,11 +17,6 @@
-  *  along with this program. If not, see <http://www.gnu.org/licenses/>. *
-  *************************************************************************/
- 
--#ifdef HAVE_CONFIG_H
--# include <config.h>
--#endif
--
--#undef _GNU_SOURCE
- #define _BSD_SOURCE 1
- 
- #include <string.h>
--- 
-1.7.10
-
-- 
2.1.4
