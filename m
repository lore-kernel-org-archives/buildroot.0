Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F14CC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 12:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BC03419A3;
	Sat, 23 Jul 2022 12:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BC03419A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w03by_VbjAW0; Sat, 23 Jul 2022 12:37:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4447141813;
	Sat, 23 Jul 2022 12:37:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4447141813
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D1FD01BF36E
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC368401A4
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:37:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC368401A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6C92tSk-rVRo for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 12:37:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 449DD40155
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 449DD40155
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:37:38 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id m17so9506241wrw.7
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 05:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+vFi84o/4U27MDVx4GZ98lTC2ggu6I18GGV/nL6zep4=;
 b=4GhLpBnWlSD2W1dhc31uzPNI9bgp77PdVZ3SdW66d+NdCLB+BIIyrzmY879aqJWv2D
 Im1CgDvaRg1LJFU8AUqjAsq5amg2KnIBd/ZLPPAKlnMfu0HU9vRCCqxx4NfYtZ7YljCx
 WEozUXu4zQSCAmEFgVvx3dWfOUI3GtgCGDqTJApPRe+Z9t1Aa8VRPeFsWQ0+Qi8Ar5ZR
 irfZ+GfKBgap9OxUHtyrG6aiW1dZu8zzMNjBvRY7cIekhsJBB34WlRd45cxk0JwJsIlP
 Vpc6mU5onVTygByp8smNd9zQObvGz+GLzUwQYR7moWF0Vxa8BCYGIpiq3hDR3Ss6Hgls
 SGqQ==
X-Gm-Message-State: AJIora8O/Ri3bhXpyTtr/4G0oZxYuL1z4Hq0ef3WxVk60LQNhtpoV2DO
 Kc4wfjSVNqp1R7Mkk/HunAPWxnW/vazinQ==
X-Google-Smtp-Source: AGRyM1szwWc5pq6CU67aywJ7+gSanTyy0yesaksdAM1ZqTngxdnGCWgBZBfZYE8I26V+Xd0EcJNzgw==
X-Received: by 2002:a05:6000:1c08:b0:21e:3940:ef47 with SMTP id
 ba8-20020a0560001c0800b0021e3940ef47mr2720613wrb.325.1658579856472; 
 Sat, 23 Jul 2022 05:37:36 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c4f0700b003a310fe1d75sm13160178wmq.38.2022.07.23.05.37.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 05:37:35 -0700 (PDT)
Message-ID: <7288c755-23a2-b448-adfd-44d954fd8e49@mind.be>
Date: Sat, 23 Jul 2022 14:37:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Joachim Wiberg <troglobit@gmail.com>, buildroot@buildroot.org
References: <20220720101306.669862-1-troglobit@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220720101306.669862-1-troglobit@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=+vFi84o/4U27MDVx4GZ98lTC2ggu6I18GGV/nL6zep4=;
 b=gp8mPlEm+/8UMeym6hlvYU3+1AoC78BF3bphpYC2d4Q51nbrNkYV6JjYBigID6eSbA
 YxFf9Xa4bgec/qJZoJNlmDlyyhumxiLALSJc+FKPjaviHYV0L5w6fSLMXTdzZKOPW4Cq
 bSqoaXbY3ykoWFPTMCZszyrTZYeWkBkMomO494GjWHN3Coi4lQtDNzMxeTjYfap8qZzC
 nAL7Y5dRVd92oa6xpKMHDyHP6SVyn1ymg9wYCBOtICiiA5Z9mM4PipShUPNIrfd7CsNf
 VzUAR3aH5E4F4LuplueMGPV8w0aKzZfsuC1CK+IQvdJX9PsUqnwgXU6RXCI1lQT9ItWe
 WHvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gp8mPlEm
Subject: Re: [Buildroot] [PATCH 1/2] package/sysklogd: install to staging,
 provides syslog() replacement
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/07/2022 12:13, Joachim Wiberg wrote:
> Since v2.0 the sysklogd project has provided an interposing library
> libsyslog.{a,so} with a syslog() replacement, including the NetBSD
> syslogp() API for RFC5424 logging.
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/sysklogd/sysklogd.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
> index d6db71e50c..9e5932f8fa 100644
> --- a/package/sysklogd/sysklogd.mk
> +++ b/package/sysklogd/sysklogd.mk
> @@ -8,6 +8,7 @@ SYSKLOGD_VERSION = 2.4.0
>   SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
>   SYSKLOGD_LICENSE = BSD-3-Clause
>   SYSKLOGD_LICENSE_FILES = LICENSE
> +SYSKLOGD_INSTALL_STAGING = YES
>   SYSKLOGD_CPE_ID_VENDOR = sysklogd_project
>   
>   # Busybox install logger in /usr/bin, and syslogd in /sbin, so install in
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
