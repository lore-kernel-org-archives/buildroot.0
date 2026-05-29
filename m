Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFDDCD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05BE0422EB;
	Fri, 29 May 2026 08:30:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EJ5ENih8_WM8; Fri, 29 May 2026 08:30:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BCCA422EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043407;
	bh=D01hzCmqBkJLW7aebpjHhcW771huNuWk97018SYOcXg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Y92aEF0SBXH2mZOvr0QahDD+Kd/F6cxa02/zv17+z4HdDPniWAlovZJuavMtk0RJu
	 l6pMulJLpHgp8pbVBkhdC/emJ7fFozbfnNyOzH7OiG7IVRQOYa7nHKLHMBB5BZkHNF
	 kZAssMVTBqZ3fkOi0h7SgYY6v6R75Wl+SSwCWIj0ot3NcZR0n2Kp+zE/ov2MQ2BVy5
	 NtF7VG6JLiLCSdn0HgQzGM4iLBB6xVhShCO4z7KAQPpUgQSZCUizLkOC1PQsNU6AQc
	 mDbmqN4y0WP5Dsme/l+jdQH5cZQi+yYLqQdIeg4NPfUuJ/qpoeOtfBohFXBpKFVrWt
	 Z7bAAZcV/KDnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BCCA422EC;
	Fri, 29 May 2026 08:30:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B264828E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87AD06158B
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FbAQn1q_qLrJ for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 649C061573
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 649C061573
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 649C061573
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:04 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-490686877a1so37906655e9.0
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:30:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043402; x=1780648202;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=p34evkNETdwMsxQsNjmCJ2QGtrR79ttSmmO+FGyUT9c=;
 b=Hl+GbofuiuNTn4lu8z8bPO4gyq1SkzDxVfAtcICyMb1lcQ3IYjZj5vCHWNF+57q71c
 3afte7m/QNpMbP22xY+kdRXr162kc+UgLH7+f8xnsk9s0krI6ymICoEkL372ts13xwxc
 61JxZcdXC4ZQikmDub7+s5WZQz0sVaE2baWFs8Znm3ZBH1ol3Vtr0sxu0SWgGn8+QLXN
 uxZ+hdXzaqJ2RBanaJ79DrhWrspqYE2nusfa6RyPaxqYsSAZTcmueSBvGEcV3LHhs1Y1
 EgXdb4VGNspdduSsU3hsEQTs2/vJPB5+5iNZEOrA9trOYOaIMor1tgzhWU9L7qgZ0PM6
 8XLQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+obav3LOCnfPOrBXiyqNxpmjld5nz7U01kv0q0yqO3c+iub8oT6csi2XGrKF7W4EPFjsVoIbnEL/o=@buildroot.org
X-Gm-Message-State: AOJu0YwXhK96Lzw55ifRktgBhx+0f7iG19KtWEXIribDd/o4COKjeC3c
 OZ1qW6EexARxeHNoKK+HSR+CyriEM5xZaJR95BPz3T0jZyN6FVYVaE4IWtl9g6YlVRVviKnZjAT
 kXMdq
X-Gm-Gg: Acq92OH0XNmB7oswSvxkKyZ9jO93kpzrPAHeZk3X6irn6+umcsAgarc/7j0hBpGQPfr
 2IxM8WKx5lbPnZUNF0oIq782twg4UWTNlBZu70X8TWcBgxzxMK1xUENPZ6uD8Sh513zzVN4hzc7
 jxA3H+6kCXtCVbMUheWn1BjZhPQvTR3hG+IVLqcO5opQLOeItG3kFNb/kwcc/n2rbHdJO4excjU
 gc31yhBfO2l/nYQW5fvNpe+yN4p9gd3kdyxC/K7Z7Vhd9Zj9XONhBFJR5kuy8eEIRU7wD2SO/4d
 BQI1jELoFfFEO5+beJwv6Gbs1WQlGBy1bcvfq2mBgN3qFnyt4xvXuZGP9VCfC2prQwmTPaf82Y/
 eIRCR0YHpPnOfrw30Qc6XUF7EwbNAz1PHKyLqsIElCa1oc3dhffY1TMsFuyzgiWkxrA8O5zFFZ1
 jeYLKmBboQCxHKOWKTiLIyzBFHDvI+thBuhAtWXFvRDBryTSaAB3DAQbwJgw==
