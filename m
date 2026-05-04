Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59CCCD343A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD980845A0;
	Mon,  4 May 2026 14:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cwJM-hnrAJ_w; Mon,  4 May 2026 14:48:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD424845D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906094;
	bh=7+3MIp/gDaLEC1U9FXnPjv/MPf7qzyN3Pu4DcuZyCy4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ogKf9OnzjOaVC9g1fSvbFrVzybXc7xqGLC0bYJ8s02MzPIiCorcwSPTRoIO/Gr7G+
	 e9TDsJJE43A5F5/TkV9kNICHH9JXMc5hRbhsjCnWJ+9+tzFJcGGpUtHj60eQUFb01m
	 kHR8siZ08edk3AKUjJ3bI2BNQ3sCD3FScxFqfQDV6XzNC1XEGeSkiXq6x/GrShRwz3
	 /x0vXrTOYdXx64/ul14jC4T2egiTTFBqUF2Ib+1u3BHm5u9IP2dhhzSWVAQeXhXSZr
	 BDejIYl0MPinpGSuC12iUMjFMiqpQkcbLyb35v2NKnlx7P6NXEO1iFGAtcrQIDRgYE
	 wz/phlN7CO0jQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD424845D6;
	Mon,  4 May 2026 14:48:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D0BCD190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6D9340B70
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VUGqtcWrEc0I for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:48:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B48A14079C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B48A14079C
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B48A14079C
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:11 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4891c00e7aeso34941765e9.2
 for <buildroot@buildroot.org>; Mon, 04 May 2026 07:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906090; x=1778510890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zdfklivxUDyQVd5xgtFrRQDinLrWnWy3Hyd5JoSx10s=;
 b=EmIJFqjwmLXu7J9JT6f4VxuDeCryLarVmdCP3kGJLQPTywj0UL2WMmLFYcKB8862RD
 4dAdehSYEH+bJ/bUuIXb3c6PlygRaNyYIhcpi5sroclfwkEFWLZJi0v2iMY1vkLw1ujR
 MYbDuMi4PjsWO3PbBzD0G601dytXrD5Gef6JZBYUgKaGJPa3l3XLjLnu2sufIlA88gRt
 /B4+dJmcpAF8Tta+HsCIe+rx3KOZN8M8OxHHeZEMCyUq/pInVU8KzFz/Lm24PioRx/nT
 a4LffN7G+EnG9h5Av7fd9SSmbuw7KZDOTlz2K1E+CxqY+hiOnoHD19odjR7/w+x+vPR9
 Smqw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+x15ZfCjVtdL/ZOQmBE8XeybW0QTYJcXftiiXfozY+ki+fO2px2S+OHz4c3M/sotxcUHGmIIv7JvI=@buildroot.org
X-Gm-Message-State: AOJu0YzJZsm+99xvIef5GuiiAZIciIC3+4goWiVBfIeHiTNYL/oV5U+c
 OIrZvpj2glvdK5zCeOLHqh5wjIRIZ1gwKEPFwGylo4dUKXwSMJTr5b5hTrFIf3RPxIrinWzIqJj
 032oK
X-Gm-Gg: AeBDievMvqlO6xErurMTf64prkL6ota4LLauZ45YtjwfthzgLWGPGyuv9m8toqfPZHc
 x/57Ly5+iF2Bi7HCgs98dp29XmzdBVr5fcWPgjo7VsTBHtDCdKizgbsosihIpyVbkSanZw12lJr
 dOjuwgF6bsGDwXfWGscd2UlqLAB3kNYitpFeuggSOJjbUkL8K/ZFNnKx3+JCKPmyOF7z7hoO4VJ
 tQvTQIKrhSP4ZbnsiSbeA65sMgdrLspMflLU0jOwTgYMVkBucBdJFKGY1L4BgFVEEpJcMPM0WuL
 +lm6VRuQDBbrzo+02qzsX+4aXcS/EiILiyGbh7HxuXbG4LiugFZmCHyyfj7v27crpsT91qeGFwf
 NGRcrit96dmuRLicWcj+cd3DQzWj/mzJDXPJUzFMACoVbrY/5We9ubGCZhuyYnj6ZowHzMfQ3ac
 Vk5j81ZQbY36JqP+MxIfGxZuQEgQ==
