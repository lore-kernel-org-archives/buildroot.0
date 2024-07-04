Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383E2C30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 06:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E666C400E0;
	Thu,  4 Jul 2024 06:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 36yYzdrGyPt6; Thu,  4 Jul 2024 06:52:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC55240364
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC55240364;
	Thu,  4 Jul 2024 06:52:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED7E81BF391
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 06:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAE16846F0
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 06:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id soF1Z04sWLjv for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 06:52:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E487B81F44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E487B81F44
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E487B81F44
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 06:52:22 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ee794ec046so2857191fa.2
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 23:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720075940; x=1720680740;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z4rrzRsoT0ZSB1QZm7olLHygXSisFcVH2uu010kGIK0=;
 b=mROC35T/f322r8S2ZjkkbgfVimQ1zF2NU16rbsyt203a+Ms66F/CyYhILpMleAxtkJ
 sifzf8t+3BdC4xSwxZ4pcl8apIzil5qFsDG/+QXU/Bgjn2JypRPnCLBBtnRy7LnLe14c
 k3lSR/vWyAuXaOTH31Bm841UFF/oOoFanMu3vQLyeHsG+P54G0BLq78U/ehYHe43gvUl
 x7DhuG85fMNV4vI9zlqrwsPusPAOZw0BOMEY3KgTs0pNt+V3nii7QAMLRR2h0zsHBcQV
 TVtdTRlXAb8IrQ82VHEqd5wqJpEOb38TFhgA39RqiXKaD15N/WPkl/F0mGhxVFrs5iWf
 q5vA==
X-Gm-Message-State: AOJu0YzsZ3r7OdlLVxb3WIgzxyK936+K8VqvO2HgLnw3F3GMHIgqQ5Iw
 WADRtRqpRk4rdNmlcvJPrTvYnnF9gRFZRNRCimupszvCORDyrgXG9ul345qDf02kLMMvtPtiyvT
 c+dMnOPro2AsrMAOnDa0Wna4/ZuEUOw==
X-Google-Smtp-Source: AGHT+IHRCkRrN2Vlh3AQ71pk1Dw3I6bXjUBwHCmEfG5jxpkXXt1ueg1N9r6eeQhOrmaztEgBicoDH3c0Uzt9uX7pdcc=
X-Received: by 2002:a2e:a58a:0:b0:2ee:6a72:f006 with SMTP id
 38308e7fff4ca-2ee8ed8c709mr5399621fa.21.1720075940253; Wed, 03 Jul 2024
 23:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <5e6129b8-9672-efd0-32c7-18d0defcad21@gmail.com>
 <CAEyMn7bdo1UPCxy5pRi-SXsTgjy_o9wYkPZ+CgYrh7CPDgUd0w@mail.gmail.com>
 <179f54c1-ed3c-4cdb-8110-71116525a6ac@gmail.com>
In-Reply-To: <179f54c1-ed3c-4cdb-8110-71116525a6ac@gmail.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 4 Jul 2024 08:52:08 +0200
Message-ID: <CAEyMn7apYeyK=YuAUUSA9ANTh2nwER3x01Q89x8Op9aRxLuNQQ@mail.gmail.com>
To: Lance Fredrickson <lancethepants@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720075940; x=1720680740; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z4rrzRsoT0ZSB1QZm7olLHygXSisFcVH2uu010kGIK0=;
 b=ZhGTasidO0CVt1QEhjWXUCFxAjY1776bOLiPGfoEIi1ABRC8LMCrbL5vFFfKI9NBt0
 eVg1G9r6O+27d5ibWOmydQv4zgUAOOO50XdO90My6QdLYdTSsK5plMLz0M7B0VytHneb
 RtMyNiB6iPNc7mled/PVLuqyICTSnvU8NQ6cb5mJFeS7MfeLpZvkYRlbEmh6jgkTc6KF
 GOfiSqEtBU7eJcuZVowbYGrHocxydKunacBhOBv1maP6q7MjHXmMInU8iU41Rm5aELL2
 JojnPBAcVeTnOa0TvJUXIqY1S6l6FutleLMD7zSIr8Kr7YFdYzwBv1MNoKBQo8+tYNEv
 +rHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZhGTasid
Subject: Re: [Buildroot] 2023.05 host ccache detects avx512 and fails to buld
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
Cc: James Hilliard <james.hilliard1@gmail.com>, yann.morin.1998@free.fr,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Lance,

Am Mi., 3. Juli 2024 um 17:03 Uhr schrieb Lance Fredrickson
<lancethepants@gmail.com>:
>
> I've just been carrying this patch that disabled AVX512.  Seemed like
> not a lot of people were using ccache.
>
> https://github.com/tomato64/tomato64/blob/master/src/patches/0001-disable-ccache-av512.patch

Good to know that this is also possible. But as you can see I bumped
ccache and added new  system dependencies to fix this issue.

-- 
Heiko

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
