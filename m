Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417BFEED628
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 17:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 131C98144F;
	Fri,  2 Jan 2026 17:27:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ijeLaJsmhaKz; Fri,  2 Jan 2026 17:27:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E634680EC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767374850;
	bh=GfaH3AKDtV676deM3jb4PK+Gl6OO1zIsAhraErHIFTE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NaGxZPgZREOe/betYtuCrBBEl14KiQOgTAuuQ+BXdlXwyhG75+KOXA7cse+7Ejh2O
	 6fT0wYKM0DHaXeS0EbGiUggPkQlPlIgA01ZexoGwikjqamKYaG6ivMD4I0PmNPWP3j
	 VVqK8ghid/+lIghTzvrKhWdVYBOEeA9vwrea1voNe1GMIJwbLSXRhJwQmamBrmPoZ9
	 ZQ9Dkx2hhPjOTUvYKiVqhDHPjWyAZWNzuuXiqnDbGAE1yWoLHaBw5o6w8425LBSR2h
	 B1xTWsuFmnvw4ccH0t1FjdKlAPFHvijFwg4PG3QruTJ/JTh7eJOmpK6wUP5dPJdQcC
	 Rp71uP0+bHoTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E634680EC9;
	Fri,  2 Jan 2026 17:27:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D9C2619D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C021540872
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NWorDIVFcrQw for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 17:27:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E38DE40874
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E38DE40874
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E38DE40874
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:27:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3238E1A25D6;
 Fri,  2 Jan 2026 17:27:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0261D606C7;
 Fri,  2 Jan 2026 17:27:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A368B113B0440; Fri,  2 Jan 2026 18:27:21 +0100 (CET)
Date: Fri, 2 Jan 2026 18:27:20 +0100
To: Neal Frager via buildroot <buildroot@buildroot.org>
Cc: Neal Frager <neal.frager@amd.com>, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, yann.morin@orange.com,
 brandon.maier@collins.com, ju.o@free.fr, romain.naour@smile.fr,
 michal.simek@amd.com, romain.naour@gmail.com
Message-ID: <20260102182720.6f74d47e@windsurf>
In-Reply-To: <20250905122603.2521801-1-neal.frager@amd.com>
References: <20250905122603.2521801-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767374845; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=uNwsletsguStMe8DbgoGzFcH/BOzMyPPa35OsHlGOBA=;
 b=c8IaP9f9S5/e4dESqq38XVXdzA2cGX0SmXxNGG0oaYxPbZZaH6W4rB9FIcMEWocKtXJNFa
 rst1vowgoSAb+uv/TOhD7Ab66p0oxoJv95deGdg8/U5CVUCI9n9hMl3uWUN6pbuo48mCM6
 QrZ6uCJO/A4e80xAeNvhj7NgVKHTs8HjGgQQ2eDInm0TzVP7NGVM33W7CYWradkkTNvDGM
 TDqXbiedhUip5tzev+qQQrzcdGGpEoudCpE+8InTCGOVRQQ+jNym35bxY6sNnTJkaCshul
 R74O46VWAoWzxS4b9T7IfW7KyXsOEnfR1h5zqM3XFQwQIK3pVg9/cdiw7FdX8Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=c8IaP9f9
Subject: Re: [Buildroot] [PATCH v2 1/1] boot/arm-trusted-firmware: override
 BL31 environment variable error
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

On Fri, 5 Sep 2025 13:26:03 +0100
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> When building the arm-trusted-firmware, if the host environment has a value
> configured in the BL31 variable such as the following:
> 
> export BL31=/tmp/bl31.elf
> 
> This will cause the build of the bl31.elf to be skipped leading to the
> following build error:
> 
> make[1]: Nothing to be done for 'bl31'.
> And then:
> readelf: Error: './output/build/arm-trusted-firmware-custom/build/versal/release/bl31/bl31.elf': No such file
> 
> To fix this, clear the BL31 variable in the MAKE_OPTS, so that building the
> arm-trusted-firmware will build regardless of the host environment.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
> - correct file path in commit subject
> ---
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 1 +
>  1 file changed, 1 insertion(+)

I am also not sure whether this was the best approach or not, but let's
say it's good enough for now. Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
