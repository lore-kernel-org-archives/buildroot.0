Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE451E68958
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 08:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BA5C6065D;
	Thu, 31 Oct 2024 08:04:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1buFb-aYpcQR; Thu, 31 Oct 2024 08:04:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C10260671
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C10260671;
	Thu, 31 Oct 2024 08:04:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 049795E4F
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 08:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0BE881016
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 08:04:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EfBCJE8Yecwr for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 08:04:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 841F48126A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 841F48126A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 841F48126A
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 08:04:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3E0BDFF805;
 Thu, 31 Oct 2024 08:04:13 +0000 (UTC)
Date: Thu, 31 Oct 2024 09:04:12 +0100
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Julien Boibessot <julien.boibessot@armadeus.com>
Message-ID: <20241031090412.782beb1b@windsurf>
In-Reply-To: <20241029235931.37689-1-fancp2007@gmail.com>
References: <20241029235931.37689-1-fancp2007@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730361853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Prkq9BI+/Afh85z452uqsGjXXaYqnCMDLoWPP1YKkDA=;
 b=CSJJjgnaE1y+i+XCcGrrm302QogcRHNxBbGV2PH3ufijaX/khfMnztv4Jx41XebjVPbM3H
 1HF7u4ScbzPkMiMWHkrTzfpBSvD8jxTSjkepWLQRKe6B7R+mzNchDPXyR7nw0l+dpVkMB2
 OzLMtjorbyl6bRne4GXesoLgpDGX96I5XNSaXGyIYKEK+0fGAR+Ib+I1DgZk0BP3670fyx
 8K6DQ2xTMdeAe3V/BRaoWQ9o+s1G/aN6aq9+krlhPrvs1oX5tcrje6cbhIkAu+IYX5QEOd
 UrCemPw8DbLpzoBTeXXPBGHM43mUdwLYhFE1alIuzt3QQ5jmyReezE6S2PB6bg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CSJJjgna
Subject: Re: [Buildroot] [PATCH] package/libmodbus: bump to version 3.1.11
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

On Wed, 30 Oct 2024 07:59:21 +0800
Scott Fan <fancp2007@gmail.com> wrote:

> Release notes:
> https://github.com/stephane/libmodbus/releases/tag/v3.1.11
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>
> ---
>  package/libmodbus/libmodbus.hash | 2 +-
>  package/libmodbus/libmodbus.mk   | 2 +-
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
