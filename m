Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5907C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:04:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB9DE610F9
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB9DE610F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94F1E818CA;
	Wed, 13 Oct 2021 19:04:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yo0ZEFArAowK; Wed, 13 Oct 2021 19:04:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB3E981C56;
	Wed, 13 Oct 2021 19:04:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE2CA1BF38C
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA4AC6005E
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:03:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bO-bFM6SioQA for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 19:03:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8ED2C6003C
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 19:03:58 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id r18so14180792edv.12
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 12:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zM7aDk7kNb8Fe2kqERF7GC9cdNZntrwxD2Y7ZBfy3GE=;
 b=FLzFI1xzsClPOebsjkevuVBPVkW2cRjc4KxjAeOfJXWXv0v0qMXJ4pHeSxIotcoPo1
 eB6wOK7USPQ5peLXb1aMQytIVv4VUn29nereewl0pnwnD7HuGntGzynp1r/jydB1Qi6K
 xtIN2UHL/0gpRk6wKku66lsvhx00rTx3tZpBX1kgclfAAwNveM7CRrbVDGQv8NwvfeB0
 j4N8ffgOIYyVXQGBww5SsBGUkLe+AR5kdoxvsPKTfes/30MF5iDB95iSWQwROqWbE6Qs
 fsq72ARCArsttLijwxo90jJ4GFmAcWMd2ImzS7p6zEh7xlAMZYec4yDdEwkZmTHiwcJz
 mWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zM7aDk7kNb8Fe2kqERF7GC9cdNZntrwxD2Y7ZBfy3GE=;
 b=lyD4dI5+CAWF7+5M1WHbQ0bGF2jx4TOuRQHC2Daq3uoh6KlVJTJEkxBC8nggFYI0Ib
 tiQYnADBjGeCwlbGoUh9bqCxs6cYapXKVTWKFdTf0WIo14KexclRIGVfhGfiwiavwhG0
 fffded6dlX8AW+tVI0E7XaLgsBSL7o4duUk1/m8gEGBy5vb+j0i4it2C8EXXRCoBC66u
 yBS0Lm8g186RAHrOwSeNJn18/TdQNLWeR+CQnZ99MAWaAgfXJK0dAtGNZS+iz5X57RNF
 2g4PEDNYmO8oGfqCGzr8h6+rFVUFqyMw46ewUdvxIDq6QhdrAzbij/RRr0oVrzZOuOAZ
 4zFQ==
X-Gm-Message-State: AOAM533JeOOK4B3OiET8g035oxepZ08aRPfdf8Ab7f7IId2ywHuzBAaA
 70UBicCh2YpUDB9+EpSzGMvOFQ==
X-Google-Smtp-Source: ABdhPJwVFKJSYylgRH1mdQKlYyOHZ+UVxoC9+OZJgojL5xvilqFvsrrRYmIzE9LGS2s76my2u/76AQ==
X-Received: by 2002:a05:6402:90c:: with SMTP id
 g12mr1701206edz.140.1634151836828; 
 Wed, 13 Oct 2021 12:03:56 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id z4sm262741ejn.112.2021.10.13.12.03.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 12:03:56 -0700 (PDT)
Message-ID: <896d8a73-ddaa-4152-e6e6-62a3a2d02ede@mind.be>
Date: Wed, 13 Oct 2021 21:03:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Chris Dimich <chris.dimich@boundarydevices.com>, buildroot@buildroot.org
References: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
 <20211006204135.2813745-3-chris.dimich@boundarydevices.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211006204135.2813745-3-chris.dimich@boundarydevices.com>
Subject: Re: [Buildroot] [PATCH 03/12] package/freescale-imx/imx-vpu-hantro:
 bump version to 1.22.0
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gary Bisson <bisson.gary@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/10/2021 22:41, Chris Dimich wrote:
> To match NXP 5.10.35-2.0.0 release.

  I've added a comment about the license.

