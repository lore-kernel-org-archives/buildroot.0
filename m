From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 17:54:59 +0200
Subject: [Buildroot] [git commit] boost: add workaround patch for musl issue
Message-ID: <20171021155029.47BFC81078@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f1d35569d39cb26cd1feba62aa410db16999f67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

musl has a bug in that <sched.h> defines CPU_ZERO(), which uses
memset(), but it doesn't have the prototype for it. This has been
fixed by upstream musl but until we rebuild our toolchains, let's have
a patch for Boost that works around this problem. We will of course
remove this patch once musl is updated to 1.1.17 and our toolchains
have been rebuilt.

Fixes:

  http://autobuild.buildroot.net/results/6884cff634367cb640940051a60e5e13f30f70a2/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boost/0004-workaround-musl-bug.patch | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/boost/0004-workaround-musl-bug.patch b/package/boost/0004-workaround-musl-bug.patch
new file mode 100644
index 0000000..8613f2f
--- /dev/null
+++ b/package/boost/0004-workaround-musl-bug.patch
@@ -0,0 +1,26 @@
+From 0506e46640989e1f919388ad36890bd6063cd43a Mon Sep 17 00:00:00 2001
+From: Zach van Rijn <me@zv.io>
+Date: Sat, 26 Aug 2017 01:32:56 -0400
+Subject: [PATCH] explicitly include <string.h> for memset()
+
+[Thomas: taken from
+https://github.com/boostorg/fiber/pull/142/commits/0506e46640989e1f919388ad36890bd6063cd43a. It
+is not going to be applied upstream because the actual bug is in musl,
+but it's a good enough workaround for now.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ libs/fiber/src/numa/linux/pin_thread.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libs/fiber/src/numa/linux/pin_thread.cpp b/libs/fiber/src/numa/linux/pin_thread.cpp
+index ae696be3..e9b3c423 100644
+--- a/libs/fiber/src/numa/linux/pin_thread.cpp
++++ b/libs/fiber/src/numa/linux/pin_thread.cpp
+@@ -9,6 +9,7 @@
+ extern "C" {
+ #include <pthread.h>
+ #include <sched.h>
++#include <string.h>
+ }
+ 
+ #include <system_error>
