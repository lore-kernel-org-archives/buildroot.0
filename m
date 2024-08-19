Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEA7C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 08:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71430606ED;
	Mon, 19 Aug 2024 08:27:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nId_Mj8AwEaI; Mon, 19 Aug 2024 08:27:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96A30607BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96A30607BC;
	Mon, 19 Aug 2024 08:27:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0ABBC1BF3EF
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 08:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE6BF80E52
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 08:27:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MqCbhVS7BiMs for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 08:27:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B47EB80BC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B47EB80BC1
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B47EB80BC1
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 08:27:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD02E60007;
 Mon, 19 Aug 2024 08:27:34 +0000 (UTC)
Date: Mon, 19 Aug 2024 10:27:33 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240819102733.13fccbc0@windsurf>
In-Reply-To: <20240819040213.3563422-1-james.hilliard1@gmail.com>
References: <20240819040213.3563422-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724056054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P8hTpGZV7JUxCT5JEQboqZmaGMGAKFyJERYPsCrcEqA=;
 b=lS5DXY/OMcJKUzssORp1rjge7fJymu4aofvByRTDqkrRHjfEEzxERC3suB1FNlNHUTS/XM
 /LL2OKRR9bxhNwyQF9Um7/MDaLn0UhdDHaG2wM+m4IrDH2DZRHE2MxS7qraG/Kebumw54T
 8wUDF8Z1IT6snpz6Jyu7sRha8C7eoLDBVJsG2om5XyTparZphHpj0eKe8RMm31Msoq/Ldz
 4zToFzsLtT5H3dI3iRPLW3oGm0GnQyCjNCip/f1zZXTEbZidPPkM9zVzARlWaJo0s58lYT
 baPc1LcMjGRsm6F05ykaq+kkISIZSroQ5g9kgw+1Qi/ddBYlLbRujn8X1TogAA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lS5DXY/O
Subject: Re: [Buildroot] [PATCH 1/1] package/flashrom: fix cli with
 BR2_SHARED_LIBS
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sun, 18 Aug 2024 22:02:13 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Flashrom requires --default-library=both for the cli when building
> with BR2_SHARED_LIBS.
> 
> As such set --default-library=both instead of disabling it.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Thanks for the patch!

Is this fixing a build issue? If so, which one, which defconfig? Or
perhaps an autobuilder failure reference?

When was this problem introduced?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