> 
> Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
> ---
>   ...on.h-header-inclusion-to-be-standard.patch | 47 ++++++++++---------
>   .../imx-vpu-hantro/imx-vpu-hantro.hash        |  6 +--
>   .../imx-vpu-hantro/imx-vpu-hantro.mk          |  2 +-
>   3 files changed, 28 insertions(+), 27 deletions(-)
> 
> diff --git a/package/freescale-imx/imx-vpu-hantro/0001-Fix-ion.h-header-inclusion-to-be-standard.patch b/package/freescale-imx/imx-vpu-hantro/0001-Fix-ion.h-header-inclusion-to-be-standard.patch
> index f5a67cd514..43ccb1dfec 100644
> --- a/package/freescale-imx/imx-vpu-hantro/0001-Fix-ion.h-header-inclusion-to-be-standard.patch
> +++ b/package/freescale-imx/imx-vpu-hantro/0001-Fix-ion.h-header-inclusion-to-be-standard.patch
> @@ -1,13 +1,14 @@
> -From e776e7360f80da9ac03f81a5df27d8b7fabc7ac7 Mon Sep 17 00:00:00 2001
> -From: Gary Bisson <gary.bisson@boundarydevices.com>
> -Date: Thu, 26 Mar 2020 16:00:33 +0100
> -Subject: [PATCH] Fix ion.h header inclusion to be standard
> +From dfe8ef9123936d2c1d5da34f63f661849171d5ef Mon Sep 17 00:00:00 2001
> +From: Chris Dimich <chris.dimich@boundarydevices.com>

  You can't claim that you're the author of this patch if you just refresh it. 
Keep the original author.

> +Date: Sun, 3 Oct 2021 16:39:29 -0700
> +Subject: [PATCH 1/1] Fix ion.h header inclusion to be standard

  There shouldn't be a 1/1 (in particular, because there are two patches...). 
Use utils/check-package to verify your package before sending it.

  Applied to master with that fixed.

  Regards,
  Arnout

