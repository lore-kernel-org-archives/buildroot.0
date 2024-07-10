Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032F0C3DA45
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 08:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6482A81F8C;
	Wed, 10 Jul 2024 08:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UFZLQoerz6-6; Wed, 10 Jul 2024 08:30:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13BC981F21
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13BC981F21;
	Wed, 10 Jul 2024 08:30:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6CD351BF5AD
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 08:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58E3E40429
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 08:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eaUn0AvQ9vBr for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 08:30:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0FA5640025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FA5640025
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0FA5640025
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 08:30:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CEDDB240006;
 Wed, 10 Jul 2024 08:30:08 +0000 (UTC)
Date: Wed, 10 Jul 2024 10:30:07 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240710103007.6778e6e9@windsurf>
In-Reply-To: <20240709220101.3597236-1-bernd@kuhls.net>
References: <20240709220101.3597236-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720600209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aroPEwd5AsrYcEwjiPrqXMUdPzZDm6pFXE0Fk//bZss=;
 b=gpL7dUnNaEp2S88zcg5Noa5XgI8+8Ebh3pzvpgfVTSlwM2HZ+s89sqOP1s3pNOOPrhHWNk
 DHvmLjihe/IRBdaJF0piTz5nYl+G2fRkPaaMBgONRkeKXh9uC5WqzysF0ltQp9ylKOUOtY
 C+sDBcY8QvH/2t2bev+GZdiMJwmG8LuhOCwnEuwPe9oIOqbf33OBUjFfKoJ6IzS+m7Q2Wy
 kSD8hrdXzxmF6bB8RyxNWeC4Rvt1j/usIOAXwBP1JKJ2akyQImhLkCKuQR2R5Xt5vvhSmx
 Yh8CehsBWqqf/lxGI7zNpgTRZNTTYMMTUZCrNN+BHaWYzD1QNC52P/BPMXSEeQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gpL7dUnN
Subject: Re: [Buildroot] [PATCH 1/1] package/stellarium: bump version to 24.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

On Wed, 10 Jul 2024 00:01:01 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> http://stellarium.org/release/2024/03/26/stellarium-24.1.html
> http://stellarium.org/release/2024/06/23/stellarium-24.2.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/stellarium/stellarium.hash | 2 +-
>  package/stellarium/stellarium.mk   | 2 +-
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
