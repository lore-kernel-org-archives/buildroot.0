Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EC3CAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A7B584ADF;
	Thu, 11 Sep 2025 19:22:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MYwb5vOLMbtW; Thu, 11 Sep 2025 19:22:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DAA984AD6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DAA984AD6;
	Thu, 11 Sep 2025 19:22:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ECE74E20
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D044B84ABE
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:22:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ZGPtqCfQAVS for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:22:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AC60B84AD0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC60B84AD0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC60B84AD0
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:22:05 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-628caee5ba2so4053345a12.1
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 12:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757618523; x=1758223323;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HChwQSC1SV2iD5ViFbUD8LGU1QqD+Klq9XbpSlQKaHQ=;
 b=bJmAAcGsMVXn45Fzo2ruepdNJOaFNQrQ9SWNunvqinmq1iWLg2FJpI+w3yxmveSocX
 xa2ARhFt03x6trrzd8xNoADuOSLfRSuFFLYG3GCIUFXiStH0n4yaXuQP3ZwpaFLmxgHg
 FbRlTxlpPnGMfURWtC0uOpaSAnKcvWQuZg0lb7C9cRRwN61BEzgVrhhl2TGe9a+OiXuy
 o8NX0htjsJYG2rAdi3m4+cEmRJAs8J0vVjcqBn3gy0wtTXKHnrItroPtUAZIvu+giRs5
 hco/gGGQLmW/HQSTPH/G4rkNVdav64twx2fJMNgjX7stFbOspJNcLWursRH4Dh8TSZxp
 w2sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnHyGcX3bsy+BO0DaIYKX1I93LezKItkuoRmh1P+IvHk4dT4hEhEsoWj6Q8XtTOv3/WTH29VQr3oA=@buildroot.org
X-Gm-Message-State: AOJu0YwuHTWHI6uCO+q5qDI7+EYOiUPXqFeGGLSHm/mp8oGwZ650CvZm
 KS9XClwXpEiCL1xs6ibQcM0D+JBaMHkUUO9Z0TByZyfSj4UXvIg+JSMcMflV67dQbUM=
X-Gm-Gg: ASbGnctA5Z5rhOyOirT4CxwJKy8BOGUWLFO3BLMc7l0rvk8y1RqUp7jDSJ3afzjT83M
 NCpQZvaBYfmCi2ulfI8fYbMf1Nu6MOofSG3TYVpoCZHHIQkGNfu0F/ex4aZVbQIWX+ZCbQpnB10
 waGmGxC4i2h8IuUeWIBTF5j0ivBHA1g5neRTzO9YMuJ4RMVHF1yTZFz3d7Hxm82ZDmuBv6jJNdi
 4046PoxrQJIZgBRoxp4Wbpt5A6pTyWtZkBPkvpmBu0ZCATvM5zPM1k7ggU3ZZgKnRYXZsDYXo5W
 dyKPR6x4j65Xq/jFJ++YzhClezE5EUISku1AhD4Yba8ylb04fZqXlqPK6l+rgHdxncfFRwtv5rj
 rVs85sZy/mYGt4e+brWxJjX3Z/g1dVV3rWKPl
X-Google-Smtp-Source: AGHT+IEdvbHWCQ0b/Vh9a7LOe2GqUlRvYYa9qnoge1fSlI7Nbr7HE45PtGd+07z5blqXuRGzB3LfrQ==
X-Received: by 2002:a17:907:72d3:b0:b04:3623:aa10 with SMTP id
 a640c23a62f3a-b07c22b20fbmr51964966b.2.1757618523529; 
 Thu, 11 Sep 2025 12:22:03 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.79])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b32f2334sm191568766b.78.2025.09.11.12.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 12:22:03 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 11 Sep 2025 21:21:40 +0200