>   
>   NXP "solution" was to manually copy the header to include/linux.
>   Let's point the Makefile to the proper (mainline) location instead:
>   https://elixir.bootlin.com/linux/v4.17/source/drivers/staging/android/uapi/ion.h
>   
>   Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> +Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
>   ---
>    Makefile_G1G2                                             | 4 ++--
>    Makefile_H1                                               | 4 ++--
> @@ -16,7 +17,7 @@ Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
>    4 files changed, 6 insertions(+), 6 deletions(-)
>   
>   diff --git a/Makefile_G1G2 b/Makefile_G1G2
> -index 8280cce..4c9fc34 100755
> +index 8f83391..25884fa 100755
>   --- a/Makefile_G1G2
>   +++ b/Makefile_G1G2
>   @@ -10,8 +10,8 @@ INCLUDE_HEADERS = -I./decoder_sw -I$(SOURCE_ROOT)/source/inc -I$(SOURCE_ROOT)/so
> @@ -31,10 +32,10 @@ index 8280cce..4c9fc34 100755
>    CFLAGS += -DDEC_MODULE_PATH=\"/dev/mxc_hantro\" -DUSE_FAKE_RFC_TABLE -DFIFO_DATATYPE=void* -DNDEBUG -DDOWN_SCALER \
>               -DUSE_EXTERNAL_BUFFER -DUSE_FAST_EC -DUSE_VP9_EC -DGET_FREE_BUFFER_NON_BLOCK \
>   diff --git a/Makefile_H1 b/Makefile_H1
> -index 9ab62e1..8d366e3 100755
> +index 0979571..479940a 100755
>   --- a/Makefile_H1
>   +++ b/Makefile_H1
> -@@ -17,8 +17,8 @@ ENV += -DMEMALLOC_MODULE_PATH=\\\"/dev/ion\\\"
> +@@ -17,8 +17,8 @@ ENV = -DENC_MODULE_PATH=\\\"/dev/mxc_hantro_h1\\\"
>    #ENV += -DSDRAM_LM_BASE=0x00000000
>    ENV += -DEWL_NO_HW_TIMEOUT
>    ENV += -DUSE_ION
> @@ -43,34 +44,34 @@ index 9ab62e1..8d366e3 100755
>   +ENV += -I$(LINUX_KERNEL_ROOT)/include/uapi -I$(LINUX_KERNEL_ROOT)/include
>   +ENV += -I$(LINUX_KERNEL_ROOT)/drivers/staging/android/uapi
>    
> - LIBENCNAME = libcodec_enc
> - LIBSENC = -L./ -lhantro_h1 -lpthread
> + ifeq ($(CFG_SECURE_DATA_PATH), y)
> + ENV += -DCFG_SECURE_DATA_PATH
>   diff --git a/decoder_sw/software/linux/dwl/dwl_linux.c b/decoder_sw/software/linux/dwl/dwl_linux.c
> -index 9b057f0..43225f6 100755
> +index 7d5e33b..c0e5727 100755
>   --- a/decoder_sw/software/linux/dwl/dwl_linux.c
>   +++ b/decoder_sw/software/linux/dwl/dwl_linux.c
> -@@ -41,7 +41,7 @@
> - #include "dwl.h"
> - #include <linux/hantrodec.h>
> - #ifdef USE_ION
> +@@ -50,7 +50,7 @@
> + #if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 11, 0)
> + #include <linux/dma-heap.h>
> + #else
>   -#include <linux/ion.h>
>   +#include <ion.h>
> - #include <linux/dma-buf.h>
> - #include <linux/version.h>
> + #endif
>    #ifdef ANDROID
> + #include <linux/mxc_ion.h>
>   diff --git a/h1_encoder/software/linux_reference/ewl/ewl_x280_common.c b/h1_encoder/software/linux_reference/ewl/ewl_x280_common.c
> -index fef1307..20b6f95 100755
> +index 312e4cc..70630c3 100755
>   --- a/h1_encoder/software/linux_reference/ewl/ewl_x280_common.c
>   +++ b/h1_encoder/software/linux_reference/ewl/ewl_x280_common.c
> -@@ -49,7 +49,7 @@
> -
> - #include "linux/hx280enc.h"
> - #ifdef USE_ION
> +@@ -52,7 +52,7 @@
> + #if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 11, 0)
> + #include <linux/dma-heap.h>
> + #else
>   -#include <linux/ion.h>
>   +#include <ion.h>
> + #endif
>    #include <linux/dma-buf.h>
>    #include <linux/version.h>
> - #ifdef ANDROID
>   --
> -2.25.1
> +2.31.1
>   
> diff --git a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
> index e9df63bfca..dd3b167e3e 100644
> --- a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
> +++ b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
> @@ -1,4 +1,4 @@
>   # Locally computed:
> -sha256  419725f0c09f5939c88cd234b729c3943cbd37e53db7352b02c8d6cc05b939b9  imx-vpu-hantro-1.21.0.bin
> -sha256  4f3cc2dcbe3b7369bd4a51df749f432b69d8189fc2bde88f9fadbec73c686683  COPYING
> -sha256  a07e8df685161553d7e0b78b8b93ebe9086d95bb8635abff0ed3247992181e85  EULA
> +sha256  03c61dfb268b31a0d25a4d1387cb3ad0261029ad5de801f72224602e2b37da00  imx-vpu-hantro-1.22.0.bin
> +sha256  ea58636bf34f589048fcd46e38497c47229fde8498df086ff5fb52f9ef8e15ee  COPYING
> +sha256  50099e283cfd307f84f159aeb1a6f462351320273dbcdb80d7f2c9db0494b71c  EULA
> diff --git a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
> index 0d075c49c0..360591b444 100644
> --- a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
> +++ b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -IMX_VPU_HANTRO_VERSION = 1.21.0
> +IMX_VPU_HANTRO_VERSION = 1.22.0
>   IMX_VPU_HANTRO_SITE = $(FREESCALE_IMX_SITE)
>   IMX_VPU_HANTRO_SOURCE = imx-vpu-hantro-$(IMX_VPU_HANTRO_VERSION).bin
>   IMX_VPU_HANTRO_DEPENDENCIES = linux
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
