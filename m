Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83233CD3423
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 07:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9209784425;
	Mon,  4 May 2026 07:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GBwMjEpyfyk4; Mon,  4 May 2026 07:48:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA72C84415
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777880886;
	bh=ppvfOBMFOv9s4Dfq9eDhARgScOZ2t7tH5aQ7M2Q/X6U=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=A1NmrMxPwVMe1mGac7IHh4i3a3LycESiFNTOR0WKvHO/riiZTPKH/JTq5ZCas1vfQ
	 LdOLTQNqgr3B2y36Po0ulcIsJwUN+yf7Lc7g3603F+C4iPW+c0dEbS9oldnkMJNXti
	 GIl2qBz3iPWBmmtn1uk6Yd4jbjg7YEiW38hJVp6IcG4gX6+3JceRGhGAUzZ2n9Hp06
	 T+b1ztQ+uCqtJfziTZxfCaBVaO7LqIQQpdkz92SVbw0QF1UdmpP6RcEM9w2zeAEMyn
	 ZAIlr6ZIGGpxWN+ivXfgnYPCht81bwepCCKOJcZI69w2zCsX8dDScLrnh4O96WI2zv
	 PnoGUF9ojHVjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA72C84415;
	Mon,  4 May 2026 07:48:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 95E3925D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 07:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BDA440A5A
 for <buildroot@buildroot.org>; Mon,  4 May 2026 07:48:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ryrdQ7NSCBmZ for <buildroot@buildroot.org>;
 Mon,  4 May 2026 07:48:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 933FA40AA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 933FA40AA7
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 933FA40AA7
 for <buildroot@buildroot.org>; Mon,  4 May 2026 07:48:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id AD9E7C5D729
 for <buildroot@buildroot.org>; Mon,  4 May 2026 07:48:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 46EB3602AC;
 Mon,  4 May 2026 07:48:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D6A6511AD2023; 
 Mon,  4 May 2026 09:47:57 +0200 (CEST)
Mime-Version: 1.0
Date: Mon, 04 May 2026 09:47:56 +0200
Message-Id: <DI9Q67GUSF9O.2A1QUB6WY2OO@bootlin.com>
To: "Bernd Kuhls" <bernd@kuhls.net>, <buildroot@buildroot.org>
X-Mailer: aerc 0.20.1
References: <20260430183544.2362642-1-bernd@kuhls.net>
In-Reply-To: <20260430183544.2362642-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1777880879; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=2Qvju3Z39t5+ULwrdl7k0e2pKFP4HVML3tV+yrXs+B0=;
 b=ZopCGqBkUj2hREKO8XRYyI7Nn1RyP2jo6bosDodJ44HhGaq9mAEB3lkEbxp1k5nArl9z5r
 dtZB2VaBh9CmpLsgOYV/bptqlSK+AAi9avUb/F4VM60LJk2SEjZd5bDsEmXmBP825BTuCq
 fK8k25G/j80WwBanvDsCES0tJX+xE5RTs6BqM4g/3N2iw6q9qdGjsBoOvQYy0/1HNHlIrd
 f32Y7/TfCVCxW9ER4Z8OmRls0KhEv5i9ULSB849ElNIMxF1xPxFSWaDHhfLT0e3setAgIn
 zjehzu5eRIcI4Dp0warUQXUty5glmAfCrIwqrlka2+61HHkRkU37hPoqDSXHnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ZopCGqBk
Subject: Re: [Buildroot] [PATCH 1/2] package/libpjsip: enable parallel builds
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
> Parallel builds were disabled in 2016 by buildroot commit
> 781ce19d746efb6a5408b4d50b30626784eff324.
>
> In 2020 upstream added two commits which fix parallel builds
> https://github.com/pjsip/pjproject/commit/ddf48e2045fa155ef5242d9d7dcec27f8c5ed873
> https://github.com/pjsip/pjproject/commit/78683646c8bc670ec730a42494e075f671a08e28
> to version 2.11 which was added to buildroot with commit
> 2c7ad667ec4a25226848baba809e492ca0ff06da.
>
> Tested with -j100.
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
