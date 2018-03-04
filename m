From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Mar 2018 10:15:25 +0100
Subject: [Buildroot] [git commit] libv4l: fix libdvbv5 musl compile
Message-ID: <20180304091630.C9B1E816A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd95e2c3316396ac637791b21033539afb2eb159
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add optional copy of TEMP_FAILURE_RETRY macro.

Fixes [1]:

  ../../lib/libdvbv5/.libs/libdvbv5.so: undefined reference to `TEMP_FAILURE_RETRY'

[1] http://autobuild.buildroot.net/results/7aea0cbb9e7fe7d9919c9be04ba4567ddcf4e15e

Patch submitted upstream:
https://www.mail-archive.com/linux-media at vger.kernel.org/msg127134.html

[Peter: add upstream submission link as suggested by Baruch]
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...d-optional-copy-of-TEMP_FAILURE_RETRY-mac.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/libv4l/0003-libdvbv5-add-optional-copy-of-TEMP_FAILURE_RETRY-mac.patch b/package/libv4l/0003-libdvbv5-add-optional-copy-of-TEMP_FAILURE_RETRY-mac.patch
new file mode 100644
index 0000000000..cd22be15c4
--- /dev/null
+++ b/package/libv4l/0003-libdvbv5-add-optional-copy-of-TEMP_FAILURE_RETRY-mac.patch
@@ -0,0 +1,39 @@
+From abfe3e7b2b4af1de9b891f3a7a996b70533b0a27 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sun, 4 Mar 2018 09:07:51 +0100
+Subject: [PATCH] libdvbv5: add optional copy of TEMP_FAILURE_RETRY macro (fix
+ musl compile)
+
+Fixes:
+
+  ../../lib/libdvbv5/.libs/libdvbv5.so: undefined reference to `TEMP_FAILURE_RETRY'
+
+[Upstream: https://www.mail-archive.com/linux-media at vger.kernel.org/msg127134.html]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ lib/libdvbv5/dvb-dev-local.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/lib/libdvbv5/dvb-dev-local.c b/lib/libdvbv5/dvb-dev-local.c
+index 8bc99d1..7a76d65 100644
+--- a/lib/libdvbv5/dvb-dev-local.c
++++ b/lib/libdvbv5/dvb-dev-local.c
+@@ -44,6 +44,15 @@
+ # define _(string) string
+ #endif
+ 
++/* taken from glibc unistd.h */
++#ifndef TEMP_FAILURE_RETRY
++#define TEMP_FAILURE_RETRY(expression) \
++    ({ long int __result;                                                     \
++       do __result = (long int) (expression);                                 \
++       while (__result == -1L && errno == EINTR);                             \
++       __result; })
++#endif
++
+ struct dvb_dev_local_priv {
+ 	dvb_dev_change_t notify_dev_change;
+ 
+-- 
+2.16.2
+
