Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9FFC4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 19:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0317742203;
	Wed,  7 Feb 2024 19:43:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id djLDGR0edr9A; Wed,  7 Feb 2024 19:43:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1613742206
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1613742206;
	Wed,  7 Feb 2024 19:43:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4F3CF1BF350
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C68C6147E
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:43:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sYxG9_IT9fcv for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 19:43:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C76A160BF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C76A160BF5
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C76A160BF5
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 19:43:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D42CF1C0004;
 Wed,  7 Feb 2024 19:43:37 +0000 (UTC)
Date: Wed, 7 Feb 2024 20:43:37 +0100
To: "kilian.zinnecker--- via buildroot" <buildroot@buildroot.org>
Message-ID: <20240207204337.561d3b54@windsurf>
In-Reply-To: <20231130223101.132221-1-kilian.zinnecker@mail.de>
References: <20231130223101.132221-1-kilian.zinnecker@mail.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707335018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W9/iU3X9qevvZ5hf/Rcf11LoYV/fF8vEGjx44C0CXvw=;
 b=AzJZ2jJgyVs4jGTio7a61dEPiYtgMFIrF0g75VqV88W7s0J6QioqJp0X/t/MdCcU0BPjhE
 ustwK9Gyn20WyReMeitWKJIMtkJWtWSm1XVCGCfkDud61UvOkOwzHqPwn5kDsYN56umg63
 IdQSIGtYpFcb9/Xl2i08YWLNRWQh8Pi4yGAs4/xRB7IVZCjlan/4TG4SsUWRDu+lic5mUy
 cHRY+R5ZKV4AqAsdY4B1EV8v7ietB4L6BKqBikjbz2VjJlpw4feYhvqWAj+1vPNfuJ937R
 P+RCY/USwx64wj6cPm0eO7YFQZF0CGWZhZ3tVs15EBJgNJO2k99zoR7V4YAJBg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AzJZ2jJg
Subject: Re: [Buildroot] [PATCH 1/1] configs/rzboard_v2L_defconfig: new
 defconfig
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 kilian.zinnecker@mail.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, 30 Nov 2023 23:31:01 +0100
"kilian.zinnecker--- via buildroot" <buildroot@buildroot.org> wrote:

> From: Kilian Zinnecker <kilian.zinnecker@mail.de>
> 
> This patch adds support for the AVNET RZBoard V2L.
> 
> The board support creates a bootable sd card image. The board is
> shipped with a u-boot inside its eMMC. The board support uses this
> u-boot and does not build and deploy a u-boot onto the sd card.
> Instead the sd card only contains a uEnv.txt, a kernel image and
> the rootfs.
> 
> Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>

Thanks, I have applied to master, after renaming to
avnet_rzboard_v2l_defconfig, and taking into account the feedback from
Giulio.

However, I find it not so nice that we don't build a fully bootable
image that includes U-Boot. Could you work on this and submit a
follow-up patch?

There is a DIP switch on the board that allows to boot from SD, see
page 15 of the board hardware manual;

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
