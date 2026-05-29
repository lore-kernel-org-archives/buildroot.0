Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA7FCD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FE4761564;
	Fri, 29 May 2026 08:29:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dWaz1I_SLwYy; Fri, 29 May 2026 08:29:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C621D61554
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043384;
	bh=DmsmSTXuDOX5lzPTjs9JhOEcJEJsjZtC6cdM/koqzbQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Y9mGnOUMDqNesYefbuBYL6JH2uMQ7reXFzDRPYyyMVENFwcvy7pK9MbO0Z6ajVc0a
	 sSMPQupaA19VgldyPNOZY0SrpdBu2bWmF4iExUsFN46Gf1XWgOei84Wn/P6sOy90pn
	 gYPXlpWnwe/uSAjnfquJmQKp/kEehHKfE+PCw/F2l5fA0L1SYIlPYz+lN27nu8DxnJ
	 /eEUTjN8JUhZ1e9TjrR1pa4BFyqVrIrviXJC4Uq2MH9b2adxql3sVsQka4KOw8ePXn
	 fModkXzs053F2/yDXVTp7OTOzUV+RInjFZQHFMTxRYi+r7UFnjDVtqOYBhGIiY4rPo
	 Q811HOPkSDnbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C621D61554;
	Fri, 29 May 2026 08:29:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CC3E28E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B5048236D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 74Se7SS3dvld for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:29:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EB04C81B99
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB04C81B99
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB04C81B99
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:42 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-45ef189aa1cso333959f8f.0
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043381; x=1780648181;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SVzjUBCrQRsh+yAWJjvFMqjv+vDG4nnVu3TbDjyLzfU=;
 b=bYqpv38msTaEPOMEqf1/EdLYnd2Bvhr2CMceDs8Ale+vYFm3CdeJZTDByBLFWDmziu
 2owNW66HAptQRpQPs3xoTGoy41BVOBDV2rMuAbUgZgC0bBu865UDjHOhCX/6GG0M/YIx
 CqhsIVtAFI6al7PCyQ5cwg9vO4uhp0UeD7mJH5pPbr94OBxNOXHaMqZ1wQ6id/l3PZoN
 ucfs5BgVjfj9/oMNOHlhhYFv5riluTSvYKHzd2NZ6vP1N4d6MilcnVXHlLeAK7oInBKe
 nFsSFduS73uL/g8x9ne2ft3xExHE0WvTra/a3gYF0uQC8VfVd6CeYCLPlMcJ5p35SD5o
 VUoQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8uclXIXdn78IMJkJaet5Ws/HPD47vhiadelBkdBYGYfjZY/U67J/1ImlhJ/OVXhyh12r7wRdD/Q+U=@buildroot.org
X-Gm-Message-State: AOJu0YwUtZnC3479eK0H0cfvNAZCohVT1WKMNsIBTJmzsmxJLcv42RP8
 8ckVd0QwL7YInQMI8OVf5cNICTew51kDjRA3uYCS4mXigGLSjhpcIFEa/luB8zP6x7w=
X-Gm-Gg: Acq92OEcAz/eRPHeqVsnA7gsNwdo07btmLbPEzZ7SKk+boV8Xk5lydEImXQ8X8uZq3U
 4wFUqy3N342xZswv1JAxxHTgOSXlyn4cHzLV+H9CQGs8GizYRRzpwZS3Q5ZT/+TW3zBxvphfsz1
 DsxGtJz68eVanzqyjxDVVVSkRTU9IyvnG56LCX/ojZhR/NZrwnY3P7iwtrPgU0um/WZ8R/bsYLy
 mW3N/Wh0h4ulwo+17usU3ekQeSksGdtu9wxq7K+j1iJTNGZymUX4ZRq0Qs8OtJSy4V/RvZTxDRO
 VoojKsWOBJoN9ybm1ArbHErIep96nmG2Zr1wTEnyNHNnKEwT+w1DZTsYb9Rotkw5s07h3lRybxW
 Sf+rfHKG61i2P1pNsm2K5d6yAwYBhFTdqzhBqWTaz+Ftfg6FmRm+HB0x/OvZQ0v5eU9wQeq6+Pu
 jw3y1UNANWM6LtJB6ah9WCQJhI7AfpjSXySDqnnBI8cWEes+POVQ86EVxEcA==
X-Received: by 2002:a05:600d:848c:10b0:490:48e2:5618 with SMTP id
 5b1f17b1804b1-4909c0affedmr24578455e9.22.1780043380817; 
 Fri, 29 May 2026 01:29:40 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c12d2c5sm12546705e9.7.2026.05.29.01.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:29:40 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:29:40 +0200
Message-ID: <20260529082940.57838-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260406151029.251720-1-ju.o@free.fr>
References: <20260406151029.251720-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043381; x=1780648181; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SVzjUBCrQRsh+yAWJjvFMqjv+vDG4nnVu3TbDjyLzfU=;
 b=AfoBu5iekSOwANbwD/EU3MEYoe6DzzO6/R53co//x+KU3zoez2/lvKf9hJ+EsJJfck
 +IL25kjUkmhoSzbcKXadjeVTSfL3Q12iGCkym/OKmoqwggoQ5RpiX9jlEfipFZVILwW0
 1CMxh/9kWjyZAPFGgg9gKTHENekmtJigsEjzRO5Fi31TGxbVLzGirOHdFo/qTTYdWnV3
 PYlEnPbGTodUTBD+1NQBqRZY/YVXRnWH775Q4hRPskAW5pE4G+Y7IsnK8CxV/XMbUoYC
 P4PB9NM0EtSpdDqtRizUGNlZ+4Ueas8T/h6WQ3vMrByTZ0ZppLjqtFsL2hu3U1pUbTeo
 X9dA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=AfoBu5ie
Subject: Re: [Buildroot] [PATCH 1/1] package/gnupg2: bump to version 2.5.18
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> For release notes, see:
> https://dev.gnupg.org/T7999
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2026.02.x. Thanks

> ---
>  package/gnupg2/gnupg2.hash | 4 ++--
>  package/gnupg2/gnupg2.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
> index 07eb84a8ee..d607e9bb86 100644
> --- a/package/gnupg2/gnupg2.hash
> +++ b/package/gnupg2/gnupg2.hash
> @@ -1,5 +1,5 @@
>  # From https://www.gnupg.org/download/integrity_check.html
> -sha1  ee0bc59eadf258b6d92131911b5dca6cabc89419  gnupg-2.5.17.tar.bz2
> -sha256  2c1fbe20e2958fd8fb53cf37d7c38e84a900edc0d561a1c4af4bc3a10888685d  gnupg-2.5.17.tar.bz2
> +sha1  91c523b172763621c69c0a213bc01b67b37d2298  gnupg-2.5.18.tar.bz2
> +sha256  0dbd64e0322fe1a4813360d46539d5f8daf4a8fa235cf5fce464e8b0214a7e4f  gnupg-2.5.18.tar.bz2
>  # Locally calculated
>  sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
> diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
> index dd2fd0b0f0..1f7ff43e07 100644
> --- a/package/gnupg2/gnupg2.mk
> +++ b/package/gnupg2/gnupg2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GNUPG2_VERSION = 2.5.17
> +GNUPG2_VERSION = 2.5.18
>  GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
>  GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
>  GNUPG2_LICENSE = GPL-3.0+
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
