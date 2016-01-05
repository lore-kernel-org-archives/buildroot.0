From: Mason <slash.tmp@free.fr>
Date: Tue, 5 Jan 2016 15:33:09 +0100
Subject: [Buildroot] package/linux-fusion: 'struct msghdr' has no member
 named 'msg_iov'
In-Reply-To: <568BBD3F.2030607@free.fr>
References: <568BBD3F.2030607@free.fr>
Message-ID: <568BD425.4070502@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/01/2016 13:55, Mason wrote:

> The linux-fusion package fails to build with recent kernels.

Using LWN's article as a reference, I came up with the following patch.
Al, could you take a look, and see whether it looks correct?

The iov_iter interface
https://lwn.net/Articles/625077/


diff --git a/one/one_udp.c b/one/one_udp.c
index 26b9e6a1f729..5d8bd605fa68 100644
--- a/one/one_udp.c
+++ b/one/one_udp.c
@@ -161,7 +161,7 @@ ksocket_send_iov( struct socket      *sock,
                   const struct iovec *iov,
                   size_t              iov_count )
 {
-     struct msghdr msg;
+     struct msghdr msg = { addr, sizeof *addr };
      mm_segment_t oldfs;
      int size = 0;
      size_t len = 0;
@@ -178,18 +178,20 @@ ksocket_send_iov( struct socket      *sock,
      for (i=0; i<iov_count; i++)
           len += iov[i].iov_len;
 
-     msg.msg_flags = 0;
-     msg.msg_name = addr;
-     msg.msg_namelen  = sizeof(struct sockaddr_in);
-     msg.msg_control = NULL;
-     msg.msg_controllen = 0;
+#if LINUX_VERSION_CODE < KERNEL_VERSION(3,19,0)
      msg.msg_iov = (struct iovec*) iov;
      msg.msg_iovlen = iov_count;
-     msg.msg_control = NULL;
+#else
+     iov_iter_init(&msg.msg_iter, WRITE, iov, iov_count, len);
+#endif
 
      oldfs = get_fs();
      set_fs(KERNEL_DS);
-     size = sock_sendmsg(sock,&msg,len);
+#if LINUX_VERSION_CODE < KERNEL_VERSION(4,1,0)
+     size = sock_sendmsg(sock, &msg, len);
+#else
+     size = sock_sendmsg(sock, &msg);
+#endif
      set_fs(oldfs);
 
      return size;
@@ -198,7 +200,7 @@ ksocket_send_iov( struct socket      *sock,
 static int
 ksocket_receive(struct socket* sock, struct sockaddr_in* addr, void *buf, int len)
 {
-     struct msghdr msg;
+     struct msghdr msg = { addr, sizeof *addr };
      struct iovec iov;
      mm_segment_t oldfs;
      int size = 0;
@@ -213,14 +215,12 @@ ksocket_receive(struct socket* sock, struct sockaddr_in* addr, void *buf, int le
      iov.iov_base = buf;
      iov.iov_len = len;
 
-     msg.msg_flags = 0;
-     msg.msg_name = addr;
-     msg.msg_namelen  = sizeof(struct sockaddr_in);
-     msg.msg_control = NULL;
-     msg.msg_controllen = 0;
+#if LINUX_VERSION_CODE < KERNEL_VERSION(3,19,0)
      msg.msg_iov = &iov;
      msg.msg_iovlen = 1;
-     msg.msg_control = NULL;
+#else
+     iov_iter_init(&msg.msg_iter, READ, &iov, 1, len);
+#endif
 
      oldfs = get_fs();
      set_fs(KERNEL_DS);
