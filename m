Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4603EEB57C
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 15:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5582460B57;
	Thu,  1 Jan 2026 15:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fAKjRPTm9lD1; Thu,  1 Jan 2026 15:52:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6E7360B46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767282744;
	bh=b3HFaJEDURnGIGlYxAPGL7kuhQajrEBjMIJT1vN+gEE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qlxEe+QR19YAxri6vbO7rRS+fOf9v0UtT6tTZSo/m+6PMMAQ1F4SfkhNbXayYJ1Pn
	 +/mylHW0qf/K3y45U2FhHq4I3BZt+NwlsGgupWXAabAng7itT6CJS8G1NrQe4bt0YL
	 u9+XxRybKza3FXCC3G25dffEruVmhfipFfO5zSpL21vdGzJTaKEyQ8wNZhGtvEJ4uE
	 4Drt3yrFHUx/Avz5oVaAz6tF5KmKwafFYy8ojOMJeeTKPBj2P/9YocRkanuIXa26H2
	 lZywxl8/2qoMu3TNbTl89pZjIfqsIn0AhdtgUFlbBhas5YzgJ6sKDDSMTd3lOyAHe7
	 Mr8uWBXI0FUUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6E7360B46;
	Thu,  1 Jan 2026 15:52:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C5445206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2E34814DC
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WfX19O5TJBoh for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 15:52:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BA98A81546
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA98A81546
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA98A81546
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:52:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id EBE334E41ED9;
 Thu,  1 Jan 2026 15:52:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A8D0960749;
 Thu,  1 Jan 2026 15:52:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6ECA7113B0628; Thu,  1 Jan 2026 16:52:18 +0100 (CET)
Date: Thu, 1 Jan 2026 16:52:17 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Danomi Manchego <danomimanchego123@gmail.com>,
 linux-amarula@amarulasolutions.com
Message-ID: <20260101165217.4e746ca6@windsurf>
In-Reply-To: <20251226171313.1982585-1-dario.binacchi@amarulasolutions.com>
References: <20251226171313.1982585-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767282739; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=AgKmWpWY9wmq3mHzx/Ip7l+3FGCuvFG/BoafbTBWaV4=;
 b=jUm6PQVPKo3OFtmDvvqTcsJOSzUAkbkMuXMC8jxAZkEnr/4NXV0d5vXw7hlzWqgW0FLA9Y
 hx2d01nYJhFI6TCciVKfidAgMfoF4q9BmNVGtwxjLrIh3aYmb5xGy9DwnxPK/MHRrM2rxG
 ol1j6ejTOHKkbOECR5lM9gqD9Kq5b5sR9c8++QDXu/F3TxdF8Xl8/BlBGXMfNaUMlcDyK5
 TQgB4396MUjoiL5MQr08HFNc08+s7sl7kQc/nKszATfpti2Cb1vM8fSj/Vl+gemKgbqKb1
 ONS+ppHoqeztNi42MVMAmiHfg1mCSnC5c9WUCWFISE7DaRzwxtRiaUWomCbsuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=jUm6PQVP
Subject: Re: [Buildroot] [PATCH 1/1] package/xinetd: fix build w/ gcc-14
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

Hello Dario,

On Fri, 26 Dec 2025 18:13:13 +0100
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Building xinetd with gcc-14 raises the following error:
> 
> cvt.c: In function 'fcvt_r':
> cvt.c:113:9: error: implicit declaration of function 'strx_nprint' [-Wimplicit-function-declaration]
>   113 |     n = strx_nprint (buf, len, "%.*" FLOAT_FMT_FLAG "f", ndigit, value);
>       |
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  ...libs-src-portable-fix-build-w-gcc-14.patch | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 package/xinetd/0006-libs-src-portable-fix-build-w-gcc-14.patch

Thanks for your patch. Unfortunately, I discovered it only after
applying a patch from Bernd bumping xinetd to a newer version that
already fixes this. That being said, your patch would have been a much
better solution for 2025.02.x, so I've pointed it out to the LTS
maintainers, so that they might be taking it instead of the version
bump to fix xinetd in 2025.02.x.

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
