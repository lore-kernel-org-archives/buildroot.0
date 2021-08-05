Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C5AEC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:24:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D27E60BD3
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:24:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D27E60BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE26E400D7;
	Thu,  5 Aug 2021 19:24:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MedtKN5QUvvK; Thu,  5 Aug 2021 19:24:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D8E6401CA;
	Thu,  5 Aug 2021 19:24:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D21D1BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CB7B40224
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:24:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JnjSSghiD65v for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:24:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1210E40215
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:24:34 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id yk17so11301879ejb.11
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 12:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iyXKQC9WM3NQ+vCnwp19OHmLbEzdibcJamnqbCT+K0o=;
 b=BnwGPsUw6AtJB6aXk1JhZ4EjbUJwHOyGsbGIiVRh0+EQ4fRWWTwfyzvRYdX5FIPyOC
 AbUEeM4CPQDF5Dxn8z/ygZeaz1tG289zWrvgUE292XXNSu1sPbyELgtekj+Mv5Rn1QmB
 rmE3dAVPnqs0cbUT/UGHNhipCMD7phTYYtsat3f7XhOAWGFbfBeK1eyXapbuX9mp1bQ0
 BCH0o/ef4WnDsCp/bDvRBUvqCh35s1Nx6nz2YdDndv31MhlLnNR7ZocaroEisYxNLeht
 F6JwWa0yNDJxQd5EIUoREi/EWGXdmKcGx9Y7+JzKsCx6PBlPCbNakLqnfugc/+Zf1dP7
 xD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=iyXKQC9WM3NQ+vCnwp19OHmLbEzdibcJamnqbCT+K0o=;
 b=jtH3zEvZG/x0kt5gbd2RQ9wIFrXrz4GXvb2ELzVZbbNyMev5Esy7zZeP7Iu4EDGh5M
 zx6XXjbuGjWodfTdbXu3WU42Vx07R6sk1wX20k7/RbIhvSB+fkfj3fREymMva6KPTXxj
 Yy8PJL0F+2PbqltFxdi/lZsnsFbzZdw2f9wvgGDudmaHz0YeovqIiD514+8X1R2CCafX
 /vmrqQTRdEO/m0R5hyY2GGC11r4eRxAZNFaQZWSd4umXzNViXCDag10uBUzK4yQ3V9E/
 vPTOviKTlz7n1qEKKwPTgTWg7SuOg1dLPQG8Jl7DuLhY9vTpc8kV1Qefp0JfSo8iO/vi
 BFsw==
X-Gm-Message-State: AOAM530nZ4m64k2Xu91ZAzT3h4SlyBkjh5Gtz1RPczjN4j2P42CNOogQ
 bQKl7hADsZtatho069+LDhGkzjAr7Igmi03tFgs=
X-Google-Smtp-Source: ABdhPJxmGrqkrosEw3ahGsfnfHEzgUmr0h+Xii6ozyrb6PnxGNHbvITC9eI0VQYadyThzZgdZsGGMA==
X-Received: by 2002:a17:906:82d3:: with SMTP id
 a19mr6377441ejy.244.1628191473222; 
 Thu, 05 Aug 2021 12:24:33 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id f15sm2016358ejt.75.2021.08.05.12.24.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 12:24:32 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210805191247.2664867-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <b8f136e3-5732-874f-9213-6ddcbc1d4006@mind.be>
Date: Thu, 5 Aug 2021 21:24:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805191247.2664867-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/pistache: fix build with gcc 11
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 05/08/2021 21:12, Fabrice Fontaine wrote:
> Fix the following build failure with gcc 11:
> 
> In file included from /tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/../include/pistache/async.h:10,
>                  from /tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/../include/pistache/client.h:9,
>                  from /tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/client/client.cc:7:
> /tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/../include/pistache/typeid.h:26:12: error: expected type-specifier before 'size_t'
>    26 |   operator size_t() const { return reinterpret_cast<size_t>(id_); }
>       |            ^~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2443559df8c2357476e4cbdbebb08280cbb80a3b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 I had almost applied v1, but then I saw the upstream review and I thought:
Fabrice will probably make an update. And indeed, 10 minutes later, there we are!

 Regards,
 Arnout

> ---
> Changes v1 -> v2:
>  - Update patch after upstream review
> 
>  ...de-pistache-typeid.h-include-cstddef.patch | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/pistache/0003-include-pistache-typeid.h-include-cstddef.patch
> 
> diff --git a/package/pistache/0003-include-pistache-typeid.h-include-cstddef.patch b/package/pistache/0003-include-pistache-typeid.h-include-cstddef.patch
> new file mode 100644
> index 0000000000..be06ca760a
> --- /dev/null
> +++ b/package/pistache/0003-include-pistache-typeid.h-include-cstddef.patch
> @@ -0,0 +1,38 @@
> +From 37291201ed948e9d65993a717c59bb14f4187e13 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Thu, 5 Aug 2021 19:02:56 +0200
> +Subject: [PATCH] include/pistache/typeid.h: include cstddef
> +
> +Include cstddef to avoid the following build failure with gcc 11:
> +
> +In file included from /tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/../include/pistache/async.h:10,
> +                 from /tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/../include/pistache/client.h:9,
> +                 from /tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/client/client.cc:7:
> +/tmp/instance-3/output-1/build/pistache-f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d/src/../include/pistache/typeid.h:26:12: error: expected type-specifier before 'size_t'
> +   26 |   operator size_t() const { return reinterpret_cast<size_t>(id_); }
> +      |            ^~~~~~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/2443559df8c2357476e4cbdbebb08280cbb80a3b
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/pistacheio/pistache/pull/965]
> +---
> + include/pistache/typeid.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/include/pistache/typeid.h b/include/pistache/typeid.h
> +index 10353ca..893e7c1 100644
> +--- a/include/pistache/typeid.h
> ++++ b/include/pistache/typeid.h
> +@@ -7,6 +7,7 @@
> + 
> + #pragma once
> + 
> ++#include <cstddef>
> + #include <functional>
> + 
> + namespace Pistache
> +-- 
> +2.30.2
> +
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
