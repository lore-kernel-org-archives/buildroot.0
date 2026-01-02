Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226B3FA3726
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 11:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE84840633;
	Fri,  2 Jan 2026 11:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id icemy9kK59Ku; Fri,  2 Jan 2026 11:21:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 012EB404AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767352877;
	bh=mefFSEYTn0dmJsp0kOTvfj+XproaEPv7R+3+nvuqt5g=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nmR3ibmSTEegK4H9Xw77IMwgWUj2QGDK+HSXtKy34F8zpwOhZfOqUY8nCoHGZWp4i
	 zma9xM88jPM1nb1on2SuS1TKEeoeWtL4b3dfTalNzrhAy6QO7X2WIM9crvy57kVHhs
	 qDp3wrJJ6eqU/dMboGWoDGpjn1OcwoMYVsp5j34ZA1Mx9eswTRj5m0fLscUEIunDF3
	 Nep4D9oD0lo6PrzLpuRo5XZBJQJzTdnxPpzdw+A+F2cGYIF1RTFxZVDilRbKevzpZn
	 DpQQK3hZUWb7nW5Y5p3P/GaPJcRPNfR57Zau93G2KTTHgBvEFuP4kXJyVJ99t5bhrl
	 phMJ33ZQ5EWgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 012EB404AD;
	Fri,  2 Jan 2026 11:21:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 981B7351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 11:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7ED99807CD
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 11:21:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZUWRsoZd-Wqm for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 11:21:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A1E9F807B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1E9F807B9
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1E9F807B9
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 11:21:14 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b7277324204so1751306466b.0
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 03:21:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767352872; x=1767957672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UKmhRVqQtBf25eXokLnGPaOfOUQCP+TWJgx26QwtNd8=;
 b=shgGASIBi63wlnQz4F8sZXd68BLKOxIHKmvKIdVk7uhi2F334+iKvshLxJFztuLvtF
 fmNJVOoMWi3TPTm9os4jKz495zfQKM+sMVZxtiOrpW55rWfqAdSd38T1VIcASASLhMiT
 P/EAvUsHlShh5JMnxFoptqWUhUejUHmrK4tN6vkWZ7Z9qT94OObF0itsjTY4FdV1/9xD
 zFfvNkSAqtAulC0B5qUpMnYWyK+ZEDyAQ4ux4ZZkZT41Eg6Bqs+HoOB3Is92D92RIMYf
 9rdlSjufbLjmX8IJQ6tTyVQYXk/d8X2fZPILM9eXftDxnf23tGMiewS490whmWx4oYQG
 RlIA==
X-Gm-Message-State: AOJu0Ywu8HikWkqkY3LD9JbzmPEZE6K6k2S7Oxu1hsdlZySp8Uvd5VXs
 VT/WkQoXCHq0CC40UBQujLI7qawNL57xZGLXHfm0+tI2Ewj8IBsbWR/Nqm34
X-Gm-Gg: AY/fxX6cs5hSmoSrtpSemYhrcm785VeUb9BKoZagldyqSNDvot8c9k1PCIQUtRWTwZj
 bY2CQtqYGXElhW3Zi2Vyq3vSr7/Y2uqoXOEHQjk6V2uI9Uu0RkDqykBmkHhEdLYZI5awp/ZKs0g
 Uav8prUVeZtGYKARA5lHBhXGxKukZKeKrIwGi1GTx5iDKzvB0mYqe4a5N/kCgCSIlQKaXHgFiA2
 0m3KJ5XJbwP8ukHUMRIJC8d2VaYc3/rdy8k7lJYLAe8iGx87uxYY3zaZ4N88g4FU73q/xpXIAOc
 CTGY9FDY/1o04bDs/c0g9p1oRZUbT6WJNgEYnZoU3sMb7ne4V9vkCeImbUEcbcBzF2XafxfVKK8
 6rFMPYgQpL+FBAUe9+vuHozYHJlOZHIqZlvd3N1QR6rFQPgqKgdare6/GEJBl2Y/iEGEV9kDGyb
 DHa22nMFZ3mOFsjQFrHNki4+qmjQ==
X-Google-Smtp-Source: AGHT+IFGbB15A6DnBfCuAF0X+095XvNhdNsyOyQuiEwnZdRvIMbBjOAEJ4uPBEY532Jynocn9Qg7UA==
X-Received: by 2002:a17:906:6a21:b0:b76:3399:457b with SMTP id
 a640c23a62f3a-b80371d8c90mr4049255066b.37.1767352867870; 
 Fri, 02 Jan 2026 03:21:07 -0800 (PST)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037de142csm4465322066b.38.2026.01.02.03.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 03:21:07 -0800 (PST)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: thomas.petazzoni@bootlin.com
Date: Fri,  2 Jan 2026 12:21:06 +0100
Message-ID: <20260102112106.31126-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260101222916.4255187E7C@busybox.osuosl.org>
References: <20260101222916.4255187E7C@busybox.osuosl.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767352872; x=1767957672; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UKmhRVqQtBf25eXokLnGPaOfOUQCP+TWJgx26QwtNd8=;
 b=OhptYDIe73ECLm15QqguLIf8gnMhYALl7PIT9Z/Q4gGq7I/3g7KUUAwGhrFtRO2WZP
 Rg9khOXukdkfaVkFan5oOs0204lWVI/cjKy7BdyWhBVdeybL2arlGDQK8P2wQesAQdHB
 +XYDeGSHqgAEOZd+0WnVnISCr1A3lCM5f8lHJr1LzX7y0pSPuVKYhezlb30SzwmA40vU
 aIcyUd6Rt5cpxdnq1jzG3NZpqA9ZIXO3wjHpLiA4cXehQBfnCN7MDBTuLZ+6ZDqXB8Hq
 syLm/P9oUDUnTsZ/MkDgjv03+EgY3Q6sYMqtpzRpjQryR5+fq4jQSUC3bWlCub68YhNq
 DoFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OhptYDIe
Subject: Re: [Buildroot] [v1, 1/1] package/kibi: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

Thanks a lot for your review and fixes.

Best regards,
Alexander Shirokov

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
