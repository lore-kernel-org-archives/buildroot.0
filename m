Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B1BCE7A9D
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 20:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68BC1400E4;
	Thu,  5 Sep 2024 20:42:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LiSD2fw1-ukY; Thu,  5 Sep 2024 20:42:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F9844028F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F9844028F;
	Thu,  5 Sep 2024 20:42:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 333B01BF41B
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 212BF81E2F
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:42:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TKIamJuyKsVW for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 20:42:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DC91281E01
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC91281E01
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC91281E01
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 20:42:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 995241BF203;
 Thu,  5 Sep 2024 20:42:21 +0000 (UTC)
Date: Thu, 5 Sep 2024 22:42:20 +0200
To: Yu Chien Peter Lin via buildroot <buildroot@buildroot.org>
Message-ID: <20240905224220.5feeae54@windsurf>
In-Reply-To: <20240904051609.2871616-5-peterlin@andestech.com>
References: <20240904051609.2871616-1-peterlin@andestech.com>
 <20240904051609.2871616-5-peterlin@andestech.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725568942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=953U1eSiK9vZWy/qny2O8/PdrOUjBNqipsyE35OjKiA=;
 b=dDS5MzpcbFJ065ZtoMumVxbWaGLLzZuotnSHAtvVYzH6R7Kq9/p3WHC6scBa2v8RgYmJ7D
 9Y5RhNSYm8gbN+HuJR32siTn28r6yLtp8HV86hRLFsfiWgo0ZCL8SCfV/cpZATaDXMfRBS
 bMmAv5YUqk8BYRF0oolWQQVkWq8GTB5VoywyaUATzVC+qfVFz4KiyKYpqfxlpIVvmCrvgL
 u15IWkHaSjOY4gfTtlgAzPN6fE6crBVvzAvMfIse6AnBivCkz2xs5zBFgC3yaR9bdXbY5O
 za0z9l76i+dPZHFPh4MdAQOSkCf4BNOcYjG/v/8ldO+//aPRzU9vQG2FSuTwcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dDS5Mzpc
Subject: Re: [Buildroot] [PATCH v2 4/4] board/andes/ae350: readme.txt: Add
 SPI_burn tool instructions
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
Cc: tim609@andestech.com, Yu Chien Peter Lin <peterlin@andestech.com>,
 ycliang@andestech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Peter,

On Wed, 4 Sep 2024 13:16:09 +0800
Yu Chien Peter Lin via buildroot <buildroot@buildroot.org> wrote:

> +How to update the bootloader and device-tree
> +============================================
> +
> +To update the bootloader and device tree, make sure you have an
> +ICEman connection set up as below:

What is ICEman? This probably should be explained, with a relevant link
or something.

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
