Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDCFD10BF9
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 13:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFBD340D73;
	Sat, 26 Oct 2024 13:32:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VaANra9ZkFMa; Sat, 26 Oct 2024 13:32:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FBBF40CFF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FBBF40CFF;
	Sat, 26 Oct 2024 13:32:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 573E15C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4471A40B83
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:32:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A7yQr8et2Ohj for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 13:32:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 33F53409FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33F53409FD
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33F53409FD
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:32:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 70CAB240003;
 Sat, 26 Oct 2024 13:32:41 +0000 (UTC)
Date: Sat, 26 Oct 2024 15:32:40 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com, Christophe
 Priouzeau <christophe.priouzeau@foss.st.com>
Message-ID: <20241026153240.409658ae@windsurf>
In-Reply-To: <20241008204145.3837269-1-dario.binacchi@amarulasolutions.com>
References: <20241008204145.3837269-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729949562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OSGxTW7sFvk+wamp6W+T9I1X+pJf7NrFhEm6QrgtvsU=;
 b=Od4TBiT3e5KzHpNKURkWPKZD4uVbE8Nu7ToShOiiqHJ38qHQp91/dLSvW4lV7ClBjalnS9
 zI5gSt6GFXxNNg2ltg1AmbDgHPmSo//oM53g7gUMzJfu8liKwO8chBzXNu0OMTglLtHq7r
 Lw3jREuw/FKHOMCdUt4QMeWjwaC1BufnmadAfJ6Rxl5AK7IJEkRy192YyAuRM1V7Hw3uX9
 5Z4Dd9dSKzVI4MP+g2zvPqg6pHIPP1cDdcRL0pCx6se/auHMOqTj15HozcY7XVYUAdqn5d
 d1DxJJAeIPVhJgJR98CvU4shcatEkAfR1ftUzBoDblFekWUcQ1qHYXl1dg+KKg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Od4TBiT3
Subject: Re: [Buildroot] [PATCH 1/2] configs/stm32f469_disco_{sd,
 xip}: bump Linux to 5.15.167
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

On Tue,  8 Oct 2024 22:41:44 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The patch bumps the Linux kernel to version 5.15.167.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  .../stmicroelectronics/stm32f469-disco/patches/linux/linux.hash | 2 +-
>  configs/stm32f469_disco_sd_defconfig                            | 2 +-
>  configs/stm32f469_disco_xip_defconfig                           | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Both applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