Message-Id: <20250911192140.2671560-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250829201835.795429-1-titouan.christophe@mind.be>
References: <20250829201835.795429-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757618523; x=1758223323; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HChwQSC1SV2iD5ViFbUD8LGU1QqD+Klq9XbpSlQKaHQ=;
 b=P7d/sxYAaKClL7P8zCU+U7vMUed2+9xZ9VxLxv4/XgzSRtlNXR/uiM64XaWM9Ho8k2
 /M3Q72Bki8wGI2ZrhQ8TEUw1WuTiGYtwAbAfFPxEH9a2sLz4UMGmVJdyKRcqgB5DSncj
 FFTB9oaNaiWRyxdpmqF84cpTonlgaZ7LAMnbORP6yaRK+piUWyZf7aH2Pn7nROfKAFQy
 XwWEMsYz1j3Bpndrv3/PhbmLqYfOog/rqi+TJan+llaiSnA/d8EY3V9P27tvxwHJ5Z31
 lR5N76YE2rhRVkaLbsRdcgdNSDneSZ5rvME2YtVm8Tj5VbKQPX8fJazceB8tnsvn0wpD
 Tt2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=P7d/sxYA
Subject: Re: [Buildroot] [PATCH] package/mosquitto: fix build failure with
 recent glibc
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
> Fix link-time build failures because glibc>=2.34 no longer ships libanl.so
> as it has been consolidated into libc.
> 
> See the inner patch message for more details.
> 
> Fixes: https://autobuild.buildroot.org/results/16223cd838876abc9b6f941f7dc20d23afa32c3b/
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  ...02-Add-configure-time-check-for-lanl.patch | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 package/mosquitto/0002-Add-configure-time-check-for-lanl.patch
> 
> diff --git a/package/mosquitto/0002-Add-configure-time-check-for-lanl.patch b/package/mosquitto/0002-Add-configure-time-check-for-lanl.patch
> new file mode 100644
> index 0000000000..b67164123a
> --- /dev/null
> +++ b/package/mosquitto/0002-Add-configure-time-check-for-lanl.patch
> @@ -0,0 +1,47 @@
> +From 447a6aa8df882a67ca3df6f5e95be42e1463eaf0 Mon Sep 17 00:00:00 2001
> +From: Titouan Christophe <titouan.christophe@mind.be>
> +Date: Fri, 29 Aug 2025 19:47:34 +0200
> +Subject: [PATCH] Add configure-time check for -lanl
> +
> +Since glibc 2.34, libanl features have been integrated directly into libc [1].
> +For backward compatibility, some toolchains still provide a shim for
> +libanl as a separate .so, but new toolchains (for example for new archs
> +like loongarch) do not provide it anymore.
> +
> +In such a case, building mosquitto fails at link time with (see [2])
> +    > cannot find -lanl: No such file or directory
> +
> +To fix this problem while maintaining compatibility with older toolchains,
> +check if a simple program that uses libanl can be compiled without -lanl,
> +and only add the linker flag otherwise.
> +
> +[1] https://sourceware.org/pipermail/libc-alpha/2021-August/129718.html
> +[2] https://autobuild.buildroot.org/results/16223cd838876abc9b6f941f7dc20d23afa32c3b/build-end.log
> +
> +Upstream: https://github.com/eclipse-mosquitto/mosquitto/pull/3358
> +
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + config.mk | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/config.mk b/config.mk
> +index 34d5163f..cc7987c4 100644
> +--- a/config.mk
> ++++ b/config.mk
> +@@ -318,8 +318,11 @@ ifeq ($(WITH_EC),yes)
> + endif
> + 
> + ifeq ($(WITH_ADNS),yes)
> +-	BROKER_LDADD:=$(BROKER_LDADD) -lanl
> + 	BROKER_CPPFLAGS:=$(BROKER_CPPFLAGS) -DWITH_ADNS
> ++	NEED_LIBANL := $(shell printf '#include <stdlib.h>\n#include <netdb.h>\nint main(){return getaddrinfo_a(0, NULL, 0, NULL);}'| $(CC) -D_GNU_SOURCE -o /dev/null -x c - 2>/dev/null || echo YES)
> ++	ifeq ($(NEED_LIBANL),YES)
> ++		BROKER_LDADD:=$(BROKER_LDADD) -lanl
> ++	endif
> + endif
> + 
> + ifeq ($(WITH_CONTROL),yes)
> +-- 
> +2.50.1
> +
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
