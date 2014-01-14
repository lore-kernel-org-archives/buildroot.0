From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 14 Jan 2014 11:22:27 +0000
Subject: [Buildroot] [PATCH] aiccu: fix undefined reference to clock_*
	functions
Message-ID: <1389698547-27787-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since glibc 2.17 the clock_* suite functions are available directly in
the main C library. For previous versions we still need -lrt to link.

Upstream is aware of this problem.

Fixes:
   http://autobuild.buildroot.net/results/c11/c1182b00f9d968e587acba15af4af905b92227f5/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 .../aiccu-0003-clock-suite-functions-fix.patch     |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 package/aiccu/aiccu-0003-clock-suite-functions-fix.patch

diff --git a/package/aiccu/aiccu-0003-clock-suite-functions-fix.patch b/package/aiccu/aiccu-0003-clock-suite-functions-fix.patch
new file mode 100644
index 0000000..365e72a
--- /dev/null
+++ b/package/aiccu/aiccu-0003-clock-suite-functions-fix.patch
@@ -0,0 +1,18 @@
+aiccu: fix undefined reference to clock_* functions
+
+Since glibc 2.17 the clock_* suite functions are available directly in 
+the main C library. For previous versions we still need -lrt to link.
+
+Signed-off-by: Vicente Olivert Riera <vincent.riera@imgtec.com>
+
+--- aiccu/unix-console/Makefile.orig	2014-01-14 10:17:20.204602513 +0000
++++ aiccu/unix-console/Makefile	2014-01-14 10:17:31.435777359 +0000
+@@ -42,7 +42,7 @@ CFLAGS	+= -D AICCU_CONSOLE
+ # Currently defaultly builds only on Linux, but other platforms might easily also support it
+ ifeq ($(shell uname | grep -c "Linux"),1)
+ CFLAGS	+= -D AICCU_GNUTLS
+-LDFLAGS += -lgnutls
++LDFLAGS += -lgnutls -lrt
+ endif
+ 
+ # Linux
-- 
1.7.1
