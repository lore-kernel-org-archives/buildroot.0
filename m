Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E97BCD6E4C
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 06:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25A1E845E5;
	Mon,  1 Jun 2026 06:50:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mWAvqJOeZnEa; Mon,  1 Jun 2026 06:50:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0BE7845C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780296634;
	bh=hrk0qCTyVqqCbedBdaiwxeOZXzuT1MIAPi79b7kb+LE=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=mimSPUQz3QRlmgnhBO9Zg00mlvWHr9NVNN4mLxBMp8hYZIyP1NLkH2VJPEnInaqsX
	 xCbZBG040As1RALoEJiVYaR6/EZx8wtkJ8ND6bQPW520q3S+74VXBOE0oC9EY9U9iZ
	 c6kKjLKdY59M4+8nZ61dugO/BRs+Er2+K/6NBdBsg1DE0X6DzY6NilvpvmFwF6694V
	 0lqR8OZv2m7xF2JreYWoc6/I5yQInXQvASSU/cy32Bin/eYo2+WSs86Bf8DyGbTblG
	 aub0Vahe0OXmgNEbsZbJIHKSIAyudXmCi1XmG1UVWpZVXdqfkBYlDOpyNuTm2XUxNF
	 r2TQHExqFIVLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0BE7845C5;
	Mon,  1 Jun 2026 06:50:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 92D19294
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 06:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83F9F407F2
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 06:50:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TY5Prj6KJihF for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 06:50:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A1C94407DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1C94407DE
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1C94407DE
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 06:50:30 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-490ace40f4bso2646585e9.3
 for <buildroot@buildroot.org>; Sun, 31 May 2026 23:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780296629; x=1780901429;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AvSB6lps24iR+zO/SiiraFNV96FStnjRwUQspEc3340=;
 b=en+h+1u4093bgUMvLZS+6A7jeHYVniLKhnOE2xmQTmFNeJ+y28h3AoVM68vSmnmWJm
 /EhNYpG8GHH2t7IPgQSf81HX98TSTWzx/Blj0OKLWsjfzmgU5ox3ZzzPQ6CtTZyVzLRj
 qoD6FIoYMd1bMyKpBzELHmLHzORDZR26NudvRFla4TiUr+HtcynRxG/2rqwXlorHY6xx
 256OU82NYwR8pKQn2NR/9LGEVJ+QNzpULhGIfMNHaRXJzsvWgshzyMQ4AUj3HMX9cALA
 gE4Pf572YePXwG23x747dZq+8rRSAbU7mB67VJROvZsahL13SNWuPkKh9PPUcTUVNX0M
 qbLg==
X-Gm-Message-State: AOJu0YzY2/jFYfCStzaHFWgjK/gjA9QU6WQXpzr6vp6oh64caV+j9Qr1
 QPwq0mZ00dXTR9cGbIKzS/sT29EBatewOuNEV5h9GWqvncgzspexVi2SQfEjAIngPGg=
X-Gm-Gg: Acq92OFrq5BDIsHzLYblZWEHR2WkXctkIZNpn6DefvC42TfGzzJM5EpyX008s36Ra0j
 +LwupqwRr9r8pMQs6Hv/LIkv3Zm9L7GRUd8Lm3lnSAWvnNaYecHseKA5cLBlD7OzCVzuRhw7Nwq
 gb3TC3grLt65+KD2eg/zvPkJqzq7TqlwpUBkGEu2KLdg+O5SkpQcHWOQdh1GLi8zPC61BxUpY/c
 Qt3nOG3k+zTAtp2dVdZheg/luwkX13vGFDHLigq5fbQNiIJuaonVishMwtTMi1LxPfI8DWJz4bL
 Tb0Q1tO5Ji/f4Si6q6+QGD+QO8euGkdQijY0rkSintYCQLixR80hIZ2GbygYp8lObgWbeyy+TQJ
 BaPTzkObQPnHVrBfGLXI+lfUGmU0LOMjjqzobmHQQhPNwUEg0eZkJqpqDICdty1JGh7dvisZVlI
 DxePFP1UV1lwUsjpxkJJSkXEujzbjpJ7EZqNG76VekFd4R3PWbGxhXik912QnNvTHdi+T4reYE
