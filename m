Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DF2D13572
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 18:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A87D80BF5;
	Sun, 27 Oct 2024 18:45:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HK7yo8KVL99y; Sun, 27 Oct 2024 18:45:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 338AC8148A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 338AC8148A;
	Sun, 27 Oct 2024 18:45:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B4BECAEE
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CC7C40260
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0HQiGY425uny for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 18:44:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 665054012F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 665054012F
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 665054012F
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DEB14FF802;
 Sun, 27 Oct 2024 18:44:37 +0000 (UTC)
Date: Sun, 27 Oct 2024 19:43:00 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20241027194300.7781886f@windsurf>
In-Reply-To: <20241026210101.2667166-1-bernd@kuhls.net>
References: <20241026210101.2667166-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730054678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=buwRWFAhbw3GqUe7+9eG0lyniDMW0bVDY9oSbdI1Q8I=;
 b=D2sHVBXA7wA7piVqtdbKwsaJMQNYLBbzUiVITBullgYbxhUBoMVso4bCheV/wN8pnp3bxN
 JZMz6Vq0d+3AEsZQK4ruMfUVkEy+Ovd4PGmwsajG4wJaAE2ZBme/HOPhY8JDgV3LU+KY1T
 +2AhCJhaqt+GZvrIGPWaOL9qekbP/r+jBv484Jg6kT1O8gTpkiBYWBJiSf13Dq39nktRBm
 DtWxzz2gdRetw+0PUhNtavOki/gTHDDDF/VhUou7i+eFSzFcYpniHD3SN6BPj1aaWmcOaO
 tBLjlbdKlPHgVMmtfnuH8j6AVr5ygi/GWG45hxoErW06Crl0tkSJfKoRNc9QSA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=D2sHVBXA
Subject: Re: [Buildroot] [PATCH 1/1] package/libpng: bump version to 1.6.44
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

On Sat, 26 Oct 2024 23:01:01 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://sourceforge.net/p/png-mng/mailman/message/58815959/
> https://raw.githubusercontent.com/pnggroup/libpng/v1.6.44/ANNOUNCE
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libpng/libpng.hash | 4 ++--
>  package/libpng/libpng.mk   | 2 +-
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
