Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D40ED43370
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA48B826BB;
	Fri, 12 Dec 2025 07:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c3B1UhUav8D3; Fri, 12 Dec 2025 07:54:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAB36826C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526041;
	bh=g67zaznIv+BfwofD4F2Nbv9akJTkMAoq00/sN/WaFJo=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=ZRuhyGFcYq9sdiKUktchnDwc2m+U+EOonZqGvAZxpnyDFv6o3a0pFy6wbfABJIRpD
	 pYL0OmjLtxWj/rg/Ki+ZGjDuAmw0fOB/6eaCSYwZFpu87bpG+OIdDEVm2+N/elDA4V
	 jJZlKnC7j8VvW4dwCbMaF8hmC6ET/wJ9aYn7e2DTto/J7241ftMN1LhbpBdSq/kzpI
	 K+ug94Gk89Ws1phLmstqtBHrdtxoyI5xoB5dWB+eoXtOPr45pvdyOMleXu0zXsujFn
	 nfDrOtxIggHt1oERlfzvaUzUSGRNdeDHnvl1Q3p9LyxA+4TXDtf95RkO6EZ+i+24Es
	 DmSORv+x4QNww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAB36826C0;
	Fri, 12 Dec 2025 07:54:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C8BCE7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4020A40223
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2tcUiYamyNZg for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:53:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2335B40154
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2335B40154
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2335B40154
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:53:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E3321C1935C;
 Fri, 12 Dec 2025 07:53:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CEA31606DF;
 Fri, 12 Dec 2025 07:53:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1AE63103C8E02; Fri, 12 Dec 2025 08:53:51 +0100 (CET)
Date: Fri, 12 Dec 2025 08:53:50 +0100
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Message-ID: <20251212085350.307c46a3@windsurf>
In-Reply-To: <SJ2PR12MB818487232470DA4456967C73A1A3A@SJ2PR12MB8184.namprd12.prod.outlook.com>
References: <20251205212959.2082018-1-thomas.petazzoni@bootlin.com>
 <87sedoazgb.fsf@dell.be.48ers.dk>
 <20251208172339.4a6d24a3@windsurf>
 <SJ2PR12MB818487232470DA4456967C73A1A3A@SJ2PR12MB8184.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765526035; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=2IdWZR21NbntTeP/QLhvQVk5oXmgugbYCCiFTxRh4f0=;
 b=nM1uF5FDFJQuIC9cS6hP81uY6w4p7qCnRHmK7LaMT04pqJ8jsE11+WtgPP5r6/Zc1zUd8O
 vm1tpZEzImvm1ftuJsYlGA5MKb4S09QMyWtHr/bajVm36q+Ff1Z7c3SIN06PeAJGgFBRPO
 jDrZo/i2NDBfkk8TXHSBq1QfavlmmBrl6iG1/wDc22R51lWngj+kcMG36BGS1dc33GBMWX
 09EAqryJoVL0/EhN1/NeKK1iAt+lEwEhYROXVLdMe274DN46Lwvd8+I6dx7geujoCJDIwF
 EPxim2dWrDftz6jLNqLTgeGCNbIcra6bQMWWqxzqONFi/5bt446zHe93Pio7lQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=nM1uF5FD
Subject: Re: [Buildroot] [PATCH] package/glibc: only supports ARC
 little-endian since glibc 2.41
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
Cc: ARC Maintainers <arc-buildroot@synopsys.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alexey,

On Tue, 9 Dec 2025 14:06:16 +0000
Alexey Brodkin <Alexey.Brodkin@synopsys.com> wrote:

> Synopsys ARC person here ;)

Good, thanks for your feedback!

> I think indeed, we may remove all the big-endian support for ARC.
> Reasons are since introduction of ARC HS4x processors we no longer support
> big-endian in any new processor IP, and even for older IP which used to
> support big-endian it was rarely used... so basically there's no good justification
> to spend any cycles on big-endian support looking forward in this project.
> I.e. BE support in uClibc could also be removed if it makes any difference.

Based on your feedback, I've sent a patch to completely drop support
for ARCeb:

  https://lore.kernel.org/buildroot/20251211161615.503688-1-thomas.petazzoni@bootlin.com/

> Well, I must confess that indeed quite some activities (including Buildroot
> support for ARC) were deprioritized some time ago due to resource
> reallocation to other areas which were not that polished as our open-source
> components. But even though I don't think that situation will change in
> comings weeks, support of ARC HS (both v2 & v3, AKA HS3x, 4x, 5x and 6x)
> in Buildroot and other open source projects is very important for us as one
> of the key enablers for ARC Processor IP, thus by all means I'd like to see
> corresponding support in.
> 
> Also, I have some ideas on how to apply some more love to ARC support
> in Buildroot - let me explore that possibility as we do want to keep
> at least existing ARC support in Buildroot and other open-source projects.

Thanks for your feedback. However, we can't support ARC in Buildroot if
there's not some minimal involvement from Synopsys to fix the
architecture-specific issues.

On August 21, 2024, I sent to you and Yuriy Kolerov an e-mail about ARC
toolchain issues.

On December 1, 2024, I sent another e-mail about ARC toolchain issues.

On December 27, 2024, I pinged again about this issue, and adding some
more.

On August 29, 2025, I reported again some other issue with ARC
toolchains.

This last problem still exists:

  https://autobuild.buildroot.net/results/be8/be8a35c9b07116f7de611c4b5ab821d500a2b12d/build-end.log
  https://autobuild.buildroot.net/results/b76/b768be74b5a5bce84b0172091f3f8720279f1028/build-end.log

The ARC-specific binutils version fails to build under some conditions:

  https://autobuild.buildroot.net/results/827/827708f47176368aac6439692c6e43ff6f2a0487/build-end.log

I understand that you may not be able to go through all build issues
affecting ARC, because many of them are not ARC-specific. Precisely
because I understand that, I have pointed out to you the specific build
issues that are ARC-specific, hoping that someone from Synopsys would
have a look.

So if by all means you would like to see the ARC support stay in
Buildroot, then Synopsys needs to dedicate a little bit of engineering
time to resolving the ARC-specific build issues. Do you think this
would be possible?

Thanks a lot for your support!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
