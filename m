Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33EACE7717F
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 22:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBC27846C8;
	Fri, 13 Dec 2024 22:31:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0iyWLP6KhMA0; Fri, 13 Dec 2024 22:31:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C04BC84748
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C04BC84748;
	Fri, 13 Dec 2024 22:31:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F1B15ECE
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 22:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C01EF41793
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 22:31:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QzxBEI6X4WK0 for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 22:31:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B28F64178C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B28F64178C
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B28F64178C
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 22:31:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 99D35FF806;
 Fri, 13 Dec 2024 22:30:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1tMEBV-00Ahhd-2L;
 Fri, 13 Dec 2024 23:30:57 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Dec 2024 23:30:55 +0100
Message-Id: <20241213223056.2551262-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] package/dahdi-linux: add patch to support Linux
 6.11+
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 ...const-struct-device_device-if-needed.patch | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 package/dahdi-linux/0003-xpp-sysfs-Use-const-struct-device_device-if-needed.patch

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
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
