From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Feb 2014 23:58:05 +0100
Subject: [Buildroot] [PATCH 1/7] cairo: fix build on Blackfin in
	test/cairo-test-runner.c
In-Reply-To: <1393196291-12636-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1393196291-12636-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1393196291-12636-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch for Cairo that ensures <unistd.h> is properly included to
get the prototype of readlink and getppid even on non-MMU platforms.

Fixes:

  http://autobuild.buildroot.net/results/93a97f90345d193b52035b2dc7559a306e11098e/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cairo/cairo-003-fix-nofork-build.patch | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/cairo/cairo-003-fix-nofork-build.patch

diff --git a/package/cairo/cairo-003-fix-nofork-build.patch b/package/cairo/cairo-003-fix-nofork-build.patch
new file mode 100644
index 0000000..702e991
--- /dev/null
+++ b/package/cairo/cairo-003-fix-nofork-build.patch
@@ -0,0 +1,29 @@
+test: fix build when SHOULD_FORK is false
+
+The code in test/cairo-test-runner.c properly takes into account
+platforms that do have fork() support, and uses the SHOULD_FORK define
+to know whether fork is available or not.
+
+However, this SHOULD_FORK macro is used to guard the inclusion of
+<unistd.h>, which is needed to get the prototype of other functions
+(namely readlink and getppid), that are used in portions of this file
+not guarded by SHOULD_FORK.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/test/cairo-test-runner.c
+===================================================================
+--- a/test/cairo-test-runner.c
++++ b/test/cairo-test-runner.c
+@@ -36,10 +36,10 @@
+ #include <pixman.h> /* for version information */
+ 
+ #define SHOULD_FORK HAVE_FORK && HAVE_WAITPID
+-#if SHOULD_FORK
+ #if HAVE_UNISTD_H
+ #include <unistd.h>
+ #endif
++#if SHOULD_FORK
+ #if HAVE_SIGNAL_H
+ #include <signal.h>
+ #endif
-- 
1.8.3.2
