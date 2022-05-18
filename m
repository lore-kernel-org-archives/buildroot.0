Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1020C433EF
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 17:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E66F41BFE;
	Wed, 18 May 2022 17:32:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iKDRGkiCTMxv; Wed, 18 May 2022 17:32:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 082F341974;
	Wed, 18 May 2022 17:32:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BFFFD1BF310
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 17:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE6D2832DC
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 17:32:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JwAByBcPYlTI for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 17:32:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B678283104
 for <buildroot@buildroot.org>; Wed, 18 May 2022 17:32:47 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id j28so3877834eda.13
 for <buildroot@buildroot.org>; Wed, 18 May 2022 10:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vbhWpRBIIeniHkiaLjTi4q9olW5z07ffvlT3LzIXMy0=;
 b=R+91pb7wem/tW3T44hkMhSEL0eCEI6dcfhsGVDEqIJwyop3HRWyosdsvX8XLPqy81G
 EYeEerUD+IdqlPytldMY9MecRWrATN2hhYLcblc1+hIUoZt6VlgGxS/CLtWZCrQghKpS
 uEKq9xlsZ16JT6j9MX5naJVO9monH6pvJ50K82qG/TUtYYT6ohvSFMUaPOqQmwIa7+UR
 /NaVxV+AAsbOhq8jIOqWF1U3LSX21WuVeF5QuLyxgCHkA8tGRQPIZumWoCsCOnHYpo15
 8w6N+l33JKdoUwq2KDa0t7tkD7U4aBjqFrCD5jjzJtjQxcJ18Vqu3xxAjtqBzUIQvgkh
 d/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vbhWpRBIIeniHkiaLjTi4q9olW5z07ffvlT3LzIXMy0=;
 b=q3lwymBPq2gTnwkTLm5pf6U9JZ8GS+mjyA0CJJUzCvaU9fUwDtY2kPKGyvcEy8atC5
 jtqW4AGGZw4gxexVVzc3JyqmMZ0g6/evdSBhFxn7KSxQMaZCnl0+UQj564V4d/9LsHbZ
 5GQzp1eq8rVff+nDqGzCDH2VO6UIA/SZzN3xYBfc3j0v39mBEQshkRC1KaI1uAOqdsSs
 fhKEWUiYhSg+D45fjNNeOl2UQ6fUFJG5qcjNOODK1Ix0V3T8/HP/TDRRXkPkQ2W/P0gz
 J0DyRaW0HXr7R9t/2zg5562A6CQwLwjnjwjbmWDQ6gOjAQz2IYWEFml9L34LK9mkByDA
 qQGw==
X-Gm-Message-State: AOAM530yXbNwZCh65Kx52BXT3i75LDf4mpD0WUupFxK+0BO8aJD9hQ42
 dDcP9C9RZYUTdxiqzzf4wS9FEA==
X-Google-Smtp-Source: ABdhPJw+z1kJX05nCH5X3EU1pXN6CPlvMWC50yXgklVbkXCBrNsmyvvjoGhFVd9BtMvA395f2j2G5g==
X-Received: by 2002:a05:6402:e9f:b0:41c:df21:b113 with SMTP id
 h31-20020a0564020e9f00b0041cdf21b113mr868602eda.217.1652895165850; 
 Wed, 18 May 2022 10:32:45 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 an10-20020a17090656ca00b006fc308e76absm1183036ejc.2.2022.05.18.10.32.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 10:32:45 -0700 (PDT)
Message-ID: <fb058cb0-4237-fe9d-fe3f-daca58d0a6db@mind.be>
Date: Wed, 18 May 2022 19:32:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Joel Stanley <joel@jms.id.au>
References: <20220510022055.67582-1-joel@jms.id.au>
 <a18d0411-9134-2ee7-62d0-4ba6a1780846@mind.be>
 <CACPK8Xem3ZS_fQdtcyO-wjeX43j+gW3bj0xmtxU4S5WVbtzXLw@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CACPK8Xem3ZS_fQdtcyO-wjeX43j+gW3bj0xmtxU4S5WVbtzXLw@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH] linux: Fix powerpc64le defconfig selection
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
Cc: Michael Ellerman <mpe@ellerman.id.au>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/05/2022 08:13, Joel Stanley wrote:
> On Fri, 13 May 2022 at 21:52, Arnout Vandecappelle <arnout@mind.be> wrote:
[snip]
>>    So I guess we should use a specific defconfig for *all* powerpc.
>>
>>    The arch-default defconfig is generally not really reliable, for example for
>> arm it always takes v7_multi, but that won't work for v7m targets...
> 
> I noticed that. It is similarly broken if you expected a kernel that
> worked on armv5.
> 
> Should we disable BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG for
> platforms that don't have a single defconfig?
> 
> The other option I considered was removing ARCH_DEFAULT_CONFIG and
> providing a default for platforms where we could suggest one. It would
> look something like this:
> 
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -176,10 +176,15 @@ endchoice
>   config BR2_LINUX_KERNEL_DEFCONFIG
>          string "Defconfig name"
>          depends on BR2_LINUX_KERNEL_USE_DEFCONFIG
> +       default "ppc64le_defconfig" if BR2_powerpc_powerpc64le
> +       default "ppc64_defconfig" if BR2_powerpc_powerpc64
> +       default "ppc_defconfig" if BR2_powerpc_powerpc
> +       default "mutli_v5_defconfig" if BR2_ARM_CPU_ARMV5
> +       default "mutli_v7_defconfig" if BR2_ARM_CPU_ARMV7A
> +       default "defconfig"
>          help
> -         Name of the kernel defconfig file to use, without the
> -         trailing _defconfig.  The defconfig is located in
> -         arch/<arch>/configs in the kernel tree.
> +         Name of the kernel defconfig file to use. The defconfig is located in
> +         arch/<arch>/configs in the kernel tree
> 
> It would need to change the option to include the _defconfig (in order
> to support plain old "defconfig"), or we could add some logic in the
> .mk to add _defconfig only if the name is not "defconfig".

  I like that idea! It allows us to gradually complete the list of defconfigs 
with better defaults. We could also add a condition after the "defconfig" to 
allow it only for the cases which are known to actually work (not much more than 
aarch64 and s390x, I think...).

  Note that changing it so that _defconfig needs to be added is not acceptable, 
because it breaks existing configs too much. We can easily work around that by 
special-casing the "defconfig" string in the .mk file.


  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
