Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0484BC4451C
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C385781179;
	Fri, 17 Jul 2026 15:47:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PFBcjvy5P7cS; Fri, 17 Jul 2026 15:47:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D452A811C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303241;
	bh=awbFy++k9DFDE3nWvmJB8qDN76m2DATwqqub1GqZ9wk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rOWrQTHQxECbM0ouUoNDBAGxOlBmmTy091jBW0bSmUqR/dffNPItJQRWGpS1wWEvr
	 6HLMA8dm2BrjBGwhxspvA+ptteTrXFifjlmRt/5QzfUJ/Vhsr0ICqvhJTAvvaumsT5
	 q4RrAOgRIccf2QbO3diYlzD8C7ICx8fut22pKH2f4Sxexdnl/YMq65Id+Ro5kAyX+X
	 GHxPd/M7N+XnoZsgK4/HfaWzqBD78EYoChh5ZEeKnz8pqCaA4qGM5ZOKyMYgeEm7VS
	 ZpiyfVdPiOIla2wivzMI88fvf2cOR6ecqvX8KkKinuOeMBiio362/HDnpDYmc6Wkwo
	 Bu/uDtbSdn4Bg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D452A811C6;
	Fri, 17 Jul 2026 15:47:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F6F636E
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99DE040B4F
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ViNzmtv9L_Ki for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:47:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 579E840B5B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 579E840B5B
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 579E840B5B
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:17 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-495437bb891so12130935e9.1
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 08:47:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784303235; x=1784908035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=T8MVZ9WQQ9JJrMQ6t5FPcI/Bkf90mTqGp2mBLKCQwSM=;
 b=QZLdbqX9OHMIGaXrGBwLhQBsDUPnwSyM0H2qbsrh5HX48j+e4gLf2/nTKbYYRwuhA/
 vlx8mRX3edMgXLy4h2KoOqpyWXg3HOay5gu+KEzeqF1+WVrQYlIo9/znvninfJCRRvzs
 J3yiUQFYAZyq01VbfFviuVWLowpanIYVFwzOUO3sthYOxQDY77JSzo5bvt3U/PAs2upv
 mb3H5PIR0NFQ9YUPN83+H2hLH1QhYghRlo8nPN8o0+ds44K1aWYSWP56SktxiQt4cHzX
 xiaZrqMFbz8oTC2u1FUX68IN+D1hhd/Q3tQ6UX+z+WQ4oFzEGAhupHJFdn7Eh3BE2s2h
 2nqA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpMy0kx4paQYpCIjyK8K7nbvyO/yvAQQEdAe7CeklwtLjByvyQTk2W0f5bR+FPO4VfmhI4LyMsTmSI=@buildroot.org
X-Gm-Message-State: AOJu0YwhQB1hVTJmRMtZP5i4nZLXyBo7kwhkJ+MLtYIuieupHM7uApQT
 etHo2PWMvE6lJ+BWF7MKpH+UsGMwspZRs33o8oyTxnEo07ehjxfq4gb8wzKUTvuw1qg=
X-Gm-Gg: AfdE7cljzTOgcuMrLrubJgERwMtb31PCvpyBoVACeLm7ygLwENXrS76SS9Qk8wbG9I3
 bRKu/dok3mCrzjF1M0TgMT0p+0jspSHKwX/1VLtY6l8xrj7Yyh4l9HcIqCkexNH/1mFARFoD9cb
 EKZDrJhZkpssoT6WKgDXneYKSjxu7icpiwGggFfsZ0CRz8kp3VFX7EWiQ71nFEBJfQdc+eZBhyQ
 hjUQKbx50bgs8BGpAHdRQN8G7FR3DXY50ElzGC7cZGe753Hy0XGSroeVxJEP4BBGbD5iMy2ilkY
 NW9/MteBr5cSvoKEnSMMPp4UiDry6Y45xSLo7oj7QWk4fSHQaA/0r59dp3iqhA5h7MfXW1xO/ym
 RcGlpl6mVyptSQX63kXxbGIAtjju10FXWY5CEtdkmrC4XVTyxu1JPHy6s+VL/DhDLfQoQ6ha0nZ
 57S+pHgQ==
X-Received: by 2002:a05:600c:4f0e:b0:495:4f84:7280 with SMTP id
 5b1f17b1804b1-4954f847354mr2893055e9.4.1784303235240; 
 Fri, 17 Jul 2026 08:47:15 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4954ba2abd0sm36795005e9.15.2026.07.17.08.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 08:47:14 -0700 (PDT)
