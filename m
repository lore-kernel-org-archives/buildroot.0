Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F14EC77B61
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 13:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B138E403FD;
	Sun,  9 Apr 2023 13:39:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B138E403FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rCNQD2G_2ZFA; Sun,  9 Apr 2023 13:39:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F02D4014E;
	Sun,  9 Apr 2023 13:39:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F02D4014E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 77FFA1BF82D
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 13:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FD3C415F8
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 13:39:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FD3C415F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0SRLs5gmOtK0 for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 13:39:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6933E415EF
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6933E415EF
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 13:39:50 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 gw11-20020a05600c850b00b003f07d305b32so2588027wmb.4
 for <buildroot@buildroot.org>; Sun, 09 Apr 2023 06:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681047588;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T3zg1knCi8FXiGowkqJQftQF5W+hyCjf54U0Pq2U+Ek=;
 b=J5XsGmhLDFWbzXXQ7Q+AQTOpEz+IA1iIC4wnZ94/FrU7IELtqO9ee7VgPUlsXRkXnD
 7DZHNbF+j2WbQ4ix4Q2fUzkJJP8SgqWL/eu/cAEuspR0b/NOYfB0Ojw7hCQ1uzm51Gao
 ZonjeCJAxYbaUc2MRHsomNMS1rbJ99qJKFN4AfDgnYQXrmULltKVMoNdod9EtiLEYY3T
 Ox/bSU5Tr0DLXfXhdU2/2oGa8r4tofqVqUxWDhME3F6BuTBCGMLRFg6IOq7a4Tq0XakA
 oAiceFxSRRmP9lfdLoZl610AeLy0YseT/UyTFSjaSTuDvuHIz/XVcOlByRiRglmMWdAx
 m8fw==
X-Gm-Message-State: AAQBX9dy7H/TER+MhArilw312DQqAri3t0Gb1sNikBnrplqEntE5NnvW
 7AzJlcKYAiwtR3XKv830Lih+lNvwW/quPj03Zpw=
X-Google-Smtp-Source: AKy350YIvJ8CVyMwVQg+AKlc08D42kp0WGI7mt1931QYwhbKwhfbduBCBq/UGVYvgMh2CMkkBHLiqQ==
X-Received: by 2002:a7b:c8cd:0:b0:3ed:ff92:dd2a with SMTP id
 f13-20020a7bc8cd000000b003edff92dd2amr3127713wml.12.1681047588568; 
 Sun, 09 Apr 2023 06:39:48 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a5d58e8000000b002de9a0b0a20sm9161748wrd.113.2023.04.09.06.39.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Apr 2023 06:39:48 -0700 (PDT)
Message-ID: <66399822-08e6-bf68-f8c3-02d061fa938f@mind.be>
Date: Sun, 9 Apr 2023 15:39:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20230408135535.246758-1-dario.binacchi@amarulasolutions.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230408135535.246758-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681047588;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T3zg1knCi8FXiGowkqJQftQF5W+hyCjf54U0Pq2U+Ek=;
 b=WPVU/PWHBSmLuS1a26tHH5fYuF97hXOsQwJyDMfq1miAClXdlHR7g1vq2D9VkSiRFn
 yM/ydOE7ukuIhkUFsjpUAUOMPL+vbBiczJhT+TpxLUiROHwb4SZn0tNVY31r0jVSVChJ
 G8SDqWl51Mx86MAk98We9cRJqZzb9MgAW4/23iP0iAViI7TbpraA1dx9wzGUayWQ56Ex
 9p1/STzCPQenCjmVXsQ3yocGhrf86OoKribogKzDV1Ox2ZuOweHf2lz/8oiKbZhHfUOX
 T2B4CE33XrfodHz2gWt8b48B793nkZzuR+NtuoUMDhH0a7VuiNMMBJH6jtbQLs631SOO
 R+jg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WPVU/PWH
Subject: Re: [Buildroot] [PATCH 1/1] configs/beaglebone_defconfig: bump
 Linux version to 5.10.162-ti-r59
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
Cc: Lothar Felten <lothar.felten@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/04/2023 15:55, Dario Binacchi wrote:
> Tested on beaglebone black.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   configs/beaglebone_defconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
> index c2d444c3ce6d..3e7ad8d4027d 100644
> --- a/configs/beaglebone_defconfig
> +++ b/configs/beaglebone_defconfig
> @@ -20,7 +20,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beaglebone/genimage.cfg"
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,5.10.162-ti-r56)/linux-5.10.162-ti-r56.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,5.10.162-ti-r59)/linux-5.10.162-ti-r59.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-wireless am335x-bonegreen-wireless"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
