Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529F4C982DA
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F30A40D2E;
	Fri, 18 Sep 2026 13:08:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3zK8MDlRVyWD; Fri, 18 Sep 2026 13:08:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4B22A40BCC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736919;
	b=XqDYlSUF9DAqqCEQ/qyybVOBlm+XEkq2wS6FzXuS56xCNr+8zIujBzCN2FXiWmhautq0
	 Duzdo5wEE7uqehfckbJQeSrulufVgemdnbgZWTIstfq/STiCse3SUORsIj/4xejFSw+6W
	 JP25OeEzA8vlxZ4UMtE2zJ+2E+Aoz3G32l9ti9pnOZbxp7Muqe0KVhm3tdj0m3/r96g/N
	 esxU0VYrcQCCDEg22bzwYUAPguYeql0FqTBoYVAItolbJlEPFGEDpRgYtq7MPbUoNioGn
	 lIRX+WXuhp9Khwgx9moesEdi11U/poitUk5l64zJxC6M1vClof8WNRoOd1msS+xpxnA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736919;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=IyUB5rimOSJLx9IzLDBLVyqa4WxCJK+p9B97yHZ6nzU=;
	b=U7+7hXK/UoDdFTALwSF1yUoqe4Byv+d9refFy6XLBdH2ImpDxUZ0lnso5c2j4/ncRAEJ
	 1hE2+1krgsaCJ3PLWRrHA+sZtDh7RY6xcU90+fvHrikl5+CSEfIn8vyBLxQQSxkR1mBmK
	 x1u/0+QFo09FzBA6HBjZEMWRcvdfZKJaQtPCuVFP38udrNhAaxpk6ZQqVe8T+AHvadFX9
	 4V1R2irq6iwYlUZ4D1AQ2eJDYpYbHUHLMdYnl2QQgzRJptQMgodlMk0bpbj9AdarAoca7
	 F4XDyM0ulKfEQq2XdnT2h9OcYB6iK+YUa1/agyTtaqWJMh2mDLooRnbBw2bxWQKJFOQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736919;
	bh=IyUB5rimOSJLx9IzLDBLVyqa4WxCJK+p9B97yHZ6nzU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OnCuRWrQzyWlVEt7r3JRRYmSUKG8X2QOcoB1CHtYGfOhJT2wJxj65OXE0/eX58k7Q
	 /HTJoTk52HH+UV/cQQaprr6XnpE58EDYKmmh/AtqnMv9vilclkgOlZkqjQqOFZHEWl
	 jS226rexqtIEkTRoQyPcD7aND2Ir0B84lZvuuksJzyV5UWLfYY6J4dyxrwP5bxdB9D
	 LDmiS1t/nnKhQ3mEW44gGbuKr8HbXI7jfHB4GXhm404XMM8Ipqc+70pXYVDVkOni2U
	 9PULVeYi3LI1LjwgqAvilU4m/ZEUcusXccrIvTEw7/aMBxLOOMAFD33aOJXpsDdLrI
	 Y8BRbcu29yvaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B22A40BCC;
	Fri, 18 Sep 2026 13:08:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8534C13D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B2C1811AC
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9SJFLe2zVX4W for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:08:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 467E38116B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736907;
 b=NMIp/I4haHjzUYGMhV0f/9NfzzZYHN/ErVUfwoNL/CDP6Xty8vYXsER+DtI8osurMVD/
 KK4whZ5JJfGRJDOQpvUaRkf9e+rgFVlG4+0pjmS31lgwzNNg9r/9QEacYvRiD/FmpQ6Hj
 QyUSUUCSZTZJUkJV6UdQCORnv6FBtywFIAUKachSOXQLNCTAR8yfVKKBQZEKh/hhILopX
 DyK0IS3fxgiqATsLsOLJGSj7+fRF4nMUmg7jg6FyZe7qb2HyFzAY/aJ8AY7tI7vUbz/Le
 7bbXRYMcVtOX/L7/vFMyRGRA7O4OsZCsUhFgpShKh0Q8ABbtJxG7QOrou8b0c/aaB1g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736907;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=0aZ2Vm12QxvmOsrZfU1Y6mhRviIAJrP6H49ilqL9v0M=;
 b=j6fKg/DqBJ7zu1hm69Rz9wglu3KJHGnWeAV8gZz7yXhRLB2YLP3JcoiHNhfgVPtu1ijQ
 IwmABXQIuDymWf2L2VKYfwMa2DgHwVOd/n5/juEnta3vuuAeZ9q/liYvn5TUzXE6yTnMz
 L8VxHliXpOLDf+cPOp+Y36tdCm+7sxDjoND/gK65o/8t8p1hnjOQA0cYkhXebHMevm80g
 AOdxR9FVusZJeWAkTHX/+DPo1MOfu4dvy0dBA1f5ydChbghRqXrM4liuMhCVdn/6TFQ62
 XBH4XKcdeSByHk3UKJIs8SjapfNTiOu6EJ0yHMIYiikLHkTDYaugF223QLIl8iAOQkw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=BMfnqZjA; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 467E38116B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:08:27 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49b965f447cso6240105e9.3
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 06:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789736905; x=1790341705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0aZ2Vm12QxvmOsrZfU1Y6mhRviIAJrP6H49ilqL9v0M=;
 b=VsT1ArtmvW3cVC80M+hI6hYc5Xx33S4GtBIYogXJ46F0F9KPYMQNid8NL5DvL4BVx+
 HMUrCwLCLV2NxYOuCZR3qiyaEEHKRMT/rS8FmR9/xBWZxCM/kiULf9pPI+q1lDQkxzPg
 vdtNPFdGxueCULxKYGc8Ezp5feQrDMi1XdBQBtr5/vZ2GmBRZk/518RWhwJ+MTLXk5Y3
 T7bMzzJwuzD9+3PmfEMQ/jn4AbGlK3UjjGBCXXW9uszNHA6yb3CheqOTy0zyQJxL4ulM
 V9rOqE2l/RyADEVEGP1qRVkSF1pmG1ePeRnx4C1CK03y5z6rRuq3IDDT5yYM+FhXcYqA
 krJA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwSakO6g5V4IPqA2OR04JpsMxGtcvG9+0hGzBPCyAQJ5A7R2bznQPC9ZNjNF/Rp5j4dXWUdL3qYvoM=@buildroot.org
