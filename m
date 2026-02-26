Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B32AFD9E0E
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 517B3405F7;
	Thu, 26 Feb 2026 20:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9GgQcP1hdArt; Thu, 26 Feb 2026 20:47:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72128405F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138837;
	bh=Z+xaF8SjjagGiSuCWty9eW6vWikYSGjNCQDbCcVw51k=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DJgyQtEuj1GrDGaXhc6Tijr4CtS3h8E+TkVX4GSQwlFy7AxWv23W3aOp+CD4q+HEX
	 ir5clbqqw/5MAMPy7Q008laKUumTwsmDPgH7DyB/46FuamWQOp9tz/YMrJje3EHrja
	 A22P/O4YQemsVTEnsN6XlTQLyXo2P9TSoGWFYf27FDXyDG2UXGsPkGCgzaKXbvjhsu
	 XRV3rY86i4qm1VodD+LoHHEmRMIum2d8X5hmaQsljDUbM9BHCoyboNFwuPsYmRe3Xf
	 2D2CzcyS1J0x+tvr6J/u9m1s8VsPVfIKA+GRWA5wDp8/Xp0XnKn2NtqaibOtVqgfCt
	 wG+wKMWMF6zPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72128405F9;
	Thu, 26 Feb 2026 20:47:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2393D1F3
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09CDB80E4F
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3qCZVtSM21_N for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:47:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F08C480E4E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F08C480E4E
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F08C480E4E
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:11 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4837907f535so12122705e9.3
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 12:47:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772138830; x=1772743630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EjpjhR5ZvEBfNZBqe22vJX6MlToVD3LTt5u3w/IyLoI=;
 b=V66e4zLGA4bXWMGtUjl0tkLHuChWOYOxIKCTuMlW32VV40LrdqMc9J34+bRbX/ls0j
 z/QCAGdy9zAMnYu6Uf+ezRHu2Ur2uKfaMehAAYmFY9k85o61rpJUtD38LPgjrZrYRZiZ
 PcTZT0rwpR+JYUzvTA6Wm/qLM2meaFNgYybHAOE6Nh6lDau6weP5/2Q/cXFkOH4DpZWt
 7GKtg2zKhI8Yw+PYPbw4OYW6lVXUbFVuge2ECOpSUvv2UbKghPUmrHNJ3haaTbOeIe8N
 2qqGEdzSHLLDZzc92bsp+Vz7OSFJoPBDadfpWdr4z/mkasy8ZF54E4NKTJQipHmx+jiY
 3RYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeNrpOIT8/Ojsm6QuIi2g97RSaBaC9I61CzoKKypBngWmADGsbZmI6ouN4jU+bNDnsaibR6ALQ+1k=@buildroot.org
X-Gm-Message-State: AOJu0Yz+31RYj7iC23M8x7WgVAUdskhgLcnW7Pl/R3sO1OzvQVyELRoy
 HMXH23vvtn+3gM5+3FJnF7YCYUuIn80Sk1ZbLkJe5qKs++vsqATWyGd/zMIVlQwAVME=
X-Gm-Gg: ATEYQzxoBIPOIQ754bnHWQl5QpQ/rx7UpS1i4zfGEJvUitw2Xr8YDMfSxLKqWQ2erQF
 D//FqzOkzxlvHvgYRuIp2bLCS0i4Qdde2CNjA30/dY3t4lSGSIwREqBbkSYPnnxKXxraJAR72c5
 UllXbZRZ1pyZNC6pIDiXi+vK2ymj8XZ+lNZSiJZmhYbVMlNYrLlL+VHDut1pR0K+RGKxWbaTSjy
 wcPwswv4Y4s4jm4LYfYmUKMHk0x8b7InnUiShGxcA2n6MpZ55Ty1O11rC0brFU2BfjtlXU3BJK1
 JGav3CHDRhRWwuoWt3FLG3ynDjqrCmND4FY/VSWZ6oVBG3r+/bcBMwegOwgxfJv+6202feD3Zwn
 91loK3125VjnXfQG5/rw5ITKt5zpMJVp6chU/0HstYPu04LiyEPmwxet9F+B6KqHU0BTtIKhfWp
 fTkG2qm6hbmDCXx5T+36CMlY5xHg==
X-Received: by 2002:a05:600c:46cd:b0:483:702f:4633 with SMTP id
 5b1f17b1804b1-483c9b9433bmr3382995e9.4.1772138829763; 
 Thu, 26 Feb 2026 12:47:09 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483c3b3d24dsm54102485e9.5.2026.02.26.12.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 12:47:09 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Feb 2026 21:47:09 +0100
Message-ID: <20260226204709.253893-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260220194702.3078327-1-bernd@kuhls.net>
References: <20260220194702.3078327-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772138830; x=1772743630; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EjpjhR5ZvEBfNZBqe22vJX6MlToVD3LTt5u3w/IyLoI=;
 b=O3SqmGN1K7KoMmTguH9/EBrICwAx1rUWDQgGRXLjpNcIvyLnD1+YjuifzwMrHf+HF5
 MbFAjedctTsA97Fg128Tl6g9XjP8apmX5Hd4zrQLUygRWIEtVA3ToG3dthgYM6ptf8yd
 UvZfO13T3YVypvToWA8XjAzEAHKW5LU5yILH5aP8e0ZyjqETHKfdSgoh7tFiQyFZG6uo
 4kylJ3UCRtrYdgiTxVSvbo0RhR/UdCA95asVQwVDQs86bNlK4V21AbbljkBV58v+cW1p
 cLg0WvaiAqX8xTiXgvAUp18FOEFDDdET1/9Adzpwk65oM1dho/rO54gXaj4dB8MS1Y4o
 YYbg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=O3SqmGN1
Subject: Re: [Buildroot] [PATCH 1/1] package/wmctrl: fix tarball URL
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
> Current site is down, switch to Debian.
> 
> Fixes:
> https://autobuild.buildroot.net/results/679/679a9f6224d1771ec2ab52e45fd74af8d03c1604/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/wmctrl/wmctrl.hash | 2 +-
>  package/wmctrl/wmctrl.mk   | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/wmctrl/wmctrl.hash b/package/wmctrl/wmctrl.hash
> index 531f64a0d8..86b04d0c01 100644
> --- a/package/wmctrl/wmctrl.hash
> +++ b/package/wmctrl/wmctrl.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  d78a1efdb62f18674298ad039c5cbdb1edb6e8e149bb3a8e3a01a4750aa3cca9  wmctrl-1.07.tar.gz
> +sha256  d78a1efdb62f18674298ad039c5cbdb1edb6e8e149bb3a8e3a01a4750aa3cca9  wmctrl_1.07.orig.tar.gz
>  sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
> diff --git a/package/wmctrl/wmctrl.mk b/package/wmctrl/wmctrl.mk
> index 36ad3513ff..e948f7a939 100644
> --- a/package/wmctrl/wmctrl.mk
> +++ b/package/wmctrl/wmctrl.mk
> @@ -5,7 +5,8 @@
>  ################################################################################
>  
>  WMCTRL_VERSION = 1.07
> -WMCTRL_SITE = https://sites.google.com/site/tstyblo/wmctrl
> +WMCTRL_SOURCE = wmctrl_$(WMCTRL_VERSION).orig.tar.gz
> +WMCTRL_SITE = https://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/w/wmctrl
>  WMCTRL_LICENSE = GPL-2.0+
>  WMCTRL_LICENSE_FILES = COPYING
>  
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
