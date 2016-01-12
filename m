From: Mason <slash.tmp@free.fr>
Date: Tue, 12 Jan 2016 16:09:58 +0100
Subject: [Buildroot] [PATCH] linux-fusion: fix several build issues
Message-ID: <56951746.4070806@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The first patch merely fixes a warning. The other two are required to
use the module on Linux 4.x

Signed-off-by: Mason <slash.tmp@free.fr>
---
IMO, reading patches of patches is not very convenient. I can attach
the original patches if necessary.
---
 ...tched-conversion-spec-and-value-in-printk.patch |  30 +++++++
 ...fusion-Unknown-symbol-tasklist_lock-err-0.patch |  39 ++++++++
 .../0004-Port-one-one_udp.c-to-Linux-4.1.patch     | 100 +++++++++++++++++++++
 3 files changed, 169 insertions(+)
 create mode 100644 package/linux-fusion/0002-Fix-mismatched-conversion-spec-and-value-in-printk.patch
 create mode 100644 package/linux-fusion/0003-Fix-fusion-Unknown-symbol-tasklist_lock-err-0.patch
 create mode 100644 package/linux-fusion/0004-Port-one-one_udp.c-to-Linux-4.1.patch

diff --git a/package/linux-fusion/0002-Fix-mismatched-conversion-spec-and-value-in-printk.patch b/package/linux-fusion/0002-Fix-mismatched-conversion-spec-and-value-in-printk.patch
new file mode 100644
index 000000000000..18fd2395e0f7
--- /dev/null
+++ b/package/linux-fusion/0002-Fix-mismatched-conversion-spec-and-value-in-printk.patch
@@ -0,0 +1,30 @@
+From debb9cafe9b7cc2b286399ecc8e3210480061c70 Mon Sep 17 00:00:00 2001
+From: Mason <slash.tmp@free.fr>
+Date: Mon, 11 Jan 2016 15:42:16 +0100
+Subject: [PATCH 2/4] Fix mismatched conversion spec and value in printk
+
+linux/drivers/char/fusion/fusiondev.c:775:38: warning:
+format '%ld' expects argument of type 'long int', but argument 7 has type 'int'
+
+Subtracting two pointers yields a ptrdiff_t value, and ptrdiff_t is not
+necessarily an alias for long int. Cast the value to long int.
+---
+ linux/drivers/char/fusion/fusiondev.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/linux/drivers/char/fusion/fusiondev.c b/linux/drivers/char/fusion/fusiondev.c
+index 7003407f7e1e..dfb5f8ecb81a 100644
+--- a/linux/drivers/char/fusion/fusiondev.c
++++ b/linux/drivers/char/fusion/fusiondev.c
+@@ -775,7 +775,7 @@ call_ioctl(FusionDev * dev, Fusionee * fusionee,
+                               printk( KERN_ERR "fusion: FUSION_CALL_EXECUTE3 with errorneous call (failed on previous ioctl call), "
+                                                "call id %d, flags 0x%08x, arg %d, length %u, serial %u,  %ld\n",
+                                       execute3.call_id, execute3.flags, execute3.call_arg, execute3.length, execute3.ret_length,
+-                                      (execute3_bin - (FusionCallExecute3 *) arg) );
++                                      (long int)(execute3_bin - (FusionCallExecute3 *) arg) );
+                               return -EIO;
+                          }
+ 
+-- 
+2.6.3
+
diff --git a/package/linux-fusion/0003-Fix-fusion-Unknown-symbol-tasklist_lock-err-0.patch b/package/linux-fusion/0003-Fix-fusion-Unknown-symbol-tasklist_lock-err-0.patch
new file mode 100644
index 000000000000..191e47d1d367
--- /dev/null
+++ b/package/linux-fusion/0003-Fix-fusion-Unknown-symbol-tasklist_lock-err-0.patch
@@ -0,0 +1,39 @@
+From a6e950ea4827813c70fafa912c5c3d1f8a2ccaf4 Mon Sep 17 00:00:00 2001
+From: Mason <slash.tmp@free.fr>
+Date: Mon, 11 Jan 2016 16:45:30 +0100
+Subject: [PATCH 3/4] Fix fusion: Unknown symbol tasklist_lock (err 0)
+
+Commit 28f6569ab7d0 renamed TREE_PREEMPT_RCU to PREEMPT_RCU in 3.19
+As a result, the code incorrectly falls back to using tasklist_lock
+(which was made private in 2.6.18)
+
+Always use rcu_read_lock on modern kernels.
+---
+ linux/drivers/char/fusion/fusionee.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/linux/drivers/char/fusion/fusionee.c b/linux/drivers/char/fusion/fusionee.c
+index ef067f5bc831..adaabaedb355 100644
+--- a/linux/drivers/char/fusion/fusionee.c
++++ b/linux/drivers/char/fusion/fusionee.c
+@@ -925,7 +925,7 @@ fusionee_kill(FusionDev * dev,
+                if (f != fusionee && (!target || target == f->id)) {
+                     struct task_struct *p;
+ 
+-#if defined(CONFIG_TREE_RCU) || defined(CONFIG_TREE_PREEMPT_RCU) || defined(CONFIG_TINY_RCU) || defined(rcu_read_lock)
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,18) || defined(rcu_read_lock)
+                     rcu_read_lock();
+ #else
+                     read_lock(&tasklist_lock);
+@@ -946,7 +946,7 @@ fusionee_kill(FusionDev * dev,
+                          }
+                     }
+ 
+-#if defined(CONFIG_TREE_RCU) || defined(CONFIG_TREE_PREEMPT_RCU) || defined(CONFIG_TINY_RCU) || defined(rcu_read_unlock)
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,18) || defined(rcu_read_lock)
+                     rcu_read_unlock();
+ #else
+                     read_unlock(&tasklist_lock);
+-- 
+2.6.3
+
diff --git a/package/linux-fusion/0004-Port-one-one_udp.c-to-Linux-4.1.patch b/package/linux-fusion/0004-Port-one-one_udp.c-to-Linux-4.1.patch
new file mode 100644
index 000000000000..1e05808e9bc2
--- /dev/null
+++ b/package/linux-fusion/0004-Port-one-one_udp.c-to-Linux-4.1.patch
@@ -0,0 +1,100 @@
+From cd420f7ed42e4a580edbeb3bc49b8492f2c71b91 Mon Sep 17 00:00:00 2001
+From: Mason <slash.tmp@free.fr>
+Date: Tue, 12 Jan 2016 14:01:42 +0100
+Subject: [PATCH 4/4] Port one/one_udp.c to Linux 4.1
+
+Kernel commit c0371da6047a replaced msg_iov and msg_iovlen with msg_iter
+in struct msghdr since 3.19
+
+one/one_udp.c: In function 'ksocket_send_iov':
+one/one_udp.c:186:9: error: 'struct msghdr' has no member named 'msg_iov'
+one/one_udp.c:187:9: error: 'struct msghdr' has no member named 'msg_iovlen'
+
+one/one_udp.c: In function 'ksocket_receive':
+one/one_udp.c:221:9: error: 'struct msghdr' has no member named 'msg_iov'
+one/one_udp.c:222:9: error: 'struct msghdr' has no member named 'msg_iovlen'
+
+The iov_iter interface
+https://lwn.net/Articles/625077/
+
+Kernel commit d8725c86aeba dropped the len parameter in sock_sendmsg
+since 4.1
+
+one/one_udp.c: In function 'ksocket_send_iov':
+one/one_udp.c:192:13: error: too many arguments to function 'sock_sendmsg'
+---
+ one/one_udp.c | 30 +++++++++++++++---------------
+ 1 file changed, 15 insertions(+), 15 deletions(-)
+
+diff --git a/one/one_udp.c b/one/one_udp.c
+index 26b9e6a1f729..b1daae164cdf 100644
+--- a/one/one_udp.c
++++ b/one/one_udp.c
+@@ -161,7 +161,7 @@ ksocket_send_iov( struct socket      *sock,
+                   const struct iovec *iov,
+                   size_t              iov_count )
+ {
+-     struct msghdr msg;
++     struct msghdr msg = { addr, sizeof *addr };
+      mm_segment_t oldfs;
+      int size = 0;
+      size_t len = 0;
+@@ -178,18 +178,20 @@ ksocket_send_iov( struct socket      *sock,
+      for (i=0; i<iov_count; i++)
+           len += iov[i].iov_len;
+ 
+-     msg.msg_flags = 0;
+-     msg.msg_name = addr;
+-     msg.msg_namelen  = sizeof(struct sockaddr_in);
+-     msg.msg_control = NULL;
+-     msg.msg_controllen = 0;
++#if LINUX_VERSION_CODE < KERNEL_VERSION(3,19,0) // commit c0371da6047a
+      msg.msg_iov = (struct iovec*) iov;
+      msg.msg_iovlen = iov_count;
+-     msg.msg_control = NULL;
++#else
++     iov_iter_init(&msg.msg_iter, WRITE, iov, iov_count, len);
++#endif
+ 
+      oldfs = get_fs();
+      set_fs(KERNEL_DS);
+-     size = sock_sendmsg(sock,&msg,len);
++#if LINUX_VERSION_CODE < KERNEL_VERSION(4,1,0) // commit d8725c86aeba
++     size = sock_sendmsg(sock, &msg, len);
++#else
++     size = sock_sendmsg(sock, &msg);
++#endif
+      set_fs(oldfs);
+ 
+      return size;
+@@ -198,7 +200,7 @@ ksocket_send_iov( struct socket      *sock,
+ static int
+ ksocket_receive(struct socket* sock, struct sockaddr_in* addr, void *buf, int len)
+ {
+-     struct msghdr msg;
++     struct msghdr msg = { addr, sizeof *addr };
+      struct iovec iov;
+      mm_segment_t oldfs;
+      int size = 0;
+@@ -213,14 +215,12 @@ ksocket_receive(struct socket* sock, struct sockaddr_in* addr, void *buf, int le
+      iov.iov_base = buf;
+      iov.iov_len = len;
+ 
+-     msg.msg_flags = 0;
+-     msg.msg_name = addr;
+-     msg.msg_namelen  = sizeof(struct sockaddr_in);
+-     msg.msg_control = NULL;
+-     msg.msg_controllen = 0;
++#if LINUX_VERSION_CODE < KERNEL_VERSION(3,19,0) // commit c0371da6047a
+      msg.msg_iov = &iov;
+      msg.msg_iovlen = 1;
+-     msg.msg_control = NULL;
++#else
++     iov_iter_init(&msg.msg_iter, READ, &iov, 1, len);
++#endif
+ 
+      oldfs = get_fs();
+      set_fs(KERNEL_DS);
+-- 
+2.6.3
+
-- 
2.6.3
