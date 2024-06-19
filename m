Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B427CC27C53
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 20:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7919941577;
	Wed, 19 Jun 2024 20:11:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id juHrr5M8Ygn5; Wed, 19 Jun 2024 20:11:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F223404FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F223404FD;
	Wed, 19 Jun 2024 20:11:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ECBB31BF846
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7E3981E73
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:11:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w2ciYCXtOSSz for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 20:11:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C6D0C81E60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6D0C81E60
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C6D0C81E60
 for <buildroot@busybox.net>; Wed, 19 Jun 2024 20:11:23 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-421eab59723so1456185e9.3
 for <buildroot@busybox.net>; Wed, 19 Jun 2024 13:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718827881; x=1719432681;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p6IVxA3CY4yjTDAeW5PAxHM7P1csuvRYaJSeuXQdWRc=;
 b=QxYgX8c9yO5TvkZ/ly1sFDTY7IxdTMmIs8vuBARpatnNnhV5AbA8glmIl5N5BhzVBn
 PXBn6IXE5PLiF7A/bxZnTx7QJL4s6RMApY9Oh+sxjmHKS3xA4T2SOe41leCa3S8cz3ez
 cu9gfuskpkx3E9VFO5OIwC+8UZePZkE8sF+b6vGbcJD+FIFLOhPB1AEFHJJXjr1AXOEE
 Uv0muF9tVPtG+Ra1wWbcuv0KriQb7Z/VPJyfi8G7EIQiB77394j8KWeh4wLQvrswSvDn
 K4lfiU9QYkCBahP9Gjrb00IcNnt3EkEvEg2AyYreau4kkuJ1BTKeQ7DToWRbxQ3SgLHc
 n37g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPhQChBsIsUpROp4KVspbQ3mahknmOxfg+nXd/5sXNvWLu4KiCCwtgH4asH35ZCeim2M61sejYErNwAlJv785V6vr3o/8=
X-Gm-Message-State: AOJu0Yyy8SSkGxRI2yxuo8y7fKzk0fI8bOa9jYbl3KZPpHfirtBnyy73
 p9Pj/DJqxHENDlK8JyrNfCrVhh0UatZ+eDejvWIAc/CTA9NV3iQJifGnVdTYF86bZ5wcxsJPO1S
 v
X-Google-Smtp-Source: AGHT+IF8lM7942urV81gcctQq1AaqHRMS99asXTX79LK/GpKB0sNKFztROCO4G5jy5PW3xT2CW50XA==
X-Received: by 2002:a05:600c:12c6:b0:422:70d4:7e96 with SMTP id
 5b1f17b1804b1-42475176308mr25388275e9.15.1718827881526; 
 Wed, 19 Jun 2024 13:11:21 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d1f6e55sm1048555e9.47.2024.06.19.13.11.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 13:11:21 -0700 (PDT)
Message-ID: <74f000b5-d752-40f1-8b6d-43cc806a3e50@mind.be>
Date: Wed, 19 Jun 2024 22:11:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Francois Perrad <francois.perrad@gadz.org>, buildroot@busybox.net
References: <20240604112502.1097739-1-francois.perrad@gadz.org>
Content-Language: en-GB
In-Reply-To: <20240604112502.1097739-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1718827881; x=1719432681; darn=busybox.net;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=p6IVxA3CY4yjTDAeW5PAxHM7P1csuvRYaJSeuXQdWRc=;
 b=fONuuP025fDQJdiTNRDPlr6VEsOpjxOeeMCc1X4bfN4VRr9ovDPmo92HfEGCJOOxzD
 FzKFGtPHLETMBZtNHoOvcYawY+m6YTS+Vt/3jytC8LjKlr8v/y1ymhjIHwAt3kxcZvxU
 4mj4Lsmig5rJsbLa7ptVCaug2UNSku0pA/Kw7q5vkMmznBtGDAvWGwq+sEta+johW81u
 nm+S7XLj5OncrwNnv0qYiH59ZA0mjIm5eWhj08qNmr0h6J/spHWpMfYkV4QmowUtlaFq
 GZSasTzd+TkXyR9Aj2XsGlmsD1M1ru6GYM9TNVV4aGcPaqaWtm6V7eq6VKZPfDoI+zbm
 sLvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fONuuP02
Subject: Re: [Buildroot] [PATCH] package/zstd: bump to version 1.5.6
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/06/2024 13:25, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/zstd/zstd.hash | 4 ++--
>   package/zstd/zstd.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/zstd/zstd.hash b/package/zstd/zstd.hash
> index abfb1d62e..8be85c356 100644
> --- a/package/zstd/zstd.hash
> +++ b/package/zstd/zstd.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/facebook/zstd/releases/download/v1.5.5/zstd-1.5.5.tar.gz.sha256
> -sha256  9c4396cc829cfae319a6e2615202e82aad41372073482fce286fac78646d3ee4  zstd-1.5.5.tar.gz
> +# From https://github.com/facebook/zstd/releases/download/v1.5.6/zstd-1.5.6.tar.gz.sha256
> +sha256  8c29e06cf42aacc1eafc4077ae2ec6c6fcb96a626157e0593d5e82a34fd403c1  zstd-1.5.6.tar.gz
>   
>   # License files (locally computed)
>   sha256  7055266497633c9025b777c78eb7235af13922117480ed5c674677adc381c9d8  LICENSE
> diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
> index e25202fd6..a2da0dd47 100644
> --- a/package/zstd/zstd.mk
> +++ b/package/zstd/zstd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -ZSTD_VERSION = 1.5.5
> +ZSTD_VERSION = 1.5.6
>   ZSTD_SITE = https://github.com/facebook/zstd/releases/download/v$(ZSTD_VERSION)
>   ZSTD_INSTALL_STAGING = YES
>   ZSTD_LICENSE = BSD-3-Clause or GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
