Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45994C44523
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F11640B71;
	Fri, 17 Jul 2026 15:47:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZvNnuvxuEcHS; Fri, 17 Jul 2026 15:47:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16FE740BAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303267;
	bh=jaSF+8CPk3KWqGrfhiE/Gxn2qxuhvGFLhOwNp8toRs0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bHfvuItuHJl0xvRXqr9GFZDWeRedq3XfXU1mxaiIKMU4yRE6HkZC6e+VGKlgXaUBv
	 vQmxTlendfmZa509pLJnDGSEmyPyuEHRiJtCf+mAzrVhnHzOCQ426YR10YcXZAQsGn
	 f9BE7C4NOZJ3s59rg+yY8qem0cgUP3mKWecS/MZutQHH9MJEhqZ52msG1t9rQ4fKOS
	 c3qGyL5xMp9Ro2q8M8QMZtddVU03QdwYcBPzaV+UFpQFDa9XTumv1AGdZfhQTexLfL
	 lA7y9PLPNPKcabtC1fWAROXu6Pc3L0PvOYyvlpJd3iIHgYl9kvdI7Vt8h+eTiV095c
	 876vZlPQCYazg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16FE740BAA;
	Fri, 17 Jul 2026 15:47:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CCE8736E
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD82A81220
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tgqdAXiaSDeS for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:47:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 531448120D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 531448120D
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 531448120D
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:41 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-476d8e647e9so7298335f8f.0
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 08:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784303259; x=1784908059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=mBHpEPpwlHdwJ7Q6c1TqqGsgKInilu0sYhX3so9iT60=;
 b=ZL9E49qILicwVS3V9EUW8E1bTBfVUkdnzAPpd0mH5RjQyEotKc1RlkgMTHMuNl1JCi
 X/5kRMOAWxLiDfZKsXZVuIFj6nB7zDeRRo99lAanMuP1jCKocqG39WiFhd0SR6hG+DRa
 HzCUx8QgKpgv7vbwUfhlQ1gCmLyQjJaDFnkoHEBBIk1d8IVl9ElluZUrKIwei6kJdD83
 QcWb+Jz6N2dlAXJZjxShPDL49qoQn4kFENLSfY739wLPpQPy4beYPRXGGZJRrAS3FK5l
 X0TIeIDnQ/5PGjtxcWhlwd/8QrCbVqq8DHYcnvilIitcm/emDuH3vBH9gXCojtqDAbbD
 bMXg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpGLM3MNo1kig2SOyhHmKEeYuYLm0BCRHBXAYfnbeHZlHr2UTtRVBvTmXoXaS2ac+HtZ/QWg1zbO38=@buildroot.org
X-Gm-Message-State: AOJu0YyBtFFhQGqqr52R1e1WmpG+IGjkyIgRlL3hgLvfNx0w6BQ7ceuX
 EwAiPYDtSJc0lvuLCvc8pRpEHigC36cbDrPAhKvkLxWNDHB970kbiMqmo9Fq1UgdD+U=
X-Gm-Gg: AfdE7cktGagkG7tIKzJtrrg3yiTUjfbdAZhmcNGhnCyAqI8YOR7LcaHbkkaHB9sTDUG
 EZp6iDNGYiUB6bMwajLkiRbxCk0XUzwvEWyKAWP73VKLxw8epdK9HXf1Eyqm7HupayZrPnIkDZ1
 lJo/Vppa06Ot2x/rwyD1NTkoGrwEigr4pnPYRImq/HtGjczsbkNBAJ6Tk/Rsp1iCCdEUJzh2Kcq
 y8f6pVb1jZvhVOydA/ICtSdJvPusScRKJhAsPiIxp6sRTcHI/OFZddnBMqzYJUHdqYUI+HunGHR
 ORHWIoHUy86vWvq3NLF4m0Zxm8YTpFeZNaPkkFaE5oFQ3q/uMnedwnUEJ6UPp4E9xZduZ3G5C+u
 g7kYvSxfLwtPv7p+NfACSDfRcPcSgxHoiq5kDCUA7PCTGkFThF56kjvFOh09vQld07qCMuhUg29
 SNqkNTGw==
