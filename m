Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FC0E7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 19:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 266FF815E7;
	Sat, 14 Dec 2024 19:58:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ajlj6dZca8-V; Sat, 14 Dec 2024 19:58:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B6D88164A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B6D88164A;
	Sat, 14 Dec 2024 19:58:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D2628CE
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 19:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B24FE40499
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 19:58:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 360Q5cC9f8XL for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 19:58:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E0FCB40474
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0FCB40474
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0FCB40474
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 19:58:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 3E91113F8A2;
 Sat, 14 Dec 2024 20:58:02 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:59496])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 14 Dec 2024 20:58:02 +0100
MIME-Version: 1.0
Date: Sat, 14 Dec 2024 20:58:02 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241213223056.2551262-1-peter@korsgaard.com>
References: <20241213223056.2551262-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <4fc673e087b4a23495cec097aa9d69f8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734206283;
 bh=1Ip/5SpC+Vrotxafw7J2TcuiB32ZUU8Zj+gX/BfjAC0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Zyc6b++IGJ/v/iGVBxAeizhdWkJRYf3roXTM28cwQmIohxEAPhfsA3Rb5opK0YMjf
 D8+5y3HjMzOGw9VlZdwhGwzdHKLKNNIeuLBpByTaPoe8q56D9ngMizVVTWawzrQs3B
 4NWA+0QiZrNgttasX4qIxmdyh1I+dHZLGrqItK6rXNyjI0RVPeuTY9IHBg0kFRVqgc
 19llcwnvk9jafUuviZ6OCMzD7aNx5z2CxV6yGivhS5orof0W3MXmueUxOo3yG/T2df
 U4PbbxhMBtGu6k2SLZNU0JCFpgGtWkTGH3kZLrhRvr6AgE46cqoflU4MEYLC2rLAA+
 u7OMv2loeydyg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Zyc6b++I
Subject: Re: [Buildroot] [PATCH] package/dahdi-linux: add patch to support
 Linux 6.11+
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 13/12/2024 23:30, Peter Korsgaard wrote:
> Fixes:
> http://autobuild.buildroot.net/results/23f0f7386f7d430c402b24f3b58b1c20c1c8344a/
> 
> Linux commit d69d8048459 "driver core: have match() callback in struct
> bus_type take a const *", which was added in 6.11-rc1, changed the 
> interface
> for sysfs match callback to accept a const struct device_driver, 
> breaking
> the build of dahdi-linux:
> 
>  CC [M]  build/dahdi-linux-3.3.0/drivers/dahdi/dahdi-sysfs.o
> build/dahdi-linux-3.3.0/drivers/dahdi/dahdi-sysfs.c:275:27: error: 
> initialization
>    of "int (*)(struct device *, const struct device_driver *)" from 
> incompatible
>    pointer type "int (*)(struct device *, struct device_driver *)"
>    [-Werror=incompatible-pointer-types]
>   275 |         .match          = span_match,
> 
> Add a patch submitted upstream to fix that.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

