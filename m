Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D360ECFD637
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 14:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A27A682250;
	Wed,  7 Jan 2026 14:09:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8dHxDatuRCI2; Wed,  7 Jan 2026 14:09:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C3878223E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767794950;
	bh=vKr4U1W+24Mz78o+31T7ZnJ/VevrPZ93kO+sy500v5g=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KWo4K7k0ltYXzxFXvloeALDlIfMqk9PIdHeGJ6IP+CiQOZjWxLe5TVY1rNElT1BHw
	 tmft8FFEyn2IS3X+VYFuYRPapI6z2zDkMIMopiqTJ/o4+zCK44oaesUjy9WCl+PqGZ
	 6Uhop3y09ui+ZOmBGSS1qExUebU5wOWKPKQuWxvuoxDFyzmh8O++oMbAXznfolvShZ
	 SOyS/ribxmi2M2O7rBco8eRS4WGrAo8vPT4EUI4FanzFjHoMZ6DrJmUjsBJC1+nWJG
	 yMmobVL3NC1gaFaCYrfonjuyuqHHEdBuNTNiiYpJUCAjIGi6xsM+CoNzsyTJlBXYkE
	 M8PnufRHjimRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C3878223E;
	Wed,  7 Jan 2026 14:09:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 02B8F436
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8FD060BAE
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cz_BYGPoEuA5 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 14:09:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E1F846083E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1F846083E
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E1F846083E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:09:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 485AF4E41FD8
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:09:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1ED41606F8;
 Wed,  7 Jan 2026 14:09:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 20A70103C8748; Wed,  7 Jan 2026 15:09:02 +0100 (CET)
Date: Wed, 7 Jan 2026 15:09:01 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20260107150901.04c5ef6f@windsurf>
In-Reply-To: <20260106190543.1318334-1-bernd@kuhls.net>
References: <20260106190543.1318334-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767794943; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Kvt28JoVzJLn3/7MBaJjxqL+wGKBpCv/CGqN58Dm/J8=;
 b=PPFG3QlA0ILUHneI5up5cuMSjSxkMesOtIOdbn+TPb6Z7Kn5X03QA6S0kEL8QivZ4GORec
 iyo91QF02mDzPEOxgAeb/gUDa1vDzoYnVSvHZEiuakjScd05GjegbBqziSQEt/GYeuHZhc
 hwgqJrtCj7nsGynJuF/JlE5jb9wOkPU9JWXRmnl1SBY31GRyqOVbPCHyKL82rY89n++7U0
 1XSTepW02Dft9bnRS0iSPbZm4E/ZddCHPTCKMVrW+CM0RkAfwHGaU4bPIb09JfIox6c+8m
 U5csd8D/4ah42y7TJMy32tzfJqIJ5vGkCvIVfr9fr7WFiH1RjzXGOMeTiPd9dw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=PPFG3QlA
Subject: Re: [Buildroot] [PATCH 1/1] package/luv: bump version to 1.51.0-1
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

On Tue,  6 Jan 2026 20:05:43 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> https://github.com/luvit/luv/releases
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/luv/luv.hash | 2 +-
>  package/luv/luv.mk   | 2 +-
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
