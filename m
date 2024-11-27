Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532C0D609A7
	for <buildroot@archiver.kernel.org>; Wed, 27 Nov 2024 07:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE34B607AB;
	Wed, 27 Nov 2024 07:44:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t8bdsLj1Q6RJ; Wed, 27 Nov 2024 07:44:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6BCD607AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6BCD607AF;
	Wed, 27 Nov 2024 07:44:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 498931DA8
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 07:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3678D42A8E
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 07:44:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BSXEB9cmjv4x for <buildroot@buildroot.org>;
 Wed, 27 Nov 2024 07:44:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C170E42A79
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C170E42A79
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C170E42A79
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 07:44:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B36B40003;
 Wed, 27 Nov 2024 07:44:17 +0000 (UTC)
Date: Wed, 27 Nov 2024 08:44:16 +0100
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20241127084416.2467f7e0@windsurf>
In-Reply-To: <CAFkzVZbXtKAezUsDyDtYxhwg5CQ0A5tBnrmA9JPmi2OwGOXtXA@mail.gmail.com>
References: <20241030002020.73963-1-fancp2007@gmail.com>
 <20241031191844.60ba9a59@windsurf>
 <CAFkzVZbczGknp7uz78yCHo+8aW3RbjQG0ns4fGPv=Gakb02fWw@mail.gmail.com>
 <20241124172908.2b4db731@windsurf>
 <CAFkzVZbeK3a-5ze3g9hWod5uhHqq1tbL+eMZ+Bz8nA9noMherA@mail.gmail.com>
 <20241126145738.0b2e25cf@windsurf>
 <CAFkzVZbXtKAezUsDyDtYxhwg5CQ0A5tBnrmA9JPmi2OwGOXtXA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1732693457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aie1xd8TMiuC/wEQVUlYHr1n+5tv80sSI/JHaP5mLKs=;
 b=TTkgPPu/TYNKjktAAV2jP89sSO6b2gMioSOjiZz24e94pqDN+mkapqTeyyqSMuHgof/X6p
 F2TD3KJWuHTIJ+Np6hA6ObNfG1sf8WD18OwV3+DX1pEA58dDRQqT7cgpsHzKt63/KDP7qA
 vqrsd86ih6v4x5NO7dhkFrgPLZOMb+kQSDuPnvx3M4Tf4lL+FQQZ9RM0xadbpmIYh1Xx/J
 1Mc/q4OtednyTGAuux3DRxyZstbKAlsa2K0Dg2BYZrTjLywZEgMWidicR7zyXWN6jQLzEV
 jJ/Bg+oFpZsWK1/Al2KsbBturjusaNp9Y7lvAl32mHWjzEMgi5ZzNkg3A2BoQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TTkgPPu/
Subject: Re: [Buildroot] [PATCH] package/procps-ng: fix pidfd_open checking
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

On Wed, 27 Nov 2024 08:35:42 +0800
Scott Fan <fancp2007@gmail.com> wrote:

> Sorry, I made a mistake, it should be:
> 
> ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3),)
> PROCPS_NG_CONF_OPTS += --disable-pidwait
> endif

Correct.

> But another problem is that the --disable-pidwait option does not
> exist in the v4.0.4 version unless the following patch is applied.
> https://gitlab.com/procps-ng/procps/-/commit/2507bc475782ff5e0541d37c780dff1e293c9553

Well, we can simply backport this patch for the time being, until
there's a newer release that includes this commit.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
