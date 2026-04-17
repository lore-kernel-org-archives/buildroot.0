Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D12F436B8
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE81C60E51;
	Fri, 17 Apr 2026 15:24:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DmcqfbOUkBHb; Fri, 17 Apr 2026 15:24:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2EC760E5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439488;
	bh=q0Uwc/rD9oCzh1GsMbINolpJ3JXH6o0pCCFw3ShaLeo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=P4kRixtIz2f6irR6L942Hceb68Rvffn7/MXrA+U5re7vQyoIUBaQ4thmSoKMRK8x1
	 wRLhzGVBdN+hG5Akgr0jtO/bn9amQdyYgWQvS7+C8dDm8GUYf3ASR/4rY2maimep1Z
	 D7SbdPSDnNf7YUHBCe2MVDTpUK1Fn07CBwFgZ+uoyh+1y8iWa/0sU2vCbaNBB9180R
	 HLGpgBzfEDeOSeEKOammoI4GWwSnCqsXDdaSdeyQ3Okkf95xiE43iNOS8xYuDKJVzJ
	 QiDlQoxiYtvj/t4fFlbcx399hNYT3iQ4mUnI8FlfZnasMe5ke2VRDYrPBYOoIhEcNk
	 YW8dcxrQ0RLhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2EC760E5A;
	Fri, 17 Apr 2026 15:24:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 63CA9396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 561CB40DED
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CS2ptxklFQIq for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:24:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5352940DEB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5352940DEB
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5352940DEB
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:44 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-488a4bc360bso5130215e9.0
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776439482; x=1777044282;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DKztr6bw9Yf5/+IKiHghoY+z5Pmj6fDD1sTWWX9MTuo=;
 b=k4JG7AmOBHmLn6Z1fwi2ayPWHkcHpwMdtwnLOonD+PXOEn5guKx2PngAszQFNV2sLt
 jv1H3O/aGFgLI82vGbWzK98PwticnfeMgU6BM0LUMatganEPolZgcj7O2AOzy16k4NBy
 9N1SB3/fAZcWPpbxuAqgG3Ks5F8s/v/7a4Vey2jiTPb2JLvgKW1raRcAQlLif85k/b6k
 lZyn4Kt46tqSVgZLbn4bu/CpCUCfvWV7+/k8XWfdTg3SEHU8LzHU/h2rZ83BdkNu4x1N
 McECSKX9CfRYYiVqA0lwVdOg3yzkuMfkClc9QYB0kM3rCOU5lh45rGP6FRg6hXWmut8l
 vdxw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/a/03QubB35n7m4YOyd0L+96PDG352WvbDRY4kVYUa6PSblEdVF1ReSLAN95dMfSMG28DOSRSBQ5E=@buildroot.org
X-Gm-Message-State: AOJu0YzrcGhFIwea8ULSAOoMByfcHVYEXDm/HrzTRTfk+CeeDOD7YSEl
 unCA8PcbynpnIc9mo/tOA/FwO2D0B/5vaUxaYoGoDRH4g7YW30m16YDqaCPTsvMMaxQ=
X-Gm-Gg: AeBDiet91LqO+aYOS6NplZevDNrBxsS5Fg6oKZJAAMCgGAQ6XoUqiBXWyjSOSQb3fDL
 VFtxrzIx1PVtoUZMhtG3J/7jsLInfyHcwDEFTY1jv8AwTHjQ73a5np+rlEyNbKm7HzOqb6LnRFY
 c7e6Ktkhk+deXwueTVHyJQL1y7bq2sQT7yQTcVucal4Tw42Sluqq5JCPGO7AV292u6NgD7zp7zh
 fofAjVDs+vJWxrwOaIyUG8xhAq3CiAVWllHHwhriSSvZmOz2DuWHVybvitv6TszmzFd8RsJ45b0
 iuvISKv2HCTbpnWR2vnyobem3QHhumbI/Q2JO49+c9xa23fc/xzTrXXXIkAGd3BHlEuC0Sw4EFY
 FZ4afn4tu90LxWjUfV//s5ZAP5Yiuu1LpW3+mHpq78XA6JDb2VSelvnDRZGKrANSwVfs5K8dMYJ
 uZFggoih79ydaiz+xHG4K1Ke5hKHI=
X-Received: by 2002:a05:600c:5246:b0:487:219e:42d with SMTP id
 5b1f17b1804b1-488fb750a1dmr50408785e9.11.1776439482157; 
 Fri, 17 Apr 2026 08:24:42 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e46471sm4826762f8f.28.2026.04.17.08.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 08:24:41 -0700 (PDT)
To: Quentin Schulz <foss+buildroot@0leil.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:24:41 +0200
Message-ID: <20260417152441.313007-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409-b4-2025-02-v1-1-187337706139@cherry.de>
References: <20260409-b4-2025-02-v1-1-187337706139@cherry.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776439482; x=1777044282; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DKztr6bw9Yf5/+IKiHghoY+z5Pmj6fDD1sTWWX9MTuo=;
 b=MTon/ahyABiJMj7pvS1zIaHp9nLlluSjp36mNJykITNG3ZSYaDfPGq3UqSxWktncT9
 MDZrWRaH66z+wf9UfYOR8NMG9FD67Be6dace3ggoV4kVrllVJnuyRLmLuYVSa3yfKDaa
 Q5x9PXI4urVFA31FBOc9hujxHZFeFXU1Ps9GzeE7t0yPI5lEfNaMlSQc8DZgYh+mXUCO
 i48xf7+mzCPIVUIwJi7v8kFo6Vkkam4/OdT4wNtmF9jjSlA1rz2JRH+pjvkz49wZQia3
 Y1pNZwguuAPQh14K5jsEKzwwTZoA/VtcCvaWsSbuQaMYO/VvXIYtAWjALXR0f2BHPL2H
 FIEw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MTon/ahy
Subject: Re: [Buildroot] [PATCH 2025.02.x] .b4-config: automatically add
 2025.02.x prefix
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
> This avoids having to run b4 prep --set-prefixes 2025.02.x to add the
> 2025.02.x prefix to the patch subject.
> 
> You do need b4 0.11+ to make use of that.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Applied to 2025.02.x. Thanks

> ---
>  .b4-config | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/.b4-config b/.b4-config
> index d568669864..0c6966c0c8 100644
> --- a/.b4-config
> +++ b/.b4-config
> @@ -1,6 +1,7 @@
>  # Configuration for the `b4` tool
>  # See https://b4.docs.kernel.org/en/latest/config.html
>  [b4]
> +    send-prefixes = 2025.02.x
>      send-series-to = buildroot@buildroot.org
>      send-auto-cc-cmd = "./utils/get-developers -e -"
>      prep-perpatch-check-cmd = "./utils/check-package -q -p -"
> 
> ---
> base-commit: 22eb284823338dd9cfbaf08c0a98943c482f21a8
> change-id: 20260409-b4-2025-02-31ef3a6d4391
> 
> Best regards,
> --  
> Quentin Schulz <quentin.schulz@cherry.de>
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
