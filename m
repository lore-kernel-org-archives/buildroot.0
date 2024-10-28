Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94CDD5B154
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 22:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89E1E80FDD;
	Mon, 28 Oct 2024 22:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ancHacEvvA9D; Mon, 28 Oct 2024 22:01:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6914680F6F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6914680F6F;
	Mon, 28 Oct 2024 22:01:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 25D7A4EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13C5F40015
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:01:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WiJKxBdFIgJC for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 22:01:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9E307400D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E307400D6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E307400D6
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:01:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D53E6E0004;
 Mon, 28 Oct 2024 22:01:23 +0000 (UTC)
Date: Mon, 28 Oct 2024 23:01:22 +0100
To: Hans Ulli Kroll <linux@ulli-kroll.de>
Message-ID: <20241028230122.16753363@windsurf>
In-Reply-To: <20240908083636.6401-1-linux@ulli-kroll.de>
References: <20240908083636.6401-1-linux@ulli-kroll.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730152884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZVCpEkyOXZYga6fbAOwNjY4KSm+bX6PL7/CJTxaMXyo=;
 b=JpQbtqyutct25xIVfSP4XocRHwqcBzwtW/Oq/Jq8F2X989m2OdW3/5U3rxuUARCzGxPGAi
 o0Ezv33eMETxSQ4BIn7pG+2NBicp9uHeAttyEiQSAsS+f5GRkJEUm9ILOTPZQtblaWt9CE
 AlQwNkl9tv1Fd9lqMd4uoHkEX/2/JdbPJlm+shfZpKXQTV8pUKhBZohcz0awwY5PyAf59B
 QX1kvslEEuElVssvRU+UI/9nM/Ur9vpJkyaG0aL5J7emZlI70W6Emb0z43w8Wm9h5CL4t+
 laes6CsyrMf7VoED3W/eO4S1Cp8ozAQujRVdfF0V/p7wPb9a/To8MXhSqMNZFw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JpQbtqyu
Subject: Re: [Buildroot] [PATCH] package:uclibc-ng:enable gnu hash for non
 mips platforms
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Hans,

Thanks for your patch!

On Sun,  8 Sep 2024 10:36:36 +0200
Hans Ulli Kroll <linux@ulli-kroll.de> wrote:

> In toolchain-wrapper.mk we use both sysv and gnu hash style for all
> platforms, except MIPS which uses sysv only.

The logic in toolchain-wrapper.mk regarding --hash-style is about
building the toolchain-wrapper executable for the host. So I really
don't see how this can be related to the uClibc library built for the
target.

> However uClibc-ng has some extra knob to enable gnu hash via Kconfig,
> which is set by default off.
> 
> This leads to wrong symbol resolving on armv5 and output of devices,
> here on Pogoplug 4 detected with lcpci 3.10.

In principle, I have nothing against your patch, but I must say I don't
really understand why it solves your problem, and what is the
impact/consequences.

Hans, do you have more details on the problems you are seeing?

Waldemar, any input?

As far as I can see from a quick look, we default to --hash-style=both,
as far as I can see in the Busybox binary:

  [ 3] .hash             HASH            00000190 000190 000a10 04   A  5   0  4
  [ 4] .gnu.hash         GNU_HASH        00000ba0 000ba0 000018 04   A  5   0  4

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
