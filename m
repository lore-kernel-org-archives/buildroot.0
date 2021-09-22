Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D4FEC433FE
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 21:05:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 709DC6112F
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 21:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 709DC6112F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 119E140121;
	Wed, 22 Sep 2021 21:05:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zf4HEeCXkbWe; Wed, 22 Sep 2021 21:05:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C423F40598;
	Wed, 22 Sep 2021 21:05:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 127511BF2F7
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 21:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 013B640598
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 21:05:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JNGnko4tIgxJ for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 21:05:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B63540121
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 21:05:14 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id c22so14796721edn.12
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 14:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Q6uEVkD0cbUs0/dVxpchxl9c/5dHhA8qZQH8/umCif4=;
 b=WAcVZYFvxPxsy9Ix/jKH589yR6Hm+Lf5jaj8p+4cJSbyjflOsWQiurhRaPOpsOFYZZ
 6saWq6peWEGqtaka3/3Dpv7t2hcxBNjyaDcAKvdK41w8+RkZTLTSvrGFIWoSuT96+dQ8
 ZhOPfho+AYu9iDqCrcY9qPX3N0vUU0roSkiU994Bh8mzjVWnNpEqXA6UucByhA+KzOMu
 Ol8ixKfyu5VvJReRPaTR74oXimJRWvkeBwoY9TdoZZ1FDWphQoHmV3NT94k85fu2d4uQ
 1TJbF15BlxIQcYaOXA/+QS4GWwmFnNWhr9nzxME4AY+IvQQhiSaqjWE3D5jsGBMkUWne
 N5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Q6uEVkD0cbUs0/dVxpchxl9c/5dHhA8qZQH8/umCif4=;
 b=cFYAURm+x1HmDUu2lv/0tajzaP6VIuvB2Et3vyhpuHP3kYk1995NHEZKOnnk2+dEE2
 xXUnm4l9h/b+s+JDYnV5WUuE5hgcarW4eKkoQzWkD5Lqzc2kgxPJLdz6M7T/PasG6hXl
 MrRBH0GFKvx1u3CtdlCnxdyDy7RPMjO5vRoh5Dy3GjurSYVWwYEJCFqphtnO4Qym/ErA
 ZHwejMfDpFJIy168Y6p/NsrwhOv6+Un8DxQhKMSqp8xjSddcIM6RPYJ5OA93cVIoUYRf
 eRRW+gUW3XRscx4bVv25KGX5SYG3KLwPcv+hVmIuLL9zapI3zq9K0c7hUkPoi1kbqWuG
 V1sw==
X-Gm-Message-State: AOAM533g5a0zzOQ5XtMa0K0BQ7L34SZ8CcpYH6315uUU/5NqtBMkmCoM
 rqFq5AMjlYtLsrd6cQqfoH6VWR5u4Q5bEg==
X-Google-Smtp-Source: ABdhPJw6yrMpYiOwYcNlAzDEQO3hy4P0AD/KBShsYc9jgQKNobz7z0NrqiqTySGjz3jt6Qt2Y1eH3w==
X-Received: by 2002:a50:8163:: with SMTP id 90mr1653414edc.198.1632344712606; 
 Wed, 22 Sep 2021 14:05:12 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d16sm1542154ejk.39.2021.09.22.14.05.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 14:05:12 -0700 (PDT)
