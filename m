Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CC9C87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C067F80D2A;
	Thu,  7 Aug 2025 18:25:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n0ljbQQLq2WD; Thu,  7 Aug 2025 18:25:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C93D380EDB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C93D380EDB;
	Thu,  7 Aug 2025 18:25:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E15DB10A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C798C405A2
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:25:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dCOTCtIKnBdn for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:25:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 04BA7405B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04BA7405B3
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04BA7405B3
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:25:12 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3b8db5e9b35so681382f8f.1
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591111; x=1755195911;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WwFAalpwggwdB4u24q2Eqlmzm1BYFIuqtZzVmRxEG7I=;
 b=MRlbSEIz90qH5GgwDKE0zHLwPaEbg+o6oCXFY+jHrbAEQOb1A8uXAMt4ga093p15l6
 bbKfuaY7dvF3JyJ1X6YzvClzqYLLWpNyx6y2LU21AFlOv5OLRiNervMbU5PCg36s6hW3
 5/cYoxXz+QPRUd/6LTRNgzad7ZNIn9+6yfKbkAD/XzF7l7c2MnL7bHaOCNEaL9Ydl3aY
 rV53HDAqt3+2fQBMUyUaZ0vmTVEsvhsWS3KU2zrMUkAd1bareEK+zc2zn6oMQtInSAFl
 sskL1NJkjdjepykZ3wNs11V40O845hauoJVSgJn9cGrmv5+/FMPbnuMkdRSiBogF3M3T
 xchg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ51jQOOxTABZqnKCFd9V6gox/eqRZ+6dwDMIJaD/CROxVzZ00ARKJkhB/xatsP05M9h8Fm3YtsT4=@buildroot.org
X-Gm-Message-State: AOJu0YxOF6/c55FK94wQOalA5KkchM1JpkBmbFiSygpADvzk/uq91FZY
 EMTyz3mMiqRd0J9exAvEuxNe+rjZuYj6Pxrr93q4jjs8Hf6gRWAinQXxK74Mrcjrp9Q=
X-Gm-Gg: ASbGncuzAD08qfhNnufaoUQU+iw//+BGKDA+9iQPfgyWajRfi5PGJ32xKEI37S2zWod
 1E5ydpXuAS6RMGQGOMADkXoDtyyqYg/HbDGA3TeZJvqXAmoCEHNBbP9dXU3Eu4wJLiHDQCd8lw3
 oLqhUl/FtA9qrKKYR91gOFrCdAVSnfoJwLLj7ULcgsNjNqSABSY5ARmEpoKahNJvjAIG5hLmoNY
 mJ0HQ6LY3vhWJrC6TWIG4GuMtN3vLNZJ7dX5YmsLm9CalK7HLjTo3Y0pMFBKQsTfe+/dJ0a/rpO
 rD+GnQuS+TE14q8sRLw3YDc338g/nSmhCvNJeKi6dq8smsmR73GN6uwYB2tct3vhpEY1Be2VEoK
 Q5H7gTpErkQaZGDhorYVE5pAU
X-Google-Smtp-Source: AGHT+IEg4gpHvpoZTQ4zHEcv/YwaXTO2FeBYZYTnf8nQ6lxTtFbTprJXdA/qrygM/2PcZzu3R8w5fQ==
X-Received: by 2002:a05:6000:1445:b0:3a4:d6ed:8df8 with SMTP id
 ffacd0b85a97d-3b900b510f4mr214096f8f.39.1754591111149; 
 Thu, 07 Aug 2025 11:25:11 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e58553f8sm111372975e9.14.2025.08.07.11.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:25:10 -0700 (PDT)
To: Lance Fredrickson <lancethepants@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:25:10 +0200
Message-ID: <20250807182510.726884-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250722050542.2949118-1-lancethepants@gmail.com>
References: <20250722050542.2949118-1-lancethepants@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591111; x=1755195911; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WwFAalpwggwdB4u24q2Eqlmzm1BYFIuqtZzVmRxEG7I=;
 b=NuNy9nP6SQVcVfUzyXD8OWatpErBRbnMyqYFAXTChplsuEoH9P6n4iZwNCGGlmbTeu
 P2ZKaDMNasM0cINhG45QKnxrz4lrlo5mB4rIXwHu33M1z0eYw+KICQqZ1hO/LyuqjOTz
 mHfexB+dwEMQ+EAY+1fqzer8CaKaL0h3+BfJ/BCCEDm86Ql33Rlnv8IRpOk32ZYYHYBY
 m/DgLApVqrS08leTliQOqkHwS02uY+wpYJg9qR6F1NSU3rMFz5OyA6UeJE4qwOK1oKfc
 Rp2krcbu9lI2MHMmYUD/UUjl2e1Zn2jUs3TtmGyEERz9BkhNWBgokcM+RE49bqhHEK5k
 qI+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NuNy9nP6
Subject: Re: [Buildroot] [PATCH] package/ncurses: bump to version
 6.5.20250720
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
> Release notes:
> https://github.com/ThomasDickey/ncurses-snapshots/blob/v6_5_20250720/NEWS
> 
> Fixes observed issues with htop on aarch64/musl after the last ncurses update.
> 
> Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>

Applied to 2025.05.x. Thanks

> ---
>  package/ncurses/ncurses.hash | 2 +-
>  package/ncurses/ncurses.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ncurses/ncurses.hash b/package/ncurses/ncurses.hash
> index 9829cd512c..7369e3cd64 100644
> --- a/package/ncurses/ncurses.hash
> +++ b/package/ncurses/ncurses.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256  271044605db2f64fcd1c697c5444a08eae0f70cae33b934e59f205954004a449  ncurses-6.5-20250517.tar.gz
> +sha256  fc3871f051e941a637488c07c81d984f731003e65c0f78353606e18296011aac  ncurses-6.5-20250720.tar.gz
>  # Locally computed
>  sha256  708999f95527e1ffa670c6fce288c6c600cb477dd04afcc1171422b3dd4ee226  COPYING
> diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
> index 4eac66a71c..864f62b57c 100644
> --- a/package/ncurses/ncurses.mk
> +++ b/package/ncurses/ncurses.mk
> @@ -6,7 +6,7 @@
>  
>  # When there is no snapshost yet for a new version, set it to the empty string
>  NCURSES_VERSION_MAJOR = 6.5
> -NCURSES_SNAPSHOT_DATE = 20250517
> +NCURSES_SNAPSHOT_DATE = 20250720
>  NCURSES_VERSION = $(NCURSES_VERSION_MAJOR)$(if $(NCURSES_SNAPSHOT_DATE),-$(NCURSES_SNAPSHOT_DATE))
>  NCURSES_VERSION_GIT = $(subst .,_,$(subst -,_,$(NCURSES_VERSION)))
>  NCURSES_SITE = $(call github,ThomasDickey,ncurses-snapshots,v$(NCURSES_VERSION_GIT))
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
