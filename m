Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112E7C77B70
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 13:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81CE440022;
	Sun,  9 Apr 2023 13:38:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81CE440022
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GMFO421JY3e4; Sun,  9 Apr 2023 13:38:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9480D4014E;
	Sun,  9 Apr 2023 13:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9480D4014E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C083B1BF82D
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 13:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FA8460B29
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 13:37:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FA8460B29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GOJbgXMr58KN for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 13:37:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E6B860757
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E6B860757
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 13:37:58 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id w21so2378437wra.4
 for <buildroot@buildroot.org>; Sun, 09 Apr 2023 06:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681047476;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jJgMcnfE3IiFg5C/UKlr5YVCB92/FNiZuvACsIAtLQk=;
 b=qzEIGKk68CpLVinlNpRyeMILz32EbV3jdcvbCYuoLeZ/UIa5HPSjNPyJW60BxFmSFL
 2TrCbVO1W6UA+QxQNazJci7hop0St259YUkC9bqJ1PdK9tOW0nYGXwJ+rcIRMhQdRXlc
 gILdqyahb/E/OWJMcffvNOsAJ9WQg3GgtDYaGSX4FUuiN+7Au1dlGgP7NcdQadnwWY87
 Pd1JWQIgKaIGfV1xyaR29X3hY6nsdsZWR+TH1onIDiKw5Jy+O8ZhIAS/XR0NSm/NUja7
 0ONDRuD2oWK7sXlncrQF0fvpVyACtlDiYYKV6oJLvN/3nsLOXzicrZCVos0hIb7RXzkW
 LxNw==
X-Gm-Message-State: AAQBX9cZ1RjXCyaKlQg8GoDJB38oU9ynksOdA29RsoB8TLXLyuu5QVHX
 jpHvYDdb71EVLdmyTPevMiqdWA==
X-Google-Smtp-Source: AKy350aBfcNRvh/okw+GyB+qt9DqDIi1yQoyICV29NrZmM1L0/+NzQ0MtDd8ZXHFQoHbg39AK2Ym1g==
X-Received: by 2002:a5d:5601:0:b0:2ef:bbd7:63a8 with SMTP id
 l1-20020a5d5601000000b002efbbd763a8mr2258179wrv.70.1681047476402; 
 Sun, 09 Apr 2023 06:37:56 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 x11-20020a5d444b000000b002efb5ef9f07sm4881222wrr.82.2023.04.09.06.37.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Apr 2023 06:37:55 -0700 (PDT)
Message-ID: <265b281a-a12c-02dc-e48e-ce249718c60d@mind.be>
Date: Sun, 9 Apr 2023 15:37:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: Florian Fainelli <f.fainelli@gmail.com>, buildroot@buildroot.org
References: <20230328212711.3721-1-f.fainelli@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230328212711.3721-1-f.fainelli@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681047476;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jJgMcnfE3IiFg5C/UKlr5YVCB92/FNiZuvACsIAtLQk=;
 b=HxMCxy0UoSRIvupiizISxyq79bFKuVwPEot9JOKhkpCfSrQHWK8ReY0eZ1RICs5wqM
 ZX+xXKmMNAhmu4RJdtumihbz168fNnwb7tCRlRncse+zYsmdZ1iy+K8dSqMuZ2awx/cA
 ZTK1UjvpOZqNNosFV/j5mn64e8czlGubuTKRH8JtvpWlxu4zqZeSpVNdm9u+Vy24kbZL
 eBvjbJRHgbuXVExPgMjkULngdzfPVZoYPrzbWq83/ufCd0EHLlYSOrht2ZEOELT8UiEE
 cDVxPpQu03CQdCixrRXLpb1msSTYc1rqSeEhX++lzXjxIA8qK7vUWxY74mXCcWuO2cc/
 ExoA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HxMCxy0U
Subject: Re: [Buildroot] [PATCH v2] package/bluez5_utils: Fix builds with
 musl-libc
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
Cc: d.lang@abatec.at, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, marcin@bis.org.pl
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/03/2023 23:27, Florian Fainelli wrote:
> Backport upstream commit ca6546fe521360fcf905bc115b893f322e706cb2
> ("shared: define MAX_INPUT for musl") to fix builds with musl-libc.
> 
> Fixes:
> - http://autobuild.buildroot.net/results/3fd24a604a29eff70e20f82690e3f058f04903f9/
> - http://autobuild.buildroot.net/results/bd57f1813be699cd5ce2ae94f5f511a71fe10428/
> - http://autobuild.buildroot.net/results/90d528cc18a367af2f68e1c0673d962fe399e1ac/
> - http://autobuild.buildroot.net/results/552b700ee129e1c7f651de13f6766eae5325dcbc/
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

  Applied to master, thanks, after adding the Upstream: tag that was the 
conclusion of the discussion raising out of v1 of this patch.

  Regards,
  Arnout

> ---
>   .../bluez5_utils/0001-musl-max-input.patch    | 37 +++++++++++++++++++
>   1 file changed, 37 insertions(+)
>   create mode 100644 package/bluez5_utils/0001-musl-max-input.patch
> 
> diff --git a/package/bluez5_utils/0001-musl-max-input.patch b/package/bluez5_utils/0001-musl-max-input.patch
> new file mode 100644
> index 000000000000..4d06a2bbeaf2
> --- /dev/null
> +++ b/package/bluez5_utils/0001-musl-max-input.patch
> @@ -0,0 +1,37 @@
> +From ca6546fe521360fcf905bc115b893f322e706cb2 Mon Sep 17 00:00:00 2001
> +From: Sam James <sam@gentoo.org>
> +Date: Tue, 31 Jan 2023 05:52:58 +0000
> +Subject: shared: define MAX_INPUT for musl
> +
> +musl systems don't have MAX_INPUT. Just define it to _POSIX_MAX_INPUT
> +which musl does have if it's not already defined.
> +
> +Note that on glibc, the values match anyway (as of glibc-2.36), and
> +indeed POSIX_MAX_INPUT has the same value on musl too.
> +
> +Bug: https://bugs.gentoo.org/888467
> +[f.fainelli@gmail.com: backport from upstream]
> +Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> +---
> + src/shared/util.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/src/shared/util.c b/src/shared/util.c
> +index 2f0ae0e86..b466fb001 100644
> +--- a/src/shared/util.c
> ++++ b/src/shared/util.c
> +@@ -28,6 +28,11 @@
> + #include <sys/random.h>
> + #endif
> +
> ++/* define MAX_INPUT for musl */
> ++#ifndef MAX_INPUT
> ++#define MAX_INPUT _POSIX_MAX_INPUT
> ++#endif
> ++
> + #include "src/shared/util.h"
> +
> + void *util_malloc(size_t size)
> +--
> +cgit
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
