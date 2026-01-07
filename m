Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0F3CFD640
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 14:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4F4F82291;
	Wed,  7 Jan 2026 14:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3d8Ek4SWcdWu; Wed,  7 Jan 2026 14:09:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10771820A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767794972;
	bh=/2cNXnuaH1y814KvRPtNXXsu4rTUPkaexP+SeQT+yyo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Xhm9aEQ7LrmIhHJPHCXXBBGJ30BIRx1hAqMHEjz911nCuwOl8Za2w0wFujanWn3fX
	 7yA54jTW4jDsCGriNz+BYTHPi/JekX14zdIVSYoPzHsGy40v3q8zvmprospGwGN7yo
	 hZTsrR5XGA7cU3CidDUQbriduBQ5SLD1ViWe6JzMzQnrlj9Q+2bTOMJuGijcwarCtJ
	 zGVG5oG9DLQURF5Ij8aqzr5BcAoRI+MVQn1ZPhJkT40gQcZZ9vH5IOBHYpATb6Hak+
	 rxNb8GAjT8UMk66quabjJcoPorCCBZD3C8reSxBPo+vjzHO9EpcHhzguY4bPwISzVI
	 1uIs1xgjRO4LA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10771820A9;
	Wed,  7 Jan 2026 14:09:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 22CBC436
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0918A60BAE
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:09:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eb5-lWZwCo-g for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 14:09:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1E3216083E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E3216083E
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E3216083E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:09:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 2B154C1EC92
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:08:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 49845606F8;
 Wed,  7 Jan 2026 14:09:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4E19D103C874B; Wed,  7 Jan 2026 15:09:24 +0100 (CET)
Date: Wed, 7 Jan 2026 15:09:23 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Simon Dawson <spdawson@gmail.com>
Message-ID: <20260107150923.43dd51cf@windsurf>
In-Reply-To: <20260106192626.1712153-1-bernd@kuhls.net>
References: <20260106192626.1712153-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767794964; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=1EB4NWoz9OGlT5HS5zq4kZlFW/TxHVj1pNh6RksqBk4=;
 b=S3DMH31bJC44unUn7bWqTdJwTvgQmEbQdyKL9dvv9d3T7m/n8cnUyC79rg+jREkQ9cXcx3
 z/jpx4EBSnyKANjm6rq47IGERCextZhzx6jqakM9iVQ5pgQMChir6sor5TpBxTnxn159fS
 ag/K+yhjO9kzw8n1M304qrsBo/A62yxUOv0ZKy290sa1386QSqzf5krYiGjZvlPUxpjp7b
 93pdXtT+VRDssrcsRmHqPXQ7ApHasuvAI6N4W5ydy2uF7wpalPa3ZI5b3jZhlXS5Nc0zfh
 Es2TzqgJCPW3Gq4UQfOn2nXZRhD8/XTlfyvVHaD14dyfQpVTHHVRRFM8tH+kTQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=S3DMH31b
Subject: Re: [Buildroot] [PATCH 1/1] package/vlc: security bump to version
 3.0.23
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

On Tue,  6 Jan 2026 20:26:26 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> https://code.videolan.org/videolan/vlc/-/blob/3.0.23/NEWS
> "Security:
>  * Fix null deref in libass, undefined shift in theora and cc-708,
>    integer overflow in daala, Infinite loop in h264 parsing, buffer
>    overflow in png and multiple format-overflows"
> 
> https://code.videolan.org/videolan/vlc/-/tags/3.0.23
> "It also adds a small feature on audio codec information, and fixes extra
>  security issues compared to the numerous we fixed in 3.0.22."
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/vlc/vlc.hash | 8 ++++----
>  package/vlc/vlc.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
