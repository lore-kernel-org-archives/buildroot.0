Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776DEC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 08:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EA5661AB5;
	Sat, 23 Jul 2022 08:49:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EA5661AB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Bpye3cafWhi; Sat, 23 Jul 2022 08:49:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AF40617BC;
	Sat, 23 Jul 2022 08:49:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AF40617BC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA52D1BF2C7
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 08:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4ED183EE7
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 08:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4ED183EE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MGTjrhBDkPcz for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 08:49:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4DEC83EC8
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C4DEC83EC8
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 08:49:26 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id b26so9357045wrc.2
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 01:49:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZWwQisXCcfIkdyNJM2RGcN6qaTTIm95Tbol/UdWAd28=;
 b=GfK+yl2d/TLrlnBNftWVn/SDsTY6HqFlAi/dDaQTLvT+O1laHovkvClVA41oUl/ZBn
 YPzZRZQl3jW3vmVrrSB/wCXSIeY9BXsDiB2866xlWhDljWGvgU/o1XsY7/5IVR3UtA2L
 z1EjGtXfY2O1CKyxBf0zG0hmfcZNth/YILN/jDYrVdn1LDTZn1KHLgayBGx0OasWom1s
 2O9MxfKsUgqHgzzG42Obkeni+asPnoOWnp+XYNEmYjurJZk0AZZQug1JFA2GZTIUgy93
 UVFljYSau8AT4x+UxQw4p04aDkntci2NDCCQETbd5wEF0y3h7Nl+NiVzWOj5gtxeGXJt
 sHcw==
X-Gm-Message-State: AJIora8jW9UgJ7fsRV43h6lhkUNMzGGVsM0llhZ2IA4wZMUq6cgrVdOG
 +Lt/yw8am7qCzE3WbKtCTtTPb6OxsvpUX2HF
X-Google-Smtp-Source: AGRyM1v5L0uk7WpVM1QmTptXUnWVeREPZQiIUTVuqbyJYv6vwqlPmTV8k5AcdT8cwfuNvR/bKFAavg==
X-Received: by 2002:a5d:47aa:0:b0:216:9eff:342b with SMTP id
 10-20020a5d47aa000000b002169eff342bmr2396658wrb.356.1658566164721; 
 Sat, 23 Jul 2022 01:49:24 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 q9-20020adfaa49000000b0021e7e050404sm539890wrd.117.2022.07.23.01.49.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 01:49:24 -0700 (PDT)
Message-ID: <9b97da5d-1cec-54e9-eff1-5b99de3e39e8@mind.be>
Date: Sat, 23 Jul 2022 10:49:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: John Keeping <john@metanate.com>, buildroot@buildroot.org
References: <20220722130043.4185303-1-john@metanate.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220722130043.4185303-1-john@metanate.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=ZWwQisXCcfIkdyNJM2RGcN6qaTTIm95Tbol/UdWAd28=;
 b=HDmnZeHXBnWxXwa+1wVNouuqnc0ofz4nKCVGN+SlOlHnpTR4R0oF5yGbLJv5IZO2Zo
 0LI9GHFd4FzYrPryyeJf6gKFo9TNQMNlcfzj3kptI/+E+NawCzaWiSP4UZiXoSOfk4Nn
 ZEz09QBwdK14sREre+ySU7zPd4nQLBt/2IuK5UgIOH0NzJ1MrO0um0xZ8hHCLNsOIVI1
 77s0P7oovJVH+ZHxedxnmb4bbhf18Mdhw/4vWyXS7QhyJSmdCNH7JUAXUcodtRAIX3+D
 AbN9TRDdJR5OV4EJHhICy+sQ2YWr+CAnGF/qYtsMg+fAbq2ICOE7gByXvBQqPy0CXV0w
 7Z1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HDmnZeHX
Subject: Re: [Buildroot] [PATCH v2] package/fscryptctl: bump to v1.0.0
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



On 22/07/2022 15:00, John Keeping wrote:
> Bump to a tagged release, pulling in about 4 years of development.
> 
> Note that v1 encryption policies have been deprecated and removed in
> this release.  Since the previous version in Buildroot is old enough not
> to have support for v2 policies, this is an incompatible update.
> 
> There are unlikely to be many v1 users and the format has some known
> vulnerabilities so no compatibility option is included.
> 
> Signed-off-by: John Keeping <john@metanate.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> v2:
> - Use a bare version for compatibility with release-monitoring.org
> 
>   package/fscryptctl/fscryptctl.hash | 2 +-
>   package/fscryptctl/fscryptctl.mk   | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/fscryptctl/fscryptctl.hash b/package/fscryptctl/fscryptctl.hash
> index b06b96c10f..d254af56ec 100644
> --- a/package/fscryptctl/fscryptctl.hash
> +++ b/package/fscryptctl/fscryptctl.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256 970a8febbcbf315313711d8a7ee3d954dea593d8087744d3cba65f6cb4bebcc1  fscryptctl-f037dcf4354ce8f25d0f371b58dfe7a7ac27576f.tar.gz
> +sha256 3828d5ad9b93664b9fec0174fc5d8e96d7b021a7896da74efe18fabe5f01d638  fscryptctl-1.0.0.tar.gz
>   sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/fscryptctl/fscryptctl.mk b/package/fscryptctl/fscryptctl.mk
> index 4275bf2b83..154af4d29f 100644
> --- a/package/fscryptctl/fscryptctl.mk
> +++ b/package/fscryptctl/fscryptctl.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -FSCRYPTCTL_VERSION = f037dcf4354ce8f25d0f371b58dfe7a7ac27576f
> -FSCRYPTCTL_SITE = $(call github,google,fscryptctl,$(FSCRYPTCTL_VERSION))
> +FSCRYPTCTL_VERSION = 1.0.0
> +FSCRYPTCTL_SITE = $(call github,google,fscryptctl,v$(FSCRYPTCTL_VERSION))
>   FSCRYPTCTL_LICENSE = Apache-2.0
>   FSCRYPTCTL_LICENSE_FILES = LICENSE
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
