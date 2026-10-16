Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B98CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3275F40ADD;
	Fri, 16 Oct 2026 15:04:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PvWgnFPRhR-L; Fri, 16 Oct 2026 15:04:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3E3CF40ADE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163041;
	b=ahqhD4pwGhlWVuuTilTMc2Pzg3wZRz3yb4hVALKRQiaPCbYk+RlsxSfeMlmXZ4gsRtNK
	 w9Xz24jGkJT8MZgPoperNtK0QFV7LLzYHoeq+XgG3Zv7LLc5vW9q/3f9SqU8/1icrANme
	 ax0JusV6G0TGWQs1t1dGd/5B3gj1rmyE9KoUls2ijsDvXNF0znqoPyqWsWvpPkD/rTJ2N
	 WypbaxmAF5ni480exaX+9N98vGiJ3KkNlVCIy/5JXDTyJa0r6ob8blCwS3TEb/odnWcUX
	 POJH7P7X4YDZHJFd3BVDh3gYEyWcoawLd2H8aKK+0d8OVnMjuMYsvRfTIELLuvuB4PA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163041;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ihHWpJw4aYRb/cXp73g11KFTvzHyWYqjslSbxPh66CQ=;
	b=oF9ROkoGe4qwENVJd1t5AOdw/LYpG/hiG1Ff1uXczjtAFsr+SqPOxZmRrBOs9k4pLLVI
	 qYIEoOf9aClHglf+iHx1K8h5SpqcpwI8nBramAFVZdg+i3zUR3k6szN6sa2tSKVE9FNjA
	 cg0T+z3/ZzmbkYR81PjQboTPEF3ZYbJ3rfAX8yKo8uXCN5zsYzzm+gq0Txlu5vMxf0hnq
	 UR7TVSirb7wWazV/76NDu55eqmgZy6akZ1IrXkpFLf4a6ol7rxypHHoF9/dG0N0KyGb+M
	 ioXKDQhMoqp1J21gnNRfVTIy3/qdArP4QdkYaNe6IjfD9jIlNi7a1CEa98oFi9M/ydw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163041;
	bh=ihHWpJw4aYRb/cXp73g11KFTvzHyWYqjslSbxPh66CQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MWwZbD/kTMMTNQc9vLZSt8F6OJ4zM4SnPu3CJYq2Fh2Y5s4dbPE66oLk7fs4qwZhq
	 B2KKOrIznQxLMVdl2tNQIvOGV8OlkoJ1epgb70Yd9bdZJ4YtLGK+4ZskcmiZ94JQPy
	 AiXhXNiJYHhdeL30W0buAYbFv8/2m+ccMpDVA5/SWB9yQe+DESN6lbAcIBaMKxAsvb
	 ZhoJh3YFLfiOEss3rH4CaySnM0wc6ytt9pOpLrIDGB1Z9JBRGdH7a98xQY4U533a7Z
	 GpwZ+wlZm0Nc+2SHwjYvtBdB8vktSSE447paXM0FXGzekQvrxkxIG3SOwLke3FSwi6
	 kaoqBAEAj55BA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E3CF40ADE;
	Fri, 16 Oct 2026 15:04:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C1327255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B317C815D7
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GaeGJ0cBtFGs for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:03:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BFC4881659
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163039;
 b=O9KisxDzejOghAFFktScxSEdfFg+qV2wEG1RfEEW1ztGGoXhfQTzp53fFVkjYpAHyWLD
 RWygSsS92JraxkkXBxNFKlABCnXc7Rybd0juqdheYVrmemu/filKfb1czwWstqS5T+ddq
 hUP5QMBOpsXklu4QPPMffTZobMLmep0atCYYJefnyoL5y7O/WP6Xa82Y/d/JdktiFOs0B
 ZZxcVUI69iICC6p3KnGxtHHHEKBXyA/0i/2XF8cHSuKF8Be6OZhoPvVSK1FtvIWwULf4G
 X1Ud5cqG/JCXsywcI2NOn4601EMZAcFy1vJc/Nx0Oc7IUb8s9bgulE/w6NgeD2lvWFw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163039;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=FHT8jOFqC5iDbVMEfYsrRqPFhF+CUBX/JNUREhKHCAo=;
 b=Z47uxgCS5eeCnfWKCuojPS1tT3EnBNWxSVNg3LWPdeHy9HGfEFFw4Wfuo8apqLec6zZ+
 c/1EtGF/RS60eVSwACZCBAMjZIZW1wFKOqOw1Gf+mXMpiPpcbD2F1ctHvzugfin3N+cqU
 2y+5Dg0M9grMnfr9ebRNSeGukZQBZ4C1Twu2R5tKJdbIe39G5SwJjdFelpO0ZcYlenCXz
 K4b+5mc1XtlC1xlXkMacFD0/8CqpSP1Pp0nZ5LewTo3vPJlM28/l3oiHqazIR6y5XxUmT
 xsmQqos2rYTzjqUsagXl/eCWrV1A4ebeftlFmQy23tFjGdSpjIRXao0izt+aEfO+leQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=RlOtMnfo; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::430"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BFC4881659
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:58 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-48afcd7ba9bso3726815f8f.3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:03:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163037; x=1792767837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=FHT8jOFqC5iDbVMEfYsrRqPFhF+CUBX/JNUREhKHCAo=;
 b=GjJEUFS78Af8pbg4c1g++BArgm6ptrpD8C+uMJ/rvwU6TQFIc2AQR4qGMfixrMzwY/
 XZfeivgntBT+nvl69/t4eTIBy0VDhisU/bxJDEATRnRXuHG/qMS/jXqdDohTZC7uSyL2
 tt2e4cVDrLBVQMt1afR8i+w8vpdGzLP9CowFQrlng1sH8rHxChT/ATlSzwG0ccuegDJm
 mMTpFwpllM+oJP9RFqboaUxYpANPhsHDG95KBilsdLBqtFi7QHrMMax3K5kjFUiq5TGo
 41Nnps5lvOT3UjcEqjvPhJbKKwGjYWBXByO3ZjVwCkE/25nVsF5L36PYSnraCtYMr/ST
 1tjA==
