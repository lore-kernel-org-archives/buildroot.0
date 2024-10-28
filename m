Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C55D5B158
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 21:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BD4D607FE;
	Mon, 28 Oct 2024 21:38:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PyIkVrLtcOp1; Mon, 28 Oct 2024 21:38:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81E916080F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81E916080F;
	Mon, 28 Oct 2024 21:38:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 38636AEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFEC36083E
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C6xK3Cf9q--U for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 21:38:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EC816607F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC816607F7
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC816607F7
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:38:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06FFE40002;
 Mon, 28 Oct 2024 21:38:25 +0000 (UTC)
Date: Mon, 28 Oct 2024 22:38:25 +0100
To: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Cc: Bryan Brattlof <bb@ti.com>
Message-ID: <20241028223825.4fb946c2@windsurf>
In-Reply-To: <20241009-am62ax-linux-headers-fix-v1-1-d46a03ce66bc@ti.com>
References: <20241009-am62ax-linux-headers-fix-v1-1-d46a03ce66bc@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730151506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HfUrP9CKmJ06Ex9YVOMCmB5wBwfXAz7e6W24B3VGwdw=;
 b=ezUn0Ryae/Ry3JLFHuFG3VUN5+6i529dRZC3pvUZxD1ckNoVysL4KcSwT23MbKj6I8QgFw
 cgyqMCR02YOYELQB28u/CB96NZc76NV8JGhaU0w1ICwGcmfTXKcpyixW0k5sdtHZxV2jVN
 f6K/H+lg6mKzrR67psE27FXG6PKnjqQyjed3kISAvpcMjiHOVYnAr7TZD9M6U9Zo7WuEMk
 JTQu/pWi/Xi878MyD1lDKV5sxiD/w8X+88Zz8+IXtp7jqAEt2Kf1U0WN1KaXNMmhVVm6zC
 6bL6sOwwKVMo7E2cQC+iuDBNGH+o/ClBOERuGtakahV5Ig2o4eOM3Ykz1gSIsQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ezUn0Rya
Subject: Re: [Buildroot] [PATCH] configs/ti_am62ax_sk_defconfig: add
 linux-headers version
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 9 Oct 2024 17:02:01 -0500
Bryan Brattlof via buildroot <buildroot@buildroot.org> wrote:

> When bumping the Linux kernel version I inadvertently removed the pinned
> linux-headers version from the defconfig which can break the build if
> the default kernel version is not v6.10. Pin linux-headers to the
> current am62ax-sk kernel version.
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
>  configs/ti_am62ax_sk_defconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
