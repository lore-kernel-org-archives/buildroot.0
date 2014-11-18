From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Nov 2014 13:24:18 +0100
Subject: [Buildroot] [git commit] iputils: fix hang issue with ping -f
Message-ID: <20141118122658.CFF5CB5AB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e0ecfd6eb7bd54b0bef6a257cba88e733be03038
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch from upstream git (git://git.linux-ipv6.org/gitroot/iputils.git). We
should probably bump the version to a newer snapshot in the 2015.02 cycle,
but this is a safer option for 2014.11.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-ping-ping6-Fix-hang-with-f-option.patch   |   34 ++++++++++++++++++++
 1 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/iputils/0001-ping-ping6-Fix-hang-with-f-option.patch b/package/iputils/0001-ping-ping6-Fix-hang-with-f-option.patch
new file mode 100644
index 0000000..fe1ab77
--- /dev/null
+++ b/package/iputils/0001-ping-ping6-Fix-hang-with-f-option.patch
@@ -0,0 +1,34 @@
+From 712fddacfb5c4a8a48d9c5debe1870bc051d836c Mon Sep 17 00:00:00 2001
+From: YOSHIFUJI Hideaki <yoshfuji@linux-ipv6.org>
+Date: Tue, 6 Nov 2012 02:44:12 +0900
+Subject: [PATCH] ping,ping6: Fix hang with -f option.
+
+Bug was introduced by commit 8feb586c4... (ping,ping6: Check return
+value of write(2) for stdout.).
+
+https://bugs.archlinux.org/task/32306
+
+Patch-by: Jan Synacek <jsynacek@redhat.com>
+Reported-by: Mohammad Alsaleh <msal@tormail.org>
+Signed-off-by: YOSHIFUJI Hideaki <yoshfuji@linux-ipv6.org>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ ping_common.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ping_common.h b/ping_common.h
+index d2a2b5c..6726e1b 100644
+--- a/ping_common.h
++++ b/ping_common.h
+@@ -140,7 +140,7 @@ static inline void write_stdout(const char *str, size_t len)
+ 	do {
+ 		cc = write(STDOUT_FILENO, str + o, len - o);
+ 		o += cc;
+-	} while (len >= o || cc < 0);
++	} while (len > o || cc < 0);
+ }
+ 
+ /*
+-- 
+2.1.3
+
