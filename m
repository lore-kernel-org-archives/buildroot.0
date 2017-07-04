From: Matthew Shyu <matthew.shyu.amlogic@gmail.com>
Date: Tue,  4 Jul 2017 11:12:38 +0800
Subject: [Buildroot] [PATCH 1/1] linux-fusion: fix a build issue
Message-ID: <20170704031238.14389-1-matthew.shyu.amlogic@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matthew Shyu <matthew.shyu@amlogic.com>

size parameter from sock_recvmsg was removed from kernel API since 4.7

Signed-off-by: Matthew Shyu <matthew.shyu@amlogic.com>
---
 .../0004-Port-one-one_udp.c-to-Linux-4.1.patch     | 27 ++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/package/linux-fusion/0004-Port-one-one_udp.c-to-Linux-4.1.patch b/package/linux-fusion/0004-Port-one-one_udp.c-to-Linux-4.1.patch
index e1bff64f3b..3ee4dac487 100644
--- a/package/linux-fusion/0004-Port-one-one_udp.c-to-Linux-4.1.patch
+++ b/package/linux-fusion/0004-Port-one-one_udp.c-to-Linux-4.1.patch
@@ -24,12 +24,20 @@ one/one_udp.c: In function 'ksocket_send_iov':
 one/one_udp.c:192:13: error: too many arguments to function 'sock_sendmsg'
 
 Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
+
+Kernel commit 2da62906b1e29 dropped the size parameter in sock_recvmsg
+since 4.7
+
+In function 'ksocket_receive'
+one/one_udp.c:235:13: error: too many arguments to function 'sock_recvmsg'
+
+Signed-off-by: Matthew Shyu <matthew.shyu@amlogic.com>
 ---
- one/one_udp.c | 30 +++++++++++++++---------------
- 1 file changed, 15 insertions(+), 15 deletions(-)
+ one/one_udp.c | 34 +++++++++++++++++++---------------
+ 1 file changed, 19 insertions(+), 15 deletions(-)
 
 diff --git a/one/one_udp.c b/one/one_udp.c
-index 26b9e6a1f729..b1daae164cdf 100644
+index 26b9e6a..9b59529 100644
 --- a/one/one_udp.c
 +++ b/one/one_udp.c
 @@ -161,7 +161,7 @@ ksocket_send_iov( struct socket      *sock,
@@ -78,7 +86,7 @@ index 26b9e6a1f729..b1daae164cdf 100644
       struct iovec iov;
       mm_segment_t oldfs;
       int size = 0;
-@@ -213,14 +215,12 @@ ksocket_receive(struct socket* sock, struct sockaddr_in* addr, void *buf, int le
+@@ -213,18 +215,20 @@ ksocket_receive(struct socket* sock, struct sockaddr_in* addr, void *buf, int le
       iov.iov_base = buf;
       iov.iov_len = len;
  
@@ -97,3 +105,14 @@ index 26b9e6a1f729..b1daae164cdf 100644
  
       oldfs = get_fs();
       set_fs(KERNEL_DS);
++#if LINUX_VERSION_CODE < KERNEL_VERSION(4,7,0) // commit 2da62906b1e29
+      size = sock_recvmsg(sock,&msg,len,msg.msg_flags);
++#else
++     size = sock_recvmsg(sock, &msg,msg.msg_flags);
++#endif
+      set_fs(oldfs);
+ 
+      return size;
+-- 
+2.11.0
+
-- 
2.11.0
