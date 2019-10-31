From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 31 Oct 2019 02:35:14 -0500
Subject: [Buildroot] [PATCH] package/rng-tools: replace non standard
 pthread_yield with sched_yield
Message-ID: <20191031073514.10739-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fixes a musl build failure where the non-standard pthread_yield
was used.

(Patch picked from upstream)

Fixes:
http://autobuild.buildroot.net/results/7479b5193cc3d6b98bbd7db4e4682945133eb2ff/

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 ...ace-non-standard-pthread_yield-with-.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/rng-tools/0002-rngd_jitter-replace-non-standard-pthread_yield-with-.patch

diff --git a/package/rng-tools/0002-rngd_jitter-replace-non-standard-pthread_yield-with-.patch b/package/rng-tools/0002-rngd_jitter-replace-non-standard-pthread_yield-with-.patch
new file mode 100644
index 0000000000..3ce6225fa5
--- /dev/null
+++ b/package/rng-tools/0002-rngd_jitter-replace-non-standard-pthread_yield-with-.patch
@@ -0,0 +1,33 @@
+From 96f1f4d5d718834c1fde610cbed89cfa9a2206f1 Mon Sep 17 00:00:00 2001
+From: Nicola Lunghi <25422924+nicola-lunghi@users.noreply.github.com>
+Date: Wed, 5 Jun 2019 16:38:21 +0100
+Subject: [PATCH] rngd_jitter: replace non standard pthread_yield with
+ sched_yield
+
+Upsteam commit:
+https://github.com/nhorman/rng-tools/commit/96f1f4d5d718834c1fde610cbed89cfa9a2206f1
+
+[Original was Nicola's but it does not include a Signed-off-by]
+Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
+
+
+---
+ rngd_jitter.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/rngd_jitter.c b/rngd_jitter.c
+index 979e613..54070ae 100644
+--- a/rngd_jitter.c
++++ b/rngd_jitter.c
+@@ -168,7 +168,7 @@ try_again:
+ 		} else if (request < need) {
+ 			if (request == -1) {
+ 				message(LOG_DAEMON|LOG_DEBUG, "failed read: %s\n", strerror(errno));
+-				pthread_yield();
++				sched_yield();
+ 			} else
+ 				message(LOG_DAEMON|LOG_DEBUG, "request of random data returns %ld less than need %ld\n",
+ 					request, need);
+-- 
+2.17.1
+
-- 
2.17.1
