Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B49EC98326
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 272A560E2D;
	Fri, 25 Sep 2026 14:45:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ialDAaTSH0-2; Fri, 25 Sep 2026 14:45:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B825960DDD
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347535;
	b=T8Ns8VzwOp87aJjml3cidDZwBgWcY6FOu3lNZ3wgBoM2Xc5H31M3d0ll40hvRKO1IlbE
	 nbYO6KO4FIWCVZ5BmzlSvfuDpi7iO4IG62M2WjdAAnPiwf/ocubdXRDvophZ/1qAYe/AT
	 Tf1a5JLFMsbsDRgKwAzl6NRrAq8jj5Jta4diFf7BCUv3MyRvqimlWEjMpE2LYzeCFo1iT
	 +3XuhujEbKeUfILqJ1z6G7j4GMNLRDUPFwGIBASZ6rMgmnF+TWzVtLWmh2Kba/+dow/93
	 DffcB8/tIFiCfyDp4tfL1n93KeB9o+YfTzMao+O3rje3q+OdOdaXU/vUsRwSy+TGr8Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347535;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=aA4ecEp4MWorZX1tRSuYzQZonUYUdq86+SHYjd7bgbY=;
	b=s3NXPfdH3HKNve41tlKu4W5VCMMnhVaqQ9XU0JXtJKSAgbBPWQN0Zdh15SdE1cpuhtT9
	 8T4sMybKovuw2XC6Pwr0rNN4i06kH4f+1oiFvSH7rp0Lv0cVxddMrjzJxjYFM/mZtFsaw
	 hUMIfjvzxg8ZSubm8pV8E+CVEv9Zdz63T2uyMhvnyLN6hJZSdliHv5NfjtV2ulysbwNT1
	 dpe3PU2gGD5Foss1DHjqrcUizXRATX1R8U5vYumOk5TaOEXeHUx/Z74PYGaogj69EnOug
	 abOydqGkX9EgNXDZx5nDd7QeJHXOsXspIhl3eFz+4Z8HFHYdqfteenWQza6uTZqCNcA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347535;
	bh=aA4ecEp4MWorZX1tRSuYzQZonUYUdq86+SHYjd7bgbY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hD+32eCWyhkPvim61P8x3qEdzcoY78C0Q+IhThgLu463KnAfOxeUmQeKp43eLz4or
	 DnaA+euV7V9rQY8jGwNNajG80lKZyuJR8oUTLLbJtuFRvHzQVVeUw40BGGHfW1KEpr
	 dGXl7JNJwvl3bGvlFbUalE7OduKTqrwKFkwDdNkAwNZzs3QAYFliPVJmGjVGQmh3BU
	 L094OGv0+6JC9wGORI9AJWAD7jLU428UJYuXfcByQ0NO1ZVex5nZSlB21VF9EWkmSm
	 7qI3aPLRpyccfrZGmIDsguCJbw/tamVaGT5KemSYLCpcCFOdkrS5AMFZg+zVei8smt
	 TDVfV+PinzfEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B825960DDD;
	Fri, 25 Sep 2026 14:45:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 73ECC334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 639698138C
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m2c-H8LCSqxG for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:45:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8E8D1813A6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347531;
 b=apxFvErN+x5JQPsgvIMxRc1Y0FxwUmx1PvbIzYKhyCtbxD8iJA7TUyKiER1ICKuBsnu9
 hz+iHCG1OXfGpK3H4cqx+PNv5qfvWrxarDZN+Y7LubN42af3nFzZB/9H3vehDe0YyJND8
 /SZjz4gLKnSo3uiEajWxy2qMo91ZYnPCFX+6t06k/wIPZ4b/ncxg8iJHNpceyeLjaMKxm
 /6cPLFw6lBrkTmylhD5JSLl/TQZ8CRIWiNqxHQxbcYGgmKCNRzYeHzFK1XlptpX63zoNM
 Ap1eXkZiE2m9VnrfE4GmzSSR26+LuQ5kquKs4tktt3i5lEkw6t12yypbWQDVl9vPV8g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347531;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=rKmIpRiW2TwQj7NtE1YZ9/230HNG10Lq+bkJCvhdp4Q=;
 b=kXw06zBKFB+pSAIoFCu05uvugKwVRVhIEuLqw5v/WH7Wtg3/mvB8nn/L/gAaKKESnq/+
 bAJgeHl/BFmevaYRd12yKU3GE28/3NOFoWosCnrgJ6N3BdsKJaQMt9kcIoAVP1p1O4l9P
 0amRymrOUVDvsYaS8bqHTXMBQL/eYemBjJSBCHCpV/CpO8rqaidsELMu01CtZM7yspSUu
 ImbgFBSHUuBIybWV6rqgfSvBtl+kADomx0eXYkTAaXTVNy/EqNmE2dnr2mJ2GzCfgLXpN
 VnKgmqs9Bjp9FB8JutHgIt2SttCpNrZPVXM+bE8Y99o02affkVzp57BVLE15ZHK/Apg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=gAE3KlMl; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E8D1813A6
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:31 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49b912d8239so7744565e9.0
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:45:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347529; x=1790952329;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rKmIpRiW2TwQj7NtE1YZ9/230HNG10Lq+bkJCvhdp4Q=;
 b=aGsxFloytiTjoa8DB2FWtPe+A2lbaFWQ8ULg5/jjDn5kSwyM5jlRkJCVZUAlGsptZd
 7qd52ToQYLZVLSjNq9yOmN94P+UqSbaq4sQEV8antT9W29KNNl6+s7GGthVV++g11y6N
 nWpzkFib6bRDLhlBkM/8T7IsV0JCP8d7lJxXwTqkh4cRZyDMUfEw5mZn2jTJaOdqcZ5+
 eJP7ofrGOqRICBqGcg2mIcQIy8aug8x+08tawUeN5NhEWX1slxKoOGcD5hOhi1mjs5CI
 fQm9xgO1nxr1R2Z07pZ/CEzSV0XWxtZuCvpjO27Qew284OYSbxgKVoZJ4gItlqBTsopc
 FaBQ==
