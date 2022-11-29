Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEF8C4321E
	for <buildroot@archiver.kernel.org>; Tue, 29 Nov 2022 22:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45A2C4031D;
	Tue, 29 Nov 2022 22:16:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45A2C4031D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NLLLcPdM9A8I; Tue, 29 Nov 2022 22:16:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 659AC40194;
	Tue, 29 Nov 2022 22:16:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 659AC40194
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A5E201BF5AD
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 22:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80CC340194
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 22:16:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80CC340194
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jCJmqQ_FL0n1 for <buildroot@lists.busybox.net>;
 Tue, 29 Nov 2022 22:16:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52D01400DD
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52D01400DD
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 22:16:30 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id x17so24296288wrn.6
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 14:16:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NMZIrLS8AHDqrPezT6RK6+04vUasex4Ft54qbxcMQkw=;
 b=Tv+KLuzB6jIlEZz4wo+0imJ0x0H+oXztKMYtavC0+u6cZdec/bLmX76ihVl7GPshI6
 xGp8Ads0GOVCK//oggQ2/N1NseRqmp2yAZSlyT65TgLBQghyRdiwg5fcPBuHUx9S4kCZ
 f2Bkfw6Z48vcpM2KkRNcx4bohzsFEJLLW9JaYBqttj5Zg95pYEeLEnzeGMktCZMWKT++
 f98vwj0Fsjuskbxlq68teBGAUK+/U4QhMKdP7XQrO7D8e55mK0ci6UamRwipCh8mnXeQ
 dh99oPESbq7L1BwaGAIE2sB119ZRtDrRQ430A82HI9cIxO1origTGFgA4mz0zqyOGboP
 iQmQ==
X-Gm-Message-State: ANoB5pkk54I68WaxkwIvHEx/7hnlun3pyX1mX6AAqwLB0Voh8sKUQ1Z2
 A3KqHvz/J8qgr/Tvd8XTbZq25g==
X-Google-Smtp-Source: AA0mqf7obW4ajGMbK4XI4PFF1yzhRDdyTxTasQZn0IDCvpinO+352X9K5FldNbw0a+I85YtuRot5aQ==
X-Received: by 2002:a05:6000:702:b0:241:b881:22af with SMTP id
 bs2-20020a056000070200b00241b88122afmr26196703wrb.652.1669760188130; 
 Tue, 29 Nov 2022 14:16:28 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 p7-20020adfe607000000b00241fea203b6sm14820444wrm.87.2022.11.29.14.16.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Nov 2022 14:16:27 -0800 (PST)
Message-ID: <ec8d8bd9-5185-b9fb-f6cb-6aec971a5de1@mind.be>
Date: Tue, 29 Nov 2022 23:16:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20221129210800.802451-1-giulio.benetti@benettiengineering.com>
 <20221129210800.802451-2-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20221129210800.802451-2-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NMZIrLS8AHDqrPezT6RK6+04vUasex4Ft54qbxcMQkw=;
 b=KrzIn+oYYwKve5Gb3e2OijPoq4HNQpRyBqq8qteWcPVzVvMGtpJNv1nPUYo0tIh71G
 1pgI+cUmpgb7szkgJ1Id1BhpD9NzHjyP74rzyu2nZpB/xwOba0FM2Tjx4BWuQNbs3BQx
 80wUBMzWnDFD7cGFoQD7dVIBP7EWgALm00b/2xeRELeFE60n0wegX7VGudMsFiU+O9Ml
 bi184G1DGAm+nfa4Lo+PcrI62/esomT0mRARR3SoJSwcZJ0EXPyn6yEAJpAEOZIqX4Sy
 F7zt8LjdJLLVVpyycO+FjzqAM+ejOq8Uo+KxU84LPkigW2bL8dW3wbdaypAEy5ibLEAj
 V2EQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KrzIn+oY
