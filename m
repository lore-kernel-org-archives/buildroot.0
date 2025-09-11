Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E19CAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A403282605;
	Thu, 11 Sep 2025 19:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PQthpX3YGiyF; Thu, 11 Sep 2025 19:25:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C8998237A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C8998237A;
	Thu, 11 Sep 2025 19:25:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 81867234
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7388A6E56C
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:25:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vh07rxOwyfuo for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:25:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 544516ECC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 544516ECC1
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 544516ECC1
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:25:04 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b046fc9f359so176481466b.0
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 12:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757618702; x=1758223502;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rp7BlVHBennkKrbm4N0SQPaodFxhnzk7nFlhD65wkpw=;
 b=nff7zqskAplQ6FzXexZorlrRJ1ueeAWHT+wf+cLbz1TZTFIvakDkPgy3fDTkw4Nke/
 Bj/wXIcxoMSgb/+W1tRyD2Ot2QRhiW/mY45ZqkTXdW++hRPRvS4rXWxOYQ88kQVbxHgO
 QLRRRwYHgGSxEHRN7/kbsEDAMjif1rqDKcZT7lfH1XaqmRhzYA5tGf+12kCJF8MjFPup
 R2YRn6PcwqUDL9NFH4DEL2njofzP3Pwv8IW4H3Bv+w6/dLVkklyhbbcRlbHTWO0A+pGL
 YQp9kaFnWRel73YCk1OD3kEUyjsh6HXtbKvJNKetB/CvnIWG2JvJIfbHXa12HhdZu1x8
 Jw/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXe1Sf9z4/ArVZOSijn5LTZPZ/zoBiSz8uCA5vtO2bhAjYj7vCiIiD8ohY1UM/MsjaqofvrrRUnNQg=@buildroot.org
X-Gm-Message-State: AOJu0YxANgMVikQl5ddvRzWIGTx/zCNXgvKtjHFdlt+8MW7zntPSNFyH
 mLx6HP1s3EMTvjc1bKLnZity2HVmDJO98xCefPCqV0LnGmn+rPQu+2eRaYWr9/8LRFw=
X-Gm-Gg: ASbGncsMmy9GKP4NvVFRiiRTbNr4gduFfKE9MNfF4sZliCELNMhraYzfWEDOLcf3yTc
 bjqo6m2K5brVTDaBp5q/gE8CQaoi+JJdCiu39P/IKxxPVFML8vN6xJGoNsvGFxlEVynubbkxSAk
 94pzJdq1aIpSdpXlAV0S7rTCq59MfbYTlwAf3hlT7e6nL6BLN+K/8caVTXZedgP/z5KjZKd0qpK
 b/+XMqYH2tNiR29/1m3i4tP3+XlJGHqugRoNZABDYw68GXekpfZeN92k2w5aV9syLSDouDwwZSW
 ZBlMsEu5gT7389vtM9tub3Nqr7npmjYJegW1UFLhrvcqnxK7nDS5tEuFmn48FPE/20Bw4DsU9so
 kp8aOEV8LnoWR9LMXys2MLtxap9knftlKAMzK
X-Google-Smtp-Source: AGHT+IGXX0f6KGCbL9K3NGgaLxbDD1YQj1zZnCeFwh3fGGdn9juIMomdvqbPlDhhL0plfIGB93KAXQ==
X-Received: by 2002:a17:906:d555:b0:b04:2a50:3c13 with SMTP id
 a640c23a62f3a-b07c3546eaemr28106966b.6.1757618702348; 
 Thu, 11 Sep 2025 12:25:02 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.79])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b32dcf77sm190305666b.64.2025.09.11.12.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 12:25:02 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 11 Sep 2025 21:24:39 +0200
Message-Id: <20250911192439.2672404-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250903110048.441164-2-titouan.christophe@mind.be>
References: <20250903110048.441164-2-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757618702; x=1758223502; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rp7BlVHBennkKrbm4N0SQPaodFxhnzk7nFlhD65wkpw=;
 b=TorxLOKccLLM6LDi2weXQx7C0nLRyjcWYQ+LfAoVORj/wFZWGBcxfiS48fvfYsl2jh
 C/T5f2NWo9wgKQcGXTVGvkHf6ygdFR6eWGITQj4Y3HooEjB3jbxkKiDi6qgU/5RE9Jtu
 XPvB7/0uhYu/AVd8n/bp6hOIRIY1+Rpo42Q/ZNjH8KDWxwdKgHNV6+y3TmhJ0HTlBoa2
 2TCd8i4VbL1/cB6XXyNZbtbGVXPpx0w0bV4CGVMhPklEPILIuzogbDzcQ20giEvgRMp6
 G6KO+e+FYN0jLAms6ek1bFlcCnEXCYiOOoQKF/9FLSr7gCrKaNDmPy0yfZLlvPTwH6Mb
 JnQg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TorxLOKc
Subject: Re: [Buildroot] [PATCH 1/2] package/wireshark: security bump to
 v4.2.13
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
> See the release notes:
> - https://www.wireshark.org/docs/relnotes/wireshark-4.2.12.html
> - https://www.wireshark.org/docs/relnotes/wireshark-4.2.13.html
> 
> This fixes the following vulnerability:
> - CVE-2025-5601:
>     Column handling crashes in Wireshark 4.4.0 to 4.4.6 and 4.2.0 to
>     4.2.12 allows denial of service via packet injection or crafted
>     capture file
>     https://www.cve.org/CVERecord?id=CVE-2025-5601
> 
> Also update hash for COPYING because of Wireshark commit
> 614add27f29269e681e4d32138bea4951985fe0a that changes the FSF address
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/wireshark/wireshark.hash | 8 ++++----
>  package/wireshark/wireshark.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
> index 8b3245551a..f1f2f58442 100644
> --- a/package/wireshark/wireshark.hash
> +++ b/package/wireshark/wireshark.hash
> @@ -1,7 +1,7 @@
> -# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.2.11.txt
> -sha1  f4e908e73ab90982e7f712e0a9b5f4cce85ca058  wireshark-4.2.11.tar.xz
> -sha256  dd80f30e9853105dacb5357e5832d960437160bbb4b147e8f1a7ead168afaa18  wireshark-4.2.11.tar.xz
> +# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.2.13.txt
> +sha1  e5a08396a98d5dfba4078c66677aacd50d47ec90  wireshark-4.2.13.tar.xz
> +sha256  2454aa650276264d23aca28e1b62eb5d4bd12b64aa261d38c06b33f97b8fa3dd  wireshark-4.2.13.tar.xz
>  
>  # Locally calculated
> -sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> +sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
>  sha256  fce67c1558e448fac784ce9a30cb47956488bc3ef6ec16316c38b0668b3cad2e  README.md
> diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
> index 72415448c4..bd81224ae7 100644
> --- a/package/wireshark/wireshark.mk
> +++ b/package/wireshark/wireshark.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WIRESHARK_VERSION = 4.2.11
> +WIRESHARK_VERSION = 4.2.13
>  WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
>  WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
>  WIRESHARK_LICENSE = wireshark license
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
