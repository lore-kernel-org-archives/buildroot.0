Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D29DCA0FFD
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 07:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23CEC614D8;
	Fri, 29 Aug 2025 07:25:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GAUazgEK1piP; Fri, 29 Aug 2025 07:25:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38EF0614C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38EF0614C6;
	Fri, 29 Aug 2025 07:25:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 66D866C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 07:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 588CB40E01
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 07:25:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id foJ1pOepct4g for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 07:25:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 222C340242
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 222C340242
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 222C340242
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 07:25:31 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-45b6278893eso3733965e9.0
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 00:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756452330; x=1757057130;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aRjrua8aVq9tetBPUXW1Ok0n4tiusEJ9K/Akv5Mbx5U=;
 b=LejkrDXG0rieXW8F5qmKo3qFxLq0rdBGgl4YKFZ/EgpVn16iGnde3POQUlXYpX/nHH
 1krr75jOYs4yhjmV08GWW1p+tR4Ml8aS4a+nRw7Qb+G3yGtDeoFhVAPDCLPXfz5EKpgC
 eKNzHsM+EjIbA/G87IlRflqBrUItvaVF8kznTRadgpdWWIuVYCbPGstVtBi30dDp8Pki
 PreiAduCa3GJ73qKN/akM+rUsMNW28nYdfzSw8xcpHvSWi6aj173GBu5dyL45ymBzWOI
 iuuUez/smb8jlUOUMBiVvW2cj0QW8PR4qw2neSDkKbyoo0R7clTb+Y8ZRIA/x601TPPb
 kMDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMlsmekf3QfJYbEwJ9SHbMXQqiAWQjrIY8/slIrf1R4tJLbgHCzq0jfEqifp1/dhoTXW0+SQ/gwAE=@buildroot.org
X-Gm-Message-State: AOJu0YxWBahKRgMU1rZ4yHFIPO6JmnuGfTHMwsRxinT1uYikErJMmjrU
 vkCtMDsB9Ncij/evOWJVWUizmdzVYoR4LpnQC7UrroQvelHU+l3aotjuTc68mId3EYk=
X-Gm-Gg: ASbGncsPMA4IEXdXoSU9pkcG1BMVj5d/2fG7pHSRBswwOCZIucjPJXVItS9y3T78vpZ
 8frjmGzYHd7x5ClfYebstcY0wckL2CHDC0tSTTST3y/1sH0T854KCOhGS5gKUUkgeh9gpnfTvMc
 aVO4HQolfjqtotR8eyZFnRe5brDUQxUYJfgN7Hbd1FKv0oiVfiRA1pB2y+Afa/UmjRRdGra7Mtk
 LbXZu2jYr6XLYrQXC9PZ+nhrl0bCsOOrfBGmOrQhFwKvjmSq3Ax4n7RSPo8hq+P1f2ZN7870iz+
 OSzQrYDnqNnzKH0xbz6UXIZCJlqeP1ATHgdkmY30iCbFcCK8fO4ExxopHjqGHquuHJ2fRAd4TeG
 fFXPHJZUdRkArc+23x+4hHO87cRKh8kPW+RktwFUcyy73cm+vI3vcwiMtHojZ7VQHA44mDvNoOJ
 h6URA=
X-Google-Smtp-Source: AGHT+IE+b2fcmfMPqOFPz4P0bOZIJRK5vloc4ZiPM+RbDJtupzws9kCNdvU5Qrfls1UkZM32L5iFUA==
X-Received: by 2002:a05:600c:3b04:b0:439:86fb:7340 with SMTP id
 5b1f17b1804b1-45b517e9d34mr245411605e9.30.1756452329707; 
 Fri, 29 Aug 2025 00:25:29 -0700 (PDT)
Received: from [172.18.30.159] (31-207-9-44.static.ef-service.nl.
 [31.207.9.44]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6fe5sm106060715e9.5.2025.08.29.00.25.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Aug 2025 00:25:29 -0700 (PDT)
Message-ID: <7e449c0e-6673-42be-a276-b4bb53100092@mind.be>
Date: Fri, 29 Aug 2025 09:25:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
References: <20250828134427.177601-1-thomas.petazzoni@bootlin.com>
Content-Language: en-US
In-Reply-To: <20250828134427.177601-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756452330; x=1757057130; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aRjrua8aVq9tetBPUXW1Ok0n4tiusEJ9K/Akv5Mbx5U=;
 b=XRQAitlBs7ogUa6NPWWZkLKXrAc++uIMTn1UVqtOs1OMO1ySo7yrjpzRDPQjLaPmjn
 2wDFZWJMDrgYpBUHJGPiThmvr3jh2P8uNS19/aoiV95FfyrFeMGJJ/ylGzVav721SnIy
 sYM1SvMEv1zcxeDF/If/1Y9ZR7w5IBcGWc1ZNsG7DGRkCF430HjeMac4PfeG5eJgbgGd
 YdPqJsqzinOb6GMNOhse1SiHASzBEeEqgmE2PFMRWQUhLYKlWzQRoXjv358mAO9Ny4Bb
 dh01CfOB+lBk0uREZtQSx8MFBztlerDNICb/Y30o01qvpjaYzwWAGW0CJKmtDLpF0X9N
 BG5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=XRQAitlB
Subject: Re: [Buildroot] [PATCH] package/pkg-generic.mk: use more sensible
 default value for <pkg>_CPE_ID_UPDATE
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

Hello Thomas and all,

On 28/08/25 15:44, Thomas Petazzoni wrote:
> Setting the "update" field in the CPE ID to * doesn't actually make
> much sense, as * is a wildcard. Instead, this field should really
> reflect the "subrelease" / "update" of the package, which unless
> specified explicitly by the package .mk file, is empty.
>
> Using a wildcard causes a few CVEs to be incorrectly identified as
> affecting some of our packages.
>
> For example https://nvd.nist.gov/vuln/detail/CVE-2013-1428 has a
> CPE configuration that goes like this:
>
> cpe:2.3:a:tinc-vpn:tinc:*:pre6:*:*:*:*:*:* up to including 1.1
>
> and this CPE configuration is currently identified as affecting our
> package. This isn't correct as our package is using 1.0.36, not a
> "pre6" version. But because the CPE ID generated by Buildroot uses *
> as the "update" field, and * is the wildcard, it does match with this
> CPE configuration.
>
> After this change, two CVEs are no longer identified as affecting
> Buildroot packages:
>
>    https://nvd.nist.gov/vuln/detail/CVE-2013-1428
>    https://nvd.nist.gov/vuln/detail/CVE-2017-9454
>
> and in both cases they are indeed CVEs not affecting our package.
>
> Reported-by: Titouan Christophe <titouan.christophe@mind.be>
> Cc: Titouan Christophe <titouan.christophe@mind.be>
> Cc: Thomas Perale <thomas.perale@mind.be>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Looks good to me !

Reviewed-by: Titouan Christophe <titouan.christophe@mind.be>

> ---
>   package/pkg-generic.mk | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 95ff9135bd..cf55101265 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -727,8 +727,6 @@ ifeq ($$($(2)_CPE_ID_VALID),YES)
>    ifndef $(2)_CPE_ID_UPDATE
>     ifdef $(3)_CPE_ID_UPDATE
>      $(2)_CPE_ID_UPDATE = $$($(3)_CPE_ID_UPDATE)
> -  else
> -   $(2)_CPE_ID_UPDATE = *
>     endif
>    endif
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
