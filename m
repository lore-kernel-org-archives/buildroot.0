Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1A0D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40412822CC;
	Sun,  7 Dec 2025 14:27:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EScB-zLOSF3a; Sun,  7 Dec 2025 14:27:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A33F81191
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765117649;
	bh=G4tcysDuUHNjolwofEyIAaXCkHBNAOmrzbZANATbAic=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QxrRw6sXx4iVqrsNNHtgEOqMRksnE2d6u91GMNX47X/20IVOmWXy+863Pr6mhbr1g
	 76SRybykGjKBUqEyPhcwiwsfDrgFhGGUvKLIRrQCXParGcTgVct+MkFWM6f4CoRk3h
	 lZCUYXZ4WIpnTB10wyYZpFsthcTdvn/aWBC+G7bdZHtmauUMVn0myVN1zIllg3nDjD
	 mSw/WXtnnfYFvlS3j+3kdhmZwht8hTwe6u0yFZkdyILM4YJGt39thvORDFrNNFfASY
	 C1o7jrstsuqISmXZsYb0w7EQ65dmi0zAqlZLNn56Vh2AHwEi3ckCWgO+7FQKgOuQfB
	 m/TCuNYsQ/Ncw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A33F81191;
	Sun,  7 Dec 2025 14:27:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B23D5E7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 991DD81191
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:27:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nVM2i_uWZGQD for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:27:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 806E681119
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 806E681119
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 806E681119
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:27:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id DA6CEC17B73
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:26:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 58D6F606D3;
 Sun,  7 Dec 2025 14:27:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 04E26102F2368; Sun,  7 Dec 2025 15:27:21 +0100 (CET)
Date: Sun, 7 Dec 2025 15:27:21 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Christian Hitz <christian.hitz@bbv.ch>
Message-ID: <20251207152721.043daf5b@windsurf>
In-Reply-To: <20251203195640.2297610-1-bernd@kuhls.net>
References: <20251203195640.2297610-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765117642; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Iu3DsilJr9g6t6vImlVoXp5nWoyn6OLyaiOcHzYWchU=;
 b=IAmIfbC1M77gkJGuQEy2iRlVU0hyN1IyRgD0a9PJ9J3WKn5hM4VuPQDU05Xv1bHSoYHZmJ
 X6UhOjN2pbmYBiURB/G4xUy4Wfp1jblzVrCT+EdHdieAubLViLOAHmJZCY2I5idR5DuFcI
 ush/r/kykRPo2zzh7aSi/3BJtAjO5QScRx/R/WPwDdBkHN7ojK54cDR4M52lmteVkms4bM
 B9+Np9BkVsHMZR2t3Stmuikc1ewRa7LkExzvQ0Brtuorf971xzEkMt+WPG0vjx+7DSUQh3
 tUVuc3m55eNam1KqcQJJgklOYH5ycMeeLAuIot9ceKBalapEbSp2miR4M6Bsow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=IAmIfbC1
Subject: Re: [Buildroot] [PATCH/next v2 1/4] package/libvncserver: bump to
 version 0.9.15
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

Hello Bernd, Hello Christian,

Thanks for the patch!

On Wed,  3 Dec 2025 20:56:37 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> From: Christian Hitz <christian.hitz@bbv.ch>
> 
> Fixes building with OpenSSL >= 3.0.0.

We have been using OpenSSL >= 3.0.0 in Buildroot for a while, but I
don't seem to see any (recent) libvncserver build issue in our
autobuilders.

Could you clarify this? Is this fixing an actual build issue we are
facing? If not, why?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
