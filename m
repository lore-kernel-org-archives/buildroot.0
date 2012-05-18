From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 18 May 2012 22:22:07 +0200
Subject: [Buildroot] [git commit branch/next] libmbus: bump to version 0.7.0
Message-ID: <20120518202900.6DBDF96D27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=92c24094240f75b44023f6a2611f66c8d1db9656
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libmbus/libmbus-0.6.1-bcopy.patch |   15 ---------------
 package/libmbus/libmbus-bcopy.patch       |   16 ++++++++++++++++
 package/libmbus/libmbus.mk                |    4 ++--
 3 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/package/libmbus/libmbus-0.6.1-bcopy.patch b/package/libmbus/libmbus-0.6.1-bcopy.patch
deleted file mode 100644
index 8b8310c..0000000
--- a/package/libmbus/libmbus-0.6.1-bcopy.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Drop bcopy since it's deprecated.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-diff -Nura libmbus-0.6.1/mbus/mbus-tcp.c libmbus-0.6.1-bcopy/mbus/mbus-tcp.c
---- libmbus-0.6.1/mbus/mbus-tcp.c	2011-11-06 02:34:28.000000000 -0300
-+++ libmbus-0.6.1-bcopy/mbus/mbus-tcp.c	2012-05-03 08:11:39.680346347 -0300
-@@ -78,7 +78,7 @@
-         return NULL;
-     }
- 
--    bcopy((void *)(host_addr->h_addr), (void *)(&s_addr.sin_addr), host_addr->h_length);
-+    memmove((void *)(&s_addr.sin_addr), (void *)(host_addr->h_addr), host_addr->h_length);
- 
-     if (connect(handle->sock, (struct sockaddr *)&s_addr, sizeof(s_addr)) < 0)
-     {
diff --git a/package/libmbus/libmbus-bcopy.patch b/package/libmbus/libmbus-bcopy.patch
new file mode 100644
index 0000000..660cc37
--- /dev/null
+++ b/package/libmbus/libmbus-bcopy.patch
@@ -0,0 +1,16 @@
+Drop bcopy since it's deprecated.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura libmbus-0.7.0/mbus/mbus-tcp.c libmbus-0.7.0-bcopy/mbus/mbus-tcp.c
+--- libmbus-0.7.0/mbus/mbus-tcp.c	2011-12-08 13:21:19.000000000 -0300
++++ libmbus-0.7.0-bcopy/mbus/mbus-tcp.c	2012-05-03 09:08:36.987106612 -0300
+@@ -78,7 +78,7 @@
+         return NULL;
+     }
+ 
+-    bcopy((void *)(host_addr->h_addr), (void *)(&s.sin_addr), host_addr->h_length);
++    memmove((void *)(&s.sin_addr), (void *)(host_addr->h_addr), host_addr->h_length);
+ 
+     if (connect(handle->sock, (struct sockaddr *)&s, sizeof(s)) < 0)
+     {
diff --git a/package/libmbus/libmbus.mk b/package/libmbus/libmbus.mk
index 9abb2bf..17954b9 100644
--- a/package/libmbus/libmbus.mk
+++ b/package/libmbus/libmbus.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-LIBMBUS_VERSION = 0.6.1
-LIBMBUS_SITE = http://www.freescada.com/public-dist/
+LIBMBUS_VERSION = 0.7.0
+LIBMBUS_SITE = http://www.freescada.com/public-dist
 LIBMBUS_INSTALL_STAGING = YES
 
 # Without this the build yields an error:
