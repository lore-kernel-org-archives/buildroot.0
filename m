Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D49AC83F1A
	for <buildroot@archiver.kernel.org>; Mon, 21 Jul 2025 21:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DD3742895;
	Mon, 21 Jul 2025 21:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ADgPFfCZeifL; Mon, 21 Jul 2025 21:00:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D32E42887
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D32E42887;
	Mon, 21 Jul 2025 21:00:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 36130127
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 21:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 276B481F00
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 21:00:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U9aJj_Xsa1W3 for <buildroot@buildroot.org>;
 Mon, 21 Jul 2025 21:00:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D6D3F81E99
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6D3F81E99
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6D3F81E99
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 21:00:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 5954113F899;
 Mon, 21 Jul 2025 22:59:58 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 21 Jul 2025 22:59:58 +0200
MIME-Version: 1.0
Date: Mon, 21 Jul 2025 22:59:58 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Kris Bahnsen <kris@embeddedts.com>, Louis Aussedat
 <aussedat.louis@gmail.com>, Sergey Matyukevich <geomatsi@gmail.com>
In-Reply-To: <20250701190841.714026-4-giulio.benetti@benettiengineering.com>
References: <20250701190841.714026-1-giulio.benetti@benettiengineering.com>
 <20250701190841.714026-4-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <95cd2991e059bd354fabe1244ec3b2b2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753131603;
 bh=xoeR+261ixBlGFWAYJLSuOjnuL9CApTJfcaw8b+8Dng=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=F12c+c1CcA4yg5grdpZ0F14SXY+jU1x+2JabOZeGuyXQtZfcBeBGxk+0H61Xlg2Gi
 FoXn/QGaUa6DAPkotdP38W+eb9NLtKOV/8TFDDtOZ3w6vDdCgCnwObF4pDnpoxniJv
 ID1oqIuAhbeh9VSl4AkqQF0xo+5xsmhQr1ipB8YTI0oNhYNAOP+4Q7gsuJ+g6VEutx
 iU7RXIus9AXEH6RV1m+ihaWKvYZaPDokj//NkJLvJI1/lUrPqwLZOQEqGnPOiz1bGh
 /sZZx2aTiQLkLp9ICtfwrDiMboF/vuHN192nHtX1REWMO6yPdl4+cVzw4/+oPuK3/o
 6sDMUDuVmqOGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=F12c+c1C
Subject: Re: [Buildroot] [PATCH] package/rtl8189es: fix build failure with
 Linux 6.15
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

On 01/07/2025 21:08, Giulio Benetti wrote:
> Add local patch pending upstream to fix build failure with Linux 6.15
> 
> Fixes:
> still not occured.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  .../0001-Fix-build-with-Linux-6.15.patch      | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 
> package/xr819-xradio/0001-Fix-build-with-Linux-6.15.patch
> 
> diff --git a/package/xr819-xradio/0001-Fix-build-with-Linux-6.15.patch 
> b/package/xr819-xradio/0001-Fix-build-with-Linux-6.15.patch

The patch title mention "package/rtl8189es" but the package patch
is added in "package/xr819-xradio". Could you clarify or send an updated
patch if this is a mixup, please?

> new file mode 100644
> index 0000000000..ce0b3f3908
> --- /dev/null
> +++ b/package/xr819-xradio/0001-Fix-build-with-Linux-6.15.patch
> @@ -0,0 +1,38 @@
> +From 6e170c96bf50a1088d5dd85fdfd67dc7f83e4eb9 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Tue, 1 Jul 2025 20:51:40 +0200
> +Subject: [PATCH] Fix build with Linux 6.15
> +
> +Commit:
> +https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8fa7292fee5c5240402371ea89
> +ab285ec856c916
> +drops del_timer_sync() in favor of timer_delete_sync() so let's 
> backport
> +locally functions del_timer_sync() when Linux version is 6.15.0 or 
> later.
> +
> +Upstream: https://github.com/fifteenhex/xradio/pull/26
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + xradio.h | 7 +++++++
> + 1 file changed, 7 insertions(+)
> +
> +diff --git a/xradio.h b/xradio.h
> +index e7f60f6..9506986 100644
> +--- a/xradio.h
> ++++ b/xradio.h
> +@@ -47,6 +47,13 @@
> + #include "pm.h"
> + #include "fwio.h"
> +
> ++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 15, 0))
> ++static inline int del_timer_sync(struct timer_list *timer)
> ++{
> ++	return timer_delete_sync(timer);
> ++}
> ++#endif
> ++
> + /* #define ROC_DEBUG */
> + /* hidden ssid is only supported when separate probe resp IE
> +    configuration is supported */
> +--
> +2.39.5
> +
> --
> 2.39.5

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
