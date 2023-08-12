Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A294C0015E
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 20:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D87440597;
	Sat, 12 Aug 2023 20:21:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D87440597
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6FptdZOeahR0; Sat, 12 Aug 2023 20:21:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6076340577;
	Sat, 12 Aug 2023 20:21:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6076340577
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 30F8B1BF4E4
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 20:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15A3A4151C
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 20:21:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15A3A4151C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rs4KfjT5AJs8 for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 20:21:25 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A1DF41517
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 20:21:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A1DF41517
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fe490c05c9so23813965e9.0
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 13:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691871683; x=1692476483;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cf4kSBkL+lTzBaWrzcXQZkxOo+MNYe6kMWA5HiwSxAg=;
 b=Ofi0dAqUf4Hi7DRewvV3RahZKZHFvCxLJ1lKkgs02pqEPpsGBi6SOYy4fAeYSdylaC
 T2DGH/SDbKbOQyePU/YQm1rvdifOjsUvbP4M8/4bAAbEdWVRW2thi4v2aagji3TPshGo
 lyB97XQxHgN7kX0CNBNC2hNd7garNThYjLjzs064lhuurIKT0OwcIp2z/nzkZ6TtzHTb
 y1MzuJV//1VCRtaYTpS4I8tIFkkjxCqMCQNr3Jd5/obs/EdDw4Nl80IVf7Dhj/If0Lca
 gISRF5CxmPViFKLCcU2uXFAItEzKbOIrEbgiTdW2btGmoN7BGEeON0rrwGhrg9ZUTt2q
 Re2Q==
X-Gm-Message-State: AOJu0YxS9aUPanuSrhkDZyE2puFshyOaPXq6nALUs2at6sk+sJebul7x
 HoKP2nKJgNqyjGfwoGCfriHEWr4qAn6b7w==
X-Google-Smtp-Source: AGHT+IEUQn0PXtKUj+P97+Vkdd+FMp7Qxy7dmzXyenU1VTCZdwUwc3lSobpKFaeWJaanh7i56lJ9JA==
X-Received: by 2002:a5d:4b51:0:b0:319:70c8:6e90 with SMTP id
 w17-20020a5d4b51000000b0031970c86e90mr545381wrs.24.1691871682940; 
 Sat, 12 Aug 2023 13:21:22 -0700 (PDT)
Received: from ?IPV6:2a01:e34:eca2:2100:dea8:bf43:866b:a7e4?
 ([2a01:e34:eca2:2100:dea8:bf43:866b:a7e4])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a05600c214100b003fe215e4492sm9328902wml.4.2023.08.12.13.21.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Aug 2023 13:21:22 -0700 (PDT)
Message-ID: <519bd5f7-86c4-4d07-bcd2-381b73beff27@gmail.com>
Date: Sat, 12 Aug 2023 22:22:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230811162546.8088-1-robertoxmed@gmail.com>
 <20230811162546.8088-2-robertoxmed@gmail.com>
 <20230812215857.6476eee8@windsurf>
Content-Language: en-US
From: Roberto Medina <robertoxmed@gmail.com>
In-Reply-To: <20230812215857.6476eee8@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691871683; x=1692476483;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Cf4kSBkL+lTzBaWrzcXQZkxOo+MNYe6kMWA5HiwSxAg=;
 b=inkStXca214MJZV/5QqnNRw08FOP2Wwt0wopqATI14i1AXnmGwnSZECXNbl0nOolaZ
 i4VbbOIpOZy7uc/n9QBlS7ADIQnt9id7I4vU9CbNjYeNH3MWR8DAuNgTC1AUQLfZ1KXE
 mA6CgN5EFT6G/W/DE5nUYgUwdboHKybjIjz34HodwQNB6rmi87zwmAL6EJ6YHdJnaG8k
 /NnIJTm+YjyZjckTf4d2Pq1TzRL3mxgIZN+QSBJPxqEbJIut1vTWzF8GUS3cwjHvOcOU
 L+jd4ACQ+/JibQJaOs0TNbZWusuYHr00gDcyzXoRQFjr7jn8K5/LIV1RPQa2XESDcSG8
 HKgQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=inkStXca
Subject: Re: [Buildroot] [PATCH 1/1 v3] configs/roc_rk3399_pc: Bring back
 and update the configuration for the rockchip rk3399 built by firefly.
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: kilian.zinnecker@mail.de, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 8/12/23 21:58, Thomas Petazzoni wrote:
> I've applied your patch to our next branch, with some very minor updates.

Woops, I was just working on a v4 when you applied I believe. Thank you 
for the changes.

Best,
Roberto
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
