Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB0CC43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 19:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2D0F4098F;
	Mon,  6 Jun 2022 19:45:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GT6hf3CM4CkE; Mon,  6 Jun 2022 19:45:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCF4940116;
	Mon,  6 Jun 2022 19:45:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 87BC21BF2B8
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 19:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76A3981D5A
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 19:45:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cUAidaMH7tdy for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 19:45:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15F8681C20
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 19:45:47 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id v1so20271156ejg.13
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 12:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=+NTdOvYu/tunevBbg2mZ45BEKqE7G7fpIEmtsleLqhw=;
 b=dFquHkzSvrXarHpXF0MbjYaJXX6kM9sbFYXU7XpQIVAts/NnEjiRaIsCFKYgal5ik3
 DhH64NI+4CFSQxfyPsSpZuU3yPYwdlOmRWodOs/3eOAXheQB+gi81O2grxsZG6QW93wI
 r3rUssANx+0KWyYZrd/BQvKCo5MxHPsZioOrbnlB5vrFrhQmvbMPY1sImUpZqaXOdEB8
 z4E+6DSy4jbdBUCYBAxmzFtm6Tv+6qbB5ZxtdIB0cvdwFfbJVkkib/X71UIjfZ/ooNYZ
 WC3emZ3CErHKFzNYIXCAXxYAU9HINKaV83hupKu70Zz5VlBS+7dSslD0CPn3798dZmz/
 UhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+NTdOvYu/tunevBbg2mZ45BEKqE7G7fpIEmtsleLqhw=;
 b=YP1mfQgHjB1b4PBYlq09yGHVcASKGsqQQjhTNMsRncooK89cd15VGAiLx5i48XwCZ+
 kUwIgpxhSjDpFFz2eL+/hWXT0Jl67XmD7NFwofyBOdZUMMbbYb3fIJksviD1hEta7EoM
 sGoDxXb184JMfwgkB1cvKtc7YMjXOA03scURbxSjSGRahFGLVgK8/XVpDby2EnXYJNVO
 hXpIlX8FbOfJ12JtvJ//J6QFhzv5kxRswA3x/BnCmrBL5hfnkVJKvvds8p9Twm+ZM0C9
 lzcoATal0jw5uTqGR/9Vowjo5UfJws4NXp0++XsaptJL3949t7A3T+r9yJszR+JpnJRf
 ZIMQ==
X-Gm-Message-State: AOAM531Tzf3dq3epb/Y27530i52yp0OnmMxivzIrkgiGXu7Tc0fMM7Em
 RyW3wTuiN4GJoKMQ8o+44cempQ==
X-Google-Smtp-Source: ABdhPJw/nR9zYO+qwtplLBCutJW9zUnVZj6E9OsqaW/WFjZYDFC4hSu9A3xwdZQIruHakXY1DVIHdg==
X-Received: by 2002:a17:906:9753:b0:6fe:dece:982a with SMTP id
 o19-20020a170906975300b006fedece982amr23362254ejy.560.1654544746105; 
 Mon, 06 Jun 2022 12:45:46 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a05640240cb00b0042e17781fc5sm7683747edb.49.2022.06.06.12.45.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 12:45:45 -0700 (PDT)
Message-ID: <7f5bb944-bcd3-dc62-43ea-1b8b15ed0126@mind.be>
Date: Mon, 6 Jun 2022 21:45:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220606163451.1510892-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220606163451.1510892-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] boot/at91dataflashboot: disable on armeb
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



On 06/06/2022 18:34, Fabrice Fontaine wrote:
> at91dataflashboot fails to build on armeb:
> 
> /nvmedata/autobuild/instance-6/output-1/per-package/at91dataflashboot/host/bin/armeb-buildroot-linux-uclibcgnueabi-ld -T elf32-littlearm.lds -Ttext 0 -n -o DataflashBoot-1.05.out objs/cstartup_ram.o objs/at45.o objs/com.o objs/dataflash.o objs/div0.o objs/init.o objs/main.o objs/stdio.o objs/asm_isr.o objs/jump.o objs/_udivsi3.o objs/_umodsi3.o objs/led.o
> /nvmedata/autobuild/instance-6/output-1/per-package/at91dataflashboot/host/bin/armeb-buildroot-linux-uclibcgnueabi-ld: objs/cstartup_ram.o: compiled for a big endian system and target is little endian
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/e44c042abc1dfb97b4f8a17389d27f842e9dd311
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  I guess that at91dataflashboot really could be used on big-endian platforms as 
well. However, this is a very dead package, and nobody complained about it 
before. Therefore, applied to master, thanks.

  Regards,
  Arnout

> ---
>   boot/at91dataflashboot/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/boot/at91dataflashboot/Config.in b/boot/at91dataflashboot/Config.in
> index 4055f96410..8b37d84409 100644
> --- a/boot/at91dataflashboot/Config.in
> +++ b/boot/at91dataflashboot/Config.in
> @@ -1,3 +1,3 @@
>   config BR2_TARGET_AT91DATAFLASHBOOT
>   	bool "AT91 DataFlashBoot"
> -	depends on BR2_arm926t
> +	depends on BR2_arm && BR2_arm926t
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
