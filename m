Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B220DD10BFC
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 14:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F4C5606A7;
	Sat, 26 Oct 2024 14:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BvAosi5ln62t; Sat, 26 Oct 2024 14:37:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BB40606EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BB40606EB;
	Sat, 26 Oct 2024 14:37:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CF8C45C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCCC0819D5
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:37:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DEBK-PT1461S for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 14:37:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B858080A6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B858080A6B
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B858080A6B
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:37:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CE54DE0002;
 Sat, 26 Oct 2024 14:37:13 +0000 (UTC)
Date: Sat, 26 Oct 2024 16:37:13 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
Message-ID: <20241026163713.27385acb@windsurf>
In-Reply-To: <20240921172634.3642820-1-bernd@kuhls.net>
References: <20240921172634.3642820-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729953434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JhkjTfr2DK7Y45qURxMUOF6M4t43Sw/VttA1ouAHXK8=;
 b=BCVGl/Lpej7Gy1/7fH/QmcyPKyeKVsNDGbhxsvwb/GSU3QzA5JdT5RIimmCn1+87p/rswj
 r6nTjFnkHf4C4WxAiaW6chBBee7Q1XVAA+pbwbJW4TCi3TvIW30pQx9ex1WmN6y8Tw0dQ7
 hTvIS1XnSnwpNolEALTOCfieO1pIrniebpI2XlqU5zhe1DKiWuumZuiN/Vk9nAaHItYOY3
 AKgevBaXwrH2ThGNKIoMwM6q315mftQ7TR356EHVOCl2eoQTJxuuq1Vvpx4i2DKRZi4Rby
 +q0s5BYYgZlK4QgWKbAkPH5ADtJHiFcUUYc/eQ0E0vcTbgEgFt6p+6cNjps22w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BCVGl/Lp
Subject: Re: [Buildroot] [PATCH 1/1] package/libxml2: bump version to 2.13.4
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

On Sat, 21 Sep 2024 19:26:34 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://download.gnome.org/sources/libxml2/2.13/libxml2-2.13.4.news
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libxml2/libxml2.hash | 4 ++--
>  package/libxml2/libxml2.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
