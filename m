Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF89ECD1284
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 12:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6364441DA5;
	Thu, 11 Apr 2024 12:48:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WjYdCITFIM_X; Thu, 11 Apr 2024 12:48:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40AFF41E18
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40AFF41E18;
	Thu, 11 Apr 2024 12:48:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 99EAA1BF2F9
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 12:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84DC782218
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 12:48:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MSGYggMEvXb9 for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 12:48:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5C2F082215
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C2F082215
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C2F082215
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 12:48:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8EB0620002;
 Thu, 11 Apr 2024 12:48:05 +0000 (UTC)
Date: Thu, 11 Apr 2024 14:48:04 +0200
To: "Matt Staveley-Taylor" <matt.stav.taylor@gmail.com>
Message-ID: <20240411144804.03fed97d@windsurf>
In-Reply-To: <D0GWMG6HYQAC.1IJW02HTVHSQB@gmail.com>
References: <20240408013859.732937-1-matt.stav.taylor@gmail.com>
 <20240408225410.6a8ba988@windsurf>
 <D0FYEL09CD80.1UJQPUQZNKEPS@gmail.com>
 <20240410113043.419ef54b@windsurf>
 <D0GWMG6HYQAC.1IJW02HTVHSQB@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712839685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Zwr//1L/pKoVMB9qt1dNr8JjgqGOeSfLLrgZJmn3iU=;
 b=CormYiomx4EMjDzba2IHrFvai76C8G21KsUIfHnRc2DwK8FfD97BNX9AsBYbNESOhW9EzY
 bO02Jfx+GSS7UkVYvKeQGyNBEDTb4EMOcHQsqcTbagttKr4IBEpIIiIE7T4bmXUIsdvp1n
 3vYrtIG9+rsgS4C9X45k7cDuOIwL81XEUws3UHawMCPmvlGWNCxIqCvUq+gyUbPL1yz3kw
 Ok94+gMbbsDOEUyD5M4W0/ztDHb42gpGfsKjXjYH+xm/zPaXZAEoM78n+XrnkNdpEV87Gt
 iDMbXqmvOwdjNAdhNzWJa6v+4Ne6Z4MC/anos0r8iuZd7HzkiWhPxPy+KH6lIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CormYiom
Subject: Re: [Buildroot] [PATCH 0/2] Add bcachefs-tools package
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

Hello Matt,

On Thu, 11 Apr 2024 02:32:24 +0100
"Matt Staveley-Taylor" <matt.stav.taylor@gmail.com> wrote:

> I noticed that host-rust downloads a pre-built binary from somewhere. Is
> there a possibility to do the same for host-clang? Or how do you want to
> proceed here?

It seems that
https://github.com/llvm/llvm-project/releases/tag/llvmorg-18.1.1 has
pre-built binaries, but not for the very common x86-64 linux host
platform, which seems odd? Apparently, those binaries are made by
volunteers. Not sure how much we want to use those binaries.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