Subject: Re: [Buildroot] [PATCH 2/2] package/rtl8192eu: fix build failure on
 Big Endian architectures
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/11/2022 22:08, Giulio Benetti wrote:
> Add local patch that allows to override CONFIG_LITTLE_ENDIAN in case we're
> building for Big Endian architectures. Then let's undefine
> CONFIG_LITTLE_ENDIAN and define endianness according to $(BR2_ENDIAN).
> 
> Fixes:
> http://autobuild.buildroot.net/results/13a/13a809570423ead33628663033db4c3c4001a79b/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   ...TRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch | 40 +++++++++++++++++++
>   package/rtl8192eu/rtl8192eu.mk                |  9 ++++-
>   2 files changed, 48 insertions(+), 1 deletion(-)
>   create mode 100644 package/rtl8192eu/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
> 
> diff --git a/package/rtl8192eu/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch b/package/rtl8192eu/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
> new file mode 100644
> index 0000000000..2f6ecfb210
> --- /dev/null
> +++ b/package/rtl8192eu/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
> @@ -0,0 +1,40 @@
> +From f51cbcbeafd8d60e9b8f35b7ca62b6c941d72e3b Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Wed, 28 Sep 2022 21:17:17 +0200
> +Subject: [PATCH] Makefile: move 'EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)' at the
> + end of EXTRA_FLAGS assignment
> +
> +At the moment USER_EXTRA_CFLAGS can't override local Makfile EXTRA_CFLAGS
> +since it's assigned at the beginning of the Makefile. For example it's not
> +possible to undefine the hardcoded CONFIG_LITTLE_ENDIAN and this doesn't
> +allow to build these modules for big endian architectures. So let's move
> +the assignment of USER_EXTRA_CFLAGS to EXTRA_CFLAGS after the last
> +EXTRA_CFLAGS assignment.
> +
> +[Upstream status: https://github.com/clnhub/rtl8192eu-linux/pull/65]
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + Makefile | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 32a1898..b67a5a4 100755
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -1,4 +1,3 @@
> +-EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
> + EXTRA_CFLAGS += -O1
> + #EXTRA_CFLAGS += -O3
> + #EXTRA_CFLAGS += -Wall
> +@@ -2329,6 +2328,8 @@ ifneq ($(USER_MODULE_NAME),)
> + MODULE_NAME := $(USER_MODULE_NAME)
> + endif
> +
> ++EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
> ++
> + ifneq ($(KERNELRELEASE),)
> +
> + ########### this part for *.mk ############################
> +--
> +2.34.1
> +
> diff --git a/package/rtl8192eu/rtl8192eu.mk b/package/rtl8192eu/rtl8192eu.mk
> index 0e8ffea5cb..589cb7f59e 100644
> --- a/package/rtl8192eu/rtl8192eu.mk
> +++ b/package/rtl8192eu/rtl8192eu.mk
> @@ -7,9 +7,16 @@
>   RTL8192EU_VERSION = 1e15b6d451731bc4d3ffd587194dc4bd0f286ac0
>   RTL8192EU_SITE = $(call github,clnhub,rtl8192eu-linux,$(RTL8192EU_VERSION))
>   RTL8192EU_LICENSE = GPL-2.0
> +
> +# Undefine the hardcoded CONFIG_LITTLE_ENDIAN
> +RTL8192EU_USER_EXTRA_CLAGS = -UCONFIG_LITTLE_ENDIAN

  It is not actually hardcoded. The only thing that is hardcoded is 
CONFIG_PLATFORM_I386_PC=y, which triggers the following fragment in the Makefile:

ifeq ($(CONFIG_PLATFORM_I386_PC), y)
EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT

SUBARCH := $(shell uname -m | sed -e s/i.86/i386/)
ARCH ?= $(SUBARCH)
CROSS_COMPILE ?=
KVER  := $(shell uname -r)
KSRC := /lib/modules/$(KVER)/build
MODDESTDIR := /lib/modules/$(KVER)/kernel/drivers/net/wireless/
INSTALL_PREFIX :=
STAGINGMODDIR := /lib/modules/$(KVER)/kernel/drivers/staging
endif


Clearly, all of this is rubbish in Buildroot context. So what we should do is to 
set

RTL8192EU_MODULE_MAKE_OPTS = ... CONFIG_PLATFORM_I386_PC=n

At that point, we can set all the appropriate config options we like, which 
would be the -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT in 
USER_EXTRA_CFLAGS.


  Regards,
  Arnout

> +# Set endianness
> +RTL8192EU_USER_EXTRA_CLAGS += -DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN
> +RTL8192EU_USER_EXTRA_CLAGS += -Wno-error
> +
>   RTL8192EU_MODULE_MAKE_OPTS = \
>   	CONFIG_RTL8192EU=m \
> -	USER_EXTRA_CFLAGS="-Wno-error"
> +	USER_EXTRA_CFLAGS="$(RTL8192EU_USER_EXTRA_CLAGS)"
>   
>   define RTL8192EU_LINUX_CONFIG_FIXUPS
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
