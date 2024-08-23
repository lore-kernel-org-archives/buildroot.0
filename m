Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B1CC531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 17:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA1CC402DD;
	Fri, 23 Aug 2024 17:09:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QoIdu3qsMY5g; Fri, 23 Aug 2024 17:09:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9617B4033B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9617B4033B;
	Fri, 23 Aug 2024 17:09:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E692B1BF306
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E075840179
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:08:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L9va6BgN8J-l for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 17:08:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A70B04015E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A70B04015E
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A70B04015E
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 17:08:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72C40FF802;
 Fri, 23 Aug 2024 17:08:55 +0000 (UTC)
Date: Fri, 23 Aug 2024 19:08:54 +0200
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20240823190854.59bc7c85@windsurf>
In-Reply-To: <20240822143738.3031317-1-festevam@gmail.com>
References: <20240822143738.3031317-1-festevam@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724432935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cEcP25ziGmpjHEru7CHrwdcEDeCavDI62EHAkeZak5k=;
 b=cR2YN8KyEhSqB9+2d1eoLTYhJVCa5Pf7EEW8FeN61akaIe6iaXZwYIOyveuGIFP6tIbcIt
 2hTGW1Ok/7yZPrlFjh0TZpITFEQZLr4udsr5bITcXNsGUGLFcQDN+lVhpEUdW075y2Yq90
 6CMfCLDKBvx1dIjhVeTwcmeh9nEZVXL3eGugX0AKRgNxY0x1RxJQNzh5/69CXkMFKZWJMW
 GF8ayw9p/mdnjoayHjGf38aDMQxDvdPgZGTdX+jeKA7RxykGXAdT4p/i3N7Dw9wRswaDE3
 yu9y5DoH3wqr18igsUkPXHNNBSBa/vlc0n9RRtfUJOexiEoqvd0LJndhsC2RqQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cR2YN8Ky
Subject: Re: [Buildroot] [PATCH] configs/imx6-sabresd: update U-Boot and
 kernel
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

On Thu, 22 Aug 2024 11:37:38 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Update to U-Boot 2024.07 and kernel 6.6.47 versions.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  configs/imx6-sabresd_defconfig     | 4 ++--
>  configs/imx6-sabresd_qt5_defconfig | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
