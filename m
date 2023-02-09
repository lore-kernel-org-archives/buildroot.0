Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24CCC61DA4
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 20:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46F64418DD;
	Thu,  9 Feb 2023 20:47:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46F64418DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kog8rVU0ovOY; Thu,  9 Feb 2023 20:47:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CAFD4189A;
	Thu,  9 Feb 2023 20:47:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CAFD4189A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 340581BF57B
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 20:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B3C982203
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 20:47:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B3C982203
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BZiLe2ta9JKs for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 20:47:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D62F82012
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D62F82012
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 20:47:32 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id l12so3264656edb.0
 for <buildroot@buildroot.org>; Thu, 09 Feb 2023 12:47:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dx6KXin62hPOZvc4EXGTJn6UjNba3Z9+TuttJyQ28Ac=;
 b=bFYmS+LW5ad4krJXKYZC02ERUaFigiQeOagGWilILlPcs6pwDHkv+Bu/723S9lcLaJ
 IpA3mMuu4lsiHucXiwN1KRW0LNYcggAgaNW1A/DhqFKO1BLhBfhUqM9fpcIqwHN+J1uD
 H9gvZhvdxTFsjmMil1UoCd1J90KtqglEariD9tNqljTl5LIYTOcRRgUvgVj/UCcih+Ic
 z5pM3uHffavZjBOYcQmHdM0vzqSaD1/28weu/Z14AJChqxX7rUbI6FRCwHE5tZsYiGtS
 V7dIWp4qROyFZFb2wI22KVDq7iKRxhyRW1asMAH7lauVZ7CBnigGXHHqfvAchkTI+iZe
 xH+g==
X-Gm-Message-State: AO0yUKUF3E1uFdNxhQ2vlL5T28ntwUR1KkceqnR9ECWiAhYkVuC2qcF7
 O+KuoEKDxM6XSKW10QLR2dOOV55kOghdsY4d
X-Google-Smtp-Source: AK7set+6+vtGiyWbNTYHyh6uMxPXjlXSXEZwK5F0ZPuVqnocsgGrGRSb+KWODMIxSAzAbX/0YuYfrA==
X-Received: by 2002:a50:d492:0:b0:4aa:a4f0:2c17 with SMTP id
 s18-20020a50d492000000b004aaa4f02c17mr12516286edi.4.1675975650787; 
 Thu, 09 Feb 2023 12:47:30 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 c25-20020a50f619000000b004aada1b8d8csm1305089edn.0.2023.02.09.12.47.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 12:47:29 -0800 (PST)
Message-ID: <543e5bca-a555-395e-7b37-d0a6c166b878@mind.be>
Date: Thu, 9 Feb 2023 21:47:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20230208175008.88846-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230208175008.88846-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dx6KXin62hPOZvc4EXGTJn6UjNba3Z9+TuttJyQ28Ac=;
 b=QllyNuf21bk/5urfjiR921R1+6Npa1RStmCiglmU3hm+frJQALgiZ31ZNANHijh3cS
 I0k6VKdd/j4ZvTx/hwPt/vzIz/92u7671NtRNa+YsY/A48ovvGecGgwPmcYYp58QhZFk
 cT6Oz28XV92rxw7985B8/u3uSyDuMd62hoMGYSWKZw04fOL4apkFW7QrIPQi0moBceBA
 3aNcfXq+TQ0GOS+35gxdtdLcALw1UIw8R1+ZwCqaj++fpwIFQpG5JvFqZbQe1EgdRfRq
 0ZGn2mmmMgj4g9k0hwDPhooi3JOOx91zNyn1YEU/CzNMuqcHrXuFPb4xZunbqfr6LFwC
 waPA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QllyNuf2
Subject: Re: [Buildroot] [PATCH 1/1] package/libsolv: add
 LIBSOLV_CPE_ID_VENDOR
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/02/2023 18:50, Fabrice Fontaine wrote:
> cpe:2.3:a:opensuse:libsolv is a valid CPE identifier for this package:
> 
>    https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopensuse%3Alibsolv
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libsolv/libsolv.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/libsolv/libsolv.mk b/package/libsolv/libsolv.mk
> index 144ce68a83..29f8a6a3d2 100644
> --- a/package/libsolv/libsolv.mk
> +++ b/package/libsolv/libsolv.mk
> @@ -8,6 +8,7 @@ LIBSOLV_VERSION = 0.7.22
>   LIBSOLV_SITE = $(call github,openSUSE,libsolv,$(LIBSOLV_VERSION))
>   LIBSOLV_LICENSE = BSD-3-Clause
>   LIBSOLV_LICENSE_FILES = LICENSE.BSD
> +LIBSOLV_CPE_ID_VENDOR = opensuse
>   LIBSOLV_INSTALL_STAGING = YES
>   LIBSOLV_DEPENDENCIES = zlib
>   LIBSOLV_CONF_OPTS = -DCMAKE_CXX_COMPILER_FORCED=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
