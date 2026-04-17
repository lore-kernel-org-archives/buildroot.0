Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A72AF436B8
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00BC581355;
	Fri, 17 Apr 2026 15:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XsbLOMgRf1Xf; Fri, 17 Apr 2026 15:24:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B79EF8133C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439498;
	bh=vyuHyTEUa3jNvcPGmSbSgU14OM97sfw/SgpZraL44oY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PrwW3AaPE8OsE05O4vsw1UzA/FlOlGtmIzyFkvukpwUwPOwVxoKRb/eGaSvAgyuJT
	 Bvtvt3Y7ZeTIkS142uweeGbl7Suh9m+cpejaWTSq63MNxY2KFAd+EiNBwgN2GCZk+w
	 WvyszibyNfDvESVb6SelbNO5W2x/h2lK6/l3NG37Wil/WdNT9upDJ5hMqsdbuGL9kb
	 wcAmG71iYKoshQk2J3tiipJWyw/Gm43MbdPT2Y7+bU6X/qhDLJxUKaWQdDuPcrFZRH
	 nW7lY0FzziETFFea3BWcqkW1Qn8SDXJtnLm/al8YUT7jIMtx4dRPIBuNu8xFa3vtiT
	 4eEEX4bat2Uqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B79EF8133C;
	Fri, 17 Apr 2026 15:24:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B44D6259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A4398133C
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MRTwUrO73a2C for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:24:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 012B280E09
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 012B280E09
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 012B280E09
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:55 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-488b8bc6bc9so5785585e9.3
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776439494; x=1777044294;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=b58eQg9B8ojz7Ch036ByO3mMkwbH5LtMK2GF5MByq0Y=;
 b=Pxu+LXuCSmSpFcD6Np6t9JA+ebxUx51tL44Zge6OGyfrFwrOUaWbETYNaVkcCM8L3V
 0rWfklwbHMc1iZ/3HZxE8zIBkBh4rWvMyeemg980iHSPziVI9QlaO1dnn0TwAPZOf3oi
 7r43nJDIJhjtpvr8gFT3Viar5524gDV8YUCqRLHbP4xZcyfFXUBNhK/DXF3vn4Sgn1eV
 pkbcW4kn3aQqHKbrBZG0uUwCcA0A72br8wXFID4R0P7Dt9wHjdlvzBTj5sJioFvVoCvV
 CGFhbXhaYWNNpB1f0ZvjEa6zcb/sfah9Ge49jeq1qe/Q+ZWq/aklR4j4vFftGWZKIOF1
 7gUw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9+ENM4cA3EF829jjRs8HRKC8jZgDf7xhmTYUMOQikHvtgykLgnF23R46xhNnBFcrxTLwpmV43uCfk=@buildroot.org
X-Gm-Message-State: AOJu0YxnKieE74TAn3zzBXmWTzZ8bdtue00zQ5BJ22ixLbKkG4BRchtq
 44/PgCtFBHe+u7+9wZvgL7l5thoE1HH2hmtItiirw9241G7oSEd8ZOiGFumRITwwXhw=
X-Gm-Gg: AeBDietvqIedfPqbHj9d+bRPD8T+LGxWttKlbXunBuOEZV716wqmkMzCCDlIp46oKJR
 nQrmLC5iJxn2hCkzGI06ZopvAjdKhciEI7kpCZnl5f1WMHCF5dQRuq7W8fcJIF4ehhDNaybtARJ
 DtrfP623XncnkNgeuxNeREQfZJwThp7G5c1wJbBbQQ7CzlEyJrEwZgB0lLum4svkeZJJEgns8LL
 UU/VPQiStsqLTM0wDNLChTovsDtS/CK08mZayMOaD/qpEj6Fl2Sls32QAThqbvprBdr/wP2l7Ph
 hJ0UYyLdgF88SfnjuE+KtBMTemxF2joivCsOk7jo1wmSb17XVwtOgf/2NIjtx9pWVUSnhzGh9wH
 sEHpuCGt39RPcX6oGzY4r6OmpNphjIA09ouQrAfZgfy620vF+jy+ieMVykdpWwHWbSM7reCuIIg
 qII6ej+vNeCrEtA2fXhbqEuqaTS+A=
X-Received: by 2002:a05:600c:4e16:b0:488:d6eb:e63a with SMTP id
 5b1f17b1804b1-488fb76fe73mr50147185e9.14.1776439493885; 
 Fri, 17 Apr 2026 08:24:53 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc177dafsm66002455e9.4.2026.04.17.08.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 08:24:53 -0700 (PDT)
To: Michael Nosthoff <buildroot@heine.tech>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:24:53 +0200
Message-ID: <20260417152453.313299-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260408111214.4171863-2-buildroot@heine.tech>
References: <20260408111214.4171863-2-buildroot@heine.tech>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776439494; x=1777044294; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b58eQg9B8ojz7Ch036ByO3mMkwbH5LtMK2GF5MByq0Y=;
 b=bTefzbg0L088IWZB9lSsm9fX7AKCT7tKx8hgc+pEgXV7Dm3UW5yjRFl/ik8qYnKhhN
 l5rlrwO9LvFaSfs0mzof88p6gpJyenMLbZXjYMWrpyiYAhUE4bnspzws8Yl4+Up9f0Q/
 5+5zLtQDYGKsspnVvhe/B13H5VCbVJRFIreJVKIm6C/NhkUV7DI2aS+RMY34ULxVVQ9R
 P06wBidcuhPPT+NRmsty9eVQvvQlQS4DOlI3UxZGcDGd7bBauDXQFjCp9tFSu9xirtzt
 wrQjn9pBRtYg9c/Oe3FCEGnfKQoDurFsiRtc+8hoH5GZVDdyzrll0AJzUCye9TwYyck/
 BA+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bTefzbg0
Subject: Re: [Buildroot] [PATCH] package/libglib2: bump to version 2.86.5
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
> Fix several security vulnerabilities of varying severity.
> 
> Release Notes:
> https://gitlab.gnome.org/GNOME/glib/-/releases/2.86.3
> https://gitlab.gnome.org/GNOME/glib/-/releases/2.86.4
> https://gitlab.gnome.org/GNOME/glib/-/releases/2.86.5
> 
> Fixes:
> - CVE-2025-13601
> - CVE-2026-1484
> - CVE-2026-1485
> - CVE-2026-1489
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to 2026.02.x. Thanks

> ---
>  package/libglib2/libglib2.hash | 2 +-
>  package/libglib2/libglib2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
> index 6698db8389..bc85581418 100644
> --- a/package/libglib2/libglib2.hash
> +++ b/package/libglib2/libglib2.hash
> @@ -1,4 +1,4 @@
>  # https://download.gnome.org/sources/glib/2.86/glib-2.86.2.sha256sum
> -sha256  8a724e970855357ea8101e27727202392a0ffd5410a98336aed54ec59113e611  glib-2.86.2.tar.xz
> +sha256  ce85a947bb8b3c0204dbeff79aec39bcb46371c6fafb64ba5b8726c71e038d5f  glib-2.86.5.tar.xz
>  # License files, locally calculated
>  sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  COPYING
> diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> index 1c5109f4ec..cae8a85a28 100644
> --- a/package/libglib2/libglib2.mk
> +++ b/package/libglib2/libglib2.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBGLIB2_VERSION_MAJOR = 2.86
> -LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).2
> +LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).5
>  LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
>  LIBGLIB2_SITE = https://download.gnome.org/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
>  LIBGLIB2_LICENSE = LGPL-2.1+
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
