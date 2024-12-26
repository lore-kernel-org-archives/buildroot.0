Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37982E77188
	for <buildroot@archiver.kernel.org>; Thu, 26 Dec 2024 22:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0203060621;
	Thu, 26 Dec 2024 22:52:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CRNaujFyU1mU; Thu, 26 Dec 2024 22:52:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C1C9607CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C1C9607CB;
	Thu, 26 Dec 2024 22:52:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E6B8F1B
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 22:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29871607D5
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 22:52:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hjZWfDANLzVO for <buildroot@buildroot.org>;
 Thu, 26 Dec 2024 22:52:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6383E607D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6383E607D6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6383E607D6
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 22:52:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BD29C240003;
 Thu, 26 Dec 2024 22:52:02 +0000 (UTC)
Date: Thu, 26 Dec 2024 23:52:02 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>,
 linux-amarula@amarulasolutions.com
Message-ID: <20241226235202.744a7a62@windsurf>
In-Reply-To: <20241220131847.3380466-1-dario.binacchi@amarulasolutions.com>
References: <20241220131847.3380466-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735253523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VeUzlD5h2qyh7PzBI8q5EQVUoHpqVHFEhZ5F/p9TTh8=;
 b=dhgBy1/1dYisiyNEck1pQp8kTNJOyXeks3IOkeedYuaW7juM/gjDW7K4yGNFTDdQpEUlAc
 1+5ooqCOnAndFrxt1Z/XIiJOaO5xQ7x1VWj5Z0Cc19FZkZ2gT8/5bWtxP85QKyDf7+Ukhd
 I0yONph5VbmvG1LOCNHOnr9VcCMECCnqfCr4SKrm2kVrFQx9UzCIvgRPx/ct0+qT6IGHBe
 fxwGYrGllgYnt5Qr4EpI5HsHfw+3LFs12Qd9bMEeHclqUWNtbz/vCPKAimxH4evCiqVrDb
 eEDtTvcEnJuNrhsYUQgVLvue3gWzBsKCwDgIm+nDGQoT9+oRcih/zhINF3iRcQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dhgBy1/1
Subject: Re: [Buildroot] [PATCH v2] package/libxml2: fix compilation with
 uclibc
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

On Fri, 20 Dec 2024 14:18:47 +0100
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The patch fixes the following errors and warnings raised by the
> compilation of the library with uClibc:

[...]

Thanks a lot for this patch. However your commit log does not indicate
when the regression was introduced. Could you research which libxml2
change introduced the regression, in which libxml2 release this
regression was introduced, and therefore in which Buildroot commit this
regression started appearing?

This is necessary to help us understand if this fix needs to be
backported to the LTS branch of Buildroot.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
