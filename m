From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Aug 2015 23:35:18 +0200
Subject: [Buildroot] [PATCH] package/canfestival: fix build with musl
Message-ID: <1440279318-19132-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/canfestival/0003-sigval-musl.patch | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 package/canfestival/0003-sigval-musl.patch

diff --git a/package/canfestival/0003-sigval-musl.patch b/package/canfestival/0003-sigval-musl.patch
new file mode 100644
index 0000000..7a4dadf
--- /dev/null
+++ b/package/canfestival/0003-sigval-musl.patch
@@ -0,0 +1,20 @@
+timers/unix: fix build with musl
+
+sigval_t is a glibcism, which is not defined in musl.
+
+Use the union instead.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN a/drivers/timers_unix/timers_unix.c b/drivers/timers_unix/timers_unix.c
+--- a/drivers/timers_unix/timers_unix.c	2014-06-12 14:07:16.000000000 +0200
++++ b/drivers/timers_unix/timers_unix.c	2015-08-22 23:12:26.921455179 +0200
+@@ -33,7 +33,7 @@
+ 	}
+ }
+ 
+-void timer_notify(sigval_t val)
++void timer_notify(union sigval val)
+ {
+ 	if(gettimeofday(&last_sig,NULL)) {
+ 		perror("gettimeofday()");
-- 
1.9.1
