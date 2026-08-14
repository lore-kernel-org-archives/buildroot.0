Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EF1C5CFC1
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00249407F3;
	Fri, 14 Aug 2026 14:17:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mzH2oGUkFIOL; Fri, 14 Aug 2026 14:17:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C52AA40DE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786717054;
	bh=ku1H18+2nVTIWdp3SSFBfduMJD1t1jyZvVQL9COFp+o=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=UhbuFPOBFr/NNw4R7VxhrCiTY3/k3JqeakBenNTN9Q61B7Gju3pdWrOl8gAxT9Flc
	 nJSwhIJsqJP3sB4UkAE1UFU5rWMn3D8t5OLLxk/Dot+Zc9V/lUXF2YixHNPuzpJ7/A
	 ZRKvgfhgDKsGqjxik1OJEE2AJTSU2dyoC5RDQdmmo1fm9T8blj9qgnXnSsKGCEdiav
	 JxLlvAJuUDhAEjvqdyT16Yz9tUG+rmnWVYBitiwd8XavKnDM7JvhUckCv9M914wj+Q
	 Z86SbDhUc1Boz6zs+8B4d5QQSCpviMmuicyWT9ycwRi88NjFJD8YCyMZXqIz1YzR0+
	 ljuCYlgu3v+nQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C52AA40DE8;
	Fri, 14 Aug 2026 14:17:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1509223F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 072358146C
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:17:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xfwTRKjv2mJN for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:17:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3C733812F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C733812F4
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C733812F4
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:17:33 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-49978908b35so9158675e9.0
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786717051; x=1787321851;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VU7a1yeYjImWfqfFi4FteJ2Cduu3WvxCgRXuWTd8kU0=;
 b=hfKbK79ybHImzQcACnpAmqR0rKRkXG+AFhMtHMAAeMJoOE37XX9dyb7shzmuw5v0op
 8bl2ulE3LTMpgtxvN2L/Y/KkeQKdmfrTHtdKPBDhTDZfZcqFOFZQ9zJ5x4A/Ovd/824k
 DuVnxjW11TKhV9y2Oab3T0FqL5P8eZRQ0fiLBlDJRaDihFS2T462iEou8r9n3luieJVP
 Cptxfq0kt3L+gHreuOAbnUNzkkd7VSFGhrevqW+MattZdgmqmIpxvhZiiTnMgCB345PW
 j6GpyKLrFsICpTIwhKO5kHJGNbB0rnuqcbU5SCQsgRMDJvfkF1MSqrqFKV0Jbk5pQG9f
 qiuQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp5zQWxqSAfNmZuSohP1nO3lMER8fVo5gQbgzlp4iQuo2Rpwse44BKutlNIEct8QMEX0w7uR+RlTDo=@buildroot.org
X-Gm-Message-State: AOJu0Yx4QqdcOGMbskK+ooRJy+QMGOEPmrOnjcZq+ja3s66jvQki+IAY
 I4BjuOg4ZGowWKYvMGBJPQVJwqtYekuR+RIEXyT6b7eqA/jHopwQ2RyO3GGZaJfKWHA=
X-Gm-Gg: AR+sD100sEqBk2Fbyzs6TyVsPiq8niYZ0uRCUcBhi1NR6mnFdRG+GIxIVwVUX86j4aA
 UgOLPxnWuANfhhmqiAWAHsoQWAgyQyjm/vndnWu8VTvsCPMMJsxa7IbHJPjAE8rnAKIOUeD0TAY
 t4EwBki8gCbkDLfxHpywzEA8GOqW9yLpr8MGQ/CdvFLKkCVoFLFF6J9fq5iSH8+0djnXuS74tP1
 DPdAT+WLWq6y0aA1haNhmbEmXYYqGSq2q4TNyDSw81uCqePjaINfskDmE10ld9aeDo+7YLz6tfh
 G7qzR63SdiC08ccUV122CvmOG7hh9LbfWmFZe1oCRtRtQjZ5z6EHHWs9M5gk/Vd/S/zQZOT651H
 lshMufGFVyTArHEbOzqQz8vC40wPBVoC2v12xyOBioM2QvCt9VZInHirHLDr2Z39Es1fX8mTGHa
 QpBLs94oGl2bNGfzA1V5z9X1AIvZXmfpwrJoICKhFF5OtszXC1i6OTN4fxM3yFYOsjTPUrXCTJL
 0OBIwSN+IojdCS4TyYPpTsJti9bZikzzyEA7x77cTsBppkz
X-Received: by 2002:a05:600c:8b02:b0:499:88b0:1726 with SMTP id
 5b1f17b1804b1-49989e37a3bmr51246485e9.2.1786717051308; 
 Fri, 14 Aug 2026 07:17:31 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2c129dsm8507029f8f.26.2026.08.14.07.17.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:17:31 -0700 (PDT)
Message-ID: <1797e033-eb08-4d4d-bd32-933e08cd948e@mind.be>
Date: Fri, 14 Aug 2026 16:17:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <20260807202457.394955-1-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20260807202457.394955-1-fiona.klute@gmx.de>
Subject: Re: [Buildroot] [PATCH 1/1] docs/manual/contribute.adoc: mention
 license file changes in commit message
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 7/08/26 22:24, Fiona Klute via buildroot wrote:
> It has been good practice for a while to describe the kind of change
> in the commit message of any patch that changes license file
> hashes. This is important so any substantial changes don't go
> unnoticed. However it wasn't explicitly stated in the manual, fix
> that.
>
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x and 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