X-Gm-Message-State: AFuF++nTxEJ4TGPVerXBbn8aO14i3nrHRmUt9dtZPyLZSfvcibeUGnFT
 i7yt8C5TfospGhFdBlyvXsjay2uA96AVnHu+kcNB7BZoWq5R14lg13Xz6dI35IAD5yF0hg+6ZZa
 lFK6w
X-Gm-Gg: AYBFou37QNh8eYBsLm2K3RBFqJRtz9mTbe2EnszEYdFqsBFtODorT9SP0oVlU6rbID/
 GP5b0GOTHLH8gH0ovG7MczaLGlybu66LevKlbqOuu+bHqrN55IC92Stb1w2hoeuufivR0uXCjit
 /pjyeP3VP3hV9InErkGRdRzOSmAIxDnnDMUWs4+cv6mRwLKp3ia1g4Q1qW+kqH5r/OH+50yPd6n
 puM57IsZNfBpxdVEpsWTtz3j8l74NyZ0vxwmNLIzPDfsRHLamJMzqQBBR3gQxIE+6DY0YmxA94O
 kAnyFw2G+iK0HSy1SCNspPFVv+HxVFXDmdgoeM+ifhFAI8fouaZM1WAhxivberL/VQwEZf+Ia2Y
 s1D0Dq/LIgj4msJas1D6N6jkIxrSWVGqGXEbJXk+G8A9ug6T40WAvSOhHyHXntATBnqogNwsJpe
 6/isZM6GXlqAdcb6t0q9peSPGQnoUVhYYkJBa93t5M7hbdTcKBVlKA6kltj43YbBeX
X-Received: by 2002:a05:600c:4e50:b0:49d:17d8:abec with SMTP id
 5b1f17b1804b1-49fc5728fa5mr32782705e9.21.1789736905282; 
 Fri, 18 Sep 2026 06:08:25 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd232d5bsm158636315e9.12.2026.09.18.06.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 06:08:24 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 18 Sep 2026 15:08:24 +0200
Message-ID: <20260918130824.162097-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912214557.1572535-1-thomas.petazzoni@bootlin.com>
References: <20260912214557.1572535-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/intel-mediasdk: add missing
 BR2_TOOLCHAIN_GCC_AT_LEAST_8 dependency
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
> BR2_PACKAGE_INTEL_MEDIASDK selects BR2_PACKAGE_INTEL_MEDIADRIVER but
> forgets to propagate the "depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8".
> 
> This issue was introduced in commit
> 51b60c8acf3f4b534d0954b801f1034491b59c94, when "depends on
> BR2_TOOLCHAIN_GCC_AT_LEAST_8" was added to mesa3d, propagated to
> intel-mediadriver, but not intel-mediasdk.
> 
> Fixes: 51b60c8acf3f4b534d0954b801f1034491b59c94 ("package/mesa3d: needs gcc >= 8")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
>  package/intel-mediasdk/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/intel-mediasdk/Config.in b/package/intel-mediasdk/Config.in
> index c1f609e3f8..7738dcbbeb 100644
> --- a/package/intel-mediasdk/Config.in
> +++ b/package/intel-mediasdk/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_INTEL_MEDIASDK
>  	depends on BR2_x86_64
>  	depends on !BR2_STATIC_LIBS # intel-mediadriver
>  	depends on BR2_INSTALL_LIBSTDCPP # intel-mediadriver
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # intel-mediadriver
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # intel-mediadriver
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # intel-mediadriver
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # intel-mediadriver
> @@ -20,7 +21,8 @@ config BR2_PACKAGE_INTEL_MEDIASDK
>  
>  	  http://mediasdk.intel.com/
>  
> -comment "intel-mediasdk needs a toolchain w/ dynamic library, C++, NPTL"
> +comment "intel-mediasdk needs a toolchain w/ dynamic library, gcc >= 8, C++, NPTL"
>  	depends on BR2_x86_64 && BR2_TOOLCHAIN_HAS_SYNC_1
>  	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
