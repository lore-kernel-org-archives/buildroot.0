From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Sep 2016 20:17:35 +0200
Subject: [Buildroot] [git commit] transmission: fix compile error
Message-ID: <20160930181812.70A3181D5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=abe444da62215d3802fb651f770075e3b72c35b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After update to uClibc-ng 1.0.18 transmission fails to
compile as the special treatment for sys/quota.h isn't required
anymore, because upstream synced with GNU libc to fix a samba4
compile problem.

Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ince-1.0.18-has-sys-quota.h-synced-with-G.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/transmission/0005-uClibc-ng-since-1.0.18-has-sys-quota.h-synced-with-G.patch b/package/transmission/0005-uClibc-ng-since-1.0.18-has-sys-quota.h-synced-with-G.patch
new file mode 100644
index 0000000..91a962a
--- /dev/null
+++ b/package/transmission/0005-uClibc-ng-since-1.0.18-has-sys-quota.h-synced-with-G.patch
@@ -0,0 +1,29 @@
+From 8682fe1bad44acc06154003ca9c9163b917bf4e3 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@uclibc-ng.org>
+Date: Thu, 29 Sep 2016 19:52:49 +0200
+Subject: [PATCH] uClibc-ng since 1.0.18 has sys/quota.h synced with GNU libc
+
+Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
+
+Pull Request:
+https://github.com/transmission/transmission/pull/42
+---
+ libtransmission/platform-quota.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libtransmission/platform-quota.c b/libtransmission/platform-quota.c
+index 58c518a..57377ef 100644
+--- a/libtransmission/platform-quota.c
++++ b/libtransmission/platform-quota.c
+@@ -284,7 +284,7 @@ getquota (const char * device)
+       spaceused = (int64_t) dq.dqb_curblocks >> 1;
+ #elif defined(__APPLE__)
+       spaceused = (int64_t) dq.dqb_curbytes;
+-#elif defined(__UCLIBC__)
++#elif defined(__UCLIBC__) && (__UCLIBC_MAJOR__ == 0 || (__UCLIBC_MAJOR__ == 1 && __UCLIBC_SUBLEVEL__ <= 17))
+       spaceused = (int64_t) btodb(dq.dqb_curblocks);
+ #elif defined(__sun) || (defined(_LINUX_QUOTA_VERSION) && _LINUX_QUOTA_VERSION < 2)
+       spaceused = (int64_t) dq.dqb_curblocks >> 1;
+-- 
+2.1.4
+
