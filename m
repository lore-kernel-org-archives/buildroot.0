Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3561EC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3CAF41EA4;
	Thu,  9 May 2024 16:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kWGU9t_Wa5iL; Thu,  9 May 2024 16:48:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8625B41EB0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8625B41EB0;
	Thu,  9 May 2024 16:48:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACF701BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6A7B83ED2
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:48:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id epFSfmptNL3g for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:48:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8A87883ED0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A87883ED0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A87883ED0
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:48:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7DF4040002;
 Thu,  9 May 2024 16:47:58 +0000 (UTC)
Date: Thu, 9 May 2024 18:47:57 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240509184757.1c3ead34@windsurf>
In-Reply-To: <20240407114445.683504-2-bernd@kuhls.net>
References: <20240407114445.683504-1-bernd@kuhls.net>
 <20240407114445.683504-2-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715273279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XwNKrx0ak+jhgT5mCXX+zCpUBrMZgShLqK90jRYI7KE=;
 b=PjE7Pu9V0Ddlh8YPeV7dmvqNjYpN/zd1XW5flZqzwm12IdcBSNUmGgTeB//OpSufhT8iPY
 46avG9T31rrt3QCo6fXdkaaOuzrE1eAIzJIsHru1gPmFyEVZBlPnE/xj5O8GUgULLkZE3a
 SrOcMJATBC0ZhvUB3q1DknzqlliFZJdzVHpaqL5GmWeiNaQoUXt/938YVWnnOeKONW7tMV
 EClV0DaXXf9vMvG0G+lvmvelMX3XdFrXgv4o1Q3uzXfywaOzrsOpMqlkElIer1XFDf2f5E
 rCxwGWNLe3TYRiDCYYzconI/IXsOFXab2tWFQlcLh6TL9LvUI6knvRLqa03TfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PjE7Pu9V
Subject: Re: [Buildroot] [PATCH v2 01/20] package/aubio: bump version
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

On Sun,  7 Apr 2024 13:44:26 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> The latest release from aubio dates back to 2019 while upstream is
> active: https://github.com/aubio/aubio/issues/381
> 
> Current git HEAD includes support for ffmpeg 6.x:
> https://github.com/aubio/aubio/commits/master/src/io/source_avcodec.c
> 
> and also removed the dependency to libavresample which was dropped in
> ffmpeg 6.0:
> https://github.com/aubio/aubio/commit/245deeadd81afc4ec5635b65d71646490c5c19fd
> 
> so we can just depend on the ffmpeg package without suboptions, quoting
> configure log:
> 
> Checking for 'libavcodec'                : yes
> Checking for 'libavformat'               : yes
> Checking for 'libavutil'                 : yes
> Checking for 'libswresample'             : yes
> Checking for all libav libraries         : yes
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/aubio/aubio.hash | 5 ++---
>  package/aubio/aubio.mk   | 7 +++----
>  2 files changed, 5 insertions(+), 7 deletions(-)

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
