Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC7CCE9D40
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 14:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FC1281774;
	Tue,  6 Jan 2026 14:48:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lCxAia6r8HFt; Tue,  6 Jan 2026 14:48:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DA3A81455
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767710889;
	bh=z05/n6IRWFHxfE6zX9j9bn3QU4Jjy4rEUnr26e4wqZA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=s975Y6ystHZWlT0hgBnkVhULB3LisqCWstJObqMNwcMOHDbUikd9vLyelV3/9BnIF
	 FchAIVXIMP5QayXIOBIDJfCgbjpYVkYagyCpezsa4JGYz6x0r7+/4XStK1ar2hN+qf
	 DueXrwwupvYe7S4J1J5CWW0ewOPHBDreh+aj0ekMtmXfcme18GkoKA5u27F1pfhai4
	 R1CuqCSgFq3OSQ+IH+39tpzywLVQiFMN5JyiJm9oWQuAL+FpMK3JKH806HDBrsX1fs
	 wHa8AIDCl7XcoqTeBjbGxktcF58d2qhSzmRd1H0QIglu0rT1y2l8I5PqZtniIUZVbL
	 PtS1GgWFCcXLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DA3A81455;
	Tue,  6 Jan 2026 14:48:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B81F249
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 14:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D6B840691
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 14:48:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xd_ZWr-czvmN for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 14:48:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1370B4067A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1370B4067A
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1370B4067A
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 14:48:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C39C44E41FAE
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 14:48:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 98BDC60739;
 Tue,  6 Jan 2026 14:48:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 825A8103C86C1; Tue,  6 Jan 2026 15:48:00 +0100 (CET)
Date: Tue, 6 Jan 2026 15:47:58 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Message-ID: <20260106154758.37b2117e@windsurf>
In-Reply-To: <08ad8b80-c5b6-4dfe-a3a9-e3030583af59@gmx.de>
References: <20260103114046.2461857-1-fiona.klute@gmx.de>
 <3fe4137c982f5acd08e775ca43dab9f2@free.fr>
 <12ad4f39-5622-430c-9b02-fcd5893f6730@gmx.de>
 <951a546a-a56c-4aa9-b515-b72f73bd249b@gmx.de>
 <9547c61ca16e7605d291fb41116a0769@free.fr>
 <754dff23-3a88-454e-ba32-8341aecbab15@gmx.de>
 <08ad8b80-c5b6-4dfe-a3a9-e3030583af59@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767710883; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=J25OY6B3ffpO8kmGFUU5GpeNhZ0CTSR4O4IDYsR/iUU=;
 b=uBgjZgvoqT3r0/hYd28/EKug+8MRHRZh2S9m/6zMIsd+cv3ozPsmmTXTLI/CS+bTQPiveK
 47kT0iQn5MsRBFLHhj7jS9kskVkI/yUnFf6qNvH3jGoFc0/I7SgemSXpk9t1Y186+5anJ0
 tgr8075B3LFcX5KPIY0Zhw3aVMoGEyx9ItjLmUN4LtOJJLKRdfHh6woUhhsU+vzhsHilYB
 rNKUsoU6H8/s3jEGFG3yF5/eLQuqv6DqoTvhmtttAaSA0eHZhOlMjy+N+53wMX6pGTkSQu
 aVZpyPzpRQW1XiYs/k7mpZPicp0LwAf2iMPPxX4/UjWZ8AFTUEOlmN9tJErmYA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=uBgjZgvo
Subject: Re: [Buildroot] [PATCH 1/1] package/squashfs: bump to version 4.7.4
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

Hello Fiona,

On Tue, 6 Jan 2026 14:52:07 +0100
Fiona Klute <fiona.klute@gmx.de> wrote:

> > I've created an upstream issue about the problem, citing your version 
> > details (thanks!): https://github.com/plougher/squashfs-tools/issues/338  
> 
> Update: The upstream maintainer has added a fallback similar to the 
> util-linux one [1]. However a new issue has been reported since about 
> corrupted images with all-zero files [2], so I think it's best to delay 
> the update until that's resolved.
> 
> > On the Buildroot side I wonder how old toolchains can reasonably be 
> > before we consider them *too old*. So far I thought the Bootlin stable 
> > toolchains were the expected baseline, because they're supposed to be 
> > used for tests unless there's a good reason not to. Personally, I 
> > wouldn't consider musl 1.2.3 "recent", uClibc-ng 1.0.50 maybe kind of, 
> > but toolchains from 2020 definitely outdated. I may be influenced by the 
> > ~2 year Debian stable cycle. ;-)  
> With the upstream fallback merged the question isn't critical any more, 
> but I think it'd be generally useful to have a documented answer.

On the gcc version, we do have a fairly clear policy, but it's true we
don't have such a policy on the C library. We try to reasonably support
older toolchains as we recognize people may be using somewhat old
toolchains to support specific HW, or just because they "fear"
switching to a newer toolchain. So in the case of squashfs, when there
is a relatively easy fallback solution, it's always good to have (and
good for upstream, as it makes their project more broadly "compatible").

I don't know if we want a policy that says "toolchains with components
older than X years are not supported. Can be a topic for the upcoming
Buildroot Developers Meeting though.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
