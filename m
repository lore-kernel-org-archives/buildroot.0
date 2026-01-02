Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA564EED628
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 15:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF5D760DB6;
	Fri,  2 Jan 2026 15:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EshqC9TlecZB; Fri,  2 Jan 2026 15:44:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AFCC60BB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767368695;
	bh=jWW6zsZSBSmk89daRAqf0EcRzNt+gKjNcOc5nYWdMTg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Lg3MERylNltKWx2WWC7uwRzc3cJQZFxwkskuEugVwNXZHYQSS1prZNCPjv1vcWYsM
	 BR8lTJc4cH/p9TNu1oG1pGAWnWkKAUbp/l2tqyI1qPtEaEycquqwOug4X5jTaYzldY
	 bFzz8WXgLI95QBcwAMt39Jtl/tsNaIC4i0Jgc+lerxDp2wZXPxhU9pYfFbbImRag5a
	 nU0FnzkpzWikXwGFZCm5UG+Y7vNeq6nOLb+AUgnEs44HhmlUr5awgbt49MfnDIEUFm
	 BmaIhlKJGyuTGftW9OOGTxAq8Ui7gGKcCX51LK6uo1+cNkHNu5fOhuHEOz60B5AiZZ
	 nifIcPjNQEQMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AFCC60BB5;
	Fri,  2 Jan 2026 15:44:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DC290351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDF6460BB5
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:44:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qyI0qkPQ4LrH for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 15:44:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CB540608E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB540608E4
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB540608E4
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:44:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 60F45C1C3B6;
 Fri,  2 Jan 2026 15:44:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 17AC8606C7;
 Fri,  2 Jan 2026 15:44:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 732B3113B071B; Fri,  2 Jan 2026 16:44:48 +0100 (CET)
Date: Fri, 2 Jan 2026 16:44:46 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Jesse Van Gavere <jesseevg@gmail.com>, Roy
 Kollen Svendsen <roykollensvendsen@gmail.com>,
 linux-amarula@amarulasolutions.com
Message-ID: <20260102164446.698d64e7@windsurf>
In-Reply-To: <20250909144713.569514-1-dario.binacchi@amarulasolutions.com>
References: <20250909144713.569514-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767368689; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=xOPuA5r6zX+JcjzGCGxSbE3TiLsr5/xAsL2++dUSiyc=;
 b=BBnLd9NjA4IWCfhmV+MxjWCDPMaQbP3tTjN1/nNvsZXe0AJoE23M+z5AOugMl0phn+fUjf
 KQy+o1DhQ8ED4KTfvfwVV47pga2x3iLq4g25cksCHCVIySZgnHequ9YrR3LDbtMEgyJej6
 D6i+3Xa1WS0k76B7+uYHsCz2gNcfJ6rBJ54juhxS1b78xHzufW8cZLlOAZJC6amkwfgQ+7
 +CkjL5W8p7LRNwJIZ7AOmQuRhmC1XsMQYKmm94Iz8OnKCNFnqMSIzncPvU5TXEEf9pTL4/
 /OCHksbJWz3tZblqHhqZXb0My+OvpYqHDWDGAFIYohlRwR5xJ/+6WnTIcS/S3g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=BBnLd9Nj
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6/qt6base: use
 QT6BASE_CONF_OPTS for Vulkan
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

On Tue,  9 Sep 2025 16:47:13 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The Vulkan option was appended to QT6BASE_CONFIGURE_OPTS instead of
> QT6BASE_CONF_OPTS, which is the variable actually used during CMake
> configuration. This prevented the feature from being enabled/disabled
> as expected.
> 
> Fixes: 1c27f3a12d77b ("package/qt6base: add vulkan option")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/qt6/qt6base/qt6base.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

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
