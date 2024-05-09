Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727E2C25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4270A41EB1;
	Thu,  9 May 2024 16:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XBoLctEFQU66; Thu,  9 May 2024 16:49:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B3BF41EB6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B3BF41EB6;
	Thu,  9 May 2024 16:49:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E1781BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58C9983D4F
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:49:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5BL_i0odt5GF for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:49:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0792B817B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0792B817B1
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0792B817B1
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:49:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D1B5A1BF207;
 Thu,  9 May 2024 16:49:40 +0000 (UTC)
Date: Thu, 9 May 2024 18:49:40 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240509184940.49fdb968@windsurf>
In-Reply-To: <20240407114445.683504-4-bernd@kuhls.net>
References: <20240407114445.683504-1-bernd@kuhls.net>
 <20240407114445.683504-4-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715273381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iPXFVmua4K0Kth8IkVaOIa3OHyGavMIAvZJMSRkACQs=;
 b=gA+VaVlRwahypeMADB2aHDbG+gcT3E8TQvWTlFjOd5zaA6ziinMDUsbFGdQWKTZFb6M4rb
 4zykVm9h3LL68/5yaUTVr5w2GJAZ+vDZDchQDcPMBYTI8ImB4YJC4OPNtYGo6tMdCdKnqK
 Bw6S6NcbyXPLzxLBq2t9pYdNOh00whnOBgtFIHvYpl6aQVr83jpOp9BmtYnYB+Nq18Mwhk
 Lz/3Nn/7apKcClj/9CNtaB8/YjctYQGdcxa0xCFlzD2DjMO/XsmZzAqQHbZ69vJmZiNy37
 2JVIpmEAB6DkfOlsY5pPcPB7rL/n77WPwTtHp+nh2Hj4EAXbAd9sLutDK+dCIQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gA+VaVlR
Subject: Re: [Buildroot] [PATCH v2 03/20] package/omxplayer: remove package
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  7 Apr 2024 13:44:28 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Quoting https://github.com/popcornmix/omxplayer/blob/master/README.md
> "Note: omxplayer has been deprecated since 2020; resources are directed
>  at improving vlc."
> 
> This package is incompatible with ffmpeg 6.x:
> https://bugs.gentoo.org/908959#c2
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .checkpackageignore                           |  1 -
>  Config.in.legacy                              |  6 +++
>  DEVELOPERS                                    |  1 -
>  package/Config.in                             |  1 -
>  ...file-to-be-compatible-with-buildroot.patch | 39 -------------------
>  package/omxplayer/Config.in                   | 36 -----------------
>  package/omxplayer/omxplayer.hash              |  6 ---
>  package/omxplayer/omxplayer.mk                | 39 -------------------
>  8 files changed, 6 insertions(+), 123 deletions(-)
>  delete mode 100644 package/omxplayer/0001-Update-Makefile-to-be-compatible-with-buildroot.patch
>  delete mode 100644 package/omxplayer/Config.in
>  delete mode 100644 package/omxplayer/omxplayer.hash
>  delete mode 100644 package/omxplayer/omxplayer.mk

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
