Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43776C001E0
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 10:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F23C841819;
	Thu, 27 Jul 2023 10:28:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F23C841819
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7xNuOn-UMX47; Thu, 27 Jul 2023 10:28:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24A9640471;
	Thu, 27 Jul 2023 10:28:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24A9640471
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F4F11BF40B
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5611360E79
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:28:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5611360E79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sKYyeioi04xu for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 10:28:13 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3034560E74
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 10:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3034560E74
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2249C240007;
 Thu, 27 Jul 2023 10:28:05 +0000 (UTC)
Date: Thu, 27 Jul 2023 12:28:05 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230727122805.3c035fc2@windsurf>
In-Reply-To: <20230726194453.1462570-1-bernd@kuhls.net>
References: <20230726194453.1462570-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690453691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KHPmtaqWfV1wqxMpMh06EOTC2oGavO7zPt6mAs3s4zY=;
 b=awd2uPe6xjBhn6nGaiGZpn6qI9y9jvgxtsSdNHNoMTRO2BcrM+fc8G2f2qTzBhmpKFwRka
 /VhkCUPxMNM3/7HS46Lr2BwPBQ38Z40MmlIV918q+nEFU+HBVSRwiTDtLVNriUakGTqncG
 y6A2BQRyTlTbN6LItScLndzQex3JINswU+MHxak/26QKgZpWtpAA6PteyTmHrwEN3Fu0Bm
 LRVAwaHDnkhNZnAmFJ3BvhL6NMxspsBkrTqMAYeNB6UOw2ioQBS0+Zm/dGIbO5VytkplZ8
 HFOwJzM+SEWn4tVEoc3c4UsUinRDXAy345akirT/s/l8I08kaRZAcCbcycuQ4A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=awd2uPe6
Subject: Re: [Buildroot] [PATCH 1/2] package/wolfssl: disable asm on armv4
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 26 Jul 2023 21:44:52 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Quoting
> https://developer.arm.com/documentation/dui0489/i/arm-and-thumb-instructions/clz
> "This ARM instruction is available in ARMv5T and above."
> 
> Fixes:
> - armeb
>   http://autobuild.buildroot.net/results/ea9/ea9b19e872b4b20b97fceec3f7e0a6a1109c4f12/
>   /tmp/ccdRCOaB.s:27: Error: selected processor does not support `clz r5,r2' in ARM mode
> - arm
>   http://autobuild.buildroot.net/results/cb1/cb1c7ac68b3379d3f4b5efc897198bea0a904217/
>   /tmp/cc72ECAj.s:6764: Error: selected processor does not support `clz r5,r0' in ARM mode
>   /tmp/cc72ECAj.s:7110: Error: selected processor does not support `clz r5,lr' in ARM mode
>   /tmp/cc72ECAj.s:8934: Error: selected processor does not support `clz r5,fp' in ARM mode
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/wolfssl/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, both applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
