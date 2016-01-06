From: Mason <slash.tmp@free.fr>
Date: Wed, 6 Jan 2016 14:09:16 +0100
Subject: [Buildroot] package/linux-fusion: 'struct msghdr' has no member
 named 'msg_iov'
In-Reply-To: <568BBD3F.2030607@free.fr>
References: <568BBD3F.2030607@free.fr>
Message-ID: <568D11FC.5030103@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/01/2016 13:55, Mason wrote:

> The linux-fusion package fails to build with recent kernels.

Might as well fix the other issue, while I'm at it.

Would my two fusion patches be accepted in buildroot if I make a
formal submission? (Who would review them?)

Looks like the upstream project is hibernating.

Regards.


linux-fusion-9.0.3/linux/drivers/char/fusion/fusiondev.c: In function 'call_ioctl':
linux-fusion-9.0.3/linux/drivers/char/fusion/fusiondev.c:775:39: warning: format '%ld' expects argument of type 'long int', but argument 7 has type 'int' [-Wformat=]


diff --git a/linux/drivers/char/fusion/fusiondev.c b/linux/drivers/char/fusion/fusiondev.c
index 7003407f7e1e..b145d7effa89 100644
--- a/linux/drivers/char/fusion/fusiondev.c
+++ b/linux/drivers/char/fusion/fusiondev.c
@@ -772,10 +772,11 @@ call_ioctl(FusionDev * dev, Fusionee * fusionee,
 
                     if (!(execute3.flags & FCEF_DONE)) {
                          if (execute3.flags & FCEF_ERROR) {
+                              long diff = execute3_bin - (FusionCallExecute3 *)arg;
                               printk( KERN_ERR "fusion: FUSION_CALL_EXECUTE3 with errorneous call (failed on previous ioctl call), "
                                                "call id %d, flags 0x%08x, arg %d, length %u, serial %u,  %ld\n",
                                       execute3.call_id, execute3.flags, execute3.call_arg, execute3.length, execute3.ret_length,
-                                      (execute3_bin - (FusionCallExecute3 *) arg) );
+                                      diff);
                               return -EIO;
                          }
 
