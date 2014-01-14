From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Jan 2014 22:26:14 +0100
Subject: [Buildroot] [git commit] aiccu: fix undefined reference to clock_*
	functions
Message-ID: <20140114214716.ABDAE9C4C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=80882ee66177160997ac449851aabce9e92e3333
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since glibc 2.17 the clock_* suite functions are available directly in
the main C library. For previous versions we still need -lrt to link.

Upstream is aware of this problem.

Fixes:
   http://autobuild.buildroot.net/results/c11/c1182b00f9d968e587acba15af4af905b92227f5/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../aiccu-0003-clock-suite-functions-fix.patch     |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

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
