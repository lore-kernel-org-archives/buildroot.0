Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B7EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 18:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4ECFF4056E;
	Mon, 20 Jun 2022 18:21:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4ECFF4056E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 69eajCuOOcpK; Mon, 20 Jun 2022 18:21:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0121A405DF;
	Mon, 20 Jun 2022 18:21:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0121A405DF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 03F331BF28A
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 18:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1D64405DF
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 18:21:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1D64405DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k7FIJ2vLxT0Y for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 18:21:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C21D94056E
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C21D94056E
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 18:21:01 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id es26so14542293edb.4
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 11:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/qru+guVd9cwoFQqPrMkuFuxVq9mgOqM8xMsn+I6kxE=;
 b=1gsexggS1492KeNgY2hnJ+HmTCPb7VBthcbONQPY/mtHDBK9MDNySfUTeg+ThI/HNO
 VCK4ag3oqOagBmE9zn7kJyyuSguMZXP+cQgtiDPpQnuTweHoiog2x3JSfUJt0UZw7dm2
 MVHV3rnYhtjbkZcFWWMP8O8c8AeG3TNVFp8O6grP5HJ+nCI385Z9i16rluWA9gEsAQfR
 u2foh+AtWxMBYhrQnnysux/PprolhWe4WmwZis2PB6T798ftCDTkH1ONa2F+7XqBlLhp
 SH7w4hQoIeEcC48QXLGaKw80oFvYdhpymmu+Wb+GUba6le5Qb6avihuOOdmMPzzoF5H7
 A+0g==
X-Gm-Message-State: AJIora/qzhJztdn2Iehk9Lz3SvUwHk6yGYDzqpTCYc7UbHBRU43cGjm+
 Kj0a92Y10w2T4hfzil0fos+K4A==
X-Google-Smtp-Source: AGRyM1tW4DxbOpG5TtRFHj2OVpHZvi4jMT8CTOhDxc8SP5Ykvrl5Bwk7B0Qg3rv400U0+kmQGuWDtg==
X-Received: by 2002:a05:6402:240e:b0:433:4642:f86a with SMTP id
 t14-20020a056402240e00b004334642f86amr30203690eda.313.1655749259754; 
 Mon, 20 Jun 2022 11:20:59 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 sb6-20020a1709076d8600b0070aaad0a173sm6335903ejc.192.2022.06.20.11.20.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 11:20:58 -0700 (PDT)
Message-ID: <b1780ee7-29e4-715c-f305-1b2323a57350@mind.be>
Date: Mon, 20 Jun 2022 20:20:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Vincent Fazio <vfazio@xes-inc.com>, buildroot@buildroot.org
References: <20211104141910.1840914-1-vfazio@xes-inc.com>
 <20220620170940.513445-1-vfazio@xes-inc.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220620170940.513445-1-vfazio@xes-inc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/qru+guVd9cwoFQqPrMkuFuxVq9mgOqM8xMsn+I6kxE=;
 b=fXxWQfGqoddOwPCbdBR49S3RKuLdVUyk92O2QEJeB8Qv8dEf4fms4M07HIB6W69gNE
 KF2HmugwJJPDkhf1ZF815LhaAhxomAfrJKxRDiBn0N/AX00nJnRbSpFC3T/PzpUujCQ4
 V7zIqQ8oj9zJHp55d5I01lu6ZWFjL9T2mEJ3pzFMMRAPvbc4veRM2kAgFzFhSNh2kI7p
 3ZnuNBUb9a0P2FT1ean9U7qeSLURn0NufXGnHFNPaX9FFQs9z2TTMY3419eG3yyJ9QkA
 yOH+hIEFG0ZW+eGyIdRdsDpfBc3dzSXywAHbIJhNWVoOTNoSzL1xqrQgQEw9fpyr7uAw
 gpyQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fXxWQfGq
Subject: Re: [Buildroot] [PATCH 1/1] package/nvidia-driver: bump version to
 390.151
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/06/2022 19:09, Vincent Fazio wrote:
> Adds support for Linux kernel 5.17.
> 
> Define IGNORE_CC_MISMATCH for kernel module builds to avoid an issue
> where NVIDIA's `cc_version_check` in kernel/conftest.sh may falsely
> detect a mismatch and fail due to matching on the pkgversion substring
> of the GCC version string in the kernel's include/generated/compile.h.

  Shouldn't that part be done in a separate patch that can be applied to 
2022.05.x and 2022.02.x? AFAIU, this error will happen even with the 5.4 kernel 
that is supported by that version of nvidia-driver. Or doesn't it?

  Regards,
  Arnout

> 
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---
>   package/nvidia-driver/nvidia-driver.hash | 4 ++--
>   package/nvidia-driver/nvidia-driver.mk   | 3 ++-
>   2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/nvidia-driver/nvidia-driver.hash b/package/nvidia-driver/nvidia-driver.hash
> index 7f2248d0f9..6564b8e821 100644
> --- a/package/nvidia-driver/nvidia-driver.hash
> +++ b/package/nvidia-driver/nvidia-driver.hash
> @@ -1,4 +1,4 @@
>   # Locally computed
> -sha256 51adb28f0ed4548f35a88a93ad6767ebd807fa14f418bf5e51a6d63a3ff7f275  NVIDIA-Linux-x86-390.132.run
> -sha256 b6b4b8af37e78e026c9ebdf4a5c64ea412dfcb710931dd028c22dac228de659d  NVIDIA-Linux-x86_64-390.132-no-compat32.run
> +sha256 5226e4842044cffd9096deadaf68934c133da74e05b80ccd21236584b3afb1fc  NVIDIA-Linux-x86-390.151.run
> +sha256 6e4fd2258465f5d5527fe80abd46de925a30348b4a84658498a6d75caf42c47c  NVIDIA-Linux-x86_64-390.151-no-compat32.run
>   sha256 bd28b0c5aeeb00eb11d3ec6f6f3449d4b3a40100914258332734a53527997526  LICENSE
> diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
> index 54c2aa46d8..f1217b00aa 100644
> --- a/package/nvidia-driver/nvidia-driver.mk
> +++ b/package/nvidia-driver/nvidia-driver.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -NVIDIA_DRIVER_VERSION = 390.132
> +NVIDIA_DRIVER_VERSION = 390.151
>   NVIDIA_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64)
>   NVIDIA_DRIVER_SITE = http://download.nvidia.com/XFree86/Linux-x86$(NVIDIA_DRIVER_SUFFIX)/$(NVIDIA_DRIVER_VERSION)
>   NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-$(NVIDIA_DRIVER_VERSION)$(if $(BR2_x86_64),-no-compat32).run
> @@ -137,6 +137,7 @@ endif
>   # because they don't recognise the usual variables set by the kernel
>   # build system. We also need to tell them what modules to build.
>   NVIDIA_DRIVER_MODULE_MAKE_OPTS = \
> +	IGNORE_CC_MISMATCH=1 \
>   	NV_KERNEL_SOURCES="$(LINUX_DIR)" \
>   	NV_KERNEL_OUTPUT="$(LINUX_DIR)" \
>   	NV_KERNEL_MODULES="$(NVIDIA_DRIVER_MODULES)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
