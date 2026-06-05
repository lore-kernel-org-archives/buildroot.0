Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAE0CD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7427E8266A;
	Fri,  5 Jun 2026 12:49:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l0Dc61b0K_Kh; Fri,  5 Jun 2026 12:49:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89728825FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663780;
	bh=8M5Wz1ySvW92rJrPz1sTP/s569jPPaRct//fuN3jEIU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QvR5Wr4hjcuN9byEj790ItaxgLzIYJSPYWL86LsRww8KvUCZHd53f3SQ8D8LsWLOY
	 wqPj12DyXUCZNe0UMSBzR1FtNU3ncZvFfgJIGrGaPhnJ23tI1UleEeOtPtJZNJ6Ris
	 25JBq8ZQvx6vdJjJfkn+XST0Y9c1D3DM4tsqHxqXMBLZEXDknBoPY3y0yHMmaE9CpF
	 SKVSUDAR856O+BBVX5i4kH/j+IMgnbYJwdGcxYfjf66fLJSYFOBshBiQUoH2S6jkUX
	 gpMNPFWeViZk1Mu6JO2Yjov8Z/MIYwmC2k4u2BvUSIBBsdoBxeRBqoepe4GSPXNrIQ
	 b7JUTvYCfUFGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89728825FE;
	Fri,  5 Jun 2026 12:49:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D3504388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5E9960FB2
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NUo22ib0i7NL for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:49:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A81D660B8A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A81D660B8A
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A81D660B8A
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:35 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-490b9318997so14024945e9.2
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663774; x=1781268574;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sj48D+rv6dInQYSFXIWpMxtVErm5032ihj7CmITXctg=;
 b=OmMa4QTC+QOxx0DJQjyIhsrt+Egqj5AS6DvCSBJ4lvS8Oozwj+CAmB/xTrEeSOTlmM
 g7ylf7DcIbF6RkoLiFP6yo+6KRak11uiHn1qsifKrMA0jMX01wWbUMF7397DUciE3wcl
 fIo5TRjAF2omAw3MwyPC+bTqGG7eOCeCISEj3rgeNUWajiNmF93Wy4Q9SFQ4naLTok33
 nZAyWkMIUxfe+5bcGn4k0Fel4s8ZxZNIEf1CDu+0iTJKnA2N6QoOIaxQ1snPeEoYjmO5
 aII4tLwKmBlNMqIu5TAaKpI5Wk3t2+Q2UDu/v6wCWcqbLuipr3d42ONJpLUr6NxiBG+0
 2JTg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/5XHQFYntOHl/rchtG9dUAsq7Ob0UwkXVrVMTYxB7FXK9nYyESPgQYX07/bRQl1MDm++EFPBLBn00=@buildroot.org
X-Gm-Message-State: AOJu0YxPwKe4O1Bik+YKU9H+IvdV3Os9k6EJL8y2N8bpvHWPTTOpVX2F
 o3SIEAkbRTwegaO2wLrbML97ERqyChUgp+n9/DAzgrocvzOftv4cNeRRGN5TK0rltjk=
X-Gm-Gg: Acq92OFJKQOG69uRkwIuvRMEiFx2pCw4tlNzYrWaCwgxTn9b7YalUBcZcr9YAAdFDIn
 vToNTDNNygGWzK1IjyQLZ7wMI8xYtKHyiEH3kXiQuSSRHXNGaZYt3qEBmSPaso33bFxwfrIC46X
 HVVYK9C7Fnl8YM1ZnOZ4b6Fdls+xcx+pQpGFDuYgKzPQZLkl3ItTb7rpwyI0bTXSJz0Izb5tjyC
 s60sLvTq2Iwu99FpuyRprELabtAFx0J/Ut3oxHQd5p1HqkGQfvz4S/LG6d7dRjuTpUbxJyG1y4J
 ennhsfmhoPqxOHHqM/KGfjsw3rgV/dhRI55wADvc1RHylOSzH9TqAE9grNP0DbNlQf3h2lQLyZ2
 nlVB16ZGCONJQ2+vr9CQ8uaEFofgdQhJuGgi1nTA8iqkRs4H7wOeBSIzVgEzVUf0pTF/SyngVC1
 k4ubJ0A5RAhRDWz+h6u2vkv+h0ew==
X-Received: by 2002:a05:600c:314b:b0:490:bfae:55cb with SMTP id
 5b1f17b1804b1-490c25f5df4mr51129325e9.21.1780663773750; 
 Fri, 05 Jun 2026 05:49:33 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc39def5sm145083225e9.5.2026.06.05.05.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:49:33 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:49:33 +0200
Message-ID: <20260605124933.271578-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530201054.2926152-1-thomas.petazzoni@bootlin.com>
References: <20260530201054.2926152-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663774; x=1781268574; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sj48D+rv6dInQYSFXIWpMxtVErm5032ihj7CmITXctg=;
 b=hh3L0QNKNTkmwlWxrBpJrya3+YRax6FftPXX/IbfROFgujLsMyDcPuI4zIFpeBsFCr
 4+lBfKDWGW3Z/hPgDGqaiIT7HCAsEJfSbiEs18KohV8tlaR4hlcc/EUHPrai8+99UDZD
 5oIdom1ichRUC2wzOm4umheO4i6O1MatbueOxlIkDPfstkXbvUBWkRbgxa4O0KCCQVa1
 zgFlX7OjcXRIhnGb6KNc18+dc3OrsXt3hHxgUMoFPzLKbner3oYlpVMSqpStTebjGANa
 KTtm2IER2W8uki25RZD4bf9YpSFdbjSk42l8geI3A89mPW3VoD0SxjNsuiepd5gaSlTa
 j2zA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hh3L0QNK
Subject: Re: [Buildroot] [PATCH] package/liburing: properly handle VERSION
 vs. SITE
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
> VERSION should ideally contain only the version, i.e 2.12 and not some
> additional prefix like liburing- as it prevents our logic matching
> against release-monitoring.org data to work properly.
> 
> Fixes: d2ed4565321c74772014681ca5ddcb433162e468 ("package/liburing: bump to version 2.12")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2026.02.x. Thanks

> ---
>  package/liburing/liburing.hash | 2 +-
>  package/liburing/liburing.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/liburing/liburing.hash b/package/liburing/liburing.hash
> index d37b69497f..d50a81d2cb 100644
> --- a/package/liburing/liburing.hash
> +++ b/package/liburing/liburing.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  f1d10cb058c97c953b4c0c446b11e9177e8c8b32a5a88b309f23fdd389e26370  liburing-2.12.tar.gz
> +sha256  f1d10cb058c97c953b4c0c446b11e9177e8c8b32a5a88b309f23fdd389e26370  2.12.tar.gz
>  
>  # Hash for license files
>  sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
> diff --git a/package/liburing/liburing.mk b/package/liburing/liburing.mk
> index 24ceb281b5..78b43d5bfa 100644
> --- a/package/liburing/liburing.mk
> +++ b/package/liburing/liburing.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -LIBURING_VERSION = liburing-2.12
> +LIBURING_VERSION = 2.12
>  LIBURING_SOURCE = $(LIBURING_VERSION).tar.gz
> -LIBURING_SITE = $(call github,axboe,liburing,$(LIBURING_VERSION))
> +LIBURING_SITE = $(call github,axboe,liburing,liburing-$(LIBURING_VERSION))
>  LIBURING_LICENSE = (GPL-2.0 with exceptions and LGPL-2.1+) or MIT
>  LIBURING_LICENSE_FILES = COPYING COPYING.GPL LICENSE README
>  LIBURING_INSTALL_STAGING = YES
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
