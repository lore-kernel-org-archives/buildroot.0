From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  3 May 2012 08:59:03 -0300
Subject: [Buildroot] [PATCH] libmbus: patch out bcopy to fix build breakage
Message-ID: <1336046343-15336-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libmbus/libmbus-0.6.1-bcopy.patch |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 package/libmbus/libmbus-0.6.1-bcopy.patch

diff --git a/package/libmbus/libmbus-0.6.1-bcopy.patch b/package/libmbus/libmbus-0.6.1-bcopy.patch
new file mode 100644
index 0000000..8b8310c
--- /dev/null
+++ b/package/libmbus/libmbus-0.6.1-bcopy.patch
@@ -0,0 +1,15 @@
+Drop bcopy since it's deprecated.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+diff -Nura libmbus-0.6.1/mbus/mbus-tcp.c libmbus-0.6.1-bcopy/mbus/mbus-tcp.c
+--- libmbus-0.6.1/mbus/mbus-tcp.c	2011-11-06 02:34:28.000000000 -0300
++++ libmbus-0.6.1-bcopy/mbus/mbus-tcp.c	2012-05-03 08:11:39.680346347 -0300
+@@ -78,7 +78,7 @@
+         return NULL;
+     }
+ 
+-    bcopy((void *)(host_addr->h_addr), (void *)(&s_addr.sin_addr), host_addr->h_length);
++    memmove((void *)(&s_addr.sin_addr), (void *)(host_addr->h_addr), host_addr->h_length);
+ 
+     if (connect(handle->sock, (struct sockaddr *)&s_addr, sizeof(s_addr)) < 0)
+     {
-- 
1.7.3.4
