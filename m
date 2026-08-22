Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F01C5DF97
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 12:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E226E80EE0;
	Sat, 22 Aug 2026 12:36:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SvpKaFEZbPbN; Sat, 22 Aug 2026 12:36:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787402194;
	bh=OPPRrqMsVbiN1p1ZbjqnSYjDTEgOGOKkb6IkkJrRtpM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=E0LVCBwWalf1tMi97mqUbZLPTEUJGbRKKA1agXQc/HL5ZU7HvoR2lsTWl7ZujFjZn
	 lpPQLAoJRbcmyjzU5FLhE5tCbTinaGbWD3VdiFfpWfxeX2h4lBddpt7SPz8Gyqs1C2
	 NW5dY0t1oTp5dVa/Ivc+OZFaU9NU5Rx8PgQ5ebpqHSlXWxDy/KxNAo99ll5zWJbM+j
	 nmv0E9U2H4vwGkLJ4/XOx92xWUKOCJcKI8tTpZIVVE5YISamvck9gPQAVH7j1hs0R6
	 VYSyz6cxljXxHtTBSeIpKSrtt3oFBcvRSRjp0ZteMl+qzpuYPn4AWrf/vMxtoKhyBK
	 p4CRlIp6cVtmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11A9080F15;
	Sat, 22 Aug 2026 12:36:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C93B2B2
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32BF8408D0
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:36:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Ug6f9iJAw_r for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 12:36:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 30F9B408C0
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:36:30 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-6a173ad7cf4so3705619a12.3
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 05:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787402188; x=1788006988;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EAr2Qy40TMPS6iX0RIeps7ei7xe6RNHSjqQqraqfUwk=;
 b=PTkcgm7cGRYuXGEDNepzLga67LjAL7dCKM25pBBsydpJJmGMlXxR0UGq9VAGU4dFid
 94fxuyfNwomkdzLMH+4JkXsnxKKwQF/gYNLFauSc1fABq2iFpRXViAB3Ckc88GW1sJgJ
 YDZ9DsKiZvS+S7+Ez1WpypHir2yvVAXVNzSzqdlmAarQ+k/QPSySR+Brcp97sUcCjI2M
 QTjnDWIceKh0M+Ms+1xim+HeKKZZqXTVdIulcpfR8BTAomSiRkNSfRkj/9rHysUb5Z+m
 bCCowyFqlg5y5eL27PV3CpfxYg+C5J5yrFrNItUNPDVq+2apSxzbkEfnbTinH63VcMRR
 p7rg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqEeCi6scF9dr7rh2gHqohKRR4l2XA1wwd0EU98cd0kri8nG+XucWmaU9lQS6UNzLZM1jlkKeUmSPA=@buildroot.org
X-Gm-Message-State: AFuF++kAQGfo6srv+ugtpAVo3ZJ7dX9MU9cEJJMVcjX7xbv3/hLSzo9p
 A6hzQe6D1rQ7VcZkiZcwFwxPpyBi2b5yn95DddtPlBUWLNQpOE82vS4eHRVpRA6QTIT9+wAOwGh
 Z0mFYMBc=
X-Gm-Gg: AR+sD109pGqmGpMsYTP3uZ4zr1o+ad1EgMRyLzJIj6ClY9bhcX5HCn6zBujfBjR7aju
 jkvyKgB9bAldWYSa3wly516Lp2807GfRqQZeJRAr2xrgeQWzh4/spYRXJCDnBQpBm4sE83D5CFw
 u+PKdtXJsnlSkuLDIqDSgW4+Tm4buigrEZwZfIwK2oNqssXnvPhgA+y+PoDsPv43I1CqRUXn+/S
 MgSNAMbeMMjZID52DDTC5ICznW05P5+12VH/C7ITZmhnxuVmc9GusQL7A486eKWVO5HdL3cddgb
 8xd/7U0StBLaKCJie6F8G1GbEvtnIp6bOBa97nDVeMRKLEOKgxXoADNyGjVvykVIiSTD1qibCqW
 fdtbeI8ZNJ6lq+ufvJ5wb2dF1C2RiLwS4KMFaVbeWIlM279tvRIWTJcz8ReGKpQIf/WBSfxM7rk
 Of+xwAMnUcNAepqviKroBKUAyqkaRO9ZAIDf7uOxjIqvpNe+M/gE1RotD/e0FVycLq0uL848HR5
 KnMFvcwHSrr26YDqJeM8CBpa0Qyhwac6a7OLpO6W9gEdUbLFw==
X-Received: by 2002:a05:6402:4342:b0:6a3:f8ab:19f7 with SMTP id
 4fb4d7f45d1cf-6a582b7d8b0mr6569675a12.11.1787402188497; 
 Sat, 22 Aug 2026 05:36:28 -0700 (PDT)
Received: from [192.168.129.33] (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a3ff0d5f70sm11535496a12.13.2026.08.22.05.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Aug 2026 05:36:28 -0700 (PDT)
Message-ID: <e17623b0-29b2-4549-a3d3-6bc426c1b949@mind.be>
Date: Sat, 22 Aug 2026 14:36:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Quentin Schulz <quentin.schulz@cherry.de>
References: <20260625-tf-cpe-update-v1-0-b315a596d23b@cherry.de>
Content-Language: en-US
In-Reply-To: <20260625-tf-cpe-update-v1-0-b315a596d23b@cherry.de>
Subject: Re: [Buildroot] [PATCH 0/3] fix CPE for TrustedFirmware projects
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

On 25/06/26 17:37, Quentin Schulz via buildroot wrote:
> OP-TEE OS, TF-A/ATF and mbedTLS had many different CPEs each, from
> various vendors and with various different names. It seems[1]
> TrustedFirmware finally did the right thing and request all CVEs to be
> reported to a single CPE for each project, so this updates the CPE of
> those projects to match what's in NVD now.
>
> This is also great news for Buildroot since it means a single CPE can
> now be used for those pieces of software, meaning users can finally stop
> working around the CycloneDX SBOM limitation of a single CPE per
> component by doing weird stuff (I'm such a user).
>
> Similar changes were already made in Yocto[2][3] (no change made to
> mbedTLS because only the CPE product part is set to mbed_tls unlike in
> Buildroot.
>
> I did not test any of this.
>
> [1] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/49486/comment/2fd93ed7_df27998e/ before last comment from Sandrine
> [2] https://git.yoctoproject.org/meta-arm/commit/?id=e2e63f20b504c31a4600f95764d3561c32b4b2f7
> [3] https://git.yoctoproject.org/meta-arm/commit/?id=81f5a92193d37027670f2c9b767ccbcd29d1e78c
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Series applied to 2025.02.x and 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
