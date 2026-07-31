Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB78C5516D
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AFDB60B90;
	Fri, 31 Jul 2026 12:22:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zmqfnu_QctJx; Fri, 31 Jul 2026 12:22:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C964C60B7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785500528;
	bh=an1g8sgzA9rZKZkx1txhCF9F/apBCVDZ4uD5gZXUKfw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WVCmeX4qfHoLjcQk0SGs4FXkDo2DowweFENxnFtp/l8/iBwIsb8KGPevbWNa3QXi6
	 7RG5DHZEoMKbaQrfzoqGWX8hmEnE9gZ+EwIjsl0nmrL5044/nUOALosBSSb2RMRjOH
	 xeX049czU3HmLJ9wTKVFh78wLAdpX+ZIJcGXEDGRCx1IVR9IhXhY8XbectULpVQ6gd
	 US9zLJDo+vQXpinKpbenxAQ+Vbt5MUeq/sF23QDin+9KuiAp2I1gZt+AoAUMwCFNoo
	 OUCrwqdc3eWJU5aP3bl31gYjIg2ArYzX5PEbVjnVwbcakyAqPqzkxyWzanrjCrnr58
	 B1Gz6XW/luaUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C964C60B7B;
	Fri, 31 Jul 2026 12:22:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BA3F2E9
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2117B8133B
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:22:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aAp9B0_fOZmq for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:22:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 01F2B81338
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01F2B81338
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01F2B81338
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:22:05 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09e5so1140391f8f.1
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 05:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785500524; x=1786105324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=twx4A/D0aqXUT12sQyDOe2CFeJEyFDqwnLwWYiX+2/Y=;
 b=YSMpf/G2KpYdTPnCxFpzA5UM9Q1FFsZipN3atUhbs67/3fq+urq91JZ9jvdYuj267e
 IQ2Z/t2aTc8W6So9kPoum+C8f14/zpwBaFKHwL1V5n/ZB6Cx2L1wnFrFZqRYvNDTCFKi
 OEQMH2kw94vXIt3U83jOEgabkF9cUM00ArO65q26ANl7op2lL9gaBAOlQ8E5HBaX0qrD
 ylhxGC4hbhxGq8TkwWQqEbOjW5Jir6SKO2yK9YotRFswPE/ecoXrIcY/zxvwRTlkGRRC
 0laYtp66CZ0BFh8KEJfB32txQII5/vnDLdPwiFsS1PVW+pXkJ7jxAWOPoNb9CfI7OSTy
 csDQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrBj+UipVqqDKtI+XmRVMKsPPEmvX/jFL+EEmsMK4w5qlemhZicl8rERDGAiN2MFttmjWmbG+O+fyQ=@buildroot.org
X-Gm-Message-State: AOJu0Ywr4c8gnNu2KFLysM8ddzeufZ1pV/nhC+kzXz8O5hD4kmQDVeZY
 8oUVx36xMbjWgLrPngzHmi4MJyD+wrOsQBVEbXgyTKw+wOQRcKyImPS0LRqDfrp0thw=
X-Gm-Gg: AR+sD10swysiZxJhAJLRT6552M/gIvSFUsYo572OERnrd5bkSFdIi3aOvYHu10/4XPz
 NTMO1dPi8kZLLHsJaT3IYFa2JsIj6qC6u3HQ2XfOI23VGPn9clMUOfw2FmP7V/NkiFQsHuvseku
 brg+DBxkFC4e6v/OtZSRRzAlZ+li/KDhbXbGHsSy/+Fdrl0aRd+kGhpXVbCiFsRDYUHhw2SdZ49
 5f2naXaCgHtbQe5fMfxZwX+pvdip37Ftbs8EQpVB7VqrokCPEbH4KkWHXGJegjLFGViMWTja2QA
 VCUec7W+yACFNUCE1iy+DaIrgrEcIfEwM/By8XWNVCFTi313t5+VdHm70uzddLyMFYT0McnfZSS
 VlGPQaLNXNicM58iIXSJmvJwwuNv8lQl3yBmV9W7BYwndXpQS1KP4UYw+Ljw+Zo/YvCAHiYuKEB
 +3yRku2FjrBC4s7SBBNynLUyUiK2ALG6qxmGWFOQOvVGEH+5T6WwP9X21PkpFMw4MfUbu4qqB+f
 3HRtbD3BaGF6k/sEWNdMA==
