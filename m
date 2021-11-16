Return-Path: <SRS0=m+kO=QD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E1B7C433EF
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 20:07:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDFFA63215
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 20:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EDFFA63215
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD17480F64;
	Tue, 16 Nov 2021 20:07:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mq-0CVKIxlRo; Tue, 16 Nov 2021 20:07:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1976E80F62;
	Tue, 16 Nov 2021 20:07:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B7DF41BF3D1
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 20:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6586404B8
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 20:07:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PihEfoxj_kSm for <buildroot@lists.busybox.net>;
 Tue, 16 Nov 2021 20:07:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AEC6E4044D
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 20:07:39 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id r11so104540edd.9
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 12:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=CTpedkb8SgChhZFP1c8fPh1OUVm1cjdp4RgLSa2vDK4=;
 b=dC5/XnD7uzJLG7ibSV3yyF0++UkJMaTPnz+tZmBrNYuchClXgBfIMafSOkuf3bCsFG
 kxpmAA7dzxbw8fT1ENUPGSqvmASbYk+hpEAEFdO9wG0trM5bn5HKm6EIv97XbrrrqJ89
 T2dAB2JhXW8sjWUiqjS1GGAlKMgvcRHCvifIfwKKE4YiX+R9SrKvv7tM/ghS+H0Ggm6G
 AkNVLv9qTCuW9nwIKVRaFf6L9RSPKie0SPJg057Fx/6ZVzaMCw0MYhrSxcw219A8jbE3
 gsn4M43yRJuusTaJCkkJr4pUD9+VDFuP2Zbcjp1YSRNDHMY6h38YxMxZh2rKQq0mKL1O
 Xozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=CTpedkb8SgChhZFP1c8fPh1OUVm1cjdp4RgLSa2vDK4=;
 b=Aci42Nj9CyzN+OpCQoKy3O/ya+u8sQnTPIgG96okO33UBMoV+NqAYSzB9DzJ/UGzl9
 fLFkCyX8sbUH8uzHZgKOYltmunJjngts2Y7zOmLAK75+IGr/VNnrDmNWr8v7UKrYMRju
 bK7Axg4lF2wat47luXr+VVTdVTL0BWcYi6gMAh47KfJOBKwuUVNz6AabFHxom8hqwQeS
 2VTKKcyzDGGkNonG1Af9t9IJOzySjUMV+oJOdDE7eEB24gUjurhvs1WzUjcmfoCzQAOe
 ucrSyuXwQ+/6u2QBVBvhKd+VVMYJtAkUefvZY6AiItKUIgCsRV1VgN1geF5JIvyOwrvp
 oOLg==
X-Gm-Message-State: AOAM531bxRFrKotlzbVic3G2rS7t9qyDzs7fM/ayRUGxVzzV26cnpxbl
 0ykLf/pl13/Zk6rSTzJ2w9WgcA==
X-Google-Smtp-Source: ABdhPJxFgQ0NS8iBSgyLTIYTMor4P0dnQyw5K5dhIec7cltgPFm9TNqI2B4r8QisTVOvtj2XLW21/A==
X-Received: by 2002:a05:6402:4242:: with SMTP id
 g2mr10853792edb.158.1637093257785; 
 Tue, 16 Nov 2021 12:07:37 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id c11sm1679788ede.32.2021.11.16.12.07.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 12:07:37 -0800 (PST)
Message-ID: <e040d219-9507-4923-acf0-74e7d635e3ca@mind.be>
Date: Tue, 16 Nov 2021 21:07:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211114144709.1559207-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211114144709.1559207-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/janet: fix static build
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



On 14/11/2021 15:47, Fabrice Fontaine wrote:
> Fix the following static build failure raised since commit
> 0ddb20c3adba8a9512caa7249cff8b43828c44e8:
> 
> /home/giuliobenetti/autobuild/run/instance-0/output-1/host/bin/xtensa-buildroot-linux-uclibc-gcc  -o janet janet.p/meson-generated_.._janet.c.o janet.p/src_mainclient_shell.c.o -Wl,--as-needed -Wl,--allow-shlib-undefined -Wl,-O1 -Wl,--start-group -latomic -lm -ldl -Wl,--end-group -pthread
> /home/giuliobenetti/autobuild/run/instance-0/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: /home/giuliobenetti/autobuild/run/instance-0/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/libgcc.a(unwind-dw2-fde-dip.o): in function `_Unwind_Find_registered_FDE':
> /home/giuliobenetti/autobuild/run/instance-0/output-1/build/host-gcc-final-10.3.0/build/xtensa-buildroot-linux-uclibc/libgcc/../../../libgcc/unwind-dw2-fde.c:1043: undefined reference to `dl_iterate_phdr'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/d6cd842bd156abe3d77b72a7a108a5233fa19e20
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/janet/janet.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/janet/janet.mk b/package/janet/janet.mk
> index 71e9e08e62..b00f82846c 100644
> --- a/package/janet/janet.mk
> +++ b/package/janet/janet.mk
> @@ -17,7 +17,7 @@ endif
>   
>   # Uses __atomic_fetch_add_4
>   ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> -JANET_LDFLAGS += -latomic
> +JANET_LDFLAGS += $(TARGET_LDFLAGS) -latomic
>   endif
>   
>   ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
