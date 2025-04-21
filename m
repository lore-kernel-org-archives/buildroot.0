Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A233BC369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 20:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 473B9812E5;
	Mon, 21 Apr 2025 20:19:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j7zeVIv4kkhg; Mon, 21 Apr 2025 20:19:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60EAC812DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60EAC812DC;
	Mon, 21 Apr 2025 20:19:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DFBF68
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 20:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 242C040A44
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 20:19:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BbOrwmAvPbws for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 20:19:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5450A40270
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5450A40270
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5450A40270
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 20:19:23 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso48166755e9.1
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 13:19:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745266761; x=1745871561;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nPNAMjrwOp4OZr1+TFQ2ZpJ/fB1HqH5rF7Gpod9PLcw=;
 b=O9jK2ZWjkFVKN+1K5xTopwp0UfBxIWZX8EnvJWEbPEe8cbjyGsvx2cKIQI/sTkA2/j
 6jBzs21RU/YvjcRkocr4yx4KwwjPpOVp2GkZ5/JrWDgMj+8JLXpkBf0va9tSrIpYLAco
 rxx/2Cgnx9YPLx7P9LJIzMoB2gfORLMeJt76byA0bdz3i0vZN6/vna6ZJKMMTfFCv+l8
 l1/iAtkzzhGyp7bRdjw81ruMqhdkqiJnlcm54pyfLNfV3+231PEqRqw8S2SBxRkaVz0w
 0P2q45J9qJSJk9HzL+P2GkKYivhOv68UGUPNY1jtB6i7VSD3o1jeUYMFE36YACaOEZgR
 sBUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcTGkR1NBnFCeSo46Kw638tT00fZGBOwYAV+h8tLTXVgquZMsWFB94zCcDUX4czCXF1rW/+FPjqD8=@buildroot.org
X-Gm-Message-State: AOJu0YzR76YsS6C8qqJW+X/mPzz4cIYtC9Ajcdb6BsHe4An1vpSQNfpd
 F6huc13+Cqcgc1K3UKNKtnAPkX8eJEL4qeJ+c/+53gvDms/tqO2oecoJMEdkd84bsPWXZp3H1MC
 m
X-Gm-Gg: ASbGncvvyZRz/8GcSO+kaWWKMC4eaPZZlBWQNuHVGajI9B9K891zWLlmMsgHvHKjw1Q
 SxR6+/7lY0NMSsZ0AiIJ0UAaQ5o81cfxQbQ2e4WIDGBv4cgQReVDncUaekoSfIzwOqri6nW9VpS
 c/EL+2GdW5s1Ff/4H5ZGaeBZ/hgLYr5XPagPiU0mLvZ2xWf/aop/C9wViOJfAQb48ixfBF7odmf
 6rJ2byWr6LaRS9SJcJ8GGS6Lbc7LPQe5zTRc3cr7GQ596dxh3YEpPQEnOAvyVxmOO1ubG6/GJPj
 xhr6tdYmXvZMLFvGls3tQvQqojNTKbAJMV6Y2lHq1EK5zw==
X-Google-Smtp-Source: AGHT+IGdIhnP9pJD4tci8mF9DsQ5LRzbVYgjIUIrsd4B2B/LN+CpHF14hn0joX3XqoDd3BffXMl0bA==
X-Received: by 2002:a05:600c:5490:b0:43c:fd72:f039 with SMTP id
 5b1f17b1804b1-44072c876d8mr79471785e9.11.1745266761397; 
 Mon, 21 Apr 2025 13:19:21 -0700 (PDT)
Received: from [192.168.4.20] ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5aa100sm148341965e9.7.2025.04.21.13.19.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Apr 2025 13:19:20 -0700 (PDT)
Message-ID: <bab05300-a70d-4f03-bb15-57bef52edac7@mind.be>
Date: Mon, 21 Apr 2025 22:19:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250415195547.199428-1-thomas.perale@mind.be>
 <87tt6o3oxx.fsf@dell.be.48ers.dk>
 <065809af-e4b6-4bd8-9f53-49d39fab38af@rnout.be>
 <4b029329-2258-428d-80c9-315dbd6335be@essensium.com>
 <20250416215812.6a8ae1a5@windsurf>
 <b864a02f-c98a-48f5-863a-a7bd800809f6@mind.be>
 <20250416224034.3eb04598@windsurf>
 <221f0412-b320-4ade-8936-9ae8d941ebf7@mind.be>
 <20250418123959.3307e037@windsurf>
Content-Language: en-US
In-Reply-To: <20250418123959.3307e037@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1745266761; x=1745871561; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nPNAMjrwOp4OZr1+TFQ2ZpJ/fB1HqH5rF7Gpod9PLcw=;
 b=a8nOhqDfwOhhFmrfiMXPBNbmfkTCOme+2wdfmVsY8wfrVTIovaFTtkye7G5IR8kefb
 KE98RlIqzFTyJUP6j6djsM6dyOi/TcR2nH9nK9Qo78K92urKaun56RGQWdiCoU6Zt0Vk
 YpcIn8X5Tz0BGWyZM5ltf9dooTVZYCz9sXNjUt9gy/dQHiP5laFUP4eI/N9ARlOm/aYa
 4eKlCDgCmeRGc+rIebgEICch+HewLEBrtwlmCzA7TNLutjY2kfVEW75EbhM+uYeJH6rG
 FVBaWA9XCCIdLnzx5Ix+pMzsYfT36xbOVo1e6TBaTRyy4wcKS7UXKhzzI0BScA7PDDny
 gj8Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=a8nOhqDf
Subject: Re: [Buildroot] [PATCH 0/7] Add PURL support
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
Cc: Thomas Perale via buildroot <buildroot@buildroot.org>,
 Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@essensium.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

> But with what tool?

> So I'm still not sure to understand your "DependencyTrack uses NVD
> annotation unfortunately". Could you clarify?

The tool is called DependencyTrack (https://dependencytrack.org/), sorry 
if the name was misleading. It uses the annotation downloaded from NVD 
to internally do the matching with the CPE ID.

Adding PURL definition the SBOM allows DependencyTrack to rely on 
https://ossindex.sonatype.org/ to match CVE to packages.

> it has to be clear with which CVE database this works, and how this is
> going to interact with pkg-stats (and if it doesn't interact, why).
My series is more about improving the SBOM contents with information 
that can be consumed by other software rather than improving 'pkg-stats' 
right now. But, it could be used as a fallback for packages without a 
CPE ID manually assigned.

Regards
Thomas

On 4/18/25 12:39 PM, Thomas Petazzoni wrote:
> Hello,
>
> On Wed, 16 Apr 2025 22:49:15 +0200
> Thomas Perale <thomas.perale@mind.be> wrote:
>
>> Just to say that with the PURL added to the Django package I got
>> notified for the CVE.
> But with what tool? Right now our "reference" tool to track CVEs in
> Buildroot is support/scripts/pkg-stats, which renders:
>
>    http://autobuild.buildroot.net/stats/master.html
>
> And which uses the CVE database from
> https://github.com/fkie-cad/nvd-json-data-feeds/.
>
> So I'm still not sure to understand your "DependencyTrack uses NVD
> annotation unfortunately". Could you clarify?
>
> Right now, packages have a CPE ID, which we use to match
> against https://github.com/fkie-cad/nvd-json-data-feeds/ as part
> of the pkg-stats tool. If we want to add more identifiers in packages,
> it has to be clear with which CVE database this works, and how this is
> going to interact with pkg-stats (and if it doesn't interact, why).
>
> Best regards,
>
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
