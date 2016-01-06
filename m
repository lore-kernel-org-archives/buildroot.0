From: Mason <slash.tmp@free.fr>
Date: Wed, 6 Jan 2016 17:35:22 +0100
Subject: [Buildroot] package/linux-fusion: 'struct msghdr' has no member
 named 'msg_iov'
In-Reply-To: <568BBD3F.2030607@free.fr>
References: <568BBD3F.2030607@free.fr>
Message-ID: <568D424A.8060500@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/01/2016 13:55, Mason wrote:

> The linux-fusion package fails to build with recent kernels.

There is also an issue /loading/ the module.

# modprobe fusion
[   49.971930] fusion: Unknown symbol tasklist_lock (err 0)

The tasklist_lock export was removed in 2.6.18
Kernel commit c59923a15c12d2b3597af913bf234a0ef264a38b

The actual issue was fixed in 2010, but returned in 3.19
because TREE_PREEMPT_RCU was renamed to PREEMPT_RCU.

The long-term fix seems to be along these lines:


diff --git a/linux/drivers/char/fusion/fusionee.c b/linux/drivers/char/fusion/fusionee.c
index ef067f5bc831..adaabaedb355 100644
--- a/linux/drivers/char/fusion/fusionee.c
+++ b/linux/drivers/char/fusion/fusionee.c
@@ -925,7 +925,7 @@ fusionee_kill(FusionDev * dev,
                if (f != fusionee && (!target || target == f->id)) {
                     struct task_struct *p;
 
-#if defined(CONFIG_TREE_RCU) || defined(CONFIG_TREE_PREEMPT_RCU) || defined(CONFIG_TINY_RCU) || defined(rcu_read_lock)
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,18) || defined(rcu_read_lock)
                     rcu_read_lock();
 #else
                     read_lock(&tasklist_lock);
@@ -946,7 +946,7 @@ fusionee_kill(FusionDev * dev,
                          }
                     }
 
-#if defined(CONFIG_TREE_RCU) || defined(CONFIG_TREE_PREEMPT_RCU) || defined(CONFIG_TINY_RCU) || defined(rcu_read_unlock)
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,18) || defined(rcu_read_lock)
                     rcu_read_unlock();
 #else
                     read_unlock(&tasklist_lock);
