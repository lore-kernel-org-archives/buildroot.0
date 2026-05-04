Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D84FFF885A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 07:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61A3E8441F;
	Mon,  4 May 2026 07:49:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jrAiaj7FV8_s; Mon,  4 May 2026 07:49:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E35484418
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777880964;
	bh=GMRkfO5I+5tgKoX24VrTf2a3t5TC1QNzMQUur2moCkA=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=ji6R4SlbyY7WoLl4VHVLbg3aKrY8RrFmjPEVf4+EP+lGzNFLiHm04ZhadElAv72dz
	 34jse3Qs7Lt/b7NBS4XFgcIziov7Wfv7v3Jtd7UFrj2uAYRFKZLWYEp+QGdwoqSkBE
	 0tYC5fIBxLmWcIQQ9/fKpayL8rp8hwVeXA1Bo43uwIpAli3us8uf2KwlFLvd56KgPk
	 YZ71U4FRpan73gDwjSV5yqzoRwxH5tG7D4A8X0nAzHdn7jlXrFm/ZIZ+9QEoxTDedM
	 zFPmlxYGelK2/7aY/DO7SZS++lfvKJcI3bvbuphqZpqHDUGMZ3hQNs8CIKXS+f7Px0
	 HZyxwMBurt+hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E35484418;
	Mon,  4 May 2026 07:49:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 02A64190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 07:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC098415C1
 for <buildroot@buildroot.org>; Mon,  4 May 2026 07:49:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id owjB93_aA_7u for <buildroot@buildroot.org>;
 Mon,  4 May 2026 07:49:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0008A4112E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0008A4112E
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0008A4112E
 for <buildroot@buildroot.org>; Mon,  4 May 2026 07:49:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5C7364E42BB8
 for <buildroot@buildroot.org>; Mon,  4 May 2026 07:49:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 32FED602AC;
 Mon,  4 May 2026 07:49:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9E16B11AD229C; 
 Mon,  4 May 2026 09:49:17 +0200 (CEST)
Mime-Version: 1.0
Date: Mon, 04 May 2026 09:49:16 +0200
Message-Id: <DI9Q78A5H9AO.20WLIR7FZITER@bootlin.com>
To: "Bernd Kuhls" <bernd@kuhls.net>, <buildroot@buildroot.org>
X-Mailer: aerc 0.20.1
References: <20260430183544.2362642-1-bernd@kuhls.net>
 <20260430183544.2362642-2-bernd@kuhls.net>
In-Reply-To: <20260430183544.2362642-2-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1777880958; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=tSmAr16/pvACt3Wo5Tdf8KY97Lr66o7ctk4bJZgdy6I=;
 b=EA21Fao9scRFGRDvNOP35mQ/mkFl/sr/4UG+ERwbwRYNSKhZVI5+IHwQagi0YcqqDpORHW
 xZaGxiG6DxpB9gaQnMBIS7ao7Qz8C1QVjcDIhXPtQQ9yTCbeuDYIVxAV9dyiIK3Rc/Yctk
 EOhs2JCn/4w8eQTEOwGDqPm3dXPR41m9ISeZqx1A2fXYoo2DdfDUYU8AmhFmNYtTpVm2TH
 jjRSs6/g1njL4ugTdAFcU6pffi0Dk4MGAWJRmSHx6fBXEg8f6TqDu6zEhY9wIfYhHDHFW2
 1vrFVKMtolugK7Z/dMiMWqa6Rf1Gxvqw6oGYnO79xyYI4JDCqdnYtA3mZSzEDQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=EA21Fao9
Subject: Re: [Buildroot] [PATCH 2/2] package/libpjsip: security bump version
 to 2.17
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu Apr 30, 2026 at 8:35 PM CEST, Bernd Kuhls wrote:
> https://github.com/pjsip/pjproject/releases/tag/2.17
>
> Fixes the following CVEs:
>
> CVE-2026-25994, CVE-2026-26203, CVE-2026-26967, CVE-2026-29068,
> CVE-2026-28799, CVE-2026-32942, CVE-2026-32945, CVE-2026-33069,
> CVE-2026-34235, CVE-2026-40614, CVE-2026-40892, CVE-2026-41416,
> CVE-2026-41415, CVE-2026-42225.
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
