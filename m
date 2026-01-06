Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A57DC47BD1
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 09:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC7CF812F1;
	Tue,  6 Jan 2026 09:40:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CqxrS1V3ISAQ; Tue,  6 Jan 2026 09:40:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EC42812E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767692408;
	bh=nXyWGeugmdNOh1DxkNlHiJUz4+VQDEscfXyLjIL6HF8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ibPSguvap0npvPgk/1Wcm6dtDiIcQXsesDF2ZFZPTm08zU1q4g1XQd1YcI8YW9IK4
	 hhHyL2zaTq6yPRmNeVQPsBwCUseITUSyS4Hes3gMS7N9Ldh60Ei6OCjxka+pwQVWAy
	 NgfMDScKZt4wyyUjZZrJPgToUacBkdkJJqernwAmAxtu64mEGROOesmdXGvjQx4kq2
	 WYqqJOcUFnRpEr9Z3uxYxnoQpkUiU8GTwTWuIi/yu+3kpUb5+S+u1j/nTnfAspPWQi
	 SywcLb6K1IOSCTu5oraM3dA1ARfa0QD9QnvyCCuWPgYwFZdtpiYuruUN9P9WKcOu69
	 Nf2HkCcsfdLhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EC42812E4;
	Tue,  6 Jan 2026 09:40:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DC722A3
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 09:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F5FB812E4
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 09:40:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n4yD-HHfxEDt for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 09:40:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4260780A54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4260780A54
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4260780A54
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 09:40:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E15A11A1AF0;
 Tue,  6 Jan 2026 09:40:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B459860739;
 Tue,  6 Jan 2026 09:40:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 81011103C8401; Tue,  6 Jan 2026 10:39:58 +0100 (CET)
Date: Tue, 6 Jan 2026 10:39:57 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org, Sen
 Hastings <sen@hastings.org>, Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <20260106103957.4e655da2@windsurf>
In-Reply-To: <CADvTj4r8prXxRJT1h6Mf-XjbDzq0YmUeYZL++gxGG0dHwSdeKA@mail.gmail.com>
References: <20251119154819.3416176-1-nolange79@gmail.com>
 <20260101230904.6d78e9f5@windsurf>
 <CADvTj4r8prXxRJT1h6Mf-XjbDzq0YmUeYZL++gxGG0dHwSdeKA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767692401; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=9pe9mU1OdRX/D9IsBO05gP8E3OlbLbXrwUm2MRNfMsQ=;
 b=wYl4MW10jYOXlvHVUR/78skfGiAktiENdWWk/uSUJeQ9rbmNEsy16EZrcF7+tErb2QAw/I
 BNPLAAGthXZVKKyS1YMY0qTgF/BrdgkkQcYOxnfeyOMu3boeedxsXHX10agjklOhWWIhBj
 4kcniugB5acNA+hb/6fKPrS6KvrldxKjjgMjOeoQ9kaQpkXk0SfoXhILTJhYlqqhCx6bAx
 QdIlgpfaKNf9hpe2nCsyX3Lpc10ToJw12C9B5gfjGTEdblkjbIvZzRLGfNjaCQFuBXSVNy
 FPHPGSUPDdQQQFBXC9O0QbniyRXT05PUKOiZdqNxarJJB2rSm7gnCplfExKF7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=wYl4MW10
Subject: Re: [Buildroot] [PATCH] package/systemd: remove several Kernel
 config options
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

Hello James,

On Thu, 1 Jan 2026 15:30:01 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> IMO we should generally default to enabling the recommended options
> as there are often good reasons for having those enabled.

I'm afraid this is not Buildroot's policy. Buildroot's policy is more
about minimalism. We want to enable the reasonably minimum set of
things needed for things to work, but not enable everything for every
possible use-case. This is why all packages are built with all optional
features disabled by default.

> In general I think we tend to default to enabling recommended options
> from packages unless there is a good reason not to in most cases
> already.

Nope, this is not what we should tend to. This statement goes
completely backwards with the 20+ years of Buildroot's history and
"philosophy".

> Also many packages include systemd unit files and it would often
> be difficult to track which kernel features those unit files depend
> on as most packages are likely to assume the system has any
> recommended kernel options enabled.

But with that reasoning, you could also be "but Qt applications can use
every possible feature in Qt, so when we build Qt, we should build
every single Qt module that exists on earth".

So no, we're not going to go down this route. Our users like Buildroot
minimalism, and we want to keep it that way. Of course, there's a
balance to find, as we want find to reasonably work fine out out the
box, but the right balance is not "enabling everything that might
potentially be needed".

Norbert: as I've stated in a previous e-mail, I'm fine with merging a
patch reducing the number of kernel options forcefully enabled by
systemd.mk. However, I'd like:

1. Our systemd unit tests to still work with this more minimal set of
   options

2. This more minimal set of options to be based on good reasoning, and
   that reasoning should be documented in systemd.mk.

Could you cook a patch in that direction? Please make sure to Cc me on
the patch.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