X-Received: by 2002:a05:600c:4450:b0:488:9e43:9690 with SMTP id
 5b1f17b1804b1-48a986388acmr160614485e9.10.1777906089742; 
 Mon, 04 May 2026 07:48:09 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a81ed69fasm393714975e9.3.2026.05.04.07.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 07:48:09 -0700 (PDT)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  4 May 2026 16:48:08 +0200
Message-ID: <20260504144808.11038-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260420142814.753135-1-buildroot@bubu1.eu>
References: <20260420142814.753135-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777906090; x=1778510890; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zdfklivxUDyQVd5xgtFrRQDinLrWnWy3Hyd5JoSx10s=;
 b=G48bDn+CoRg63y6xsYeO7TBa4LNgfyk3Yftm2joDZwga5kQ6NmW2CQRAFcBRcsVsu5
 s5WwKsblJ5x2odlP/RtrxUIl/kSrJwHvll0Oth19mXFgfpvZlZ2lMSxLjt+DWMNuzvWA
 aVzbc+suxBTk9BhN3TZd5LWi5x729qLzYSenPgARFl3cTABZOfoJijCFwIS4zfoWAR8u
 wq+TpbJtp3s9SN9evWo4aNjcxvo7v4+DfmeTFQYMtmjfpKCmzeDn8gywO3OLxwAb3Bag
 38ijyoANieW+ZkTAoxtQBNqCyVWjSxDNKtgS1k3A5HXDW4rXdzTqvvUO/pFF8K4CVCun
 jVSQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=G48bDn+C
Subject: Re: [Buildroot] [PATCH] package/util-linux: security bump to 2.41.4
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
> Security fixes:
> 
>  CVE-2026-27456 - mount(8) TOCTOU symlink attack via loop device.
>    The SUID mount follows symlinks when resolving loop backing file
>    paths. On systems where non-root users are permitted to mount loop
>    devices (via 'user' option in fstab), this allows access to
>    arbitrary files.
> 
>  CWE-190 - Integer overflow in libblkid parse_dos_extended().
>    A crafted MBR disk image can cause uint32_t wraparound in EBR
>    chain processing, causing reported partitions to not match the
>    on-disk layout. Tools like udisks may then register a partition
>    at logical sector 0.
> 
> Full release notes: https://www.kernel.org/pub/linux/utils/util-linux/v2.41/v2.41.4-ReleaseNotes
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to 2026.02.x. Thanks

> ---
>  package/util-linux/util-linux.hash | 2 +-
>  package/util-linux/util-linux.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
> index eab8a0c3b5..5a5656212c 100644
> --- a/package/util-linux/util-linux.hash
> +++ b/package/util-linux/util-linux.hash
> @@ -1,5 +1,5 @@
>  # From https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.41/sha256sums.asc
> -sha256  3330d873f0fceb5560b89a7dc14e4f3288bbd880e96903ed9b50ec2b5799e58b  util-linux-2.41.3.tar.xz
> +sha256  a8c213cc06048862602a42b2d299b340001f6d05c4407b549f3e03521df83688  util-linux-2.41.4.tar.xz
>  # License files, locally calculated
>  sha256  4c2db318192bda62f3f8fcf71488bb5e602ae4385eba281d711b46cc13a40bb3  README.licensing
>  sha256  527f738966ca396cd5a68c1509390de2a780c6b614d9ee57f7544a6161938ed1  Documentation/licenses/COPYING.BSD-2-Clause
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index 7617041a46..1271bc7dc0 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -8,7 +8,7 @@
>  # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
>  
>  UTIL_LINUX_VERSION_MAJOR = 2.41
> -UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).3
> +UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).4
>  UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
>  UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
>  
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
