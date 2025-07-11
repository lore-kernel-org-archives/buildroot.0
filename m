Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127CEC8303C
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF61460DE5;
	Fri, 11 Jul 2025 10:44:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z2ohbHaRDXIN; Fri, 11 Jul 2025 10:44:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7A0A60E50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7A0A60E50;
	Fri, 11 Jul 2025 10:44:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E957199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 152E940DA2
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fbkM4hKb_u7k for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:44:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 322E240DB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 322E240DB3
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 322E240DB3
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:30 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-451dbe494d6so20635805e9.1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:44:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230668; x=1752835468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YGThrMhnDGJcyZk9VqBHF4PTXEK4ovmwTKIrfCl0vhE=;
 b=myYtE2wC4hel55VM756Q+qjMBSgquFN41ZsrJOeaamIKYiHn5BN+LXX0k17pmq+8dD
 AxW8mfTgoq4otJN/KRHFoLPMs95GCq1E6dX8azqII8pVMz3MVGn6mCOsdMkrh9gU2m8d
 fN8BL2xJsj+T52d9N5n7gcZ2Hygb48drMATUUxNvaPt29W/KCEi6p+dihyXThWzTOcD2
 X/3QQMqWCTYY+6sleCwCA+C2i9VRBs6P2vwz3uBc7I7Dlv7P+GkRfXdFIBcnrqM8X+tQ
 ObNM8+ju+1p0Xuen1D3Lkk2gNp/D8WyZrNfPH3CwxNfyd4ANq0YCcxagvONRf60B0Jso
 iszA==
X-Gm-Message-State: AOJu0YwmqCDvAUIeWemsW2MgcpjhQ9l1UHZ6V4xMwnz58TPZumcNiG1t
 dDBCEGj6lgYeHZZwie5VlIpvwp0fwOggsIsJBlVZjuevlJzrjcLH3Jkwewh2E/Xj3T1fUfPt6O7
 rGNz0
X-Gm-Gg: ASbGncu5CEQbBcbddhb+qhIJGzYegag+pd3TPHBmjxPWA2yFmomKOxMxZ4dYNeHvceM
 zmjbrkvFuTFiei2rCUxdve0qo/Pesk73fHH6lCtMub1OFJQSQ770/T+YBPV71zpDV89HruO1XeP
 LE5e32zhK05rBoz6AxUkflSCKFqP6PhpBGoI8y3KDRlds3P4C1MLgmcv3/bZdB6czpD26KTR9Af
 awQu3kZDtulAOiNhOy9v0hDkHjC1Ldt1rzbX1kxO4Dk+xdK45auKX3OXFJZWKA1+U2prlA9eBee
 AcwQnLhdGw1fvICkEusJw4rYlpBDyHmTV26A998+R9L1PYBFXOVHaevTHe6xXgvkZKlGFpGDzV/
 MBauikdnFcel6Pg==
X-Google-Smtp-Source: AGHT+IHTcBFMYiop7JRH0SxyDWgVymK2iOAMtPCAPJZAs+pAqQIk5RSf/MOyDn7Q/neWfgb5yj5sZw==
X-Received: by 2002:a05:600c:8483:b0:440:6a1a:d89f with SMTP id
 5b1f17b1804b1-455bd87a4a2mr16176405e9.4.1752230668255; 
 Fri, 11 Jul 2025 03:44:28 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454dd4669c3sm43161475e9.14.2025.07.11.03.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:44:27 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:44:27 +0200
Message-ID: <20250711104427.822970-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250629205947.1033440-1-thomas.perale@mind.be>
References: <20250629205947.1033440-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230668; x=1752835468; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YGThrMhnDGJcyZk9VqBHF4PTXEK4ovmwTKIrfCl0vhE=;
 b=QmlhTxO2cXa/75AekSYM1PfcMvrbWDGlGJniKbqmGXMJm29segdko8FfkN+a487pVN
 z9qu/OHD7Nd8aYJNAyHL2T2awxRvkAF46LhoSuA1JnyZHJyeOwNapStqVCgfWUtdWNdv
 vgr4H0c87JH1aAjmfRj6aTBORfhi4bMSMDznsYZ5mBMEFmjOnAS7Ig0ipWS6ntfDrCGk
 CNIprXLc9XQBWUmU5fdq7ormjibQIiwa6WnxQ4EHikSH20HDqVL5AtqffXrXR/jQzE6I
 4iLT0cQofzkg06+YN1lJwE1dgrAJ+2R4pMFlaXzaGPrULGowAiinsqMbRlnXrI1yNCHM
 IaHQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QmlhTxO2
Subject: Re: [Buildroot] [PATCH] package/libavif: security bump to v1.3.0
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
> Fixes the following security issues:
> 
> - CVE-2025-48174: makeRoom in stream.c has an integer overflow and
>     resultant buffer overflow in stream->offset+size.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-48174
>   - https://github.com/AOMediaCodec/libavif/pull/2768/commits
> 
> - CVE-2025-48175: avifImageRGBToYUV in reformat.c has integer overflows
>     in multiplications involving rgbRowBytes, yRowBytes, uRowBytes, and
>     vRowBytes.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-48175
>   - https://github.com/AOMediaCodec/libavif/commit/64d956ed5a602f78cebf29da023280944ee92efd
> 
> For more details on the version bump, see:
>   - https://github.com/AOMediaCodec/libavif/releases/tag/v1.3.0
>   - https://github.com/AOMediaCodec/libavif/releases/tag/v1.2.1
>   - https://github.com/AOMediaCodec/libavif/releases/tag/v1.2.0
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/libavif/libavif.hash | 2 +-
>  package/libavif/libavif.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libavif/libavif.hash b/package/libavif/libavif.hash
> index b26e678abf..c53e0c9f50 100644
> --- a/package/libavif/libavif.hash
> +++ b/package/libavif/libavif.hash
> @@ -1,3 +1,3 @@
> -sha256  914662e16245e062ed73f90112fbb4548241300843a7772d8d441bb6859de45b  libavif-1.1.1.tar.gz
> +sha256  0a545e953cc049bf5bcf4ee467306a2f113a75110edf59e61248873101cd26c1  libavif-1.3.0.tar.gz
>  
>  sha256  165abf92cc04b39e80d29cadea7a6a7e8fddf59407d4ad2616507a7ebe8216f9  LICENSE
> diff --git a/package/libavif/libavif.mk b/package/libavif/libavif.mk
> index 0c2a8e4dae..4357566ed1 100644
> --- a/package/libavif/libavif.mk
> +++ b/package/libavif/libavif.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBAVIF_VERSION = 1.1.1
> +LIBAVIF_VERSION = 1.3.0
>  LIBAVIF_SITE = $(call github,AOMediaCodec,libavif,v$(LIBAVIF_VERSION))
>  LIBAVIF_LICENSE = BSD-2-Clause, IJG, Apache-2.0
>  LIBAVIF_LICENSE_FILES = LICENSE
> -- 
> 2.50.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