Message-ID: <73613c72-395f-fd00-6687-ff99c8e6beca@mind.be>
Date: Wed, 22 Sep 2021 23:05:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Petr Vorel <petr.vorel@gmail.com>, buildroot@buildroot.org
References: <20210914172243.8013-1-petr.vorel@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210914172243.8013-1-petr.vorel@gmail.com>
Subject: Re: [Buildroot] [RESENT][PATCH 1/1] package/busybox: bump version
 to 1.34.0
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
Cc: Aleksander Morgado <aleksander@aleksander.es>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 14/09/2021 19:22, Petr Vorel wrote:
> * backport fix from 1_34_stable branch
> * refresh patches
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...route-use-linux-if_packet.h-instead-.patch | 18 ++++++---
>   ...trip-non-l-arguments-returned-by-pkg.patch | 15 +++----
>   ...003-udhcp-fix-build-breakage-on-MIPS.patch | 39 +++++++++++++++++++
>   package/busybox/busybox.hash                  |  4 +-
>   package/busybox/busybox.mk                    |  2 +-
>   5 files changed, 63 insertions(+), 15 deletions(-)
>   create mode 100644 package/busybox/0003-udhcp-fix-build-breakage-on-MIPS.patch
> 
> diff --git a/package/busybox/0001-networking-libiproute-use-linux-if_packet.h-instead-.patch b/package/busybox/0001-networking-libiproute-use-linux-if_packet.h-instead-.patch
> index 3aabc96053..9b5eaf89bd 100644
> --- a/package/busybox/0001-networking-libiproute-use-linux-if_packet.h-instead-.patch
> +++ b/package/busybox/0001-networking-libiproute-use-linux-if_packet.h-instead-.patch
> @@ -1,4 +1,4 @@
> -From d4fec31889ad660a58dab633c511221feb66e817 Mon Sep 17 00:00:00 2001
> +From 60da1d0763224698008d847eb8ad8d4d8c6f54ff Mon Sep 17 00:00:00 2001
>   From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>   Date: Sat, 5 Oct 2013 15:55:06 +0200
>   Subject: [PATCH] networking/libiproute: use <linux/if_packet.h> instead of
> @@ -14,10 +14,15 @@ This commit fixes the build of iplink with the musl C library.
>   
>   Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>   [Gustavo: update for busybox 1.22.0]
> +Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> +---
> + networking/libiproute/iplink.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
>   
> -diff -Nura busybox-1.22.0.orig/networking/libiproute/iplink.c busybox-1.22.0/networking/libiproute/iplink.c
> ---- busybox-1.22.0.orig/networking/libiproute/iplink.c	2014-01-01 09:42:40.301137882 -0300
> -+++ busybox-1.22.0/networking/libiproute/iplink.c	2014-01-01 09:43:01.282827700 -0300
> +diff --git a/networking/libiproute/iplink.c b/networking/libiproute/iplink.c
> +index 1a1064bdc..a4c3ad307 100644
> +--- a/networking/libiproute/iplink.c
> ++++ b/networking/libiproute/iplink.c
>   @@ -7,7 +7,7 @@
>     */
>    #include <net/if.h>
> @@ -25,5 +30,8 @@ diff -Nura busybox-1.22.0.orig/networking/libiproute/iplink.c busybox-1.22.0/net
>   -#include <netpacket/packet.h>
>   +#include <linux/if_packet.h>
>    #include <netinet/if_ether.h>
> -
> +
>    #include <linux/if_vlan.h>
> +--
> +2.33.0
> +
> diff --git a/package/busybox/0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch b/package/busybox/0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
> index 84435442c9..3a94241043 100644
> --- a/package/busybox/0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
> +++ b/package/busybox/0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
> @@ -1,7 +1,8 @@
> -From 67eb23d2be8aba3c474dac81a15b0fa11e5847b7 Mon Sep 17 00:00:00 2001
> +From 59daea82e7b5abcdb42a4f97a0109f14d5a774ea Mon Sep 17 00:00:00 2001
>   From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>   Date: Mon, 25 Nov 2013 22:51:53 +0100
> -Subject: [PATCH] Makefile.flags: strip non -l arguments returned by pkg-config
> +Subject: [PATCH] Makefile.flags: strip non -l arguments returned by
> + pkg-config
>   
>   Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>   [yann.morin.1998@free.fr: refresh for 1.29.0]
> @@ -13,10 +14,10 @@ Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
>    1 file changed, 3 insertions(+), 1 deletion(-)
>   
>   diff --git a/Makefile.flags b/Makefile.flags
> -index 307afa7..885e323 100644
> +index 667481983..88d76efec 100644
>   --- a/Makefile.flags
>   +++ b/Makefile.flags
> -@@ -176,7 +176,9 @@ ifeq ($(CONFIG_SELINUX),y)
> +@@ -180,7 +180,9 @@ ifeq ($(CONFIG_SELINUX),y)
>    SELINUX_PC_MODULES = libselinux libsepol
>    $(eval $(call pkg_check_modules,SELINUX,$(SELINUX_PC_MODULES)))
>    CPPFLAGS += $(SELINUX_CFLAGS)
> @@ -25,8 +26,8 @@ index 307afa7..885e323 100644
>   +       $(patsubst -l%,%,$(filter -l%,$(SELINUX_LIBS))),\
>   +       $(SELINUX_PC_MODULES:lib%=%))
>    endif
> -
> +
>    ifeq ($(CONFIG_FEATURE_NSLOOKUP_BIG),y)
> ---
> -1.8.1.2
> +--
> +2.33.0
>   
> diff --git a/package/busybox/0003-udhcp-fix-build-breakage-on-MIPS.patch b/package/busybox/0003-udhcp-fix-build-breakage-on-MIPS.patch
> new file mode 100644
> index 0000000000..d54d45da43
> --- /dev/null
> +++ b/package/busybox/0003-udhcp-fix-build-breakage-on-MIPS.patch
> @@ -0,0 +1,39 @@
> +From 56824284b749e5b9d568b75d5c5bc471b1814d46 Mon Sep 17 00:00:00 2001
> +From: Denys Vlasenko <vda.linux@googlemail.com>
> +Date: Fri, 20 Aug 2021 13:33:50 +0200
> +Subject: [PATCH] udhcp: fix build breakage on MIPS
> +
> +Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> +Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> +---
> +upstream status: 00adcdb64 ("udhcp: fix build breakage on MIPS")
> +
> + networking/udhcp/common.h | 12 ------------
> + 1 file changed, 12 deletions(-)
> +
> +diff --git a/networking/udhcp/common.h b/networking/udhcp/common.h
> +index 8c678dd32..ca778dab8 100644
> +--- a/networking/udhcp/common.h
> ++++ b/networking/udhcp/common.h
> +@@ -304,18 +304,6 @@ void udhcp_dump_packet(struct dhcp_packet *packet) FAST_FUNC;
> + # define log3s(msg) ((void)0)
> + #endif
> +
> +-#if defined(__mips__)
> +-/*
> +- * The 'simple' message functions have a negative impact on the size of the
> +- * DHCP code when compiled for MIPS, so don't use them in this case.
> +- */
> +-#define bb_simple_info_msg bb_info_msg
> +-#define bb_simple_error_msg bb_error_msg
> +-#define bb_simple_perror_msg_and_die bb_perror_msg_and_die
> +-#undef log1s
> +-#define log1s log1
> +-#endif
> +-
> + /*** Other shared functions ***/
> +
> + /* 2nd param is "uint32_t*" */
> +--
> +2.33.0
> +
> diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
> index 3e9c30cad0..4782f68819 100644
> --- a/package/busybox/busybox.hash
> +++ b/package/busybox/busybox.hash
> @@ -1,5 +1,5 @@
> -# From https://busybox.net/downloads/busybox-1.33.1.tar.bz2.sha256
> -sha256  12cec6bd2b16d8a9446dd16130f2b92982f1819f6e1c5f5887b6db03f5660d28  busybox-1.33.1.tar.bz2
> +# From https://busybox.net/downloads/busybox-1.34.0.tar.bz2.sha256
> +sha256  ec8d1615edb045b83b81966604759c4d4ac921434ab4011da604f629c06074ce  busybox-1.34.0.tar.bz2
>   # Locally computed
>   sha256  bbfc9843646d483c334664f651c208b9839626891d8f17604db2146962f43548  LICENSE
>   sha256  b5a136ed67798e51fe2e0ca0b2a21cb01b904ff0c9f7d563a6292e276607e58f  archival/libarchive/bz/LICENSE
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 560c4fe7b6..08b5c55c50 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -BUSYBOX_VERSION = 1.33.1
> +BUSYBOX_VERSION = 1.34.0
>   BUSYBOX_SITE = https://www.busybox.net/downloads
>   BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
>   BUSYBOX_LICENSE = GPL-2.0, bzip2-1.0.4
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
