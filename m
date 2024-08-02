Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7848C52D6D
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 06:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72F6E81E7E;
	Fri,  2 Aug 2024 06:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HfVs9KeefEbe; Fri,  2 Aug 2024 06:23:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F98C81EE3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F98C81EE3;
	Fri,  2 Aug 2024 06:23:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D7B691BF421
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 06:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5B6C40C7F
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 06:23:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EDxpQNZOpaEa for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 06:23:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4F18840C67
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F18840C67
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F18840C67
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 06:23:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 928631C0002;
 Fri,  2 Aug 2024 06:23:14 +0000 (UTC)
Date: Fri, 2 Aug 2024 08:23:13 +0200
To: Bagas Sanjaya <bagasdotme@gmail.com>
Message-ID: <20240802082313.617f5ad1@windsurf>
In-Reply-To: <20240802050830.1020682-2-bagasdotme@gmail.com>
References: <20240802050830.1020682-2-bagasdotme@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722579794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5lTpRIRmxuIy1x3y8TBk1/kslj+T9uePi9UdSJO5M+w=;
 b=TE2N5STtIrQZz/2kF5Jl3SGhks/L/1wWxV5oCSrSV9uqRCbLijPcTyCpozRNQsqlFgqLrR
 A9N0PSFHDCH1dBBAeLhG8PbObLcD20rYApkEF4gF9e52TNrNoTNaybKfOO1VRV7wI4QUwx
 PF6tNf+lkaAI8SV72HjjkAXJg0utJyFM45TMsC/TTrFkrO7+1igyya/rwye+Bxpo6XmibW
 GdlENvrydeYI2rvpEMPS4MWu/j2iG+qz8XmB/6jHb3MQXPYGi6xzcVnd574Vr+iz7H2xTQ
 bOQ12X/L5SJLykj/mUo8wM2VUkYNlgFdyPrYs1gVRH6ZfN2l2gE2XTTytLpyIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TE2N5STt
Subject: Re: [Buildroot] [PATCH] package/git: bump to version 2.46.0
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
Cc: Buildroot Development <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  2 Aug 2024 12:08:31 +0700
Bagas Sanjaya <bagasdotme@gmail.com> wrote:

> Bump the package version to 2.46.0.
> 
> Release notes:
> https://lore.kernel.org/git/xmqqzfq0i0qa.fsf@gitster.g/
> 
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  package/git/git.hash | 2 +-
>  package/git/git.mk   | 2 +-
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