> ---
>  ...const-struct-device_device-if-needed.patch | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 
> package/dahdi-linux/0003-xpp-sysfs-Use-const-struct-device_device-if-needed.patch
> 
> diff --git 
> a/package/dahdi-linux/0003-xpp-sysfs-Use-const-struct-device_device-if-needed.patch 
> b/package/dahdi-linux/0003-xpp-sysfs-Use-const-struct-device_device-if-needed.patch
> new file mode 100644
> index 0000000000..becb82a6d2
> --- /dev/null
> +++ 
> b/package/dahdi-linux/0003-xpp-sysfs-Use-const-struct-device_device-if-needed.patch
> @@ -0,0 +1,82 @@
> +From ce9de5d1bf9d21c088b01ce9da6f7ff02b0d863d Mon Sep 17 00:00:00 2001
> +From: InterLinked1 <24227567+InterLinked1@users.noreply.github.com>
> +Date: Mon, 23 Sep 2024 08:04:54 -0400
> +Subject: [PATCH] xpp, sysfs: Use const struct device_device if needed.
> +
> +Kernel commit d69d804845985c29ab5be5a4b3b1f4787893daf8
> +changed struct device_driver to be const, so make the
> +arguments const on kernels 6.11 and newer.
> +
> +Resolves: #63
> +
> +Upstream: https://github.com/asterisk/dahdi-linux/pull/64
> +Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> +---
> + drivers/dahdi/dahdi-sysfs-chan.c | 4 ++++
> + drivers/dahdi/dahdi-sysfs.c      | 4 ++++
> + drivers/dahdi/xpp/xbus-sysfs.c   | 8 ++++++++
> + 3 files changed, 16 insertions(+)
> +
> +diff --git a/drivers/dahdi/dahdi-sysfs-chan.c 
> b/drivers/dahdi/dahdi-sysfs-chan.c
> +index 09d7317..35b7bd4 100644
> +--- a/drivers/dahdi/dahdi-sysfs-chan.c
> ++++ b/drivers/dahdi/dahdi-sysfs-chan.c
> +@@ -220,7 +220,11 @@ static void chan_release(struct device *dev)
> + 	chan_dbg(DEVICES, chan, "SYSFS\n");
> + }
> +
> ++#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 11, 0)
> ++static int chan_match(struct device *dev, const struct device_driver 
> *driver)
> ++#else
> + static int chan_match(struct device *dev, struct device_driver 
> *driver)
> ++#endif /* LINUX_VERSION_CODE */
> + {
> + 	struct dahdi_chan *chan;
> +
> +diff --git a/drivers/dahdi/dahdi-sysfs.c b/drivers/dahdi/dahdi-sysfs.c
> +index 7477ebc..246514c 100644
> +--- a/drivers/dahdi/dahdi-sysfs.c
> ++++ b/drivers/dahdi/dahdi-sysfs.c
> +@@ -42,7 +42,11 @@ module_param(tools_rootdir, charp, 0444);
> + MODULE_PARM_DESC(tools_rootdir,
> + 		"root directory of all tools paths (default /)");
> +
> ++#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 11, 0)
> ++static int span_match(struct device *dev, const struct device_driver 
> *driver)
> ++#else
> + static int span_match(struct device *dev, struct device_driver 
> *driver)
> ++#endif /* LINUX_VERSION_CODE */
> + {
> + 	return 1;
> + }
> +diff --git a/drivers/dahdi/xpp/xbus-sysfs.c 
> b/drivers/dahdi/xpp/xbus-sysfs.c
> +index 177048b..f78a15e 100644
> +--- a/drivers/dahdi/xpp/xbus-sysfs.c
> ++++ b/drivers/dahdi/xpp/xbus-sysfs.c
> +@@ -397,7 +397,11 @@ static struct attribute *xbus_dev_attrs[] = {
> + ATTRIBUTE_GROUPS(xbus_dev);
> + #endif
> +
> ++#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 11, 0)
> ++static int astribank_match(struct device *dev, const struct 
> device_driver *driver)
> ++#else
> + static int astribank_match(struct device *dev, struct device_driver 
> *driver)
> ++#endif /* LINUX_VERSION_CODE */
> + {
> + 	DBG(DEVICES, "SYSFS MATCH: dev->bus_id = %s, driver->name = %s\n",
> + 	    dev_name(dev), driver->name);
> +@@ -771,7 +775,11 @@ static DEVICE_ATTR_READER(refcount_xpd_show, dev, 
> buf)
> + 	return len;
> + }
> +
> ++#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 11, 0)
> ++static int xpd_match(struct device *dev, const struct device_driver 
> *driver)
> ++#else
> + static int xpd_match(struct device *dev, struct device_driver 
> *driver)
> ++#endif /* LINUX_VERSION_CODE */
> + {
> + 	struct xpd_driver *xpd_driver;
> + 	xpd_t *xpd;
> +--
> +2.39.5
> +
> --
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
