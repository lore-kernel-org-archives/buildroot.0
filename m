Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95139C6FA99
	for <buildroot@archiver.kernel.org>; Fri, 10 Mar 2023 20:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D12741C55;
	Fri, 10 Mar 2023 20:24:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D12741C55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EFM5T_ULhWvI; Fri, 10 Mar 2023 20:24:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE6B441061;
	Fri, 10 Mar 2023 20:24:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE6B441061
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 793A71BF390
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 20:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6009861AD8
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 20:24:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6009861AD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0KEooWb_Ac7C for <buildroot@lists.busybox.net>;
 Fri, 10 Mar 2023 20:24:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D46FA61ACA
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D46FA61ACA
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 20:24:51 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id ay14so25289402edb.11
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 12:24:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678479890;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iJ2CJytuIKZ9zEpPvnMHOn6KNIachfOwWZIftx2zGe8=;
 b=UOExMEzy7Ioy6JZydkiQEprLQ6AccZbRk2mI3YV3h04RRh49u/EwSh5PmNJjyaarpB
 MM93hUAPLU9yLOsYJif1YVt9AwNeCHq+Momd16KuOCodePVUyjf8dRlO0Wc/nd/X8Zsx
 ofoa95ZWtvwMI6A80k0brVunv7BNXIHkXVVHp9wrLsIclWS+XauZxGbHoTY0V2kkWE4O
 OCgwMRAkbwSQKcLZUqbMsG68j0vREDyZkQmlXPIFOJR7se9bpJdioW0FjHT7clAjeCo6
 WpYdWYNHNmZVJsTdlc9PNV1zy5ZdTjN2suFiBdmWfnB5FRFFLGpouK+bVouFImBzW5kH
 84xw==
X-Gm-Message-State: AO0yUKUFs51f+SozSsiP/KhYbvkAmdd0Ubt58FVrN3zCDSSkmClfHNLo
 zvXiv+aYCgkkS8eMh99JxpeLJA==
X-Google-Smtp-Source: AK7set9xRnX/UgPU2X26QLKkks5kwPLbz0SS9BEtdcs5pvPHgOwztTDpwMorKuqM3QGy4/4ChW13QQ==
X-Received: by 2002:a17:906:4bd3:b0:905:a46b:a725 with SMTP id
 x19-20020a1709064bd300b00905a46ba725mr2951289ejv.16.1678479889760; 
 Fri, 10 Mar 2023 12:24:49 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a170906824d00b0091d9b634abcsm270632ejx.27.2023.03.10.12.24.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 12:24:49 -0800 (PST)
Message-ID: <22d700fa-fd2b-cd51-8232-00078c816ba4@mind.be>
Date: Fri, 10 Mar 2023 21:24:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20230223111903.315678-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230223111903.315678-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1678479890;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iJ2CJytuIKZ9zEpPvnMHOn6KNIachfOwWZIftx2zGe8=;
 b=bb7cGebAenJH+b04JI0pVjgciN8XoTrjr0UqeTXBM2BevTsl20DCoGRuF647ujnTo4
 /aBI9scs1yJ8iF1B6GmWUFwsENR9aX/IlIxI6hCLYnBOAzrnTGsiHD+ggRk21kLIos6H
 HCk55cH6YaZHmr+sBRBnoTv36wREauUoPhzL0axOnYew5m18lUjSRLqe7GHz1zcWx2tB
 zZb5Ba+BAB4ydIfyRLY5G/yglsJu2ae63TVrcBpjfVjxvRswp/SJh0m0RgiqAR4kIp+Q
 qYtpofRmlvg4f+6/pjtuG+TQBZQhwjfLL5l3q5PRRqAiMrhYnc5mKF3rU0USrQKqSxZd
 KvYA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bb7cGebA
Subject: Re: [Buildroot] [PATCH 1/1] package/s6-linux-utils: fix build with
 glibc < 2.25
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/02/2023 12:19, Fabrice Fontaine wrote:
> Fix the following build failure with glibc < 2.25 raised since bump to
> version 2.6.0.0 in commit 5aac1d0105a73133fd886acc6c5195ca28f7e17f and
> https://github.com/skarnet/s6-linux-utils/commit/ad5973028c42d947440cdae5e4f106152c3dda28:
> 
> src/minutils/rngseed.c:15:24: fatal error: sys/random.h: No such file or directory
>   #include <sys/random.h>
>                          ^
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/214bcecfc389cb412b68627c831300478d614a3a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...utils-rngseed.c-fix-build-with-glibc.patch | 39 +++++++++++++++++++
>   1 file changed, 39 insertions(+)
>   create mode 100644 package/s6-linux-utils/0001-src-s6-linux-utils-rngseed.c-fix-build-with-glibc.patch
> 
> diff --git a/package/s6-linux-utils/0001-src-s6-linux-utils-rngseed.c-fix-build-with-glibc.patch b/package/s6-linux-utils/0001-src-s6-linux-utils-rngseed.c-fix-build-with-glibc.patch
> new file mode 100644
> index 0000000000..2df8a99700
> --- /dev/null
> +++ b/package/s6-linux-utils/0001-src-s6-linux-utils-rngseed.c-fix-build-with-glibc.patch
> @@ -0,0 +1,39 @@
> +From 3ab8bdc1c657f91a2a96f4e6db308d17098de0c4 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Thu, 23 Feb 2023 12:09:11 +0100
> +Subject: [PATCH] src/s6-linux-utils/rngseed.c: fix build with glibc <
> +
> +getrandom and sys/random.h are only available since glibc 2.25 resulting
> +in the following build failure since version 2.6.0.0 and
> +https://github.com/skarnet/s6-linux-utils/commit/ad5973028c42d947440cdae5e4f106152c3dda28:
> +
> +src/minutils/rngseed.c:15:24: fatal error: sys/random.h: No such file or directory
> + #include <sys/random.h>
> +                        ^
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/214bcecfc389cb412b68627c831300478d614a3a
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/skarnet/s6-linux-utils/pull/2]
> +---
> + src/s6-linux-utils/rngseed.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/minutils/rngseed.c b/src/minutils/rngseed.c
> +index 2b1772c..223f50a 100644
> +--- a/src/minutils/rngseed.c
> ++++ b/src/minutils/rngseed.c
> +@@ -12,7 +12,9 @@
> + #include <unistd.h>
> + #include <sys/stat.h>
> + #include <sys/ioctl.h>
> ++#ifdef SKALIBS_HASGETRANDOM
> + #include <sys/random.h>
> ++#endif
> + #include <linux/random.h>
> +
> + #include <skalibs/types.h>
> +--
> +2.39.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
