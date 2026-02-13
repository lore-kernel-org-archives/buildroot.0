Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EB0EF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30362845EE;
	Fri, 13 Feb 2026 19:40:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y0kSx6ONjbTg; Fri, 13 Feb 2026 19:40:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B21684945
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011615;
	bh=kkXRUkTxQDJrx3s9aR5Ryx75c4nrwB3HxXQHWNGmT7A=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=c/xoXUF9+VnoOgI9K9gjhXgv8KZFcam3Fq84FhKS2+gz4l4llfeXbP4HnQDrCMQD5
	 HatwraeUYh5chBD3OMsFuDd99JrAtVo03Mfep06kiYSNek8VhUggR+4HgWf09y/226
	 3PBYefJLL2OYa93zdoWFrogvlUV7S5P6/xfsB/EvlZd5FeWhyQcbHgSqIb0J+oNPPT
	 jH40oJQpvQsd3v2Ga/U68znbfIPI8tkJqMdevKYAxTXwl613YkOmTrs3isJEjVt8Ha
	 D8jIpwYpI5SPbZ+ER7/fv+Cx+OfFiJgHeBmsWQkUvNeVB6uE6DA17mM2It/MKerUti
	 1jE62GY1VkMKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B21684945;
	Fri, 13 Feb 2026 19:40:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3292469
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 540B6413B3
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xhS-msJzf1XP for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2D28D40407
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D28D40407
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D28D40407
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:30 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-48371119eacso11956175e9.2
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011448; x=1771616248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mafd/8bQCI/BpJwu4T5h9nhVBrzEHHNQYAX9KMgZSbo=;
 b=hWEOmhsWLyAn1s3W0OLcMy1R5CuIRoCyY/KVtP5D2R7+Mn/UhRlNfMwxHEFsC48Rte
 ShzvI/HagttGJxn9739/l79tTLLLwZhzB0YSsC4qbknaNBQoXdRMsi78y6QOO1bJE5kL
 oMSc8y77HzCIorEtm/cOMYWxcNRXgeLCdLfmg/0tVJF0MeJaBcFdI6xH+ST0E1zv8GLN
 gppOuZDYk1N9eSKqI54SiDp7SlINecNtrgf/h77Uy8Otuhf/KZeBCMPg3JPwr+dOUwW5
 5ExhCKXVrKco6n7DMxHPOkg4qag8iBgy8mPjO12aw2zLbKM1FlNdGSFcWqXKNKr1ZjQn
 d99g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFs7/7/ys8palrYckrxY24K39fBWZcafCjl9fYD/R01U9Yc4dwdZ0ox7rq0LxDMNh4kDxUp92so3E=@buildroot.org
X-Gm-Message-State: AOJu0YzLLjV9c2BSouOv6pzV1lZa8g0bJySWelRTSVI96SwVrGzXuhSE
 dbvwMDvT+PW4lhIn8QBl2C2ET276qx/bC/59pCra0OMS7UQY/8t2zNLM3jRYQ3dM7r+/B4cqSP/
 DwP8e
X-Gm-Gg: AZuq6aKENf2ODH81i/KTN60yXs93K6HKJsrJBkGpNYi45oiGJI+MuTppkfhGyQCZEpo
 Bc0whvdxkGrngZT12ALYih3MRKYDnIN7y4GYVG8HTUAYyFOkTxC76TT8Z6RiYsr6ArKAnXVBUOJ
 BWeqDwob4FKKgfoSsr+lixrJGVPVNC/VNSzs+zRRHLCe7Nj5PTuHDEQ2qqoPTnFQXM8CrzSb3uF
 1g8/xmNpJWtHrvrqGo0ln0OSmwoBclEfvz7m+M5SoqKfkeXo1+/1y+BxON3FbTdLbQf3ZcBEhvo
 1gvSuC3EC2LA2k7DLwpOVAVPIsu3HQziPLKe419xGG8I1drzDNPNcLRjmNo+ztrsG79ZKSyqlX2
 1vqOG5VSy5LKLpsbbZaUr/pJveYp39czBuL8IEAHvH6JW/wrl+ZscAlYiq8wQvRfzx6lUSZs97O
 Gh8uxXC0PNfSAjvA0=
