Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E4AD13578
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 18:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7F27405D5;
	Sun, 27 Oct 2024 18:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OqpnGrxDPSNS; Sun, 27 Oct 2024 18:44:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D439540679
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D439540679;
	Sun, 27 Oct 2024 18:44:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B5E1A971
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3C2140163
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bja51FmL2OLT for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 18:44:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 723924012A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 723924012A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 723924012A
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C5231FF804;
 Sun, 27 Oct 2024 18:44:32 +0000 (UTC)
Date: Sun, 27 Oct 2024 19:43:39 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20241027194339.1f30ee17@windsurf>
In-Reply-To: <20241026210602.2668612-1-bernd@kuhls.net>
References: <20241026210602.2668612-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730054673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qr0r0lPvjuh1xCvwFghNnYYcCGwBai5OD5xeqWRlyBo=;
 b=QY9hzc+CifIOTre8DlmRh+xWs7FuOtRbEZN1YJFlMZmh3cBumIk1RS+brwqLa4g7n5Rm9g
 BxS/NuKaU+ehv4B1CmyZEeRvfR0JLDtTanH8iA+ZEK2PVxCVF4coCo/LbpPabiizzuJpzV
 RVTO5NTRJdhv2dR4gRHEqeqxS0wp12xiiCYnbLTp/WT+mgbvVjqVsLTEpH+mR/LWcIWKrX
 S9vaPrBMkIG6jdJyU2B0jOT8ebi/tL5WcvT3FuiWY6218/7AnRSe0/GBpQWl9SNX399tN+
 P2PXpR2hKn/OtsoZyR0PONdSC/dgME5OQVSZgQd8d0k2w3q/2rHwmSqXi/SHRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QY9hzc+C
Subject: Re: [Buildroot] [PATCH 1/1] package/php: bump version to 8.3.13
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

On Sat, 26 Oct 2024 23:06:02 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog: https://www.php.net/ChangeLog-8.php#PHP_8_3
> Release notes: https://news-web.php.net/php.announce/442
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
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
