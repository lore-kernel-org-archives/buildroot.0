Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE1EC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 973F26FA38;
	Fri, 28 Feb 2025 16:32:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b9u14shfBRfp; Fri, 28 Feb 2025 16:32:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7480F6FAB7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7480F6FAB7;
	Fri, 28 Feb 2025 16:32:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4ABCE711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1648160736
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 744dFTGTEPeL for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 658D46FA70
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 658D46FA70
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6006385E77; Fri, 28 Feb 2025 16:29:40 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 Dec 2024 20:55:11 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bb654e5a3bdef3576e82bd27e0ef809afb1b10d9
X-Git-Newrev: 4533795cdec704ffef78ffb3ef0acf559794ae21
X-Patchwork-Hint: ignore
Message-Id: <20250228162940.6006385E77@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/dahdi-linux: add patch
 to support Linux 6.11+
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4533795cdec704ffef78ffb3ef0acf559794ae21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
http://autobuild.buildroot.net/results/23f0f7386f7d430c402b24f3b58b1c20c1c8344a/

Linux commit d69d8048459 "driver core: have match() callback in struct
bus_type take a const *", which was added in 6.11-rc1, changed the interface
for sysfs match callback to accept a const struct device_driver, breaking
the build of dahdi-linux:

 CC [M]  build/dahdi-linux-3.3.0/drivers/dahdi/dahdi-sysfs.o
build/dahdi-linux-3.3.0/drivers/dahdi/dahdi-sysfs.c:275:27: error: initialization
   of "int (*)(struct device *, const struct device_driver *)" from incompatible
   pointer type "int (*)(struct device *, struct device_driver *)"
   [-Werror=incompatible-pointer-types]
  275 |         .match          = span_match,

Add a patch submitted upstream to fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-Use-const-struct-device_device-if-needed.patch | 82 ++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/package/dahdi-linux/0003-xpp-sysfs-Use-const-struct-device_device-if-needed.patch b/package/dahdi-linux/0003-xpp-sysfs-Use-const-struct-device_device-if-needed.patch
new file mode 100644
index 0000000000..becb82a6d2
--- /dev/null
+++ b/package/dahdi-linux/0003-xpp-sysfs-Use-const-struct-device_device-if-needed.patch
@@ -0,0 +1,82 @@
+From ce9de5d1bf9d21c088b01ce9da6f7ff02b0d863d Mon Sep 17 00:00:00 2001
+From: InterLinked1 <24227567+InterLinked1@users.noreply.github.com>
+Date: Mon, 23 Sep 2024 08:04:54 -0400
+Subject: [PATCH] xpp, sysfs: Use const struct device_device if needed.
+
+Kernel commit d69d804845985c29ab5be5a4b3b1f4787893daf8
+changed struct device_driver to be const, so make the
+arguments const on kernels 6.11 and newer.
+
+Resolves: #63
+
+Upstream: https://github.com/asterisk/dahdi-linux/pull/64
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ drivers/dahdi/dahdi-sysfs-chan.c | 4 ++++
+ drivers/dahdi/dahdi-sysfs.c      | 4 ++++
+ drivers/dahdi/xpp/xbus-sysfs.c   | 8 ++++++++
+ 3 files changed, 16 insertions(+)
+
+diff --git a/drivers/dahdi/dahdi-sysfs-chan.c b/drivers/dahdi/dahdi-sysfs-chan.c
+index 09d7317..35b7bd4 100644
+--- a/drivers/dahdi/dahdi-sysfs-chan.c
++++ b/drivers/dahdi/dahdi-sysfs-chan.c
+@@ -220,7 +220,11 @@ static void chan_release(struct device *dev)
+ 	chan_dbg(DEVICES, chan, "SYSFS\n");
+ }
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 11, 0)
++static int chan_match(struct device *dev, const struct device_driver *driver)
++#else
+ static int chan_match(struct device *dev, struct device_driver *driver)
++#endif /* LINUX_VERSION_CODE */
+ {
+ 	struct dahdi_chan *chan;
+ 
+diff --git a/drivers/dahdi/dahdi-sysfs.c b/drivers/dahdi/dahdi-sysfs.c
+index 7477ebc..246514c 100644
+--- a/drivers/dahdi/dahdi-sysfs.c
++++ b/drivers/dahdi/dahdi-sysfs.c
+@@ -42,7 +42,11 @@ module_param(tools_rootdir, charp, 0444);
+ MODULE_PARM_DESC(tools_rootdir,
+ 		"root directory of all tools paths (default /)");
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 11, 0)
++static int span_match(struct device *dev, const struct device_driver *driver)
++#else
+ static int span_match(struct device *dev, struct device_driver *driver)
++#endif /* LINUX_VERSION_CODE */
+ {
+ 	return 1;
+ }
+diff --git a/drivers/dahdi/xpp/xbus-sysfs.c b/drivers/dahdi/xpp/xbus-sysfs.c
+index 177048b..f78a15e 100644
+--- a/drivers/dahdi/xpp/xbus-sysfs.c
++++ b/drivers/dahdi/xpp/xbus-sysfs.c
+@@ -397,7 +397,11 @@ static struct attribute *xbus_dev_attrs[] = {
+ ATTRIBUTE_GROUPS(xbus_dev);
+ #endif
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 11, 0)
++static int astribank_match(struct device *dev, const struct device_driver *driver)
++#else
+ static int astribank_match(struct device *dev, struct device_driver *driver)
++#endif /* LINUX_VERSION_CODE */
+ {
+ 	DBG(DEVICES, "SYSFS MATCH: dev->bus_id = %s, driver->name = %s\n",
+ 	    dev_name(dev), driver->name);
+@@ -771,7 +775,11 @@ static DEVICE_ATTR_READER(refcount_xpd_show, dev, buf)
+ 	return len;
+ }
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 11, 0)
++static int xpd_match(struct device *dev, const struct device_driver *driver)
++#else
+ static int xpd_match(struct device *dev, struct device_driver *driver)
++#endif /* LINUX_VERSION_CODE */
+ {
+ 	struct xpd_driver *xpd_driver;
+ 	xpd_t *xpd;
+-- 
+2.39.5
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
