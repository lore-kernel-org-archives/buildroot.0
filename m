Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636DFC5CFCF
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38BAD40F16;
	Fri, 14 Aug 2026 14:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oIoaVF_4_NFj; Fri, 14 Aug 2026 14:24:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F30240F1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786717460;
	bh=u7lLBlY7RWDIl/OPU+WmYKvlk2F/3qFd/tpeRK5SZuY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BLHbPg+1wdJEU9FJO7yHThZGGwPGnyf1y6sZ6YOIb+1pcBmBGqUcicNQPvmJq3Dek
	 0AgStQw+4cfCy52TZ38xRBdlD2rjGm5LLMxyplBZ0QEGhk/3w/vsxJiVujlwZoC2cE
	 LeQ5dSgYV0gFG7SNKOgxLznAYoAfEtW95SBs48JsmswLadgFlLV2owSlYUTPjmQ28Z
	 IqEryEKjbZdNO6tkrovbMVRrYDtP6X2AxLi4AfOasJtHiKpBnC+7EeCi5aXVeWNDxD
	 1Qtj7lWxP71iM22okqoPF8TtK/21C+1b/9xTbQ7qIWEvORBcTFwdmgO7Z+Hb93gzZq
	 GWgCs1YUOjLdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F30240F1A;
	Fri, 14 Aug 2026 14:24:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3118323F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17AC040F1A
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FiYRcfkGmhux for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:24:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 23B9640F16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23B9640F16
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 23B9640F16
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:24:16 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-49978908b35so9211015e9.0
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786717455; x=1787322255;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iDN+UMyZHYEvukJMcq2MDrs1EF/kY0uTBkyy57NAGrk=;
 b=Wu5BnatNlVbgXXFGvj/DDHbgzudJFKVvTg1tPkC4gHcVHLc97/X2dnCfPhDgFDH1q0
 ivQoy2/t8V44N3VBdI6VhfoT9YxsFJrDRl0yrmBbCffBdjxVzt7v5OohOi+VdFQxOR4g
 KTnWYbD4Z/MoJFdOZKhUGPuRx837Pzp7PL/giOFtDQRORLUX+8XUgB7GHeciouj49CUy
 8cDhwijyNSs7sa9bJ1RHOJHipRBm1omc8IaHhq29Qf7SB/4mmp67in+US5zBKwJfkTuQ
 Lq+4wEptznUV8lRtI1L4sXc0KHH78PaWdSQgpOnp2gHE8MtS9pTPfjjD4tESBpqUhNJq
 +UWw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqwV3TKm4ODZpuk+wj4aMVCYWabJVeCRR0E6pdPq7oy6UcvOtagTBE8hPckhGX6BIq92HzPTSuD3jA=@buildroot.org
X-Gm-Message-State: AOJu0Yz31vMGgCixDRH/Bayv0GCa3lPz9Pk4+v41CYsq+SMNsFFhV/wo
 b0AF6FbpG/0n30ao6wGfPp7dHwvQIkKSG2X6RRMWTUPLZhX5ePba07oip4fgRQxD9LVKnBnDPfN
 f1fH0Sdg=
X-Gm-Gg: AR+sD10msoAhiPf6IGvtbZamOxPPqYcdytMFFV7oD0nb7IxGn5XQJkk8++XAX1IUlLD
 exQfuVj0+3pUY2PtEM5xW7dSvrFayUFiTyAAT0IlxBX+dCQaSBDtDVEMHRuAyYEMkBCh3hnSjGe
 hOjzzXEbcZhsK4Q7L+M0DQNnbE5N7q3TzTqsbFVkndnErKDyCXO8EP76+flYCK2BIs8/6bAo//B
 3XdGU0AMtnwnlJp+Bop7es/ps2GmLZ3Gjw9alguEQeewnRLfPAvNl2NSl9OdxsfJul1xwDMxejt
 rIgecjI/Dx/NmEKbgQ1rtrPSRl+BGxqHIf7EkKcuvMNseMK/2XHPdx3ffPzmwt1ZZCcWvWv/FaC
 ZQkG5IJmuUARnPauh9+BbIkIswMxK5AJaN6ujUMFlnQ4oZ1Dsml3V7wb+fgo1Osbh3/yGP5z8A9
 FAXuirM1f+EsDiom7vUgkuBjL8J9zHcJnqeeU2oC9jK38uyuSn4pIoxCDQ8dih/4G6jhpdQINiC
 WCPgBuQhXKTZZhYoFQJd9LQb0s7DOBsT5c0nUYfhi3K5FVmyYrw6H3B6oBX3xYu
X-Received: by 2002:a05:600c:828f:b0:495:4491:b8c2 with SMTP id
 5b1f17b1804b1-49987941d7cmr101163865e9.3.1786717455092; 
 Fri, 14 Aug 2026 07:24:15 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49988b2a87dsm49965015e9.15.2026.08.14.07.24.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:24:14 -0700 (PDT)
Message-ID: <18e0e7f5-6a02-41a8-a47c-e0683c8b14a9@mind.be>
Date: Fri, 14 Aug 2026 16:24:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260706174555.2892229-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260706174555.2892229-1-bernd@kuhls.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/gcc: 15.3.0: add GCC patch to
 fix mips/glibc build issue
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

On 6/07/26 19:45, Bernd Kuhls wrote:
> Fixes a build error with glibc:
>
> programs/locfile.c: In function 'align_locale_data':
> programs/locfile.c:584:1: internal compiler error:
>   in mips_load_store_insns, at config/mips/mips.cc:3137
>
> by backporting an upstream fix which is already included in gcc 16.1.
>
> The build error does not occur with gcc 14.x.
>
> Fixes:
> https://autobuild.buildroot.org/results/b925a444bb3ef03354224ac643b0b3160c4c5e8a/
>
> The oldest recorded build error dates back to July 2025:
> https://autobuild.buildroot.net/results/cb1/cb156fb938de26dd5dfe7fc48a1e061efa0284c7/
>
> so a backport to LTS branches should be considered.
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
