From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 3 May 2012 22:04:11 +0200
Subject: [Buildroot] [git commit] libmbus: patch out bcopy to fix build
	breakage
Message-ID: <20120503200434.0D56F96C68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c95522860fec2fa66b1b9c69cbf703999ea4233b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libmbus/libmbus-0.6.1-bcopy.patch |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

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
