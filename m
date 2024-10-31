Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE6ED767FD
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 20:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9612380F22;
	Thu, 31 Oct 2024 20:01:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9oi207B11Tmw; Thu, 31 Oct 2024 20:01:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C08CF80F34
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C08CF80F34;
	Thu, 31 Oct 2024 20:01:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 80BFC5E50
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 20:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EED560C06
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 20:00:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EclvFfuGPUwF for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 20:00:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 52BE060BDD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52BE060BDD
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 52BE060BDD
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 20:00:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5409BC0005;
 Thu, 31 Oct 2024 20:00:55 +0000 (UTC)
Date: Thu, 31 Oct 2024 21:00:54 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Alexandre Esse <alexandre.esse.dev@gmail.com>
Message-ID: <20241031210054.3353eaf2@windsurf>
In-Reply-To: <20241031185057.427423-1-bernd@kuhls.net>
References: <20241031185057.427423-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730404855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uvyyF7mG4QZK0yE9ZG4fptnU3GQQ6opTbRFws17acoE=;
 b=nTA228A4G9eQNApFYI0GlJyoiMURFUFZTgKyqx/PDELubVALCw246b+IVEQrTTNBkNRD4n
 kYzG2s3rgQknSHF4p4H7ej93SSTvD20xpq+rbWuJbkT231OpGn7QPoN4ueiwbC5z5/mfm9
 ExIoPEo0T9oMeS7CPMpEMEhEABUE/mMfA2843oDPIZJUnhFkMPGMv9gtJTQx3IZ1zqpQV0
 lPL1dBdpJ+Al9+wpWYeep+QZqjrqpiP20P63xJdPKKHKH9ZnchtehZ/80O4MOozJ+F36Ih
 TCvh4dcK4/rX4NdOsfZ3hU/5v/G/+NCO5tZlrOVn77pm0fCObRd9Ii359J/wQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nTA228A4
Subject: Re: [Buildroot] [PATCH 1/1] package/v4l2loopback: bump version to
 0.13.2
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

On Thu, 31 Oct 2024 19:50:57 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog:
> https://github.com/umlaeute/v4l2loopback/blob/v0.13.2/ChangeLog
> 
> Fixes:
> http://autobuild.buildroot.net/results/356/356be839ce23154e9f808469b4483e7eaae316e1/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/v4l2loopback/v4l2loopback.hash | 2 +-
>  package/v4l2loopback/v4l2loopback.mk   | 2 +-
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
