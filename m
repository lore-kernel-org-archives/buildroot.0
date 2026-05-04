Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE10FF885A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A469845C8;
	Mon,  4 May 2026 14:47:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n-AXO7Egr9Gi; Mon,  4 May 2026 14:47:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 737D7845AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906058;
	bh=iRnjnRfzZP2UwwBLyDS6bktwS1+7P+uq+4Hh+NrcECE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Mhc02UHRvT0kyOqFeNnAljwLpSyF+w0daVOOHllndML+Wg01t3m1yOLETmlWR1F36
	 CProDigjmkjRicCFiXblJvXpLeJLWk5C8FRWP7tC11zwZwcmnKCxZKd/iaL870z6bA
	 L6vglHMi9rXFcdjAx8Zy/VGBmzBAhXtha7k24Z3zzpzsSDEuoy8NYUAFMnHyvyE3aU
	 Pbmlm3kM7egcx1weIVfpVFEWVCBjG0xkPRYj4XwLkybHFPqgNqBur23gmJNlcWWaEa
	 ggdE0kgdLFXCX0S4hH4RzBMDiJiTKKB13X2ZnKC/3x45WtlC2iHXdxszLo3V2YztIq
	 lEMCgp+QCEhKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 737D7845AE;
	Mon,  4 May 2026 14:47:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7655E190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 685C941BA6
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rAzSd4hu5ZxI for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:47:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 77CD741104
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77CD741104
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77CD741104
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:35 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-43d7645adbdso2552619f8f.1
 for <buildroot@buildroot.org>; Mon, 04 May 2026 07:47:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906053; x=1778510853;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3PoM+bEl9RxIExOdX6Drt3YdNzhs0cNfDSyAL/mnpIE=;
 b=Sf+RQbGetW9zH25/yNSpKap/UNjhvQfqDOvTGM32+76d+IC1BJfiP/MtG1T6J74Axy
 LSH7DaDyX5+KDjzRg1bKnOIkji5jS49RUmF1kr/3T7v5TcN0W4bGQNo5SkZt87wTj1+q
 Hf5fM89y5R8ioNkV0RhaEghjutBR2snEiS9Kw2qaxgs23y3ihQvjZVyTOu1mwSJH2SK9
 YUAKAhecPQHxG6k9J13Bjcgig4yiaO9H60vZgyHV4K+dLFyY9BzE6fBWDbaN832Myl+C
 4aEeDgKWD2BxN75VGUJOoFDsCgnAeVSNJR5MQXAueMLNgt0gRh5ukCZIC0y07phHF+jt
 DvZA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9ya7DhNWg/WRIOxZDFG/peW4SqkE8RqukWpFD2dLLZ3z4sEvTCoTwrRwFtX8ltHrazUFoOekckQwM=@buildroot.org
X-Gm-Message-State: AOJu0Yyqc6HehloB48EfBtMoaLzJNRF3aCgHcjXbrYEbD53PBrqjoZou
 mAPezdLkHazYANZEioGSBfus0z29EGOqhN54EhA+dpM6tQPyPEktRZsIbe6f5DWy2LQ=
X-Gm-Gg: AeBDieskmwzzU+jSr/wMkzd4q9B20ge9ncr3+bK6NDKGivpP9EgT+QeSswr/NtLVEg1
 0rdRKkUI4x4NHt6KBIcjijxAU3qtu5WVHmplO2BN0idG4jpCnhKzf4WXQ8ffGHOIaG9O8mq4tFR
 4ZsJ6u7hvunxOsWvtdcgVmtY/YIX8B4JDDIDdKC4gh0auogUyL3/Q3VR2rqk305C1AnvkBes8WP
 B9mr6eqMP850TnHoDNE0IaANf29z8064t6tUxuY6bEjLSjpHYlyfGBw8gDu1ej6pj59QXt+MvLS
 HoFSQBD3d0eO1nr9JkhUYsnIVijMLMvi2CGKapSdcF0Gfp3BbUD+ty+M1k5Fbuv7uLLFkt080cd
 K34GHBzanuqNmv62aTWZtwMt+HNEcPTuigkG6H37/ub+MvHPind2DPbSV+8z2NY4O4nwUd4C8wZ
 dVS1hCQFxMnwfXw9mPWYU42+T0Hw==
X-Received: by 2002:a05:6000:25c1:b0:43f:dc86:d61f with SMTP id
 ffacd0b85a97d-44bb4af9d07mr17224200f8f.14.1777906053423; 
 Mon, 04 May 2026 07:47:33 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44a8ea7cf5dsm26665024f8f.1.2026.05.04.07.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 07:47:33 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  4 May 2026 16:47:32 +0200
Message-ID: <20260504144732.9277-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260420174507.3612219-1-bernd@kuhls.net>
References: <20260420174507.3612219-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777906053; x=1778510853; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3PoM+bEl9RxIExOdX6Drt3YdNzhs0cNfDSyAL/mnpIE=;
 b=KeXol7F2d8rDxUtKFpKgIaCVpOpiguaToxj6LA4MhR/BazsE3dLF+x75Ro+NHNQDuW
 Dm4udOYG5QVsRuEJZ+M83elACXKiBQU4N9KmAWxa0aS95LzTVd/mAgmoVvr16ZnnjtJV
 MG9fINW/LZkU/9OcD//WWjWmCiolils0N8N8x6fYN8gjfWTPAOFDE898glv0AYNux5Z6
 qoZAjNg+PdBWVMeEy8iMy+4zUsKGkpG6Ipm0aPcGx8z0i8JJyLJz5sBqBIH9GVYmTE5A
 5hD7QKrwToZQ4Na4BwVlEzWG02Y+hPXNUqb+FWcOSrRV/JCZoKBoxbo+dwUtvDekLwvr
 dQgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KeXol7F2
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: remove Clayton Shotwell,
 e-mail bounces
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
> <clayton.shotwell@collins.com>: host
>     mxb-00105402.gslb.gpphosted.com[67.231.155.145] said: 550 5.1.1 User
>     Unknown (in reply to RCPT TO command)
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  DEVELOPERS | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index e8be446a66..f97fffbcba 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -704,19 +704,6 @@ F:	package/perl-sys-mmap/
>  F:	package/perl-time-parsedate/
>  F:	package/perl-x10/
>  
> -N:	Clayton Shotwell <clayton.shotwell@collins.com>
> -F:	package/audit/
> -F:	package/checkpolicy/
> -F:	package/cpio/
> -F:	package/libcgroup/
> -F:	package/libee/
> -F:	package/libestr/
> -F:	package/liblogging/
> -F:	package/libselinux/
> -F:	package/libsemanage/
> -F:	package/libsepol/
> -F:	package/policycoreutils/
> -
>  N:	Colin Foster <colin.foster@in-advantage.com>
>  F:	package/python-tftpy/
>  F:	package/rauc-hawkbit-updater/
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
