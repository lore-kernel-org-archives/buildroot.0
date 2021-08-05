Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC33C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:06:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61205606A5
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 61205606A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AA57404FB;
	Thu,  5 Aug 2021 19:06:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BQD1VkxF6Y-Q; Thu,  5 Aug 2021 19:06:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 661A640298;
	Thu,  5 Aug 2021 19:06:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A60401BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1DA683AE0
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:06:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 85IKxNOF5xQa for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:06:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A005C83AA6
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:06:20 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id u3so11296275ejz.1
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 12:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fQ9WBdphoorpIgk/FJvRMLxAM2EmUAwMnIicMfWn2dQ=;
 b=Amuau8a5AlE8xWKlagiS39Tejh5zXgsQHw4jGLaNffAztteTFAvG7oEzPyIIxLGC1B
 Y9Uz+LNhlHuqllQvS+hVW6AS5+iKlvVpHc89luIDu1d2IiMf3nM0K28ADM3cqNzJG41l
 vqOXqqsNls7nUv7HINZerC7hRHmmr0gUQwChOJkgWF6CLQqg44bNSY+NPMdsXXS6+XVT
 BQtH180mzh4C91lRNhbUUbNxvJqMWLCtYNQW/T6CRbOP5Ds1lOYmhvRsHT5ej2f5kOQj
 9Knrmkn/q47JvzFj5CskNxN0No13EGH6cD4+DNfiQ9fVmLpxFXHjsf3xR24G2oXYYY5i
 sEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=fQ9WBdphoorpIgk/FJvRMLxAM2EmUAwMnIicMfWn2dQ=;
 b=tKDEfeMXC9In21cjFWd8rgN5UKzkh1GDjz8z1Nk70aZPHNPYXnTNcwMqGXikSb1Nkk
 eq7zAl8baHO4Y7Jbe/vojhkoWLCuxaIDpe5gawYT9Sf0AHYdTRFPgHg9SsHLXb6qySkF
 6JTyTIiD3iznkG136jxCrQhHVryGv86P4YXJErDFczeYqk3vzTSFd2y7SwFBqziBtAnj
 Y2XXn8Y76KbYY3uoWlA9kcpbQX5N0P+aIRm+BVSyTXMFO6NpE3RrPgLCKUpGYe4Bi/3l
 vdbZCMnTvEc2jpUZti/O6puAgmeV02m/PiD5OJnnSvELucrT5D6ob2+/0W5C109EIUPS
 Q/lg==
X-Gm-Message-State: AOAM531MAdTUFA9OFlLNTeH/1T10x8sK2CeQKKvRsQjgV9NoRuWG4MxM
 VHx4Z3ahg+upIHHKFZP93p5RFA==
X-Google-Smtp-Source: ABdhPJzTF4Jx0fhEd3tC4b+OdIFqQgBsklHfDB9Lhqh/MR/S8FQ1HCP5gPJ9gAXB8DMzlOBrEX+qCA==
X-Received: by 2002:a17:906:ccd9:: with SMTP id
 ot25mr6207310ejb.508.1628190378793; 
 Thu, 05 Aug 2021 12:06:18 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id jj11sm2019512ejc.61.2021.08.05.12.06.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 12:06:18 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210805085955.2105652-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <894297ac-c698-0415-7bb9-2f1afc68f20b@mind.be>
Date: Thu, 5 Aug 2021 21:06:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805085955.2105652-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/uhd: fix build with gcc 11
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 05/08/2021 10:59, Fabrice Fontaine wrote:
> Fix the following build failure with gcc 11:
> 
> In file included from /tmp/instance-4/output-1/build/uhd-3.15.0.0/host/lib/usrp/dboard/e3xx/e3xx_ad9361_iface.hpp:14,
>                  from /tmp/instance-4/output-1/build/uhd-3.15.0.0/host/lib/usrp/dboard/e3xx/e3xx_ad9361_iface.cpp:7:
> /tmp/instance-4/output-1/build/uhd-3.15.0.0/host/lib/include/uhdlib/utils/rpc.hpp: In function 'bool {anonymous}::await_rpc_connected_state(std::shared_ptr<rpc::client>, std::chrono::milliseconds)':
> /tmp/instance-4/output-1/build/uhd-3.15.0.0/host/lib/include/uhdlib/utils/rpc.hpp:28:27: error: 'sleep_for' is not a member of 'std::this_thread'
>    28 |         std::this_thread::sleep_for(std::chrono::milliseconds(1));
>       |                           ^~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1591ff7fabb09e4eb79f3aa293fbb228c255c45b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  ...-lib-Fix-missing-includes-in-rpc-hpp.patch | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/uhd/0004-lib-Fix-missing-includes-in-rpc-hpp.patch
> 
> diff --git a/package/uhd/0004-lib-Fix-missing-includes-in-rpc-hpp.patch b/package/uhd/0004-lib-Fix-missing-includes-in-rpc-hpp.patch
> new file mode 100644
> index 0000000000..b287beec71
> --- /dev/null
> +++ b/package/uhd/0004-lib-Fix-missing-includes-in-rpc-hpp.patch
> @@ -0,0 +1,28 @@
> +From 9c4d9d826a6f40f199c526afd5ec168d5d088591 Mon Sep 17 00:00:00 2001
> +From: Martin Braun <martin.braun@ettus.com>
> +Date: Fri, 29 Jan 2021 12:23:50 +0100
> +Subject: [PATCH] lib: Fix missing includes in rpc.hpp
> +
> +[Retrieved from:
> +https://github.com/EttusResearch/uhd/commit/9c4d9d826a6f40f199c526afd5ec168d5d088591]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + host/lib/include/uhdlib/utils/rpc.hpp | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/host/lib/include/uhdlib/utils/rpc.hpp b/host/lib/include/uhdlib/utils/rpc.hpp
> +index e87a2ee324..ca89c10547 100644
> +--- a/host/lib/include/uhdlib/utils/rpc.hpp
> ++++ b/host/lib/include/uhdlib/utils/rpc.hpp
> +@@ -12,7 +12,11 @@
> + #include <rpc/client.h>
> + #include <rpc/rpc_error.h>
> + #include <boost/format.hpp>
> ++#include <chrono>
> + #include <memory>
> ++#include <mutex>
> ++#include <string>
> ++#include <thread>
> + 
> + namespace {
> + 
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
