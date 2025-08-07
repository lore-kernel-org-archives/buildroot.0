Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B3CC87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88AD780E08;
	Thu,  7 Aug 2025 18:24:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NyMOd9S0amFU; Thu,  7 Aug 2025 18:24:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A567980E13
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A567980E13;
	Thu,  7 Aug 2025 18:24:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F3B64C6
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05674803C8
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B3PQdUKa9HqB for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C258D80DD2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C258D80DD2
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C258D80DD2
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:17 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-458c063baeaso8361405e9.1
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591056; x=1755195856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7yr+YQDI3jmOwJ/Kj1AoY/F4iUxQd5N/lUpTIRCG+1c=;
 b=RdJn87uLMGNjU/DQyVDLoVzF+WAMgy1Qe/nXYybM6nLTi6ZIRaDI/wMZ5pmOatIxlu
 kHGj4yEjpo2XKu57JNK3oUewgTenHAIoZHmdjyHA2LXbghTA8IMZ08gCnSAewhWmUT8I
 6KYOJ8bVAEL+m7OLxjMnU63S3IITnJ68I7epDuH6IyAYA/e5B3GW9WsfhwpXNgcA2k3b
 WRMrvkOCKec0xUPqwRBvoe2TjbI+vPDwuDsCCvzSGQhTfSzBGLe7QmxweJJqUT9ucx4k
 mXJA4y3q62uL3icWG8rkaZrfrtmB7lnLEVadJqxSK7ZZ/0MW8xBx1TuWbdCbV+Fh0UDF
 MXlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvlfcfPonlWwq6b7D86Wpmgm/zkd3rkm0w8zWVz1DGa4Q8hrb1giOgqNXq7tyg78aeNrVKpA1aav4=@buildroot.org
X-Gm-Message-State: AOJu0YxOZvhHsdHYRdC+F3zDQ+npYL1ZUU7iYVw0FkvgBWQ8O9wt6yek
 njWThRYFbAPbjfH2iBe+gt7F5krw+idlCqa/cxu5jGo3SWk4gUS61SXNsDO+hkh9YAA=
X-Gm-Gg: ASbGncs2Vy2YOSTC40TSYHvRY4/H+gkIwFlmGPc3LDdzXaIpVtgYHAygBxd1z0arOej
 Clzg2WolCYywI9wf2lexRC6AZwvZAClPfkKOw30YI1asXnejatA9F5PM13J3EYzIMTUrThWsJEJ
 PQ4F6iQH1PGbWLHqpJN/mwFm1v8aOEjfyeWeV6pLO8tDyf+47DkM2EwIo4R610P4XeGkoALg9Hn
 5wqHNEACiczm2LBHElLZjoJkDCR9dFMmVyCbLDhInBv7NxTSBQGC8g6CfrSTOS2elo8zEJdzMbl
 zF1lVFdpu/myCEyUgU6meA4ccLNS5EC3/qmoWyEvaYPBWbkVWw4gnM0ROdTu1a/6VT9YJPCW2vU
 BvIipQGlMj2wI1g==
X-Google-Smtp-Source: AGHT+IFDnbZ+4DP4Ky++oUjZ27spmEAM8cqm3v0lWvYXqd2T2H8FBhSuBTeWISLBESrntG+PLEO2Ig==
X-Received: by 2002:a05:600c:35c2:b0:458:a992:6f1e with SMTP id
 5b1f17b1804b1-459f4ea1e8cmr236495e9.5.1754591055828; 
 Thu, 07 Aug 2025 11:24:15 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5862fd9sm112122005e9.16.2025.08.07.11.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:15 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:15 +0200
Message-ID: <20250807182415.724769-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250717224738.1048325-1-titouan.christophe@mind.be>
References: <20250717224738.1048325-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591056; x=1755195856; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7yr+YQDI3jmOwJ/Kj1AoY/F4iUxQd5N/lUpTIRCG+1c=;
 b=Yyb3Z7EyEvT4lzb3gG9XbzFBhTfkzosVrzOOvjEEIw6cehBDKTCEwxg0H7fJLjrcy1
 UMRnN1Juj28mQgIjcI4isIroS5Q8QDuEwkIeVY3pIZudK5IOFunYbjVb9IzgeNTa44hY
 K3gpcI3xUYV6aiHilm+Dv1h0DorVsOe9T+zPqiyly/9HQoQmJrdku4nkkr++UPOAKfV/
 wz0pJ74m4ciofzdQbUJL9N00n1TIMBFkKUtT7FyYWJkhYogKLOipDx9yWt+z67FvV9wV
 xKZw5Cehjkqs0gNJwWMn2v134UcoOVu3nWx7beC/GcBzrknNHnT7m9B9gIL7UT0sDEQI
 98vQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Yyb3Z7Ey
Subject: Re: [Buildroot] [PATCH] package/python-aiohttp: fix missing build
 dependency
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
> Since aiohttp was bumped in e4451602ebee8ef6f6b354e8f9b6dcc80206f079,
> it now requires pkgconfig at setup time, see upstream commit
> https://github.com/aio-libs/aiohttp/commit/40563751adf02b811d5acf95696c096a4dbd9ed4
> 
> Reported-by: Julien Olivain <ju.o@free.fr>
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/python-aiohttp/python-aiohttp.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
> index e52b6e81c5..7070d00cec 100644
> --- a/package/python-aiohttp/python-aiohttp.mk
> +++ b/package/python-aiohttp/python-aiohttp.mk
> @@ -13,4 +13,6 @@ PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
>  PYTHON_AIOHTTP_CPE_ID_VENDOR = aiohttp
>  PYTHON_AIOHTTP_CPE_ID_PRODUCT = aiohttp
>  
> +PYTHON_AIOHTTP_DEPENDENCIES = host-python-pkgconfig
> +
>  $(eval $(python-package))
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
