Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F34C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 21:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C6BF40A10;
	Wed, 16 Feb 2022 21:46:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HMN8PVoXCm7v; Wed, 16 Feb 2022 21:46:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45D51404F4;
	Wed, 16 Feb 2022 21:46:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF31E1BF5A9
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64E84410AA
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:46:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wBnvCw8NQV56 for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 21:46:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3133641791
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 21:46:12 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id g7so6243163edb.5
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 13:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=veBfA+FFsVcA1eHdfggCSBhYU2XylFdJSIQg47T0vf8=;
 b=KOYDXIXmzqq1KGPabfyOp3/8F7+DXk/6WXdwMKjl3WHfI+O6gL044RTLF0jw/8fUDw
 UkjKxZB2ac+duFf+tzbIEgLNrvV6XBKmiSRlePOapEK2Et2KHJ2Aa06JBFQZ+DVZO/GU
 ThYS9jGybmwqkF6n5IQTxhL9tsvDt4Wke+qprePvOLzWeLFMwEF+9d5HodvXi3gvCHjf
 xdEviNegcVdboQcw16Kyh33JG3oRl5h3druvhjQX876bcHi97ntMAnp9dmwLcyy4UcYZ
 LCIvKB4SGsuklNOEp882Qz2GyEpvIUdEZnyRPCGk8lQF6Cu2rAxtqft+NrDPQS5dg5zn
 H0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=veBfA+FFsVcA1eHdfggCSBhYU2XylFdJSIQg47T0vf8=;
 b=K+YSYCLOiH4r4Wct4/eCep2zABq6LQNGkgVBlUHCV31jSFWJzo+rKzgNmCbFJCdcsV
 unPamP2pV/PLU6KGfloN/6Ti2VMq7ihOuGbKB1JmAg8t86fqYEYD0I32jnl9r4ZpSa2b
 UmO9JN8uPE668UW9YZkTsQmOXcWyjZbfWFZWlOR3WJrrPJKEtca60YOdHgwdxrgpl2xC
 vOFU2erXxsQ79jzIqJqf5WAw/AiO+Oto0N4osVIGcIbup1pALdPdRhPeJerj5Y98XPJe
 bvQUeN6T0hmHSYXYzXguEmPUhibRTGxXi9Iia/XU3Dwt50PWJvb/QX13D+RawxPtsR/M
 t9dw==
X-Gm-Message-State: AOAM531b8/5WX5hDzIo7A49GNWTpSHScPR5B7VUxTD7yFTXr+fUyx8uB
 M2oL03sCVgfD9xzsAjNW9TAfQw==
X-Google-Smtp-Source: ABdhPJxnYmf1VctgrWijBfbH72qnOJHBLckLurevDybmdVvW7YcqUrKB71q/eBy1JhxyByQOxEnR1A==
X-Received: by 2002:a05:6402:5244:b0:410:f41c:ebe7 with SMTP id
 t4-20020a056402524400b00410f41cebe7mr5171153edd.77.1645047970981; 
 Wed, 16 Feb 2022 13:46:10 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id c25sm2189996edu.103.2022.02.16.13.46.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 13:46:10 -0800 (PST)
Message-ID: <1f433a35-86f3-adad-564b-81660ecd6c06@mind.be>
Date: Wed, 16 Feb 2022 22:46:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220213114214.1057171-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220213114214.1057171-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libbpf: add LIBBPF_CPE_ID_VENDOR
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/02/2022 12:42, Fabrice Fontaine wrote:
> cpe:2.3:a:libbpf_project:libbpf is a valid CPE identifier for this
> package:
> 
>    https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibbpf_project%3Alibbpf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libbpf/libbpf.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
> index 6750b063c0..06f3f3475a 100644
> --- a/package/libbpf/libbpf.mk
> +++ b/package/libbpf/libbpf.mk
> @@ -8,6 +8,7 @@ LIBBPF_VERSION = 0.6.1
>   LIBBPF_SITE = $(call github,libbpf,libbpf,v$(LIBBPF_VERSION))
>   LIBBPF_LICENSE = GPL-2.0, LGPL-2.1, BSD-2-Clause
>   LIBBPF_LICENSE_FILES = LICENSE LICENSE.BSD-2-Clause LICENSE.LGPL-2.1
> +LIBBPF_CPE_ID_VENDOR = libbpf_project
>   LIBBPF_DEPENDENCIES = host-bison host-flex host-pkgconf elfutils zlib
>   LIBBPF_INSTALL_STAGING = YES
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