X-Received: by 2002:a05:6000:43c7:20b0:47f:48d5:2986 with SMTP id
 ffacd0b85a97d-47f6233f164mr3579903f8f.53.1784303259277; 
 Fri, 17 Jul 2026 08:47:39 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63edda9bsm4553947f8f.31.2026.07.17.08.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 08:47:39 -0700 (PDT)
To: Baruch Siach <baruch@tkos.co.il>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Jul 2026 17:47:37 +0200
Message-ID: <20260717154737.192255-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <bb6119f10459ad2ecba91904dbb3bc122f381a5c.1783685047.git.baruch@tkos.co.il>
References: <bb6119f10459ad2ecba91904dbb3bc122f381a5c.1783685047.git.baruch@tkos.co.il>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1784303259; x=1784908059; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mBHpEPpwlHdwJ7Q6c1TqqGsgKInilu0sYhX3so9iT60=;
 b=RQ8E70KPVeh5ZlY14+09ew8MAfvK2N2UVQjagGmSIWeNmUhlPFgh1UnQLifPSYz3Zb
 SCJvqeviuuOE5BtNs0oE6ktqWp6ngg7SHF0YgqmSK4gKTQpqyx69fV28roRd2onEP11l
 uIdC3O85czqMZtE11YBPgVVPMkA6lekbZ2Fg+DD2sCtCB4h/0tLwLCdsham/NAx5snFa
 1dRHbjYN7ipmGjYfe9uNgseVzEj/tG59JnjekeJ3+AByXkaJrL0osCvqD/BkQHHCFYgp
 QaYmPzgHWHZNf9kLXtvawn1KyxIDy4iHkvdpqvSqsWKzPRrHpZazOByLSuv/P6cC69bp
 RWtQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RQ8E70KP
Subject: Re: [Buildroot] [PATCH] package/socat: security bump to version
 1.8.1.3
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
> Fixes CVE-2026-56123: SOCKS5 client buffer overflow. Only signed char
> platforms are affected.
> 
>   http://www.dest-unreach.org/socat/CHANGES
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/socat/socat.hash | 4 ++--
>  package/socat/socat.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/socat/socat.hash b/package/socat/socat.hash
> index 3a4eec60c1cb..2fc8e4085317 100644
> --- a/package/socat/socat.hash
> +++ b/package/socat/socat.hash
> @@ -1,7 +1,7 @@
>  # From http://www.dest-unreach.org/socat/download.md5sum
> -md5  5456f0f0c5d4505b68edcb10e23ef128  socat-1.8.1.1.tar.bz2
> +md5  1a5b8ddff793847d80aa100d54b7cf76  socat-1.8.1.3.tar.bz2
>  # From http://www.dest-unreach.org/socat/download.sha256sum
> -sha256  5ebc636b7f427053f98806696521653a614c7e06464910353cbf54e2327adc1b  socat-1.8.1.1.tar.bz2
> +sha256  25bc6476292b2e614220989c77b0b6fca87bb2525d9747b31a6639b1fb602418  socat-1.8.1.3.tar.bz2
>  # Locally calculated
>  sha256  86e46422f9381b386bd2eb6606f9d6c3ff479f905660d0f318c571292ab304b8  README
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/socat/socat.mk b/package/socat/socat.mk
> index 3d40540599d7..311bdfda3abf 100644
> --- a/package/socat/socat.mk
> +++ b/package/socat/socat.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SOCAT_VERSION = 1.8.1.1
> +SOCAT_VERSION = 1.8.1.3
>  SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
>  SOCAT_SITE = http://www.dest-unreach.org/socat/download
>  SOCAT_LICENSE = GPL-2.0 with OpenSSL exception
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