X-Gm-Message-State: AFq9FYLbsw1LGtpdJQY3F6bqY1SLmnrptJtDHt2WS9NESlrSTtykU73w
 WaFzCjRF4ThW2UlIVY6/SCijpiNsVJMkcqRMnOLbmpwyfIRrtYuoY6JCNR2y86tB0Z1QLfNN/hU
 0sBxe7C0=
X-Gm-Gg: AYBFou1pe9wn613YwNOLRvO3lQkbk3UqE8omkjvu9fnzELqu6uH0xZaPQ9lSQHi0e5Q
 IRHE1wK3aS5ppa4xZOjokHrJD+NQsSZCNvRJ3lBI6pyEUcGMtebOrtm6LlKO2XQlhbTOD+Pjat8
 kb2CTpkZQ195Qne2UhUPpS0xwzcoUhlR7g0Da5M+hnpm+7cYtWtKLxytv08YeNdNrE8abXavIXH
 Hzwl4D8WfwUFiCLdDKptUag/KexbsIsSvD5mq+ekqGL9e+tKsaeFWYP2WbH90OcDiXN79uD8xCY
 ptF1+x1btBzLKC6PpJU35OqqiH+Eo0Tq4FIFZSXcn2OOTYkUIYw/V0iqHh4E/qcbKTFiKM1SyYW
 gjE3eadwwZbnPo5QhE3tDIHxBnGOOampjSTzYdGBaVqvV9v32wqey3k3IPK+Upeu3S+XgesD7Yh
 h/hQSrf+DfxnWzOncv71yi7At60ODEyPUMFSbIiCsrlEOSkrHQjqyIJ0HToLtC74aOJyB8DyI4J
 MEivUKl4JpNpMvjnkmepsI1O0euufiMRvaQrpkoRw==
X-Received: by 2002:a05:6000:2486:b0:48d:f6d2:9c8d with SMTP id
 ffacd0b85a97d-48df6d29d8amr11897690f8f.46.1792163036725; 
 Fri, 16 Oct 2026 08:03:56 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd500e75sm5495593f8f.42.2026.10.16.08.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:03:56 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:03:53 +0200
Message-ID: <20261016150355.67026-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925060237.2488685-1-yegorslists@googlemail.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/haveged: needs threads
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
> Since the bump to version 1.9.15 in commit
> 2a28d25d0c61 ("package/haveged: bump to version 1.9.15"), haveged
> unconditionally includes <semaphore.h> and uses named semaphores
> (sem_open() and friends) to synchronize command instances. As a
> result, the build fails with toolchains without threads support:
> 
> haveged.c:37:10: fatal error: semaphore.h: No such file or directory
> 
> Add a dependency on BR2_TOOLCHAIN_HAS_THREADS. Since threads are now
> always available, unconditionally pass --enable-threads.
> 
> Fixes:
>   https://autobuild.buildroot.org/results/814cb7b5537d8b7b2c23f3d90e37b2b41de7ee3f
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5-5

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/haveged/Config.in  | 5 +++++
>  package/haveged/haveged.mk | 7 +------
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/haveged/Config.in b/package/haveged/Config.in
> index 0e49a2db7c..8862792824 100644
> --- a/package/haveged/Config.in
> +++ b/package/haveged/Config.in
> @@ -1,9 +1,14 @@
>  config BR2_PACKAGE_HAVEGED
>  	bool "haveged"
>  	depends on BR2_USE_MMU # fork()
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # semaphore.h
>  	help
>  	  The haveged project is an attempt to provide an easy-to-use,
>  	  unpredictable random number generator based upon an adaptation
>  	  of the HAVEGE algorithm.
>  
>  	  http://www.issihosts.com/haveged/
> +
> +comment "haveged needs a toolchain w/ threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
> index e22712f016..bf3209cfdc 100644
> --- a/package/haveged/haveged.mk
> +++ b/package/haveged/haveged.mk
> @@ -18,18 +18,13 @@ HAVEGED_CONF_OPTS = \
>  	--disable-nistest \
>  	--disable-enttest \
>  	--disable-olt \
> +	--enable-threads \
>  	--enable-tune
>  
>  ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
>  HAVEGED_CONF_OPTS += --enable-clock_gettime
>  endif
>  
> -ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> -HAVEGED_CONF_OPTS += --enable-threads
> -else
> -HAVEGED_CONF_OPTS += --disable-threads
> -endif
> -
>  define HAVEGED_INSTALL_INIT_SYSV
>  	$(INSTALL) -m 755 -D package/haveged/S21haveged \
>  		$(TARGET_DIR)/etc/init.d/S21haveged
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
