Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D46BD10BFC
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 15:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54DC582114;
	Sat, 26 Oct 2024 15:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZVGtpQNTCzy; Sat, 26 Oct 2024 15:20:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63AA58210C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63AA58210C;
	Sat, 26 Oct 2024 15:20:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EC6C12318
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2F1D8210D
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nQfj2TaTY7wE for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 15:20:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A58CB8210C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A58CB8210C
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A58CB8210C
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:20:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A64A840002;
 Sat, 26 Oct 2024 15:20:28 +0000 (UTC)
Date: Sat, 26 Oct 2024 17:20:27 +0200
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>, Torben Voltmer <mail@t-voltmer.net>
Message-ID: <20241026172027.61029c4e@windsurf>
In-Reply-To: <20240919161908.125007-1-thomas.perale@mind.be>
References: <20240919161908.125007-1-thomas.perale@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729956029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lhR7BwhKStwMbs552bez6XaO1KLVQbPCbJhip3HOB1U=;
 b=l9BDKp4NqjLt7AlSUji3piNcgwmZVyylR0FBsZksvZPTrT14bvmUsa20eCQqhYb2zUXbVY
 x8G6ZbmQ+y7iRDCUxy49gqpMSaVrgoncgVmpKYScFJJyVeK1TQSrzpivbQsW2DK+L1MATW
 jvj0dM4v1T+djwSTsG1IpQ67aWUdt5ZAa11lh7WlWrYer6j8HUm+BCTAZQKs5/1OeimXZd
 QmzDy7sxL53WdGgLUMPdIKjfoIQe7dhA0lsOnLaR4ZwwLTMw7fNf3o9MgE0TK5iglRHXJM
 DEOu6azxczMXSlwWvrH5c86eJzKNnvkJMIGCMSKZHFQ1kxO54mQbsiHwt/m7Zg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=l9BDKp4N
Subject: Re: [Buildroot] [PATCH 1/1] package/espflash: bump v3.1.1
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

On Thu, 19 Sep 2024 18:19:08 +0200
Thomas Perale via buildroot <buildroot@buildroot.org> wrote:

> Fix the following error:
> 
> error[E0282]: type annotations needed for `Box<_>`
> 
> The issue came from the `time` library depedency of espflash
> (see https://github.com/time-rs/time/issues/693).
> The `time` library has been bumped in the following commit
> https://github.com/esp-rs/espflash/commit/233490736646ca7bc29463a98df98d7ccf53439d
> 
> Fixes:
>   - https://autobuild.buildroot.org/results/321/321598baef543b84ce82c09a88e51ad745a15dfd/
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>  package/espflash/espflash.hash | 2 +-
>  package/espflash/espflash.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