X-Received: by 2002:a05:600c:4e45:b0:490:ab8b:1bb3 with SMTP id
 5b1f17b1804b1-490ab8b1c1amr24663355e9.18.1780296628854; 
 Sun, 31 May 2026 23:50:28 -0700 (PDT)
Received: from [172.16.21.183] (rtr.23.90.200.122.unyc.it. [23.90.200.122])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c09ac4bsm69543445e9.3.2026.05.31.23.50.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 May 2026 23:50:26 -0700 (PDT)
Message-ID: <e365b141-28f7-42d9-8d02-aeb68191e07a@mind.be>
Date: Mon, 1 Jun 2026 08:50:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260531153557.2375580-1-titouan.christophe@mind.be>
 <20260531153557.2375580-8-titouan.christophe@mind.be>
 <ahxgJkG0qqeRJf29@windsurf>
Content-Language: en-US
In-Reply-To: <ahxgJkG0qqeRJf29@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780296629; x=1780901429; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AvSB6lps24iR+zO/SiiraFNV96FStnjRwUQspEc3340=;
 b=F8Jle+mnJDRhfn22VJwbiuDLmJbCzHeOHJLRtT60HfPWXEoKMQSooXBrGCOC732WyG
 TABDed2hCmDG/4JYXsoLqh/VLaiJE3QK9/SUQGoQvVPPvvRqrGE+f0LmTI9fBwQOqS7a
 Pd3I3/mIXRnJtbcH+U0JN3oknbaL2hczGvXgKj65gB20rQVAwjbQAhoGL2nculyEqH5P
 eSw+cIWDmi9yHlbFs/FPW/LGEviXlepZURFEcyD8qX/RIvWpAGAHMWtuQRg2Eot2aFFv
 RyUrbR6mEZFedJx7MwWLo2Tr3EFWaC2PnntjYk3E8c8WjaESg2bY1F71q4M05i0BeNNF
 slYw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=F8Jle+mn
Subject: Re: [Buildroot] [PATCH v4 7/9] package/openssl: move
 libopenssl/libressl/.br2-external.in.openssl source statements outside of
 the choice
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: yann.morin@orange.com, ps.report@gmx.net, petr.vorel@gmail.com,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas, all,

On 31/05/26 18:22, Thomas Petazzoni wrote:
> On Sun, May 31, 2026 at 05:35:51PM +0200, Titouan Christophe wrote:
>> +config BR2_PACKAGE_OPENSSL_EXTERNAL
>> +        bool "from an external tree"
>> +        depends on "$(BR2_EXTERNAL)" != ""
> Hu? What is this thing?
Not exactly sure for this particular entry (maybe you still remember 
that part @Peter Seiderer ?). Indeed, if I revert that particular change 
everything still works as expected. However, reverting either the 
libressl or libopenssl trigger the issue.

What I can tell for sure is that the libressl & libopenssl changes are 
required because a choice can no longer contain ifs, and the included 
file have some; hence the trickery to move them out of the choice.

I don't know about a publicly available br2-external that provides 
openssl, but if you have some I'd be glad to look further into that.
>
> And what about the other packages that are like openssl, i.e virtual
> packages that may have providers in BR2_EXTERNAL trees?
To the extent of my understanding, this is because the included files do 
not contain ifs ? At least it is the easier case, as we don't have any 
external at the moment.

So maybe we should do it for all places where we include an external as 
a preventive measure, in case the external provided config.in contains 
any if condition.

>
> Thanks!
>
> Thomas

Thanks you for looking into this !
Titouan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
