Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 060A0C432BE
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 20:20:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 695426103B
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 20:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 695426103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E25F400EE;
	Wed, 25 Aug 2021 20:20:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FTNX127Ns7Tz; Wed, 25 Aug 2021 20:20:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EFCD403BD;
	Wed, 25 Aug 2021 20:19:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 62D421BF335
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 20:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5242C80E70
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 20:19:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dDMAOR-c-7rJ for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 20:19:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3449C80E61
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 20:19:52 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id d6so931777edt.7
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 13:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:cc:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sAUIHtH/jQHQupadHH9mzNnyI5xveuiAIW1S6IFcSk8=;
 b=di86w8LWt6/07zCqTqUsTU0vh31UzRV6cyavj1MEMx/+QUruvL9wCTtQLv32aUDJ8S
 KolZqM33zdB1OBp4dt5qViAGXRJp3AF39oKlE37sHlFtQLxVh/IdxYu9peTLe75ksjsg
 GFvK17b8gmX1YD1XCXtmuWQCoP193FZH15Jg5HsPxW/Gkt3o9p+6IE/uK/m9tzLGF3vE
 9EjDatxuYJZBLPga5DtHD3rQZJxHB1bVQmNGb58EdIgLS6ht+nsgx1csE1hbCIAYs/y9
 npboC115e0YcAh1r7ImpIzj/PVwVbD8MXDSRzPZGlATEmS75SCGZBBBes+QWU2o+6j+1
 aFQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=sAUIHtH/jQHQupadHH9mzNnyI5xveuiAIW1S6IFcSk8=;
 b=hgwT/ChmWFv1s7KHFeOYEWmRejOya+NGL6Oo7VmAa0p8+sWv1jieywHEUQyRGnicCq
 JKfUXIqZDBxm1Yi2+V45jKotCQCh7+INemEwWL9SrTH2t6sCbT2bK1GEATkMhOsObLib
 FuebhYVHRSgG1Ep3Wml2UvVxvA5PLAv7/LXQWmx2mi6UVjr8hbwfmwG/aV4teqxsNhV9
 J1I6rhgfT7mxW1zX5+olR9ueVQfpQZDeASFcXs0sgtEXNEaSJrXV58c2iObAOrVXRyoI
 nUu2xJ6lhtpZJLP/NjKnpscYULAzBanwtw+Tq9s64sFkT90YOgklijdCvJBNRPQ8JPmZ
 POIQ==
X-Gm-Message-State: AOAM532BsecptaqycUtccpTak67Od5At6ToD+JjNilDCnERm2wYV7AS+
 PJrA6qxAJtuGhENwksHfgP8QTYaL0HQ+tg==
X-Google-Smtp-Source: ABdhPJy6NXc9bdMkK3qpUhHTikLcfm6Ib3hkCpubODygvA6zh0fS2qm9i/LGa6fCFRNiSAprakGvqw==
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr344370edd.63.1629922791249; 
 Wed, 25 Aug 2021 13:19:51 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h30sm545305edz.40.2021.08.25.13.19.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 13:19:50 -0700 (PDT)
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20210825192014.1203727-1-romain.naour@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <dca43476-ea86-85e5-9e97-5f8d985cdfbc@mind.be>
Date: Wed, 25 Aug 2021 22:19:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210825192014.1203727-1-romain.naour@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH] configs/beaglev_defconfig: update
 linux-headers to 5.13.
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
Cc: Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 25/08/2021 21:20, Romain Naour wrote:
> The beaglev kernel is based on the 5.13 branch, update
> the expected linux-headers version to 5.13.
> 
> Fixes:
> https://gitlab.com/kubu93/buildroot/-/jobs/1525740895

 Gah, this has been wrong eer since commit
9a1bd7cc1ce512672a5d76baa86c449e36137052 which I applied (and I didn't notice
even though 5.13 is mentioned 3 times in that commit...)

 What I also don't understand is how nobody else noticed before, while there
have been 3 other commits to  that defconfig and this still wasn't noticed...
Drew, I guess you do your tests with an external toolchain rather than with the
actual defconfig?

 Regards,
 Arnout

> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  configs/beaglev_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/beaglev_defconfig b/configs/beaglev_defconfig
> index 82a6e9abc4..70459bf3e8 100644
> --- a/configs/beaglev_defconfig
> +++ b/configs/beaglev_defconfig
> @@ -4,7 +4,7 @@ BR2_RISCV_ISA_CUSTOM_RVM=y
>  BR2_RISCV_ISA_CUSTOM_RVF=y
>  BR2_RISCV_ISA_CUSTOM_RVD=y
>  BR2_RISCV_ISA_CUSTOM_RVC=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=y
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/beaglev/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beaglev/genimage.cfg"
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
