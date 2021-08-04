Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57660C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 14:31:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F044160EBC
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 14:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F044160EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5E6C83AC1;
	Wed,  4 Aug 2021 14:31:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ovfBWTZ_30z1; Wed,  4 Aug 2021 14:31:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23FD68397F;
	Wed,  4 Aug 2021 14:31:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 74B471BF9C1
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 14:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63C868332A
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 14:31:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g3iry_na6pS6 for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 14:31:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BD8A8397F
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 14:31:08 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id g21so3812031edb.4
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 07:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bTqT5bcugQhtEFz7bjvXUZTtYZg5oPUgZzoVqTs4nas=;
 b=XZN+xsIAv+yCpmH12S3Fgbf/hOYvGTbcrSwmN/kvUe9LcJS7yzQnKEkmnoZ4q82Dfz
 3b2xyOigVK+m/PSZsHuCMKdLtVIPZsS6R8VtfeA578Wb7lsFtJZ495IITjcxTnT9cYqf
 BTXCxiUbdf71M1nT6QBxbeNtuzNsix1/WI/tbSh+cm6Px16c7DX9vyc3s2gxvT94HiOT
 gu2Zk/0ZsNUu+RVo3Oc47HNDZ58KvKo5HUM73J1E8GCan/oCUw9PhjpeLySKATtKm6XY
 PH3ES9CjybWrIgDAQ6kjE+t9crpt+BvEMwtqECxdoTfV4DgzyD0lro/yQ8shKqZ4Ca0g
 v2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=bTqT5bcugQhtEFz7bjvXUZTtYZg5oPUgZzoVqTs4nas=;
 b=FimGdwCO2zNNEuz27Nig6gLQ19rCVcX1REFKtsceDJJnf6eaeb0fzfr4stvTY8RJtd
 v489Zvinq5VvhdsD7lO9mMIMptiax2FS3pXnNwsBXLDgbdK4eGkNGmpkGnza+y6JyuVw
 gUM6V5uZ/pnpZHXfL69hAxPGScAAzvA0lVrLO+ykd06+pQaiHib6/bCruJXVFVlLB6ip
 92cKI6zNwceXXB4TwR/LSsqhsr99GqlBEAp3ie2MO+vYiAwyyyLVQez1cqyUoKSDRCj3
 HthN+dRxDdNMLfldp/kgtUUvU2KVp5hZcYn5urwVXH8x8Hk7InxsHlkR34pAcm/xL8cy
 KKaA==
X-Gm-Message-State: AOAM531rWbgbZsUDHJOIbQMCzbAmnukLKElz2jKkVC35OcqpX+rO3aey
 KVC5dFw70vC5+wpIKooCtg6mMQ==
X-Google-Smtp-Source: ABdhPJxixoIpxf5EJPpa0J3SdavsB6uykt8JtHTirHtMFH0RwmXzYkY4ubivKnYQIt1VytZ6yXkx/A==
X-Received: by 2002:a05:6402:b83:: with SMTP id cf3mr46161edb.12.1628087466301; 
 Wed, 04 Aug 2021 07:31:06 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id s7sm905074edu.23.2021.08.04.07.31.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 07:31:05 -0700 (PDT)
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20210617091456.272611-1-nolange79@gmail.com>
 <20210617091456.272611-5-nolange79@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <682f3d33-c5ab-b8b2-2dd4-d5f59c360a6c@mind.be>
Date: Wed, 4 Aug 2021 16:31:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210617091456.272611-5-nolange79@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v4 2/3] package/zstd: Change Build options
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 17/06/2021 11:14, Norbert Lange wrote:
> Disable the legacy format, these are just needed for
> decompressing files created with pre-release version.
> 
> Use Buildroot's setting for optimization, zstd's build system
> overrides CFLAGS, but MOREFLAGS can override again.
> Quick tests show that using -O2 (like buildroot)
> is actually a little faster than -O3 on x86_64 Atoms.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

 Applied to master, thanks. I just rewrote the commit message a little (in
particular, the subject line gave no indication that this patch is actually
fixing something).

 Regards,
 Arnout

> ---
> v2->v3:
> *   Remove ZSTD_OPTS_MOREFLAGS variable
> ---
>  package/zstd/zstd.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
> index 5674e85bfe..58b0d0099e 100644
> --- a/package/zstd/zstd.mk
> +++ b/package/zstd/zstd.mk
> @@ -13,6 +13,7 @@ ZSTD_CPE_ID_VENDOR = facebook
>  ZSTD_CPE_ID_PRODUCT = zstandard
>  
>  ZSTD_OPTS += PREFIX=/usr
> +ZSTD_OPTS += ZSTD_LEGACY_SUPPORT=0
>  
>  ifeq ($(BR2_PACKAGE_ZLIB),y)
>  ZSTD_DEPENDENCIES += zlib
> @@ -35,6 +36,9 @@ else
>  ZSTD_OPTS += HAVE_LZ4=0
>  endif
>  
> +# zstd will append -O3 after $(CFLAGS), use MOREFLAGS to override again
> +ZSTD_OPTS += MOREFLAGS="$(TARGET_OPTIMIZATION)"
> +
>  ZSTD_BUILD_PROG_TARGET = zstd-release
>  
>  ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
