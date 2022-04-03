Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C133CC433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 15:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A78E4055D;
	Sun,  3 Apr 2022 15:03:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J9S6XJW48F3z; Sun,  3 Apr 2022 15:03:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 750644048C;
	Sun,  3 Apr 2022 15:03:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 794201BF96B
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 15:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6783660E1A
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 15:03:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ihS3VboAsoVw for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 15:03:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FED060E09
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 15:03:04 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id ot30so5205583ejb.12
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 08:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Am5vesjOVZmb9KuCxxCXaypgyUlsY/aLqnS8Chh9vlw=;
 b=d0wFM/YPmBrgchmDdboqg5YfYMNQiAL0lrmSzGwfZINofG8n4ituTX5qnNpgLffaHm
 J5/1hHnOK0LseDTj4GyFDppQIzhc5Q1YpsGtwnWm5dI40BpGDCbjsZ8NeK3Qkflho1df
 jz3+vcHNsSJUB4oML3sVfX4N8xbBnKeNuCMZeePZjAeBWvAQZKX7fM26tZ5ufYvX+PTT
 jifSsODASagcx5nM1Di5eo7bdWG6rx9G2c83ZszKLOZNq+UMSrepu2GfCJ/PLC1OurL2
 hEmAJcAi7Z7ayUbwW8ATUg3iSdaFMAKSbM9YSrC9pPAYBFMJBrrO6M7/lUutqfo2sScy
 IqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Am5vesjOVZmb9KuCxxCXaypgyUlsY/aLqnS8Chh9vlw=;
 b=ockmk+lJ130W5ur4jQ1kbzyPJ7GyX+vflUieFs81k0ICqB4u9dij1iCYrmcIUhuSki
 VFQPrRSvebHYtBQGIg0Vq3jWaiLSs8cw074Z8wWDa3lHqxE09PukcAynMHHKWnBP/P9G
 08AU2OSFSJU82u/vA2aasvsMd+E5dKAz7utO6ao9Gx1jk2t8SQcERrDHS42N5k/gCUTn
 t//XGsNp3DyJX8WTEgy7Swm8djM3j06W4P31EcsawtO200tSzCiXoQyMCoJ4+xI192d3
 Vx42GSRdn0MW44/RLJojUe76FsRtE4kiW41GsZYiKBNIgnlmGN9CUcWNvbxmq/bb+GAx
 +/XQ==
X-Gm-Message-State: AOAM530ZWFqNMQO1PRAuNqb1k6HKth2zFQJYBRVRKCJoCDikZfDDPMPu
 qxt9W2tIEnonUuMc529SChrD/w==
X-Google-Smtp-Source: ABdhPJwlNxt5BfbN45UKUjy9IPu5MnurW4+6rLNsWgSWjrKgjoQntTWPBYuM82XvkBj9XFUr+GJejA==
X-Received: by 2002:a17:907:6d15:b0:6e7:7c12:b06d with SMTP id
 sa21-20020a1709076d1500b006e77c12b06dmr3320629ejc.594.1648998183308; 
 Sun, 03 Apr 2022 08:03:03 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:68f9:c8ef:77ab:7425?
 (ptr-9fplejof7ird5pjql2d.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:68f9:c8ef:77ab:7425])
 by smtp.gmail.com with ESMTPSA id
 bp10-20020a170907918a00b006e7f1e7d1dbsm174835ejb.54.2022.04.03.08.03.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Apr 2022 08:03:02 -0700 (PDT)
Message-ID: <6bc40b55-9462-041f-ca77-29a58dbfe225@mind.be>
Date: Sun, 3 Apr 2022 17:03:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220329184458.289902-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220329184458.289902-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/nbd: needs host-bison
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/03/2022 20:44, Fabrice Fontaine wrote:
> host-bison is mandatory to avoid the following build failure since bump
> to version 3.24 in commit bf2e459bb9fc9fe57147313cda35f7022172e6e8 and
> https://github.com/NetworkBlockDevice/nbd/commit/cd099ee7d0602104506bdd5063c0a3db2ec9b550:
> 
> configure: error: bison is required
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/05872813c9e9b9f39f960fa9a33ad82dc124c808
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/nbd/nbd.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
> index f0fb23910e..50f698dd24 100644
> --- a/package/nbd/nbd.mk
> +++ b/package/nbd/nbd.mk
> @@ -8,7 +8,7 @@ NBD_VERSION = 3.24
>   NBD_SOURCE = nbd-$(NBD_VERSION).tar.xz
>   NBD_SITE = http://downloads.sourceforge.net/project/nbd/nbd/$(NBD_VERSION)
>   NBD_CONF_OPTS = --enable-lfs
> -NBD_DEPENDENCIES = host-pkgconf libglib2
> +NBD_DEPENDENCIES = host-bison host-pkgconf libglib2
>   NBD_LICENSE = GPL-2.0
>   NBD_LICENSE_FILES = COPYING
>   NBD_CPE_ID_VENDOR = network_block_device_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
