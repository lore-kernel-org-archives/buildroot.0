Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDBCFA0C30
	for <buildroot@archiver.kernel.org>; Wed, 15 Apr 2026 06:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B294042E8D;
	Wed, 15 Apr 2026 06:27:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8jOKpiqRVSgN; Wed, 15 Apr 2026 06:27:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC00F42EB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776234444;
	bh=wHLBJ5BR7RQxeu7oAufOPnr2F6ERwj6g7WxIbCooGQE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qtecG09LPqh1XlZ7UJLffKiUMOFgqLpl89Ei2ip7BTku5WJ3SFNOy5W67Z/y81jpk
	 JevMh8rdqcS/9RTCARtnZr19TwZsrbKyLXpca3ht9sxLfn0uz695uiH221VnPHCv8e
	 4aiyt2du4uhnYWj+OKi7936RbSFka+YFCppBf93wdOPexNyToMbCUDXSZEDewSt9m0
	 J3dGolQt6KjYuFPi7mBH9uHM14PZ2Oe6WZAtlLMU2lW5L5fYQ4PVmlszmnhg7kYQ1y
	 EwE/vQj8pO3QOeTiF61ggoxH+tQZbTisenvsBmb8rpS6RcH65VOJEdnW6WZFywFCpM
	 Xg4QWxENtHgrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC00F42EB0;
	Wed, 15 Apr 2026 06:27:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 742DA237
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 06:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65BAC4269F
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 06:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TY4fY1hDnR2C for <buildroot@buildroot.org>;
 Wed, 15 Apr 2026 06:27:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6AE94422CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AE94422CA
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6AE94422CA
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 06:27:21 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso59604535e9.3
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 23:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776234440; x=1776839240;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=D3trGtVZBOX4+r7ZcJUNZDDlqEm42gFdhI73c8UUE78=;
 b=lZYZ0DWtsWNIlqL/HjIx6mmxYK+MwBvksJUrwTfnlDD5gqhvXiBC3S/5wV2V5Wf5s3
 2KK0wagk0dgsxvxXfEobmRfvH80UGu912uq+S1hlnx26f2JkNG7uRTcpfqMUT30E9nLt
 xKbjn23ieFFn1xAql1c/vrQYzQcKd08QRdUyp8Fq80eGqTS375aNQ4UIceSjl8Kk67jO
 +5CqSKyS1IrBbyOW/tmpFZaRgkGIU79xq2PsKwtv27Zndcfm2WqFS51g5Cr1njxSHZTf
 qgswMly3FX/b+afBtg15L0T9gVbiHneiC7/poCV6GFHYW0AhahMEH0k5cXuO7FiQeLCn
 76YQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Pxx8yznYD8JtrZOwNEchKldFZlupGKZ1jvoByAdde9cZbJ+p2S9mqBw0NQRPztqUF7Ssvu01NqNU=@buildroot.org
X-Gm-Message-State: AOJu0YxNQsy6slwcyzWLRU8ggzC0+WlBwmpg/cvQTXo94eVqTEe130tL
 XiPT0u5R+CACmKPJi5MtGgUz26Obmmz0vIvY7mtPzxL6BK9wnCH8pddjEaoEnVs0Bdo=
X-Gm-Gg: AeBDies4mSTXqcMF9WuLCdqLUa4hIql+ETd3x5ybWW23KQZVxzyydnjssLU8atfzWM5
 Cwz+Axng7saStF5w8ErzTqG7+s3aMsZwXpzYuCDrM3dpoYDjv18ovNfGy9jXXt8ACWcL4ef4JCQ
 Pinu4EcfPQWqEIv7SYAHZ1GNOmXOxy1NSJs2UzEA1khLrGvQWtPs+n5bP4Fuefe5LX2Y1yE9PvP
 wZjylKgWGxpJL4n5M091VUmBk1LE/rsHbVduwWIC7e+fD+utbUoAoV77Jm7c5V2fKhDbKmPUkIc
 sOk8PU7rLiB3Ty4kf7Kp01CEehiW4arMCUyMsLOdOVyqBTEd/tffxIuCVqqanWy18UhiPgqFdFn
 PKu0rjGNhcivAbB3dd8rkIopMbw23PkG6Cheua19pxPC/7/31ZhG2Jxdxgs8oWMj73tSyM/Bdh5
 jX4TEDLk5lfabuX8JOz7Gfc/bVTQU=
