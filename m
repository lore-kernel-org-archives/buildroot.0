Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203D1C5DF97
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 12:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 592DC40816;
	Sat, 22 Aug 2026 12:29:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3iQoXsoY6FgC; Sat, 22 Aug 2026 12:28:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787401738;
	bh=OTNErLz4pSL8W4xud5EkuNvAjSBHTErtKCeCvaO2bLI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BEuBzzveJYxVrjEOHRMXTGwiCIU7vFxbciIFxUTKYpD468wnc94rb0uaia72xH5D+
	 dF/CxXECyo9BzPSpC6cnz58CiVDq9k6dP09ZXTP+jjmho1AfhupEqG2hdELqHiB9tT
	 qqEatf1dnbfgO+qSba3bFK9g87e50MxWAe1X4RCqwIHBkRwVMbFZuUTSzc4konJNsd
	 VizUzXklAgWL3Lqz+bORAJ6bvLiT00WkFA6v7cwE5pRkAhOlfVDUQmifvdJbfuXF7V
	 wC4P6I+rnH0YbEbTle28dQ1C5oTQpnT5x5LvemXGi9c7kY/low4EVXBKVxJvJFq3s+
	 N2m8RR1dxwtBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B578F407E5;
	Sat, 22 Aug 2026 12:28:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E94E2118
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF37F40073
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:28:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NAFcPdToHEEH for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 12:28:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C11C44005F
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:28:55 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-c2020421077so327172866b.3
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 05:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787401733; x=1788006533;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=f/+gKa5fqGXyRvSOkAacldyYZCCdnoeBejbusStJIh0=;
 b=pMgjlKQ4nenF/w4QJso6eh7zoyv+bzjRFdMecdgJIvxWpnCq8Hr9CC3o4HJ4jvIrCN
 qLyj6yakPusoC1GymJjzrfDRJVbyasyE1r6AV5blTXyspsq6SFJAXNdWwvCYONj6GuAQ
 nv9DJ7jDj4tGYKw9oBEEcUzHswx7vZMJuxZyXry0wszFrei9evJwHvOIBw+4SyfZ8H7t
 Yp+iyVFbsXE7VGHwlm2i1LYQtRl05UmmLn+UQ38DWnvj9JUIjg1CWhLUBuhRsk2zXzv4
 740BUOpjNgGuJu8n/yrsWPpyXhRTDSssQU/hlWO/doG71fiwq13fClg1Pw+0+RrbrtF9
 cwUA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp2D1nJqfMNHObipWGewbA1eeNtmDfa4PhGBb/5fEqcDgfAoofoSrL5uwR9K3zjjUcQyiDJktC1znY=@buildroot.org
X-Gm-Message-State: AFuF++m+gS8YfLeQeOIQbAfYQ/C4wXIHd9NU457VxxzgTnYXbdsxENCq
 HMUGHDFL/N8pdvHNvjIsVVhL3Kc5iGtoecMNBKgrUCcZ0gTibdHek+hORZ/+V63/V0fqTcjDxr/
 hPVp8
X-Gm-Gg: AR+sD12IOU//mJdSXe2u4Kf+820tylovCdiAET0YH3wTE+3am+rnqh3it7GpOd08lX3
 omi14wk/icmWoBmWIkV/rXCvLn3AQbGNpNJc9mbkRxSKeCMxeFY84Nlc6HhFhuAwdi+fyRa3olt
 2LSXaVJ23nSW0HxiR8LN08uHaYDCScv5J8oZfapP5MER8BKAoFEr06ibIQhklJ9DvvOZJmlketX
 Gh8QYmieinv2XJL+yER1+VAqnJinlZJuf3tI0IGsxouwruepuVGnKW/lG6sUSn1wA+XdmNqtzy5
 UP5mHvylePd5gp+Hn9cqn8fe8J4MwZ1UMWfMe8ZY0MhlLsqpsTHpKRD4yv7alCd8+9qB6Uo8GtN
 rWEoYx8C9dVCw05KlTfH4CMeqsjUqRFwDx9+6H/EW+ZQmw7zHHGPAY3aHVbvX5x/YMSOuf2EYlz
 GPafX94wP/mJdiwepawB2OUsLMEKqg6ihQRp1qG6juCtC4hWnUvfxthcXVgMV+J7dFAebXavRfe
 rgDTtYUuDACPHuojpQ/UFGzFv8Pa2VBd4FOCGgn9cAdtQX2
X-Received: by 2002:a17:907:c008:b0:c24:6505:8f66 with SMTP id
 a640c23a62f3a-c2491e83843mr626030266b.13.1787401733581; 
 Sat, 22 Aug 2026 05:28:53 -0700 (PDT)
Received: from [192.168.129.33] (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c249606a905sm331444266b.13.2026.08.22.05.28.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Aug 2026 05:28:53 -0700 (PDT)
Message-ID: <256fc1f6-1c15-4d75-bc4a-ed358b878156@mind.be>
Date: Sat, 22 Aug 2026 14:28:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mattia Narducci <mattianarducci1@gmail.com>, buildroot@buildroot.org
Cc: Francisco Gonzalez <gzmorell@gmail.com>
References: <20260812113306.353838-1-mattianarducci1@gmail.com>
Content-Language: en-US
In-Reply-To: <20260812113306.353838-1-mattianarducci1@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/ser2net: backport security patch
 for GHSA-cgh5-39mg-vhfr
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

On 12/08/26 13:33, Mattia Narducci wrote:
> - GHSA-cgh5-39mg-vhfr: Path traversal in authentication via unsanitized
>    username allows auth bypass
>    https://github.com/cminyard/ser2net/security/advisories/GHSA-cgh5-39mg-vhfr
>    No CVE ID yet.
>
> Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>

Applied to 2025.02.x and 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
