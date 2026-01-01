Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864AFEEB57C
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 16:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EEF380B87;
	Thu,  1 Jan 2026 16:33:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hZkRh4NfzoOK; Thu,  1 Jan 2026 16:33:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B5288117C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767285191;
	bh=GB/EZarqshIBzRwGDvxCYJbs+tCVWv60BjCzeYVQepg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IBtA2XEnMUL7L1+7PWg6Y/AegkppAND+T2Mvybtw2VChJGyElg0zHqPK3osS7xfz8
	 C2q0KR4wsmjND2wZVG1UpsMwlzwWQ3YWo64AOKaunL81Hy2D/qqH7beEqh/VezGCQT
	 g2f3SowY2w+xNplfzueBDiuavkuJw2Z6x6m2UkiSJa2/o2iHqjTlloPINZlqLJ1gNO
	 6I00mozXH9qYQRU7vpQcHhjP8py009/Az5hroWHzeHJQ+wS8Mprk57pyTpXDlC2iLm
	 W7r4t8o9Ezvc0wqh5JsLIbC7DSAwFoIvfHTFlzcKtwgd/V+I31mFO4JRoRkw76G9w0
	 D3E4AQ/9CaTqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B5288117C;
	Thu,  1 Jan 2026 16:33:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D5A3F351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 16:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBD9C607DC
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 16:33:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tPRe0m5zmMpO for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 16:33:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AC86C6078A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC86C6078A
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC86C6078A
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 16:33:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9342AC1C39C;
 Thu,  1 Jan 2026 16:32:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 205E160749;
 Thu,  1 Jan 2026 16:33:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 79ABF113B0777; Thu,  1 Jan 2026 17:33:01 +0100 (CET)
Date: Thu, 1 Jan 2026 17:33:00 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Message-ID: <20260101173300.3e146572@windsurf>
In-Reply-To: <20251003143043.641856-2-bernd@kuhls.net>
References: <20251003143043.641856-1-bernd@kuhls.net>
 <20251003143043.641856-2-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767285182; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=TCdyaX4SQsMPeXKGH78GQ0ERkncFmmvNfdIs3tSaeVI=;
 b=sMIEqtPkCmGdhAgN6r7OPD41Mqo58bldxWFTIop+j4TLA2NaTERraoZZky+JmBsBy8iqL9
 Ho33I9th+RTqXavnN+644JrkmbLf8/IafaEnwxbD173mYcy9wSOsgd9WQHPjLYGKT35Kzt
 3PHogd4RV0iYLxIQAwBnmxcI77PY8gw+OPxxd0a3J8YBUAhu7he82vsGb8w5lr85AiZVwd
 RWkqSEuD5Q/f9xUyUWVRTMaBbTVtVPH0vOmMvRaSsfNEGD1TXqedOCKkspV7kaOEDT8p8Y
 3TYwOLdAdFQOfnjpdGIk6IUioOFQy6o/1tds/Y+8n+R8IvzvaKgTj/Z0okIgaA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=sMIEqtPk
Subject: Re: [Buildroot] [PATCH 2/2] package/mpv: bump version to 0.4.0
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

Hello,

On Fri,  3 Oct 2025 16:30:43 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Added upstream patch to fix build with ffmpeg 8.0.
> 
> Added dependency to libplacebo:
> https://github.com/mpv-player/mpv/commit/f5ca11e12bc55d14bd6895b619c4abfd470c6452
> 
> Added optional dependency to libdisplay-info when libdrm is enabled:
> https://github.com/mpv-player/mpv/commit/a4d9bdd262b808d0c8663d28023ff21fef862803
> 
> Removed rpi-specific code:
> https://github.com/mpv-player/mpv/commit/343a5fd345a84572ea5693a805119067d5b0fbc8
> 
> Removed configure options for atomic support:
> https://github.com/mpv-player/mpv/commit/2fa695c3f9d4164344228ef4083e87369de3bb33
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...mpilation-after-deprecated-definitio.patch | 39 +++++++++++++++++++
>  package/mpv/Config.in                         | 12 ++++--
>  package/mpv/mpv.hash                          |  4 +-
>  package/mpv/mpv.mk                            | 22 +++--------
>  4 files changed, 55 insertions(+), 22 deletions(-)
>  create mode 100644 package/mpv/0001-demux_mkv-fix-compilation-after-deprecated-definitio.patch

Applied to master after fixing the conflict caused by the recent
removal of rpi-userland.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
