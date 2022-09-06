Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA81ECAAA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 20:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5786260C24;
	Tue,  6 Sep 2022 20:01:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5786260C24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1GPUROx7x_yS; Tue,  6 Sep 2022 20:01:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CE8961186;
	Tue,  6 Sep 2022 20:01:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CE8961186
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2DCB91BF57C
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 20:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0732B41634
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 20:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0732B41634
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Ms-xeCZ_iQG for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 20:01:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD4374161E
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD4374161E
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 20:01:21 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id gh9so3809144ejc.8
 for <buildroot@buildroot.org>; Tue, 06 Sep 2022 13:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=+tYWRZmTuCAF1rd26HU+gm1z4nlbdd9mdiide81K+6Y=;
 b=TqvpYiq1NBdN9W05cYyrQpqueAoMrjXhc97hgv0uPrKNv1iNR+0iaxvrsUwh8eceU6
 ETYJE2ZzZ61UA8SEcNs9s0DEdHqCXTInjG0ksKXlZCeJW4RNFW8gURn8q5kWH+ou0Qrb
 kBAI3TOm2nZ+7smOJdVXmMg9aD4UEf+kB0yR3tEmSvNLbdaEJyB95/8363/IUhAMP4W6
 3fTlDc1WajJVfj91pTvElSgdFAjIBUPpeXpoktkcfWjWHpUfcIT3J07+dIb0ItVFdwjT
 M/GtIzdkXCf+WQ2tYb9RhzxboQ5hOmOmiTzJ6QoCeLpw5ALXy4sskaqeTJdHlQiHIbyD
 sTwA==
X-Gm-Message-State: ACgBeo3Bfpoui4ha8rOmYDH3a8fkUDD5tteuykDT6RWkhXtizS10t703
 guIlwyKvnvHiVyaJKOG1LqQnSA==
X-Google-Smtp-Source: AA6agR7NLADoTdO0Ivmz0oms6S4/0v37DwEGEkJEwdfb/Ffd9clcq9/1vy0znCdQ71lxAOLVHma/lA==
X-Received: by 2002:a17:906:11d:b0:712:abf:3210 with SMTP id
 29-20020a170906011d00b007120abf3210mr94657eje.292.1662494480039; 
 Tue, 06 Sep 2022 13:01:20 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a170906768600b00734b2169222sm7111682ejm.186.2022.09.06.13.01.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 13:01:19 -0700 (PDT)
Message-ID: <1ce8f038-cc05-6a04-6c3e-546718ece7c4@mind.be>
Date: Tue, 6 Sep 2022 22:01:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220824221424.395516-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220824221424.395516-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=+tYWRZmTuCAF1rd26HU+gm1z4nlbdd9mdiide81K+6Y=;
 b=BDwHGczliF6WKgV0VJIBv7GouSzwq1eqlxz3xp/kXIJA41omiIyZsjd3peIF5OKHph
 w/nKLF9QDMHsxidUlSvNQZHe6SGACbSpH7Ba9hwBjPpbAOyMZM+1lrUelWw4zWhehTfU
 e4j+0ZoU76wCl9NiUoasNtWZxGP9Pr187XT9goOiMkN5b3h+ldJbcYiNJWkJMvvUdGJO
 0sUnQ5InYjQVb+jNCBB5QKriI6gjt0Gkgm3tCkIruaWZgZeMkS+qOwQOkXwTEtV+qIb0
 dnu0FDolk/fCxTarP3eHLzfU5ZMV2FRsW+/UvlvjIfh+LsIEv8yTbV0u9u2AljSUeXvy
 4PTg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BDwHGczl
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: add mxs-bootlets
 custom handling
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



On 25/08/2022 00:14, Fabrice Fontaine wrote:
> Add custom cases to make sure that a random configuration with an empty
> git or tarball location for mxs-bootlets doesn't fail. It reverts to
> BR2_TARGET_MXS_BOOTLETS_FREESCALE in that case.
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/dcbeb73d152c79c18b1fa3bef3b4fa07635d7b36
>   - http://autobuild.buildroot.org/results/f61cf3fc58db9ded5ec42ebf4a9847584700698d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   utils/genrandconfig | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index 54146a99de..7fd17239c5 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -543,6 +543,20 @@ def fixup_config(sysinfo, configfile):
>           if 'BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT=y\n' in configlines:
>               return False
>   
> +    if 'BR2_TARGET_MXS_BOOTLETS=y\n' in configlines and \
> +       'BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT=y\n' in configlines and \
> +       'BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT_URL=""\n' in configlines:
> +        configlines.remove('BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT=y\n')
> +        configlines.append('BR2_TARGET_MXS_BOOTLETS_FREESCALE=y\n')
> +        configlines.remove('BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT_URL=""\n')
> +
> +    if 'BR2_TARGET_MXS_BOOTLETS=y\n' in configlines and \
> +       'BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL=y\n' in configlines and \
> +       'BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL_URL=""\n' in configlines:
> +        configlines.remove('BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL=y\n')
> +        configlines.append('BR2_TARGET_MXS_BOOTLETS_FREESCALE=y\n')
> +        configlines.remove('BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL_URL=""\n')
> +
>       if 'BR2_TARGET_OPENSBI=y\n' in configlines and \
>          'BR2_TARGET_OPENSBI_CUSTOM_GIT=y\n' in configlines and \
>          'BR2_TARGET_OPENSBI_CUSTOM_REPO_URL=""\n' in configlines:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