X-Received: by 2002:a05:600c:19cc:b0:477:7bca:8b34 with SMTP id
 5b1f17b1804b1-48373a082eamr49518305e9.6.1771011448161; 
 Fri, 13 Feb 2026 11:37:28 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4837a5d562esm4125995e9.15.2026.02.13.11.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:27 -0800 (PST)
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:27 +0100
Message-ID: <20260213193727.39507-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251001-fix_license-v2-4-bf18911c835d@bootlin.com>
References: <20251001-fix_license-v2-4-bf18911c835d@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011448; x=1771616248; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mafd/8bQCI/BpJwu4T5h9nhVBrzEHHNQYAX9KMgZSbo=;
 b=TFzLIhk0YJg6hxWBcWojPeRmw1vDSEQJ1mP+uiLqtD/yEBCRVd5qpiOJuqu8VxsPSX
 t+XIMINAlhpk6QCLFSMlZDwN8DGWwQrveJs9Ab6RpuVHFGGs229H1ppY27kCJKMl6gVX
 ch2A9N2K4AzVLJ/cCKm2e0NKgwYI2uJB8hlclRZS74eoglVhClJhdTTBNpYkmPOEOhNL
 z1ix2eZdpjrdxGP+yDJV5UouW3Mt26K960ti0WL1r37JoZvVMy7sPQHMoqg1vW0j4Ln8
 wAKtlI1ECQUTxmak/ElCPfANH8JnK1Yun/P2MuLI9P3V/ebFEBpLO/tNyt/xpinPPZ8a
 XEwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TFzLIhk0
Subject: Re: [Buildroot] [PATCH v2 4/7] opensbi: Add support for custom
 license files
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
> The OpenSBI package was not providing any license file when a custom
> Linux version was selected.
> 
> Fix this by adding a Kconfig option to specify the license file,
> with a default value set to the commonly used license paths.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
> 
> Change in v2:
> - Do not show license option if it is not a custom repo version
> ---
>  boot/opensbi/Config.in  | 16 ++++++++++++++++
>  boot/opensbi/opensbi.mk |  4 +---
>  2 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
> index 9c6047df5e66f67e077f8b613b760f073301654e..86cccb1003b813076581f7eff3aa4c1eb530ebe0 100644
> --- a/boot/opensbi/Config.in
> +++ b/boot/opensbi/Config.in
> @@ -64,6 +64,22 @@ config BR2_TARGET_OPENSBI_VERSION
>  	default BR2_TARGET_OPENSBI_CUSTOM_REPO_VERSION \
>  		if BR2_TARGET_OPENSBI_CUSTOM_GIT
>  
> +config BR2_TARGET_OPENSBI_CUSTOM_LICENSE_FILES
> +	string "OpenSBI license files"
> +	default "COPYING.BSD"
> +	depends on BR2_TARGET_OPENSBI_CUSTOM_GIT || \
> +		   BR2_TARGET_OPENSBI_CUSTOM_TARBALL
> +	help
> +	  A space-separated list of license files related to the OpenSBI
> +	  package.
> +
> +config BR2_TARGET_OPENSBI_LICENSE_FILES
> +	string
> +	default BR2_TARGET_OPENSBI_CUSTOM_LICENSE_FILES \
> +		if BR2_TARGET_OPENSBI_CUSTOM_GIT || \
> +		   BR2_TARGET_OPENSBI_CUSTOM_TARBALL
> +	default "COPYING.BSD"
> +
>  config BR2_TARGET_OPENSBI_PLAT
>  	string "OpenSBI Platform"
>  	default ""
> diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
> index 0142769a1276175ff9ababfb4d40ac9b7054c3e8..f9f550176f925cdec8193e0fe2891338f69a71b3 100644
> --- a/boot/opensbi/opensbi.mk
> +++ b/boot/opensbi/opensbi.mk
> @@ -20,9 +20,7 @@ OPENSBI_SITE = $(call github,riscv-software-src,opensbi,v$(OPENSBI_VERSION))
>  endif
>  
>  OPENSBI_LICENSE = BSD-2-Clause
> -ifeq ($(BR2_TARGET_OPENSBI_LATEST_VERSION),y)
> -OPENSBI_LICENSE_FILES = COPYING.BSD
> -endif
> +OPENSBI_LICENSE_FILES = $(call qstrip,$(BR2_TARGET_OPENSBI_LICENSE_FILES))
>  OPENSBI_INSTALL_TARGET = NO
>  OPENSBI_INSTALL_STAGING = YES
>  
> 
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
