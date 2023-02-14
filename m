Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE58C6379F
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 21:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B7EC60BD3;
	Tue, 14 Feb 2023 21:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B7EC60BD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QWmXHUVmWC2L; Tue, 14 Feb 2023 21:46:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB65060F99;
	Tue, 14 Feb 2023 21:46:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB65060F99
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A87BC1BF2B3
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 21:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F027408D4
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 21:46:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F027408D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tXb6DfL1J54j for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 21:46:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5944C40318
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5944C40318
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 21:46:39 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id jg8so43523604ejc.6
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 13:46:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CnbjcOopVAsRie40WmroehLFw5b/I/qBSTJrIlxXEwM=;
 b=0hhx1SRVuHU9+MyHPJGfkcI1S5gvOilURRZyBSQRYSUtV3kLeRggbd/Gx1MpDtRgJj
 N/82clKtbn5/1JB98yAUrUomGEpDPkJuFdn1DaIomO6cGDkHIIhyuyktJA5+M8jfeI7X
 Zsfmpf44pRcuhJgpqEjRLtGyRpo7x7IW8QL98iAqUohQ8onK2agpq7jVj2hKkvALp7jC
 zPXkEHsFuB1+KvuCKM/NcQLLW1L2T/nKUWUHChe1ViXqeiq08Tjdu1jbrl5TH/FJeBVA
 vUsnpBQeJfrRoZF1QxVU637ejioYri3o1C1EFrllvaqEPJfaNBfZiCDhdpF22YPij5Qm
 t3sg==
X-Gm-Message-State: AO0yUKW/D23//N/bbPO2zIudPIu5rwaremuYIqQ7FTmuqcMtVjohf6s9
 qqnYYB9mxxLUfJTGrw6ff6GO1EC7AelRA/GA
X-Google-Smtp-Source: AK7set9JHFHBKwlMeqjlcjA4nb/GVWWMG47JQV0rrbyh11VHIVuZt3988iHwsyAIkVGRxPwaBEmY8Q==
X-Received: by 2002:a17:906:bc92:b0:878:509f:798c with SMTP id
 lv18-20020a170906bc9200b00878509f798cmr3983903ejb.4.1676411197306; 
 Tue, 14 Feb 2023 13:46:37 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 y25-20020a17090614d900b008b133f9a197sm1019034ejc.198.2023.02.14.13.46.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 13:46:36 -0800 (PST)
Message-ID: <1f6626fc-12c0-d1f0-2a8a-2fa2fd0431b6@mind.be>
Date: Tue, 14 Feb 2023 22:46:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: ckhardin@gmail.com, buildroot@buildroot.org
References: <20230209231518.9458-1-ckhardin@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230209231518.9458-1-ckhardin@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CnbjcOopVAsRie40WmroehLFw5b/I/qBSTJrIlxXEwM=;
 b=V4OJ0boATda9Wt9J5a8BHttcKUrpz0jk2AFPhWaZlvthUQ9vKg7RHoipWLtLY/t4R1
 7Yt7IVKC+IZsKmUFgMbRweQyvzID4Rg4FbSTOOEf5n28iY6CbV+O4rV6gV4d2yg9Drny
 ls8KZe23Mzh6gTQJ3/JAbpd7W6sj5fufQfEBxSYeL7xJiahm2NXOLdD64Vn7HrXYs4DZ
 51egURB93lKIZvHz5fw0tjcS7FWxuMIRtXz01CDXwx45m7qokdOsqGZ3TNd4iAFtPLwE
 kYtj+neGvryI2fgfbMEtgXflcoBurtzog26lObpr6UJUoSQOCovR4tajielRUxLCeSyT
 +zfg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=V4OJ0boA
Subject: Re: [Buildroot] [PATCH 1/4] linux: create a scmversion file based
 on the custom repo variables
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

  Hi Charles,

  First of all, in patchwork [1] there are about twelve patches from you about 
this subject, but I think all except these four are superseded. Is that correct? 
Could you update patchwork and mark the old ones as superseded?


On 10/02/2023 00:15, ckhardin@gmail.com wrote:
> From: Charles Hardin <ckhardin@gmail.com>
> 
> When using the custom repositories, the archive creation will
> omit the source history to get reproducible hashes. This has
> the side effect of making the setlocalversion scripts within the
> builds to not create the tracking information as expected. So,
> just generate a .scmversion so that kernels will be labelled
> with where buildroot referenced them.

  This is less than ideal because it's completely different than the normal git 
describe output. In particular, if you first develop something in an 
OVERRIDE_SRCDIR (after applying patch 4) and then change the config to point to 
the exact same commit with BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION, it will create 
a completely different UTS_RELEASE string...

  I think a better solution would be to extend the git download wrapper with a 
hook that gets called in the git tree itself. E.g.:

LINUX_SCMVERSION_HOOK = ./scripts/setlocalversion --save-scmversion

  The same hook could then also be used for rsync. And it would be easy to add 
the same feature to barebox, tf-a, ...

  Regards,
  Arnout


> 
> For example (line wrapped)
> 
>      #define UTS_RELEASE "5.4.70-repo-version-" \
>                          "92c23d10d0031e0a13244a1a97e7530d3b53fc6e"
> 
> Signed-off-by: Charles Hardin <ckhardin@gmail.com>
> ---
>   linux/linux.mk | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 7645b5f507..0b27c8dee2 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -596,6 +596,20 @@ endif
>   ifeq ($(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL)),)
>   $(error No custom repo URL set. Check your BR2_LINUX_KERNEL_CUSTOM_REPO_URL setting)
>   endif
> +
> +# Create a custom scm version file to reflect the source version since the
> +# archive will omit source directories like .git to maintain reproducible
> +# hashes for the archives
> +LINUX_CUSTOM_REPO_SCMVERSION = \
> +	"-repo-version-$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION))"
> +define LINUX_CUSTOM_REPO_SCMVERSION_HOOK
> +	(cd $(@D); \
> +		if [ ! -f .scmversion ]; then \
> +			echo $(LINUX_CUSTOM_REPO_SCMVERSION) > .scmversion; \
> +		fi)
> +endef
> +
> +LINUX_POST_EXTRACT_HOOKS += LINUX_CUSTOM_REPO_SCMVERSION_HOOK
>   endif
>   
>   ifeq ($(BR_BUILDING),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
