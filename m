Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9B8E92704
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 15:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8ACE660653;
	Sat, 27 Dec 2025 15:44:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u-rIMvDU6hBf; Sat, 27 Dec 2025 15:44:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A637060664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766850293;
	bh=IPxfXLpbMvE8ebOQ+KLDVbO9FDr8hso1EOJ7GgIQWkM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=N5/uJ5giVN5uEd8CE60DiaaI0nTlFOYo+VEHsEuVtSVPGDaYpfUiWm63/hj/LqcvP
	 RrfGy7K5rile5CTXW4yl62BIthyh1tPX23jlA4k+hlSTk1b256zRaoVbe5SlnsOkmq
	 K7I1pAqzXMyNqmFZL9Kkci/MDpna3EFkuuf9f+e1tutFUJ8NPUvNK2xwMA00cZyeR1
	 Yczd95VwTWJoyF/Do02pR4G6MTc5VUCSOtKNtcMfagTTaBAYATqJcAniNzMP358xQ/
	 Wdr7UiaNpV3F8w30iVQTZ4aM3pY1j46OLy/mt1JnVd2NmoYkXX6mnUThEQNHVR+JJU
	 h/8vgrIiwavkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A637060664;
	Sat, 27 Dec 2025 15:44:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C088FD8
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE53160664
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x-nEhtIysNfQ for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 15:44:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BAAA760653
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAAA760653
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BAAA760653
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:44:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3A3CB4E41E17
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:44:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E80E360725;
 Sat, 27 Dec 2025 15:44:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 00FEC119782DF; Sat, 27 Dec 2025 16:44:46 +0100 (CET)
Date: Sat, 27 Dec 2025 16:44:45 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Carsten Schoenert <c.schoenert@gmail.com>
Message-ID: <20251227164445.37daa273@windsurf>
In-Reply-To: <20251027191829.1129021-1-bernd@kuhls.net>
References: <20251027191829.1129021-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766850287; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=j1tH9kEzggNg72bdvvbxJgSv0jsq0JaGHY5lRnHztpc=;
 b=BYKen+f9xp+YJ+QOlIYtf39CQW2th2quH3cL05Td9SigGJS6UdRtk8yyJYDc7X5A2QJ5dJ
 Up0HzU03H5LHVo2XJNzJVXzzpmClkE8NGVnnjGENCVQY6yG5QxM8MVAxEAoU+7a0b+5Pel
 bdym79ziIqKWuMuTqV7x/hmAU7jsqmGzINAzB/kToXbhcCHTVuU/ruQ1zcUkuJFAQcug4D
 4oM6trq5eHLE6F4j5GSoEwKkdsNbr2XHHMbGun1zsj22GXaIlCLhmMefqbob/GzOitD13r
 ZNGMnZmakTchHdN2ROmX6QzfeIyv+va3QwduFxF1lg+aQMeCEZslMaSrO9PgEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=BYKen+f9
Subject: Re: [Buildroot] [PATCH 1/1] package/libsvg: fix build with gcc 14.x
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

Hello Bernd,

On Mon, 27 Oct 2025 20:18:29 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> https://autobuild.buildroot.net/results/12e/12e2481afb8acd3149f7ce5692d0f113f2419cd3/
> 
> No active upstream was found:
> https://lists.freedesktop.org/pipermail/cairo/2010-July/020272.html
> https://www.freshports.org/graphics/libsvg/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libsvg/0003-stdlib.patch | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 package/libsvg/0003-stdlib.patch

Thanks for the patch. However:

- The problem also occurs with GCC 13.x, so it's not a GCC 14.x issue

- On my side, I also have build failures like this:

  svgint.h:40:9: error: unknown type name 'xmlParserCtxtPtr'
   40 | typedef xmlParserCtxtPtr svg_xml_parser_context_t;
      |         ^~~~~~~~~~~~~~~~

  as visible at https://autobuild.buildroot.net/results/895/895fdba2f3fcaa42aa93946f2532351d39b16647/build-end.log

So since the latest release of libsvg-cairo and libsvg was from 2005, I
sent a patch series to just drop both packages:

  https://lore.kernel.org/buildroot/20251227154005.2015199-1-thomas.petazzoni@bootlin.com/

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