X-Received: by 2002:a05:6000:220d:b0:47f:93a1:1126 with SMTP id
 ffacd0b85a97d-47fd2b6b0cdmr4073501f8f.61.1785500523967; 
 Fri, 31 Jul 2026 05:22:03 -0700 (PDT)
Received: from arch (213.219.161.200.adsl.dyn.edpnet.net. [213.219.161.200])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd41e2abbsm4244294f8f.9.2026.07.31.05.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:22:03 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:22:03 +0200
Message-ID: <20260731122203.155707-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260723195710.1465177-1-bernd@kuhls.net>
References: <20260723195710.1465177-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785500524; x=1786105324; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=twx4A/D0aqXUT12sQyDOe2CFeJEyFDqwnLwWYiX+2/Y=;
 b=K/jX5WJWuk3Gf8vVVU0zmPU1lu/dihfyrxT3pU09l4WvDcb0KbiS6iixdR3g/eYUKW
 T2rUWuYU5D+yUiiyk1V4yEdNzJ5DI1LPS3Ns2CC9q25fPjBvkaKO1AIQL8PRUxBSf/o3
 3zkj57pbnseUzqSJsHQvF+sb2MmTrRUqua9NvymqPUb4C0S+CMLD61JxPPNe3aIY4U1V
 jt6SKhmlT81vNBulKJOeRQrRqlm+ZUlqHr4ivd7IFY1H6ry/M3XSbQ8bqKwAXFT+dIP2
 ZhpOz3aEamc3QLZjFJVKqR+TjHOt5YjbPmii5b1/t8t8vua8p3L6rGNZsT8Wr1FdwEFz
 zlhQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=K/jX5WJW
Subject: Re: [Buildroot] [PATCH 1/1] package/bind: security bump version to
 9.20.26
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
> https://downloads.isc.org/isc/bind9/9.20.26/doc/arm/html/notes.html#notes-for-bind-9-20-26
> https://downloads.isc.org/isc/bind9/9.20.26/doc/arm/html/changelog.html
> https://seclists.org/oss-sec/2026/q3/208
> 
> Fixes
> 
> CVE-2026-10723: Incorrect acceptance of NSEC3 records
> CVE-2026-10822: Key Record using PRIVATEDNS algorithm may lead to unexpected exit
> CVE-2026-11331: Potential wildcard CNAME RPZ policy bypass
> CVE-2026-11605: Unnecessary validation of DNSSEC signed records
> CVE-2026-11622: Potential memory usage beyond configured limits
> CVE-2026-11721: Cache poisoning possible with label count discrepancy, RRSIG, and wildcards
> CVE-2026-12617: Record ordering based unexpected exit with CNAME or DNAME
> CVE-2026-13204: Unexpected exit in certain situations with NSEC and NSEC3 both present
> CVE-2026-13321: DNSSEC Validation Bypass via Out-of-Zone NSEC Next Field
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
> Gitlab pipelines
> https://gitlab.com/bkuhls/buildroot/-/commits/78563f67d06099122f817ed8e1ea9c0794726c81
> show the same 13 broken defconfigs compared to the git tree without this
> bump:
> https://gitlab.com/bkuhls/buildroot/-/commits/2d23bf7cc9ebc2e86374021b5f07013fa2d85429
> No new build errors are introduced by this bump.
> 
>  package/bind/bind.hash | 4 ++--
>  package/bind/bind.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/bind/bind.hash b/package/bind/bind.hash
> index a1ff3c6101..eb39e4b057 100644
> --- a/package/bind/bind.hash
> +++ b/package/bind/bind.hash
> @@ -1,4 +1,4 @@
> -# Verified from https://ftp.isc.org/isc/bind9/9.20.24/bind-9.20.24.tar.xz.asc
> +# Verified from https://ftp.isc.org/isc/bind9/9.20.26/bind-9.20.26.tar.xz.asc
>  # with key D99CCEAF879747014F038D63182E23579462EFAA
> -sha256  989fef1fc88ea59d04cd86f854dca5a4616a20a9968bcdde3c1a3668ab36be08  bind-9.20.24.tar.xz
> +sha256  55248def0f870c4c46b3de72978ea972615131516663188a4564dca1d20bf350  bind-9.20.26.tar.xz
>  sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
> diff --git a/package/bind/bind.mk b/package/bind/bind.mk
> index 2b8156d0d0..172bbf79b5 100644
> --- a/package/bind/bind.mk
> +++ b/package/bind/bind.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BIND_VERSION = 9.20.24
> +BIND_VERSION = 9.20.26
>  BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
>  BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
>  BIND_INSTALL_STAGING = YES
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