X-Received: by 2002:a05:600c:3b18:b0:490:8b0b:d3b1 with SMTP id
 5b1f17b1804b1-4909c62909bmr23782555e9.12.1780043402187; 
 Fri, 29 May 2026 01:30:02 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909cab0e94sm28691545e9.12.2026.05.29.01.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:01 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:30:01 +0200
Message-ID: <20260529083001.58493-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20251229170331.1299723-1-giulio.benetti@benettiengineering.com>
References: <20251229170331.1299723-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043402; x=1780648202; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p34evkNETdwMsxQsNjmCJ2QGtrR79ttSmmO+FGyUT9c=;
 b=D4wIRRhH5rIbp0bx0Lu1TuIKMC01ZOxJSdy43MKDj67ei8y9lmP1ZeCSdhwU3EiGHX
 03Ppu+EH7F+dm3XKKJmcUYletyBu3svA+d21TS99fT9vwHNgfo0fYoRUSI/r9ytltY89
 MPf6j4W4YFXApDHvFJopJjMOy8+blHBRfUImSVdIQSCDZO+65n1rdPfWdGI/pysv5Qi1
 UuI/73O+8jpP2LXWH7aOZsC1JFM0tFsv+EviflMdpEaJ17w6hwgVbOpcK/4y8cG7KkEC
 lRKite29IianPH6lUloxTuUMM3+87boXuGObHoeYtwVENJwcgs4yG3nmsfI+mDey79sh
 V93w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=D4wIRRhH
Subject: Re: [Buildroot] [PATCH] package/libnss: fix Makefile ifndef
 FREEBL_NO_DEPEND
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
> NSS Makefile build system is pretty weak if used with parallel build. In
> this case what happens is that 'ifndef FREEBL_NO_DEPEND' appears in
> lib/freebl/manifest.mn and coreconf/Linux.mk. When parallel building
> variable FREEBL_NO_DEPEND gets defined if not defined to 1, but in the
> 2 occurences we end up having on variable set to 1 and 1 still not
> defined. This results in:
> `
> /home/giuliobenetti/br-reproduce/3e046c996825447f48377f7c4361b5db26b84f95/output/host/lib/gcc/arm-buildroot-linux-musleabi/14.3.0/../../../../arm-buildroot-linux-musleabi/bin/ld: Linux2.6_arm_arm-buildroot-linux-musleabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/lowhash_vector.o: in function `loader_GetOriginalPathname':
> lowhash_vector.c:(.text.loader_GetOriginalPathname+0x68): undefined reference to `PR_SetError'
> collect2: error: ld returned 1 exit status
> `
> So let's pass FREEBL_NO_DEPEND=1 when building to define that variable
> instead to let NSS Makefile to calculate it.
> 
> Fixes:
> https://autobuild.buildroot.net/results/ad4/ad40536728303c56d1d0968e38ac36da12cca416//
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/libnss/libnss.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index b6be6dbc8c..db71c0018d 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -57,7 +57,8 @@ LIBNSS_BUILD_VARS = \
>  	OS_ARCH="Linux" \
>  	OS_RELEASE="2.6" \
>  	OS_TEST=$(BR2_PACKAGE_LIBNSS_ARCH) \
> -	NSS_ENABLE_WERROR=0
> +	NSS_ENABLE_WERROR=0 \
> +	FREEBL_NO_DEPEND=1
>  
>  ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),)
>  # Disable Altivec if not supported
> @@ -136,7 +137,8 @@ HOST_LIBNSS_BUILD_VARS = \
>  	NSS_USE_SYSTEM_SQLITE=1 \
>  	SQLITE_INCLUDE_DIR=$(HOST_DIR)/include \
>  	ZLIB_INCLUDE_DIR=$(HOST_DIR)/include \
> -	NSS_ENABLE_WERROR=0
> +	NSS_ENABLE_WERROR=0 \
> +	FREEBL_NO_DEPEND=1
>  
>  HOST_LIBNSS_DEPENDENCIES = host-libnspr host-sqlite host-zlib
>  
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