To: Christian Stewart <christian@aperture.us>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Jul 2026 17:47:14 +0200
Message-ID: <20260717154714.191627-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713203901.24229-1-christian@aperture.us>
References: <20260713203901.24229-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1784303235; x=1784908035; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=T8MVZ9WQQ9JJrMQ6t5FPcI/Bkf90mTqGp2mBLKCQwSM=;
 b=OcApmmBOrOWfU3tB0HK7dvEzE2V3lqaxlzYyGgc2Jfw952iVAYiyHgDSkyejLlCKDx
 3j+B/WKprzIuPrZvgFcSaFAApOfbBjdSOoujCprlTBosqiWZ3dJgGeUf5zb0ddCYnBac
 bS6xIjUPDEC7731SiDBrnSkpjaXBTC5VMubBN8F5qVPMk+782iWOKIIOZ2md7WJzGRTf
 p8vMDaNVbI7b9OtNzp4PxkOSIFwQs4EdcI40gYFaGkGdvKHbjKgJnPXycLwMFdVwNfO4
 SP9mX91YkIRE/8yCGYpMk5HoaWzC60SeV75jvKqKt0ON8YEmMZrrETsY0dJ9qTjLyAeD
 t/nQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=OcApmmBO
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: security bump to version
 1.26.5
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
> CVE-2026-39822: os: root escape via symlink plus trailing slash
> 
> go1.26.5 (released 2026-07-07) includes security fixes to the crypto/tls and os packages, as well as bug fixes to the compiler, the runtime, the go command, and the net, os, and syscall packages.
> 
> https://go.dev/doc/devel/release#go1.26.5
> Signed-off-by: Christian Stewart <christian@aperture.us>

Applied to 2026.05.x. Thanks

> ---
>  package/go/go.hash | 14 +++++++-------
>  package/go/go.mk   |  2 +-
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/go/go.hash b/package/go/go.hash
> index 69f2a3139c8..6c9c20be69e 100644
> --- a/package/go/go.hash
> +++ b/package/go/go.hash
> @@ -1,9 +1,9 @@
>  # sha256 checksum from https://go.dev/dl/
> -sha256  1c646875d0aa8799133184ed57cf79ff24bdefe8c8820470602a9d3d6d9192b8  go1.26.3.src.tar.gz
> -sha256  0ef3626a149b5811c813838c62b7d6618d03ea36047b32c90b0e4851cc42b1fa  go1.26.3.linux-386.tar.gz
> -sha256  2b2cfc7148493da5e73981bffbf3353af381d5f93e789c82c79aff64962eb556  go1.26.3.linux-amd64.tar.gz
> -sha256  9d89a3ea57d141c2b22d70083f2c8459ba3890f2d9e818e7e933b75614936565  go1.26.3.linux-arm64.tar.gz
> -sha256  d44133d4c66b1451a1e247da26db7716f76a081c0169a75e6c84e1871e394320  go1.26.3.linux-armv6l.tar.gz
> -sha256  dbd82b50530ead2beb1fd72215117380df3cb16332b51467116dc35b3691dd75  go1.26.3.linux-ppc64le.tar.gz
> -sha256  5c0605b7175449f1c8e8cb02efaba2695caab914fad4dcedc764c2f4c6dfe6ca  go1.26.3.linux-s390x.tar.gz
> +sha256  495be4bc87176ac567392e5b4116abd98466d33d7b49d41e764ccc6976b2dc42  go1.26.5.src.tar.gz
> +sha256  88c162b204e6eefcc32499453b492e80209f4a4c78c33092636901c540fb0d05  go1.26.5.linux-386.tar.gz
> +sha256  5c2c3b16caefa1d968a94c1daca04a7ca301a496d9b086e17ad77bb81393f053  go1.26.5.linux-amd64.tar.gz
> +sha256  fe4789e92b1f33358680864bbe8704289e7bb5fc207d80623c308935bd696d49  go1.26.5.linux-arm64.tar.gz
> +sha256  6dae9edab81c13bccf962dec15f1fd2ec26c14a6821b4d2c92dab4130c289d7a  go1.26.5.linux-armv6l.tar.gz
> +sha256  c5d60e2b303bb612f20cd82786594b64874e73b35134025e27d3390bf284ae43  go1.26.5.linux-ppc64le.tar.gz
> +sha256  09ce3c504c0323968b75a717244dca4f25cd4cf0443e5ff6bc0bfa74add89fa7  go1.26.5.linux-s390x.tar.gz
>  sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
> diff --git a/package/go/go.mk b/package/go/go.mk
> index ebd0d418efa..a64d7538f85 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GO_VERSION = 1.26.3
> +GO_VERSION = 1.26.5
>  
>  HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
>  HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
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
