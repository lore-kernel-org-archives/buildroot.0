Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D79CD37AC
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 19:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F105E60828;
	Tue,  3 Sep 2024 19:55:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SAsfM7PxmNSO; Tue,  3 Sep 2024 19:55:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B18546084B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B18546084B;
	Tue,  3 Sep 2024 19:55:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 68B3E1BF344
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55853402A1
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WntujFbT3pPp for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 19:55:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1261E4029B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1261E4029B
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1261E4029B
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 19:55:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0754BC0003;
 Tue,  3 Sep 2024 19:55:44 +0000 (UTC)
Date: Tue, 3 Sep 2024 21:55:43 +0200
To: Dong Wang <wangdong115@foxmail.com>
Message-ID: <20240903215543.1b69a4f5@windsurf>
In-Reply-To: <tencent_92439641515553684D208B3331676FB36C05@qq.com>
References: <tencent_92439641515553684D208B3331676FB36C05@qq.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725393345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bgPQOR57auQrU6Qmm7jwZ+fuG6a8+ybd7SOhAPzVK9o=;
 b=lzQUUFdkIQ+4zfyoaxx2Hm3XOaXxXPUU+u4wIzR2V70498iOA3qlccbyaHb2LLYhZYA76K
 T95G11K+ldTOVAy4n4llrVP9DckSCMfZelp0OAq/Q1Tn6vxLSYCUuSoM7f3PvhfOZG/p5I
 EUt0XXzJE7w1NkV/3Giu4mOIO4fm4lXoDPZk0P7ztPkWBd6yV975TN1519ZvdlRmUPVQ/f
 336gcmgDz/F0EF52ueqmUCJK242Dx/nEobocW/rcCpDhz/4OKMalHH9/VBpTENvIQBm6n1
 ovpqdami5mTgT3tFxK0BGRhDC+dQJlQXt/t34chnEVq/BevUlPJ/9EtJgSbz3w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lzQUUFdk
Subject: Re: [Buildroot] [PATCH next] board/friendlyarm/nanopi-neo: refine
 genimage.cfg
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 17 Aug 2024 00:07:56 +0800
Dong Wang <wangdong115@foxmail.com> wrote:

> This patch adds the offset argument for rootfs partiton so that it's
> aligned to a 1MiB boundary, instead of using the size of the previous
> u-boot partition to achieve this.
> 
> Genimage will make sure no partitions overlap. So we don't need a size
> argument to limit the size of the u-boot image.
> 
> Signed-off-by: Dong Wang <wangdong115@foxmail.com>
> ---

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
