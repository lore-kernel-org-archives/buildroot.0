Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE9FDC433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 21:23:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4236361168
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 21:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4236361168
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE13A40121;
	Wed, 22 Sep 2021 21:23:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p6Y4UeBtGhp9; Wed, 22 Sep 2021 21:23:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E39D24047E;
	Wed, 22 Sep 2021 21:23:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0AE501BF2F7
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 21:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07BA76148D
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 21:23:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kRtzVYqma95E for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 21:23:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC1B16077B
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 21:23:10 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id dj4so15418758edb.5
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 14:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tLdy1eZr2XAQB+72oQ7cFjvQPofUfElu9x6i6sKub24=;
 b=dBsXAiBeGAhDYvlZeeUSp5SbgB6f5b2a8C1IKE0zy5dGzaa493fXsa5G5SqdVc1Eiv
 Upba1S6i1UoSV7EQlXp0PmJoIWmlU7jkd43KebF5uMK+UcWygXXrcFYV+HTC4hQzbl6L
 KOplrKRO75tkNNrlerbGxI2B5YWIrvyarKbUQJxLaYfZoRPRE0bNIbPc7vw63D/pWBQo
 ut8BMy2dzkYmwZSosGfJ6E5crQ99tTySvz+RF8jtoIqsEtuNiT2TwNOwuJJE7+0OHWwu
 UTSOyqSTKBfOdEguBgfECory4EK4uodIy725oUGhTQ53A2t2QV9N7UPIiwBR4/GO5j/o
 A1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tLdy1eZr2XAQB+72oQ7cFjvQPofUfElu9x6i6sKub24=;
 b=YG774pOlYBe2zJKwp+HVJf77KI9G9BOUPGLXIlNIyrOJlBaSVxXfmcikKxUTwl2yi1
 MSw3pg1FRQkSW65iCcz2gvSKqsLNbjiGgEQ3E9C5/4z3qoOALW3A4QNQ+9o1V+G43TPN
 jfpJ/+wr6xMmRRElbULckuEUyY/vb40oDaCWfVSbe5MmngfT1WvRFjGN4CDwAt766lXQ
 6OBII8qLTTVUUtXs1Wqo29M/ZpnwqmTnKAirWN14YBV21bB5nvXcD1GjnHrJWsuFowlU
 OebBbU+3833vYr6e4Ig9GwzgzcjpyZofbkegr1T96AGzPbcMPLvV2g/CXE9v6CWt20Fn
 Ye1Q==
X-Gm-Message-State: AOAM533AYTajOSyumGACWGFITeJghQC0E+b0ZpodrzNAUp6gs9I+lR5b
 d8NiL4tU3r5kRdoXaQyCFL2PxDbJkuujWg==
X-Google-Smtp-Source: ABdhPJzPkV31ne6hSsSmdD3MlaPvJCJfXI0yjFmUIp1IDs3dXI/D4diZJAUY3+qoCB714ljUNWrwZQ==
X-Received: by 2002:a17:906:a012:: with SMTP id
 p18mr1447333ejy.331.1632345788792; 
 Wed, 22 Sep 2021 14:23:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id r22sm1588372ejj.91.2021.09.22.14.23.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 14:23:04 -0700 (PDT)
Message-ID: <bda2bf67-a20c-f793-1d1f-024095091a38@mind.be>
Date: Wed, 22 Sep 2021 23:23:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210914211501.403653-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210914211501.403653-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/uboot-tools: fix static build
 with musl
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 14/09/2021 23:15, Fabrice Fontaine wrote:
> Static build with musl fails since bump to version 2020.04 in commit
> fe97212976ea0b2a80fe1e076ad17d6f648cd1de because LDFLAGS, which contains
> -static, is not passed resulting in the following build failure:
> 
> /tmp/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-musleabihf/10.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: /tmp/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-musleabihf/10.3.0/libgcc.a(_dvmd_lnx.o): in function `__aeabi_ldiv0':
> /tmp/instance-1/output-1/build/host-gcc-final-10.3.0/build/arm-buildroot-linux-musleabihf/libgcc/../../../libgcc/config/arm/lib1funcs.S:1499: undefined reference to `raise'
> collect2: error: ld returned 1 exit status
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/d71aba27ff0c7711f2cb67261183506f25217a5f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  What's the upstream status of the patch?

  Regards,
  Arnout

> ---
>   ...ix-C-LD-FLAGS-with-CROSS_BUILD_TOOLS.patch | 34 +++++++++++++++++++
>   1 file changed, 34 insertions(+)
>   create mode 100644 package/uboot-tools/0003-tools-Makefile-fix-C-LD-FLAGS-with-CROSS_BUILD_TOOLS.patch
> 
> diff --git a/package/uboot-tools/0003-tools-Makefile-fix-C-LD-FLAGS-with-CROSS_BUILD_TOOLS.patch b/package/uboot-tools/0003-tools-Makefile-fix-C-LD-FLAGS-with-CROSS_BUILD_TOOLS.patch
> new file mode 100644
> index 0000000000..502458e219
> --- /dev/null
> +++ b/package/uboot-tools/0003-tools-Makefile-fix-C-LD-FLAGS-with-CROSS_BUILD_TOOLS.patch
> @@ -0,0 +1,34 @@
> +From 3b89170333ef0fdfffee14751ce3e1d66d7dfa00 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Tue, 14 Sep 2021 19:08:02 +0200
> +Subject: [PATCH] tools/Makefile: fix {C,LD}FLAGS with CROSS_BUILD_TOOLS
> +
> +When CROSS_BUILD_TOOLS is set, set KBUILD_HOST{CF,LD}FLAGS to
> +{C,LD}FLAGS otherwise CC will be used with HOST{C,LD}FLAGS which seems
> +wrong.
> +
> +It should be noted that, for an unknown reason, overriding
> +HOST{C,LD}FLAGS don't work.
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + tools/Makefile | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/tools/Makefile b/tools/Makefile
> +index 4a86321f64..98bb92990d 100644
> +--- a/tools/Makefile
> ++++ b/tools/Makefile
> +@@ -316,7 +316,8 @@ subdir- += env
> +
> + ifneq ($(CROSS_BUILD_TOOLS),)
> + override HOSTCC = $(CC)
> +-override HOSTCFLAGS = $(CFLAGS)
> ++override KBUILD_HOSTCFLAGS = $(CFLAGS)
> ++override KBUILD_HOSTLDFLAGS = $(LDFLAGS)
> +
> + quiet_cmd_crosstools_strip = STRIP   $^
> +       cmd_crosstools_strip = $(STRIP) $^; touch $@
> +--
> +2.33.0
> +
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