X-Received: by 2002:a5d:5d12:0:b0:43c:faee:87e with SMTP id
 ffacd0b85a97d-43d642cb48bmr30293418f8f.48.1776234439847; 
 Tue, 14 Apr 2026 23:27:19 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead3d5ea9sm2427550f8f.21.2026.04.14.23.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2026 23:27:19 -0700 (PDT)
To: Baruch Siach <baruch@tkos.co.il>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Thomas Perale via buildroot <buildroot@buildroot.org>,
 Bernd Kuhls <bernd@kuhls.net>
Date: Wed, 15 Apr 2026 08:27:18 +0200
Message-ID: <20260415062718.21784-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <877bq8deuh.fsf@tarshish>
References: <877bq8deuh.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776234440; x=1776839240; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D3trGtVZBOX4+r7ZcJUNZDDlqEm42gFdhI73c8UUE78=;
 b=ZX3Yt/HjXuua8j8G8XLJtXGoSREoFqf+PTmRt8HWel5zllQbKQ3/z5cTcCGv0HzNSp
 R+7SA0gz6X7oTo+mFizUm0XNIX39vTWRPOIq+DPiTJ1h/lk8NbsRVBKNSbvYLK7rqaOZ
 dcdSzIHYFBRnMpxZEoQirL22qhEKEdesYvXod3FB2AofyW/lj8kwH1JBEcZ6v/+tsMWb
 +5XPeIcHk4edYqvsz5777V6OZ9gdIldWQotuZK/RTArC/BmY5T3PHQJYMTSXUf1W8TiD
 vsZDAhk1NdZWbe02afRlmx6Xe9yuaXvsJpQNz8lo8KB6d9qHAUrBEZyVZ9o4cwzxW6ye
 tJ2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZX3Yt/Hj
Subject: Re: [Buildroot] [PATCH 1/1] package/xz: security bump version to
 5.8.3
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

Hi Baruch,

In reply of:
> Hi Thomas,
> 
> On Tue, Apr 14 2026, Thomas Perale via buildroot wrote:
> > In reply of:
> >> https://github.com/tukaani-project/xz/releases/tag/v5.8.3
> >> 
> >> Fixes CVE-2026-34743.
> >> 
> >> Switched to sha256 tarball provided by upstream.
> >> 
> >> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> >
> > Applied to 2026.02.x. Thanks
> 
> Not in 2026.02.x branch as of commit 8f19b5b8096f ("package/leafnode2:
> fix build without pod2man").
> 
> baruch

Fixed thanks

PERALE Thomas

> >
> >> ---
> >>  package/xz/xz.hash | 6 ++----
> >>  package/xz/xz.mk   | 2 +-
> >>  2 files changed, 3 insertions(+), 5 deletions(-)
> >> 
> >> diff --git a/package/xz/xz.hash b/package/xz/xz.hash
> >> index 99daa5e9df..488a3d55dc 100644
> >> --- a/package/xz/xz.hash
> >> +++ b/package/xz/xz.hash
> >> @@ -1,7 +1,5 @@
> >> -# Locally calculated after checking pgp signature
> >> -# https://github.com/tukaani-project/xz/releases/download/v5.8.2/xz-5.8.2.tar.bz2.sig
> >> -# using key 3690C240CE51B4670D30AD1C38EE757D69184620 Lasse Collin <lasse.collin@tukaani.org>
> >> -sha256  60345d7c0b9c8d7ffa469e96898c300def3669f5047fc76219b819340839f3d8  xz-5.8.2.tar.bz2
> >> +# From https://github.com/tukaani-project/xz/releases/tag/v5.8.3
> >> +sha256  33bf69c0d6c698e83a68f77e6c1f465778e418ca0b3d59860d3ab446f4ac99a6  xz-5.8.3.tar.bz2
> >>  
> >>  # Hash for license files
> >>  sha256  616a3ad264ce29b8f1cb97e53037b139d406899ca8d1f799651e17bfa09830b8  COPYING
> >> diff --git a/package/xz/xz.mk b/package/xz/xz.mk
> >> index 8aa0716b18..91eedd7a83 100644
> >> --- a/package/xz/xz.mk
> >> +++ b/package/xz/xz.mk
> >> @@ -4,7 +4,7 @@
> >>  #
> >>  ################################################################################
> >>  
> >> -XZ_VERSION = 5.8.2
> >> +XZ_VERSION = 5.8.3
> >>  XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
> >>  XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
> >>  XZ_INSTALL_STAGING = YES
> >> -- 
> >> 2.47.3
> 
> -- 
>                                                      ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
