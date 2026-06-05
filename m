Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8537CD6E74
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADCA1812D8;
	Fri,  5 Jun 2026 12:51:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rVFZRLnmcExH; Fri,  5 Jun 2026 12:51:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B588E81240
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663867;
	bh=fg8k5D/zX9JiE/0UWn1930kjA1QUErpygJ5sRweNiGY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NyWlSxiIFZ+r/ady8mEo7dviXT9JTnZkdbGz2mYgWIfouWvzXNACmjiTQgp1yutGu
	 S4g7lnYTv7ficsXzazFwDZGzGkIvaHf+pvRZqY4t+jbHEynV2b7DpGBqf82RsSHga4
	 uZ7BsvHJs61aZtpolv9sg2GuypeQFxYKoZxjbBzc/UWW5lw5dVUwJCuqhbZpKDmoL8
	 YX2WtiUXoOb/IsfSC+jk00PsIy3dcGdJ9KO5ZxjtbMdLf7K9qZV2tLrXVTO8QXJ7tv
	 pEcqf4fDsEprL6Yds2KC5xYAl9zujN+zJr9ALDeO41a/1mHwSI9OueSzXN3/IzP8Ue
	 S6QCnwse9tD4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B588E81240;
	Fri,  5 Jun 2026 12:51:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DF0D7388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0A9840381
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sjO1QMIKh-mZ for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:51:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C5DCC4037E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5DCC4037E
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5DCC4037E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:02 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-490ac10e337so15538895e9.3
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663861; x=1781268661;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kjw3sVAJQpm7aFGCn8MGNeTYFToQeC45O8s8Xbh0ymM=;
 b=PMSZagPNL0BLbdTicgcHqTBAhg2ryucv73zmOczLqd0OGWlzQhMHK9O/0QrWzq3UEL
 LVoyYUh1BGW0rkqMdm2H1PslsNSMOD7AIg+BZMME+PTQUXOymMhiBouNHrHzMUTPHw2l
 TryOqTvY3tGMGxL+LZmapx4fLPE8By9Wj8+W9F+sQwcnRWd03bz95B2lFb3R5ZsuzAWa
 Y/gpVUHcRWatjv2MAiRY3yhw2I4uAiYEJCNlMCIhrx6j9ENF+zvCGwLPfeg2hWeYP1wl
 LyMAHhX8KNni0zt5T7d5x8Pq5YUphxuXhzNTt9t2Lo5koPzPhabmGACzIXIuzZ1wRiZe
 pI/Q==
X-Gm-Message-State: AOJu0YzwG2NgCmOUvpHCuEQpHMtBjESameiF5VHf6HtUMSalJgK7gea8
 b+d8tOhr9rJ7veGV0w3NMA4KZ0rkdO0USYNkiLwqHPbZ2bZSeXXcOpAFgX8nG/NXxYM=
X-Gm-Gg: Acq92OFhZ13mRsXSX0ua2kLs+DXb91XYQBZwE28APwsoHrJ0y8tDEzHgH84h/UlLJLG
 kTjDOikkLaI4nhf5D9nVXz2RLAX1EgrF/9/oerJLHGtLhuj65xcjQ2UiAqAHPpCjSfDjpxtFH62
 VzFYk91Mgtwx33A6gjRHsfW2mRHlJwcsMNonbvnrfQvvUOf3ddIbzUvx/KNpHSUcnRXPBUwvVqK
 3qPguqHozYOUYSBFE2Yl646/R661SeLGxaFWwFIIgMeLoukTUX+hDyJHbchK5AA1z/VTirZEALc
 vgdkAaPSxTPZosAL1kaWpSh65iywh6TEDEEj4f1o/+JLmjH91klxQlYNbVCcZELYaTYdKmeGkNe
 xBoH4FUgT5BNt+6YkhTeYvdGrZaAhSiJwFpqcwwylAYC7AE4PqlLEYPGDCHA6YaQEoQ5MUEfEry
 lHC3eUdCp0QCTaerxdjEUHa0za7w==
X-Received: by 2002:a05:600c:1387:b0:48a:75b9:b0bc with SMTP id
 5b1f17b1804b1-490c2619945mr53530715e9.29.1780663860856; 
 Fri, 05 Jun 2026 05:51:00 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490c2cbb4cbsm35261015e9.0.2026.06.05.05.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:51:00 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:59 +0200
Message-ID: <20260605125059.275001-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529094514.178266-2-thomas.perale@mind.be>
References: <20260529094514.178266-2-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663861; x=1781268661; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kjw3sVAJQpm7aFGCn8MGNeTYFToQeC45O8s8Xbh0ymM=;
 b=IDliH3YiFm3JeQCGWHgWOacw6OtlbM4rOVlbtG5Nzj1G52nZ9FOiSSWzbt4VPJent5
 Ncn8X3YA9Pok+mXAPiJkvVVR7CwuMySXpiGDyAzsK4pTa9pFNtZ56G1Fe1l/6Znk4Uik
 jNg6Zc5AOHClh/7J0687XrvHXk694HB+ARnusHFdeJrLc8adKfaaAhUyf9D+gIIPs4k0
 xRacOT3EJYrtpGI1rwL5P7vgsdI1JhVemLpLZoG4ubgYOJR1ojuwmLi+yLRZ23OmpRqo
 Qsnar3xuG55MH7ewgTyP4+UFr+rjT+rNYlOVCqh/qXtvfsPRZEv32PHBPfwZG0HtPRyM
 /K6Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IDliH3Yi
Subject: Re: [Buildroot] [PATCH] package/hiredis: update CPE vendor
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
> The CPE "cpe:2.3:a:redis:hiredis:*:*:*:*:*:*:*:*" is valid for this
> package.
> 
> See the GHSA [1] and the associated CVE [2].
> 
> [1] https://github.com/redis/hiredis/security/advisories/GHSA-hfm9-39pp-55p2
> [2] https://nvd.nist.gov/vuln/detail/CVE-2021-32765
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/hiredis/hiredis.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
> index f7acb2f131..33a87e7780 100644
> --- a/package/hiredis/hiredis.mk
> +++ b/package/hiredis/hiredis.mk
> @@ -9,7 +9,7 @@ HIREDIS_VERSION = $(HIREDIS_VERSION_MAJOR).0
>  HIREDIS_SITE = $(call github,redis,hiredis,v$(HIREDIS_VERSION))
>  HIREDIS_LICENSE = BSD-3-Clause
>  HIREDIS_LICENSE_FILES = COPYING
> -HIREDIS_CPE_ID_VENDOR = redislabs
> +HIREDIS_CPE_ID_VENDOR = redis
>  HIREDIS_INSTALL_STAGING = YES
>  
>  # The package is a dependency to ccache so ccache cannot be a dependency
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
