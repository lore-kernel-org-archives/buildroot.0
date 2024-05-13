Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73B1C25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 19:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9532A60642;
	Mon, 13 May 2024 19:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LTFpwtKWEdph; Mon, 13 May 2024 19:58:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D478606C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D478606C4;
	Mon, 13 May 2024 19:58:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7BD081BF2CA
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75A33403E9
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hhuyad9fkVgE for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 19:58:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 135E94018D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 135E94018D
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 135E94018D
 for <buildroot@buildroot.org>; Mon, 13 May 2024 19:58:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C1F8120003;
 Mon, 13 May 2024 19:58:48 +0000 (UTC)
Date: Mon, 13 May 2024 21:58:47 +0200
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20240513215847.175987ed@windsurf>
In-Reply-To: <20240513064039.2091596-1-neal.frager@amd.com>
References: <20240513064039.2091596-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715630329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t5wdKIxAbE61rdOAgG9qDNTwd27Cn4dlOl+6t88kVvU=;
 b=IYvk1JCwzxHq1xqZczPMUVQ4nK2ObZMV1tpuZhmnrHwiXwhxMe26nb6yoQu2Sb1QEOOwGj
 WNCtWJGw/v0l6ps8e37aRGtwEZv4ceEXjD3D8VeBkOoynYPctrNmQglU13IVp/3ipfVV5V
 +JjBSscrTK42+3D7Bw8YW4VsUkc0oSTA73sHuMQ61pxQbYYBmFgv4TjHw+el1ZquOsfl3X
 vNWoHgIMCtoZgIxglijFSJKcKq4jGkR1AIQn+9uRpzs40yTPmGHNWyMAfzff1CjYfgBRgO
 OdeRmFO+5ViFYAJfGZ9ncPhWmsXv4Ny3a5dKKL1Rtw/yI9yfQzxM6nBcCGmPxQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IYvk1JCw
Subject: Re: [Buildroot] [PATCH v1 1/2] package/newlib-bare-metal: add patch
 for gcc 14.1.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: michal.simek@amd.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, 13 May 2024 07:40:38 +0100
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> This patch is needed for building newlib with gcc 14.1.0.  Without this patch,
> the following build error will occur:
> 
> ../../.././libgloss/microblaze/linux-outbyte.c: In function 'outbyte':
> ../../.././libgloss/microblaze/linux-outbyte.c:3:9: error: implicit declaration of function '_write' [-Wimplicit-function-declaration]
>     3 |         _write(1, &c, 1);
> 
> This patch has been submitted upstream:
> https://patchwork.sourceware.org/project/newlib/patch/20240513062419.2042278-1-neal.frager@amd.com/
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  ...oblaze-fix-read-and-_write-declarati.patch | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/newlib-bare-metal/4.4.0.20231231/0001-libgloss-microblaze-fix-read-and-_write-declarati.patch
> 
> diff --git a/package/newlib-bare-metal/4.4.0.20231231/0001-libgloss-microblaze-fix-read-and-_write-declarati.patch b/package/newlib-bare-metal/4.4.0.20231231/0001-libgloss-microblaze-fix-read-and-_write-declarati.patch
> new file mode 100644
> index 0000000000..8901f60c3c
> --- /dev/null
> +++ b/package/newlib-bare-metal/4.4.0.20231231/0001-libgloss-microblaze-fix-read-and-_write-declarati.patch

This patch should have been directly in package/newlib-bare-metal/,
there is no need for a per-version directory. Such subdirectories are
only needed when multiple versions of the package are supported (gcc,
binutils, gdb, etc.) but not for normal packages that have a fixed
version.

> @@ -0,0 +1,39 @@
> +From 1ebecb83607e9c0cc44ad1e518169ae03c0f2d26 Mon Sep 17 00:00:00 2001
> +From: Neal Frager <neal.frager@amd.com>
> +Date: Mon, 13 May 2024 07:22:47 +0100
> +Subject: [PATCH] libgloss: microblaze: fix read and _write declarations
> +
> +This patch resolves the following build error which occurs with gcc 14.1.0:
> +../../.././libgloss/microblaze/linux-outbyte.c: In function 'outbyte':
> +../../.././libgloss/microblaze/linux-outbyte.c:3:9: error: implicit declaration of function '_write' [-Wimplicit-function-declaration]
> +    3 |         _write(1, &c, 1);
> +
> +Signed-off-by: Neal Frager <neal.frager@amd.com>

The "Upstream:" tag was missing here, and this issue was reported by
"make check-package":

WARNING: package/newlib-bare-metal/4.4.0.20231231/0001-libgloss-microblaze-fix-read-and-_write-declarati.patch:0: missing Upstream in the header (https://nightly.buildroot.org/#_additional_patch_documentation)

I fixed both issues and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
