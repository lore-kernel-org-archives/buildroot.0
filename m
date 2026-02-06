Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B252EB28D6
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCF726114C;
	Fri,  6 Feb 2026 08:11:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v66yp862xjcs; Fri,  6 Feb 2026 08:11:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D643561184
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365512;
	bh=iL1E0eFCVjX1O3zY8QOaxRIRjtr/L9fGWCSNTL+h4Og=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ms48Fgq5GfzuuQ5xbwOdYe+x+f+r0NXGW5aKScxtGnEzqYJdkzfYkHuzxRSXKw9Mv
	 uKHcri5lmG4pv+zHZLtMv+kx+b2UOrIlGAnyzzN0zjRcBSYVeT837qn9oztRHCt4pF
	 BtwwjmG6DpBzApx/CDiD70sRqXM6XuyvnCSmVh/KJUugeMAcOLsMk7+nEHtZfQq9N4
	 r37pZ1VxuxHXrhgE6L6S27JFl+6/hW8+Dl8YhBQ0Sa1RXy1oerwCIlu4vPmkziXh42
	 0uvlB0QG2e4N+2I5a0oT+iQAcxwLbyJ1G4oNx6WLfZuMLhk0ns82NXNQMTMV5Lro5O
	 G4ClvDpjemHyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D643561184;
	Fri,  6 Feb 2026 08:11:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A0729219
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FD9084008
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S-ajQ5JUvWua for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:11:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 670B583BC7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 670B583BC7
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 670B583BC7
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:50 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47fedb7c68dso18531685e9.2
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:11:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365508; x=1770970308;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=s1n9ct5NVxYpmvZv+O9em8e44w8PzWP7Gsp17snaMQg=;
 b=fTdBalc1pvrGuvg4BdzSuS++3k/Hm6vj2za6cxddhfotDHUvxDOwypb0UEq1wThBwN
 LfHUkDiODoj9l30MeWxEIbjhyUSXAHqqZsnLRkqxvMn1J+szxokG1Gvx5f7ZXL8kwf0s
 Wut7sTOb44sJYLHXVSeJw3pr3gWjZbc2dErEpnJvjk08ULu8tYu8kgWRRkKoj3JLquCI
 zFymPYsis10y6v4EkY+fsBBF7YKUfDs2dgN/SoAnkVzTD6i01HIBsnW/IWIqKRczwadP
 QzEHB24Zcfev5jAnXrgtSCJRzZqkOMNbRmlyfaoDBPkGM6A/an01/8NujOLBLdqg9j+Q
 SFcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKR7CzoqwiCiwfCx9zRqvGNMWq6P5YPBbxlrlJKcwqswklR/W+a8F9V4crjnhX+RjeLtf+Y8JWd7M=@buildroot.org
X-Gm-Message-State: AOJu0Ywg3tYXKSCaULxSP7D1e7d119vynvUTCJ6N+rHue/TKpogIS86T
 8ZRbwtxoQ9GF9Xgpe6fhxiVQ1rOkZj4KNkh7/W5CK5DGrlVHEB1XsgguLaJYzDVQYpxp7bTGAA0
 tV+1G
X-Gm-Gg: AZuq6aKVkU3eiPRvi/VeenSKAB8oGtk1knjSyN6znnb1D3EE4SgNfIEOCWIz6J/gb6l
 9BIeH/K7WUeuQ7ViK13Twk1XHOFKoHIyb4Sc6oTvkqNct+FKrwxGC7wLrXhwkxQ0AozkHsg3nT+
 AQPoH80NuDtk0gA/TCfem5EZr/sZZjNcRxnkleU/ewDnQXGwzUYfHFjn+7pge5D6Ya+CJGw3UTT
 tkG8Vdln/imaHBydux+0vAROCnQN0TslNLVX/eT0985YqpiDKsQLzvH38tm3i14jFnwpHwOm6yg
 zIaMVH0qxIaTsAxfLIA1ImFpQ2xasHUGEmgrad9nFDT3hiNM5XCQ0ZRIAs0btlm6xumlcX2QAQF
 iIq4QizhqtkGiIQTP+Zz9b5J4m+jD6E8OhDwlxAbjKbCZo5aPGJbWs+ux35AfUWCIcHgVB3gkGl
 3wZOk=
X-Received: by 2002:a05:600c:4eca:b0:47e:e4ff:e2ac with SMTP id
 5b1f17b1804b1-483209c557amr20757125e9.33.1770365508309; 
 Fri, 06 Feb 2026 00:11:48 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483209eeef0sm11885345e9.20.2026.02.06.00.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:11:48 -0800 (PST)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:11:47 +0100
Message-ID: <20260206081147.31978-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218192316.940103-1-giulio.benetti@benettiengineering.com>
References: <20251218192316.940103-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365508; x=1770970308; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s1n9ct5NVxYpmvZv+O9em8e44w8PzWP7Gsp17snaMQg=;
 b=SvdDQ0/DVuwF/pw9ASn3fY8BGf48F+vA4a4jo9Y9P8uScveLi3ZknXvxLOBVOOP7Xw
 JXFrSUto/WKBcPzlvkTkFmslI0DLMqj686tcD/2SWGm/sxihiQyycBE17gGLcjVFdIrj
 aabv1/zLWDKXz3ew6jY9JyPP8moyDD/elK/2svlxAcPPgPsSRFz8IpsLopMGmVPGdl93
 SQjz3ebXf0a1IoX+c5HYkIo2pss8jWqooVoD36ckhgK12ZTZJkJUGJQ+Tu/vA53X86uw
 P5OE83lUyAK+yEig6EWODLGswPHHcnAPThN8AMdRZo5gRzckHmmDZB5AyC0h2nUtj7xN
 khhQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SvdDQ0/D
Subject: Re: [Buildroot] [PATCH] package/cryptsetup: bump version to 2.8.2
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
> For release note, see:
> https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.8.2/docs/v2.8.2-ReleaseNotes
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/cryptsetup/cryptsetup.hash | 2 +-
>  package/cryptsetup/cryptsetup.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
> index bd165f2356..e85607cdb6 100644
> --- a/package/cryptsetup/cryptsetup.hash
> +++ b/package/cryptsetup/cryptsetup.hash
> @@ -1,5 +1,5 @@
>  # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.8/sha256sums.asc
> -sha256  2c3379eb76597dcab50911449b013e2697c4bffcc716dbbf0d9b0e8fbbb46fb4  cryptsetup-2.8.1.tar.xz
> +sha256  dd9ede9875976cb25f3d29bfabf343b1c60f6186646b67ef5e40e60ab4935ec1  cryptsetup-2.8.2.tar.xz
>  sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  docs/licenses/COPYING.Apache-2.0
>  sha256  28a9529c7d0bb4dc51f4bf5c116a3d16ef247a052f7591466768ddf563fd1cf5  docs/licenses/COPYING.CC-BY-SA-4.0
> diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
> index ebe9c865b3..8421543f41 100644
> --- a/package/cryptsetup/cryptsetup.mk
> +++ b/package/cryptsetup/cryptsetup.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  CRYPTSETUP_VERSION_MAJOR = 2.8
> -CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).1
> +CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).2
>  CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
>  CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
>  CRYPTSETUP_DEPENDENCIES = \
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