X-Gm-Message-State: AFuF++kyzw/PGRLd+qEzyD+vU/qGRvpUO0wLuKseyb468o7CyWEykGuD
 91dav8/Ggp9ZKihqTHKcoE6ZcrSxHLn9TOl6vuibvdTT4/QACmLL/aOHV495Yz7M5my1uJTXs9E
 20VGeU8rIsg==
X-Gm-Gg: AYBFou13/mNWOIOgT8rll1o47X8WMd9lXyr62hBfY/mVpKCBGkJPZvB6r20HWGdEzgZ
 jRIYOgBs2FogqLoNHK+y+YkyFRb/bxtp/bZD8SrCKF4LWAFOpQboncNOSmufVF8Q1yIIs6v5zv2
 7n9J0qbocDaKrenH78w3M0YMRL19+cu76esTA0W9Y+5RQCzlzumqjLzDYS4Dl+BUY7IAgLO9ypF
 l8g4b0p5DQJv360N7FNLj/0L1lkVMBJqhDhIsWPkEy7ah7L9YtEhG51aCKdbY4xbUcPHPicWBZt
 ZU6zpU+3cfA0y8wroKwC5P+mMOmiJOxUBhaHzLeSQvYYbxlDl6NruKox2jraz3b3HGDYnhCUsrP
 HYbrNNV8vtQVi86uRh1tFvv5FPObbNcUHZLalYc7wiQCMyoBTlD+c0fjDZwcr6p0p2daEYyGhHa
 AyI5wwxPsz2Q7AgBCBgkqkavY6VrG+okfV+X+OvUyUlpncpthL59ZvJcAznwdpZiDVVatn1HDG8
 FhUNetlRJMt9Pztwc2oVW9j5LxiYyMbgmfsZejipA==
X-Received: by 2002:a05:600c:530e:b0:49f:bc28:e8bc with SMTP id
 5b1f17b1804b1-49fe7bab945mr104736055e9.17.1790347529495; 
 Fri, 25 Sep 2026 07:45:29 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe5de4de4sm162212755e9.8.2026.09.25.07.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:45:29 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:45:26 +0200
Message-ID: <20260925144527.4097808-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915123932.1956884-1-thomas.petazzoni@bootlin.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/xen: harmonize
 BR2_PACKAGE_BUSYBOX_SHOW_OTHERS select
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> BR2_PACKAGE_XEN_TOOLS needs the full blown version of bash and
> coreutils, so it selects BR2_PACKAGE_BUSYBOX_SHOW_OTHERS, but it does
> so only if BR2_PACKAGE_BUSYBOX=y. Which kind of makes sense, but is
> not aligned with the vast majority of other places where
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is selected, where
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is selected unconditionally. Harmonize
> this with other packages.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/xen/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/xen/Config.in b/package/xen/Config.in
> index d63a3f6002..47f9dfa6e4 100644
> --- a/package/xen/Config.in
> +++ b/package/xen/Config.in
> @@ -35,7 +35,7 @@ config BR2_PACKAGE_XEN_TOOLS
>  	select BR2_PACKAGE_YAJL
>  	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC
>  	select BR2_PACKAGE_BASH # runtime (scripts)
> -	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS if BR2_PACKAGE_BUSYBOX # bash
> +	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
>  	select BR2_PACKAGE_COREUTILS # runtime (stat)
>  	select BR2_PACKAGE_QEMU_XEN
>  	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
