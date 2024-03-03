Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7653FC48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 17:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 278224020B;
	Sun,  3 Mar 2024 17:08:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qaV5YtyGchmZ; Sun,  3 Mar 2024 17:08:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3A6E40424
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3A6E40424;
	Sun,  3 Mar 2024 17:08:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5B4B61BF8B4
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 17:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 499F960669
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 17:08:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ry-f-2nx2OON for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 17:08:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0FCE260629
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FCE260629
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FCE260629
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 17:08:00 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d29111272eso57361571fa.0
 for <buildroot@buildroot.org>; Sun, 03 Mar 2024 09:08:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709485679; x=1710090479;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bvtGU+ddVIofq28v5GRiPbHpa52yUH2jM+GRWljXfz0=;
 b=GCU2rGo0b56ABz5RORsKPXG7M4nG4KGB1D4nQlukg7xQfKpp2B9J16CjHLWSDATDxJ
 fFlyhUOJIp2ecx1U6N5LLYpbh3xuGGkeMtqek/scc2Pa+s08Rw8jQTIfnsZ1AiZcdfaE
 KxZx31LmdGfTl8nqhJml4HbYrNJONgl5FeCsw8bEe4uIytmlnp6lD6alP2l0bDqvob7B
 Air/+laTC6M8FSQRPEssw/1GNHaEr0neEo+mqJqp8GfrGHVdrBoOW6BSiREceql2WHxD
 F8b1pta0i53dJdjRw5vYrjg5c6stIXjcJYtWOzg/sPAKqhRL3ZOdRS/UMO+ZvAoWdfQt
 VZ0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdGxoYeDOrbTlvxlmYFed9JU8Z4lLjl1SKUI72FCtnqzmgcujZFA/b3HMEdNtGzqTdGqYXqAq3b5gXs6hvUD+wE12FsHZFmQ==
X-Gm-Message-State: AOJu0YzQcpMaRUdXHLeNSObx+mVeRhfvtEuJ65exKmTMVTv0QV0WeWRb
 7u943W5F4CK7EHy8/c2imZSbLpLcUp/0bHC1At9JHQ4dRKqhOCpPBW7767atuhY=
X-Google-Smtp-Source: AGHT+IEUX2bb8EF/Crk8Xe5CV4T12E4EBBVruVTde1ZHIaICxC4b4eQY448GDbHFEJjxYks7uqvbuA==
X-Received: by 2002:a2e:8e93:0:b0:2d3:7e8e:de23 with SMTP id
 z19-20020a2e8e93000000b002d37e8ede23mr1065826ljk.23.1709485678916; 
 Sun, 03 Mar 2024 09:07:58 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a05600c510e00b00412aff7874esm12205510wms.48.2024.03.03.09.07.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Mar 2024 09:07:58 -0800 (PST)
Message-ID: <ce5a5a43-c09a-4870-a64c-603fc5fcdaae@mind.be>
Date: Sun, 3 Mar 2024 18:07:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Christian Hitz <christian@klarinett.li>, buildroot@buildroot.org
References: <20240228145129.416828-1-christian@klarinett.li>
In-Reply-To: <20240228145129.416828-1-christian@klarinett.li>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1709485679; x=1710090479; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bvtGU+ddVIofq28v5GRiPbHpa52yUH2jM+GRWljXfz0=;
 b=fSGLRv1m3tLAyTlCQ/ydZ5w7Q6XDLeBCJcJ3XMdPt4jLyKJlGVUaCzM8a7xN2+4O6F
 nSVw/WieDY1ajqWfYETcNuWDhQjKRbIPPQNBigAjpUkRe1y/N0Wt0Jnkr5vTNXnpC6Ns
 EFX9mIUchUhA4TO1vCxS4LDbG4ho43EJC9MzuQYboWtNBSEgGTTm8H3D5VuD60jZv/Wf
 hgfVxdGw4Nu5CJpBDzTX2Ir3n14s6wBWPcAD0JZJpj+trGDM2aqlXE1y4kvhkzOf1ans
 y9kjIHA/XjtUC7NsQJEtpsdrlr/+og6YNlsU8+LyE/k6tG2VdRgFvdMZwU4MQ4TbBR0U
 glCQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fSGLRv1m
Subject: Re: [Buildroot] [PATCH] package/arm-trusted-firmware: add
 ARM_TRUSTED_FIRMWARE_CPE_ID_*
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
Cc: Christian Hitz <christian.hitz@bbv.ch>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/02/2024 15:51, Christian Hitz via buildroot wrote:
> From: Christian Hitz <christian.hitz@bbv.ch>
> 
> cpe:2.3:o:arm:arm-trusted-firmware:2.4:-:*:*:*:*:*:* is a valid CPE
> identifier for this package:
> 
>    https://nvd.nist.gov/products/cpe/detail/78601535-610A-45A5-A5F0-AFC6A27A7F83

  This entry is from 2021, and they haven't added any entries for later versions 
(it's now at version 2.10).

  So I think this CPE entry is not relevant for any current version. If we add 
the CPE ID now, we will not notice if later they in fact name it e.g. 
trusted-firmware-arm. Note that the upstream repository is called 
trustedfirmware-a, and that there is a CPE entry for trusted_firmware-m [1] 
although that one also hasn't been updated for recent releases...

  So I don't think we should merge this.

  Regards,
  Arnout

[1] https://nvd.nist.gov/products/cpe/detail/2AF395D6-6367-4EFF-A0D0-C0CB6CA99E3E


> 
> Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
> ---
>   boot/arm-trusted-firmware/arm-trusted-firmware.mk | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index 2d554c1da8..ebb9b8e9f6 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -24,6 +24,8 @@ ARM_TRUSTED_FIRMWARE_LICENSE = BSD-3-Clause
>   ARM_TRUSTED_FIRMWARE_LICENSE_FILES = docs/license.rst
>   endif
>   endif
> +ARM_TRUSTED_FIRMWARE_CPE_ID_VENDOR = arm
> +ARM_TRUSTED_FIRMWARE_CPE_ID_PREFIX = cpe:2.3:o
>   
>   ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE):$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT),y:y)
>   BR_NO_CHECK_HASH_FOR += $(ARM_TRUSTED_FIRMWARE_SOURCE)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
