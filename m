Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5E6C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB0BE4FE81;
	Fri, 28 Feb 2025 16:49:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CXakIgtD1Ves; Fri, 28 Feb 2025 16:49:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC56A41E6B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC56A41E6B;
	Fri, 28 Feb 2025 16:49:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17AE868
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74F96424CC
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TZpTd_d1BmV5 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF1734247C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF1734247C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D6B2B86612; Fri, 28 Feb 2025 16:29:55 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 31 Dec 2024 18:17:50 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f0422b41df9d5b638b59ffc9811f9bce135f3e35
X-Git-Newrev: c438cf82563a641fc78284ae6b5b38f03ddb21fb
X-Patchwork-Hint: ignore
Message-Id: <20250228162955.D6B2B86612@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/igh-ethercat: fix
 build of tty module with recent kernels
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7795378243076063815=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7795378243076063815==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c438cf82563a641fc78284ae6b5b38f03ddb21fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since commit
eec3a1108a65ab8de4a313a7f34205c5d5ad8f2b ("package/igh-ethercat: add
configuration options"), we are building more components of
igh-ethercat, including the tty module, which fails to build with
Linux kernels >= 6.6.

This commit adds 3 patches, submitted upstream, that fix those build
failures.

Fixes:

  https://autobuild.buildroot.org/results/1bb799f4ae6140b67c4eb28c04aa45ccbd296b31/

Cc: Jannik Becher <becher.jannik@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...odule.c-mark-internal-functions-as-static.patch | 154 +++++++++++++++++++++
 ...c-fix-ec_tty_write-prototype-for-Linux-6..patch |  58 ++++++++
 ...c-fix-ec_tty_send_xchar-prototype-for-Lin.patch |  50 +++++++
 3 files changed, 262 insertions(+)

diff --git a/package/igh-ethercat/0001-tty-module.c-mark-internal-functions-as-static.patch b/package/igh-ethercat/0001-tty-module.c-mark-internal-functions-as-static.patch
new file mode 100644
index 0000000000..5d6dd6b9b6
--- /dev/null
+++ b/package/igh-ethercat/0001-tty-module.c-mark-internal-functions-as-static.patch
@@ -0,0 +1,154 @@
+From aed3ba0acb2c355be562cfbdb3a375682412c144 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 31 Dec 2024 10:28:41 +0100
+Subject: [PATCH] tty/module.c: mark internal functions as static
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+/home/autobuild/autobuild/instance-7/output-1/build/igh-ethercat-1.6.2/./tty/module.c:128:12: warning: no previous prototype for â€˜ec_tty_init_moduleâ€™ [-Wmissing-prototypes]
+  128 | int __init ec_tty_init_module(void)
+      |            ^~~~~~~~~~~~~~~~~~
+/home/autobuild/autobuild/instance-7/output-1/build/igh-ethercat-1.6.2/./tty/module.c:189:13: warning: no previous prototype for â€˜ec_tty_cleanup_moduleâ€™ [-Wmissing-prototypes]
+  189 | void __exit ec_tty_cleanup_module(void)
+      |             ^~~~~~~~~~~~~~~~~~~~~
+/home/autobuild/autobuild/instance-7/output-1/build/igh-ethercat-1.6.2/./tty/module.c:216:5: warning: no previous prototype for â€˜ec_tty_initâ€™ [-Wmissing-prototypes]
+  216 | int ec_tty_init(ec_tty_t *t, int minor,
+      |     ^~~~~~~~~~~
+/home/autobuild/autobuild/instance-7/output-1/build/igh-ethercat-1.6.2/./tty/module.c:293:6: warning: no previous prototype for â€˜ec_tty_clearâ€™ [-Wmissing-prototypes]
+  293 | void ec_tty_clear(ec_tty_t *tty)
+      |      ^~~~~~~~~~~~
+/home/autobuild/autobuild/instance-7/output-1/build/igh-ethercat-1.6.2/./tty/module.c:301:14: warning: no previous prototype for â€˜ec_tty_tx_sizeâ€™ [-Wmissing-prototypes]
+  301 | unsigned int ec_tty_tx_size(ec_tty_t *tty)
+      |              ^~~~~~~~~~~~~~
+/home/autobuild/autobuild/instance-7/output-1/build/igh-ethercat-1.6.2/./tty/module.c:316:14: warning: no previous prototype for â€˜ec_tty_tx_spaceâ€™ [-Wmissing-prototypes]
+  316 | unsigned int ec_tty_tx_space(ec_tty_t *tty)
+      |              ^~~~~~~~~~~~~~~
+/home/autobuild/autobuild/instance-7/output-1/build/igh-ethercat-1.6.2/./tty/module.c:323:14: warning: no previous prototype for â€˜ec_tty_rx_sizeâ€™ [-Wmissing-prototypes]
+  323 | unsigned int ec_tty_rx_size(ec_tty_t *tty)
+      |              ^~~~~~~~~~~~~~
+/home/autobuild/autobuild/instance-7/output-1/build/igh-ethercat-1.6.2/./tty/module.c:338:14: warning: no previous prototype for â€˜ec_tty_rx_spaceâ€™ [-Wmissing-prototypes]
+  338 | unsigned int ec_tty_rx_space(ec_tty_t *tty)
+      |              ^~~~~~~~~~~~~~~
+/home/autobuild/autobuild/instance-7/output-1/build/igh-ethercat-1.6.2/./tty/module.c:345:5: warning: no previous prototype for â€˜ec_tty_get_serial_infoâ€™ [-Wmissing-prototypes]
+  345 | int ec_tty_get_serial_info(ec_tty_t *tty, struct serial_struct *data)
+      |     ^~~~~~~~~~~~~~~~~~~~~~
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://gitlab.com/etherlab.org/ethercat/-/merge_requests/150
+---
+ tty/module.c | 26 +++++++++++++-------------
+ 1 file changed, 13 insertions(+), 13 deletions(-)
+
+diff --git a/tty/module.c b/tty/module.c
+index 05486940..af4c1b70 100644
+--- a/tty/module.c
++++ b/tty/module.c
+@@ -64,9 +64,9 @@ ec_tty_t *ttys[EC_TTY_MAX_DEVICES];
+ struct semaphore tty_sem;
+ 
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 15, 0)
+-void ec_tty_wakeup(struct timer_list *);
++static void ec_tty_wakeup(struct timer_list *);
+ #else
+-void ec_tty_wakeup(unsigned long);
++static void ec_tty_wakeup(unsigned long);
+ #endif
+ 
+ /****************************************************************************/
+@@ -125,7 +125,7 @@ static const struct tty_operations ec_tty_ops; // see below
+  *
+  * \return 0 on success, else < 0
+  */
+-int __init ec_tty_init_module(void)
++static int __init ec_tty_init_module(void)
+ {
+     int i, ret = 0;
+     unsigned flags = TTY_DRIVER_REAL_RAW | TTY_DRIVER_DYNAMIC_DEV;
+@@ -186,7 +186,7 @@ out_return:
+  *
+  * Clears all master instances.
+  */
+-void __exit ec_tty_cleanup_module(void)
++static void __exit ec_tty_cleanup_module(void)
+ {
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 7, 0)
+     int i;
+@@ -213,7 +213,7 @@ void __exit ec_tty_cleanup_module(void)
+  * ec_tty_t methods.
+  ****************************************************************************/
+ 
+-int ec_tty_init(ec_tty_t *t, int minor,
++static int ec_tty_init(ec_tty_t *t, int minor,
+         const ec_tty_operations_t *ops, void *cb_data)
+ {
+     int ret;
+@@ -290,7 +290,7 @@ int ec_tty_init(ec_tty_t *t, int minor,
+ 
+ /****************************************************************************/
+ 
+-void ec_tty_clear(ec_tty_t *tty)
++static void ec_tty_clear(ec_tty_t *tty)
+ {
+     del_timer_sync(&tty->timer);
+     tty_unregister_device(tty_driver, tty->minor);
+@@ -298,7 +298,7 @@ void ec_tty_clear(ec_tty_t *tty)
+ 
+ /****************************************************************************/
+ 
+-unsigned int ec_tty_tx_size(ec_tty_t *tty)
++static unsigned int ec_tty_tx_size(ec_tty_t *tty)
+ {
+     unsigned int ret;
+ 
+@@ -313,14 +313,14 @@ unsigned int ec_tty_tx_size(ec_tty_t *tty)
+ 
+ /****************************************************************************/
+ 
+-unsigned int ec_tty_tx_space(ec_tty_t *tty)
++static unsigned int ec_tty_tx_space(ec_tty_t *tty)
+ {
+     return EC_TTY_TX_BUFFER_SIZE - 1 - ec_tty_tx_size(tty);
+ }
+ 
+ /****************************************************************************/
+ 
+-unsigned int ec_tty_rx_size(ec_tty_t *tty)
++static unsigned int ec_tty_rx_size(ec_tty_t *tty)
+ {
+     unsigned int ret;
+ 
+@@ -335,14 +335,14 @@ unsigned int ec_tty_rx_size(ec_tty_t *tty)
+ 
+ /****************************************************************************/
+ 
+-unsigned int ec_tty_rx_space(ec_tty_t *tty)
++static unsigned int ec_tty_rx_space(ec_tty_t *tty)
+ {
+     return EC_TTY_RX_BUFFER_SIZE - 1 - ec_tty_rx_size(tty);
+ }
+ 
+ /****************************************************************************/
+ 
+-int ec_tty_get_serial_info(ec_tty_t *tty, struct serial_struct *data)
++static int ec_tty_get_serial_info(ec_tty_t *tty, struct serial_struct *data)
+ {
+     struct serial_struct tmp;
+ 
+@@ -362,9 +362,9 @@ int ec_tty_get_serial_info(ec_tty_t *tty, struct serial_struct *data)
+ /** Timer function.
+  */
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 15, 0)
+-void ec_tty_wakeup(struct timer_list *t)
++static void ec_tty_wakeup(struct timer_list *t)
+ #else
+-void ec_tty_wakeup(unsigned long data)
++static void ec_tty_wakeup(unsigned long data)
+ #endif
+ {
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 15, 0)
+-- 
+2.47.1
+
diff --git a/package/igh-ethercat/0002-tty-module.c-fix-ec_tty_write-prototype-for-Linux-6..patch b/package/igh-ethercat/0002-tty-module.c-fix-ec_tty_write-prototype-for-Linux-6..patch
new file mode 100644
index 0000000000..78a444715e
--- /dev/null
+++ b/package/igh-ethercat/0002-tty-module.c-fix-ec_tty_write-prototype-for-Linux-6..patch
@@ -0,0 +1,58 @@
+From 27175946c4ea55a426cdcdc1278a7d7c433d2a57 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 31 Dec 2024 10:35:38 +0100
+Subject: [PATCH] tty/module.c: fix ec_tty_write() prototype for Linux >= 6.6
+
+In upstream Linux kernel commits:
+ 95713967ba52389f7cea75704d0cf048080ec218 ("tty: make tty_operations::write()'s count size_t")
+ 69851e4ab8feeb369119a44ddca430c0ee15f0d8 ("tty: propagate u8 data to tty_operations::write()")
+
+The prototype of tty_operations->write() was changed from:
+
+       int  (*write)(struct tty_struct * tty,
+                     const unsigned char *buf, int count);
+
+to:
+
+       ssize_t (*write)(struct tty_struct *tty, const u8 *buf, size_t count);
+
+Both of those commits were merged in Linux 6.6, and this needs an
+update in tty/module.c to avoid the following build failure:
+
+/home/autobuild/autobuild/instance-7/output-1/build/igh-ethercat-1.6.2/./tty/module.c:740:14: error: initialization of "ssize_t (*)(struct tty_struct *, const u8 *, size_t)" {aka "long int (*)(struct tty_struct *, const unsigned char *, long unsigned int)"} from incompatible pointer type "int (*)(struct tty_struct *, const unsigned char *, int)" [-Werror=incompatible-pointer-types]
+  740 |     .write = ec_tty_write,
+      |              ^~~~~~~~~~~~
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://gitlab.com/etherlab.org/ethercat/-/merge_requests/150
+---
+ tty/module.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/tty/module.c b/tty/module.c
+index af4c1b70..354ddfd6 100644
+--- a/tty/module.c
++++ b/tty/module.c
+@@ -488,11 +488,19 @@ static void ec_tty_close(struct tty_struct *tty, struct file *file)
+ 
+ /****************************************************************************/
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 6, 0)
++static ssize_t ec_tty_write(
++        struct tty_struct *tty,
++        const u8 *buffer,
++        size_t count
++        )
++#else
+ static int ec_tty_write(
+         struct tty_struct *tty,
+         const unsigned char *buffer,
+         int count
+         )
++#endif
+ {
+     ec_tty_t *t = (ec_tty_t *) tty->driver_data;
+     unsigned int data_size, i;
+-- 
+2.47.1
+
diff --git a/package/igh-ethercat/0003-tty-module.c-fix-ec_tty_send_xchar-prototype-for-Lin.patch b/package/igh-ethercat/0003-tty-module.c-fix-ec_tty_send_xchar-prototype-for-Lin.patch
new file mode 100644
index 0000000000..62662ee103
--- /dev/null
+++ b/package/igh-ethercat/0003-tty-module.c-fix-ec_tty_send_xchar-prototype-for-Lin.patch
@@ -0,0 +1,50 @@
+From 2824232792364140569d522627b48a64e5d3a690 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 31 Dec 2024 10:38:03 +0100
+Subject: [PATCH] tty/module.c: fix ec_tty_send_xchar() prototype for Linux >=
+ 6.8
+
+In upstream Linux kernel commit:
+  3a00da027946cd08db1c1be2de4620950bbdf074 ("tty: make tty_operations::send_xchar accept u8 char")
+
+The prototype of tty_operations->send_xchar() was changed from:
+
+  void (*send_xchar)(struct tty_struct *tty, char ch);
+
+to:
+
+  void (*send_xchar)(struct tty_struct *tty, u8 ch);
+
+This commit was merged in Linux 6.8, and therefore the
+ec_tty_send_xchar() implementation needs to be changed to avoid the
+following build failure:
+
+/home/autobuild/autobuild/instance-7/output-1/build/igh-ethercat-1.6.2/./tty/module.c:751:19: error: initialization of "void (*)(struct tty_struct *, u8)" {aka "void (*)(struct tty_struct *, unsigned char)"} from incompatible pointer type "void (*)(struct tty_struct *, char)" [-Werror=incompatible-pointer-types]
+  751 |     .send_xchar = ec_tty_send_xchar,
+      |                   ^~~~~~~~~~~~~~~~~
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://gitlab.com/etherlab.org/ethercat/-/merge_requests/150
+---
+ tty/module.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/tty/module.c b/tty/module.c
+index 354ddfd6..2b7b22bb 100644
+--- a/tty/module.c
++++ b/tty/module.c
+@@ -724,7 +724,11 @@ static int ec_tty_break(struct tty_struct *tty, int break_state)
+ 
+ /****************************************************************************/
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 8, 0)
++static void ec_tty_send_xchar(struct tty_struct *tty, u8 ch)
++#else
+ static void ec_tty_send_xchar(struct tty_struct *tty, char ch)
++#endif
+ {
+ #if EC_TTY_DEBUG >= 2
+     printk(KERN_INFO PFX "%s(ch=%02x).\n", __func__, (unsigned int) ch);
+-- 
+2.47.1
+

--===============7795378243076063815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7795378243076063815==--
