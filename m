Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3E2E9273E
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 16:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD3A3404A8;
	Mon, 29 Dec 2025 16:52:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LHVbEsoRiJEj; Mon, 29 Dec 2025 16:52:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC0E1404AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767027176;
	bh=CoG5xEN1dcwrgU6u7fpVMYRrSDH8knPa8bm+yqo7FSI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NoMDKLdarDpCGxx15cuQ2uCz7RUb7C2RNrsdkfm4udgeLLYZ0wQ4dbq/khfizF5Cs
	 QDaHsrlG6gD5d1ZIqI66QVWJN/Tqh4VY8zz4eq5qTsv5wxUQBKDLA0HC13Oc6wS+6K
	 ZsobiiJW6FiUjQ2EEqF18RCXBR/LtQIIOsA+tCQvlrNGrqkzjRO2fe0V5YS2T3lG9H
	 e0S8RIvxNoErdzIVEzR6KzTigXmiOHIB+89qoSwpl16nEmqBLgl4Nc+i/8PDjhNtuw
	 magr0V0KoBb0f3pQWtFBlEH8qHkHGFBJqR3Uvzpmnjuh26YKckGpYZWrobeI2MpGug
	 GhbS7jy0Q/qQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC0E1404AF;
	Mon, 29 Dec 2025 16:52:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F74BB9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 16:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63E29813F8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 16:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lqGh3AUYXYDy for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 16:52:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 80DEB813CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80DEB813CF
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80DEB813CF
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 16:52:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 8ECB6C1D721;
 Mon, 29 Dec 2025 16:52:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0025A60725;
 Mon, 29 Dec 2025 16:52:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 29D37113B0451; Mon, 29 Dec 2025 17:52:50 +0100 (CET)
Date: Mon, 29 Dec 2025 17:52:49 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
Message-ID: <20251229175249.2a2ca53b@windsurf>
In-Reply-To: <20251005134950.4007861-1-peter@korsgaard.com>
References: <20251005134950.4007861-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767027171; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=4X8gRSCnKYHH0ovKyToeFS3vMh4YnpKK+yiXSHUEw6A=;
 b=EIxcTYeFKmsmfzXxgJH8jTR5R+HY7jam6rajy9Z9veWevnK7TWBtdGRsJoJ3cb93N2roB5
 7XZU+frIaW5KmjfQGjSp3CrjriGsBkwxP9AtpkvQnVjD4xf0Jk05a5wOLTxHfdROv64PHA
 5nUr3sX1+qzzYYIdNlzHO36QLm0LSKiylLW9UAsCuXmYcALPWMnbEzA3niaV19d0Yikz1O
 uKZ1NiZrAo/yJTcqFyB5APde9kBzWfgfyRmsDaj9RXiMfCEX4y7yi848nVQlJ5eWFnqAsM
 gGTMoaU5zO4vy3TVl3Tzq+9GJgu+nvUMqCxqu1Z/s7GDTD7Liu1nykJJ/pYz4Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=EIxcTYeF
Subject: Re: [Buildroot] [PATCH] boot/s500-bootloader: drop package
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

On Sun,  5 Oct 2025 15:49:49 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> With the removal of the roseapplepi defconfig in commit 56091a581854a
> ("configs/roseapplepi: remove defconfig, broken") there are no (in-tree)
> users of the s500-bootloader binary blob package, so drop it.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  Config.in.legacy                          |  6 ++++
>  boot/Config.in                            |  1 -
>  boot/s500-bootloader/Config.in            | 17 ------------
>  boot/s500-bootloader/s500-bootloader.hash |  2 --
>  boot/s500-bootloader/s500-bootloader.mk   | 34 -----------------------
>  utils/genrandconfig                       |  5 ----
>  6 files changed, 6 insertions(+), 59 deletions(-)
>  delete mode 100644 boot/s500-bootloader/Config.in
>  delete mode 100644 boot/s500-bootloader/s500-bootloader.hash
>  delete mode 100644 boot/s500-bootloader/s500-bootloader.mk

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
