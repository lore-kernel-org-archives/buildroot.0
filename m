Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8184FCD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57CBF61597;
	Fri, 29 May 2026 08:30:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yBvG5cvfatIe; Fri, 29 May 2026 08:30:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F6B861598
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043418;
	bh=2siuOGxf9KJEUazoJcqwWEamn3bddjPMvZf0rpdZiCc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AtgVLF1cIza5mc0toDKmnXnXgCjpt9pKMRng7YL1oAttrnPy1vgBKvITuqhhPJTYI
	 v1V3+eX2tmxtsru7ekfyR0rdgAbJaRmOvN5D2LFDg3VJWG4zwWvpIIzuWx81leHA+y
	 OwudQKaCnFyRQbb3m6ykjLl4QD8LHf+ail+6PpjX3QLnNjiGCQLXayH3E71w+n+SMG
	 kJDeYXb40GJX14AypaobVv8GPV29+3li2xItO6OxsBHxTivjZneAPKlQOpKsQu3nXZ
	 nIns8YRKjIfpYCcdZQt+Gl5u3VSiKF0MFuTlj/qkQ79a5K/Gzw1ptvtUKpBJe8u8wJ
	 wZK3NJtc4R1SA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F6B861598;
	Fri, 29 May 2026 08:30:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 52C8E288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50332422FF
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uE8p2yPy_ca8 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4AB3F42300
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AB3F42300
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4AB3F42300
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:12 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-48fde648a71so90489205e9.0
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043410; x=1780648210;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UvObHUaTPgSbDzhIFi8nYXtbmjxfy7HKrE0QA6jN5ZY=;
 b=Pt78DgcRAsBWNtYdvsmV8DnuR2nFHstHfBp9eeppjG2UnmqepTx+Gs5/BGsc57ajjJ
 HHXGEBYVK2+xE2k9M1kXmL+NXbwBvYzQVlOjIj5nfNXuPak4XQKHas/xwq+dsJ3PzMTt
 8/1dwCRx4tQObla1cofg44MFs6iSdD49qA68CBCpfnTJQilpBhtprsQ6DJNhFGZtBUsE
 4hNaDz8qCaRZUupZVhX98J5dIFQeCnh80B9Hd9MztJdvjgGqshbZKniKowQBhjxyCCcL
 NgzokvN1bCMWKzyiWm9eIlN+etRqd+HVYKgPXSC2qlBJwlzPtdnoVANQ6Etq6Y4J1vH0
 bkzQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+ErpWw+KrI4gPhwSxBazt4m4ZjVXyOW9OLH12muqrMKl4kI+YyMADuV76PbUCCbrhaVTFYvY9i9Ic=@buildroot.org
X-Gm-Message-State: AOJu0YwnsEwF3nTavPx8lRum62oHNSW2ShadJzxysVqfWVCi7SK951g5
 ZnxCsewLmRHgr6Dyp9y1/wFTH87bctZxSvXUrltcfKC9TyNJKHH3Oz3hweCwZcQVJSY=
X-Gm-Gg: Acq92OEMC6SIDgHibzkcNBzs7YQiswv2lPpHGnV036aU3cjshYkz5ulTIV9dl4g/FRu
 Rcd6aJ8uQddzEYLsetzXtNvK2LfUJCj58WMkT/L2RdbuVbaTS2QmUZ9CxGfWdxpLTjNbFWRIQUW
 2hsXnNEvCw91n+dHvMqeQJXCSkk6H+ibh0vGAZJAObg9A7imnvaWigKGH9la8WBjesfJ3179Biv
 zsRflSjU30FqwE0LvWWBRJ+QVHjniYJlHZbLJ8YM1hrOwZI2c0L0NLJW4NC8CYhRx+54xDFNNoS
 wPH/fyT4yw/o8KceSJFYnNlVb0VufgOuVfJbOtcc3ysZboy8TE8QGMImYHj7ohlpLc9zxDBN4Ee
 V2QqKZ3jGPerrhfEsk2QPNuK9ODmIcaCH8UgrFS8ioElKU2fqB8aLarEHWCSsJM5yOMNpeKL2fa
 58wAO0OCEaLPpzqQaNLyDNZSXo688MuC5+r51AGQ066XCzMf7SC1itrwhufb5PMaWRW2cM
X-Received: by 2002:a05:600c:8207:b0:48f:e044:927d with SMTP id
 5b1f17b1804b1-4909c62336fmr23106835e9.10.1780043409740; 
 Fri, 29 May 2026 01:30:09 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909ca6db64sm29608255e9.6.2026.05.29.01.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:09 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:30:09 +0200
Message-ID: <20260529083009.58939-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508184329.3669575-1-bernd@kuhls.net>
References: <20260508184329.3669575-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043410; x=1780648210; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UvObHUaTPgSbDzhIFi8nYXtbmjxfy7HKrE0QA6jN5ZY=;
 b=fo3McMNOZY8ggquVO42XVWaKVI8yd3uxXH9hQLWNc8xy7LO7e8WlV4MER60luWJQUW
 f+Saz0ZPCZmKf0m5JsoRW6l/G/zQSrdVclKYPhaq77Rkz3W5GCF2w4hJI41VEUc34iM4
 8r8Oxp4lHcW8AmKDCHdK1bu8+ghb7q0PHuBP7VyRemMHR2nOHe3RzNLedY41bfQu4XBz
 CxjsICH+Y//aq12lqKdTrlnRp+l4iYHmo6yIIO6whxo2Ki+u06Unh5hLgpB0JxszY/nn
 WpAfsQvxvXCy8mO2vRv2XesVk/S9Am2GJIQeuiOOlAz+l4nQ5C/XJGCJI4AQDpbE7zio
 ue+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fo3McMNO
Subject: Re: [Buildroot] [PATCH 1/3] package/libks: select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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
> libks makes use of ERR_* functions defined in openssl/err.h which are
> included by openssl/engine.h resulting in a build failure when
> !BR2_PACKAGE_LIBOPENSSL_ENGINES since commit
> 623d3bbe43e9193aa8e3395367d01af59071b859:
> 
> /home/buildroot/instance-0/output-1/build/libks-2.0.5/src/ks_ssl.c:111:17:
>  error: implicit declaration of function 'ERR_free_strings'; did you mean
>  'ERR_load_EC_strings'? [-Wimplicit-function-declaration]
>   111 |                 ERR_free_strings();
> 
> Fixes:
> https://autobuild.buildroot.net/results/aac/aac25e5c584ede962cac95c353afd64bf720199c/
> 
> The oldest build error on the master branch dates back to Feb 2025:
> https://autobuild.buildroot.net/results/83a/83a207bee796afbc619b62c5ecf89c662484170f/
> so a backport to LTS branches should be considered.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/libks/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libks/Config.in b/package/libks/Config.in
> index 4781d188bf..17a008d7a0 100644
> --- a/package/libks/Config.in
> +++ b/package/libks/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBKS
>  	depends on !BR2_STATIC_LIBS # dlfcn.h
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_setname_np()
>  	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
>  	select BR2_PACKAGE_UTIL_LINUX
>  	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>  	help
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
