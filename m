Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B868C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 15:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1062D605B0;
	Sun, 14 Jul 2024 15:43:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TuJDBnWtMK1R; Sun, 14 Jul 2024 15:43:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E2CC605E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E2CC605E0;
	Sun, 14 Jul 2024 15:43:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 315871BF44A
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DB9F40139
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EoKjCI9GTTyE for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 15:43:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B8A8A40010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8A8A40010
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B8A8A40010
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 15:43:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76E6E1C0003;
 Sun, 14 Jul 2024 15:43:00 +0000 (UTC)
Date: Sun, 14 Jul 2024 17:42:48 +0200
To: Romain Naour via buildroot <buildroot@buildroot.org>
Message-ID: <20240714174248.23e0e371@windsurf>
In-Reply-To: <20240527100424.397567-1-romain.naour@smile.fr>
References: <20240527100424.397567-1-romain.naour@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720971786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aPpcXNR/OFu6tqU+mLMV6BhkPR0MEYb4q3FL/HhSLww=;
 b=hG45nBwzaq6H2XkvhRcX1t47aaAYOd7wDGngaX7ePvwS2aXaSB3zEW6/sSTjcKEvVnJdqU
 iHfboBwYUnn+fs+mMdHX6tZ7FgdRdquVlgfQ2/LIjO+8xRtI5OfLSImngP02CbcnegXIeR
 mLhfV8a8VzCm2Z4OpegHyXhKq34w/WEWmdKwtkp19KWJ0A91vfQRZ3ipvQSaVr1DeFs4lh
 Wysa/RswHANrE897wOAGLY8Sus+Zltre4JKslic+VWwz/USEJtb9ghz7asDcg5UAewFsEA
 koorBI0hLb9R73CB85Q8l4mW7m0kdn/r09WidBO8Q9EWZqabnMPefKru3TBiPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hG45nBwz
Subject: Re: [Buildroot] [PATCHv2] configs/lepotato_defconfig: new defconfig
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Romain,

On Mon, 27 May 2024 12:04:24 +0200
Romain Naour via buildroot <buildroot@buildroot.org> wrote:

> Add basic support for the Libre Computer "Le Potato" SBC.
> 
> https://libre.computer/products/aml-s905x-cc
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Tested-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

As we discussed today, and worked on today together:

- The FAT partition can indeed be dropped, and the kernel + DTB +
  extlinux.conf can be put into the ext4 root filesystem

- The "dd" quicks to write the bootloader into sdcard.img can be
  dropped, but that requires a small change in genimage, which we
  implemented, and submitted
  at: https://github.com/pengutronix/genimage/pull/260

The results of our work is
at https://github.com/tpetazzoni/buildroot/tree/librecomputer-lepotato.

I suggest to wait for the feedback of the genimage maintainers on our
feature proposal, before submitting a v3 of this work to Buildroot.
Maybe you can register/watch the Github pull request to get notified
when something changes there.

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
