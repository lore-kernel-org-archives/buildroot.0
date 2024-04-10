Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A0ACD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 19:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCBE940182;
	Wed, 10 Apr 2024 19:45:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PjKNepYFwelK; Wed, 10 Apr 2024 19:45:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5FB44036E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5FB44036E;
	Wed, 10 Apr 2024 19:45:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB29D1BF59A
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 19:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7BA160E5E
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 19:45:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T8bKfrApd-Lh for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 19:45:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 32BDE60E4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32BDE60E4A
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 32BDE60E4A
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 19:45:31 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3458b699d6cso1764944f8f.0
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 12:45:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712778329; x=1713383129;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wedJRdohGg10DT/3ZC9jfTCpucz6Cwpz0qQyt2QPZME=;
 b=PWToTjiZP23GI0aprmgs4szpQkHC+qtgXnarPCAXqPcIAPHPaLv4F8N5dLjL+ZVY+x
 VXei3wLrlDv/Kd80MylYZ8m/rutkqRmbPJxU/sRchWaWzfPeKapkxW2t5FOssXRYwrBu
 TGDWn9yJY/hOYOKHivnUe+mQoIiQmO/hlqeuq9wMe9wh97X1ik8Ok87xYk8+OmDZ0zLc
 MQfV9KKMVORiMq/PByLKYndpmerJu4ZdQG7ab8KZImz8lRkxMsU1wV7LSaBiXIoUZyEh
 S62h7VjTvHmyNLfA77MtnxPJ6CuZh4CAcJHmgg8BOppkfZUvWX2oEZnMq2vNCfG5talj
 P2Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwhYPSdwCanoANJ5zkt2YoWmZnXGOmpZD/mlHIU4sgf784C9JSb/HAa6+EXjXJbWtGQk3LdBSOj7tptDARh80QUWrTp0V9tA==
X-Gm-Message-State: AOJu0YwQKeOiqJQ3rpzMHS+Hy8JsHGoZG5JyDxpKdV+sakxsqjK/WqCp
 x3FQS8Cktms2aIFdrkt71pLUFxr5ren17WvZ5iUKIU20rShSD7lT8ffj3WNfpnManEOtJ+jMnLu
 C
X-Google-Smtp-Source: AGHT+IEtD9otSU29ccGVyKImWZ4pR3XVRywxT5ERbwX8y6rFnak6Bw2ZlfJTzkJQin0VAvmDLgVvXw==
X-Received: by 2002:a05:6000:458f:b0:346:8fa3:45cd with SMTP id
 gb15-20020a056000458f00b003468fa345cdmr1123323wrb.41.1712778329067; 
 Wed, 10 Apr 2024 12:45:29 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a05600c0a1100b00416b8da335esm29736wmp.48.2024.04.10.12.45.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 12:45:28 -0700 (PDT)
Message-ID: <836aca76-02f3-4ef1-a86f-68a5a55d2bd9@mind.be>
Date: Wed, 10 Apr 2024 21:45:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240410193712.31108-1-ju.o@free.fr>
Content-Language: en-GB
In-Reply-To: <20240410193712.31108-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712778329; x=1713383129; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wedJRdohGg10DT/3ZC9jfTCpucz6Cwpz0qQyt2QPZME=;
 b=dFseyABpRRnB3bvAvT5pwH+rTX5doe20aVez2ch6lZc3s3D1z1ekwqPcUBIYkSv01y
 /hzWa08YFDRPdLYDplk/+7ygDtWD3RWLGweWXVhP7czZ5nKMb0DVBBH8Kvw01UkYwDA6
 Ai/o18/E3f9KHIi/YiOosPJ6djeIVz2d7dRlmpb5Vj1lAVN1jzqwqDzqt5traWh8DMI8
 OX2tNBsZ3YkU5+7KyhdEK1UFfP65B/xJ7lVOzjll3mFJZH8VGWQ9JP9T5IrlYkuvR6zH
 uiKIJjiXqRQ1kCGAUgUi5yOTXqa/CUUOCnNIsIKjdhG7Qe9CrxHi28qlaMmnULTb08Df
 fEnw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dFseyABp
Subject: Re: [Buildroot] [PATCH v3 1/1] package/rdma-core: bump to version
 v51.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/04/2024 21:37, Julien Olivain wrote:
> For change log since v49.0, see:
> https://github.com/linux-rdma/rdma-core/releases/tag/v50.0
> https://github.com/linux-rdma/rdma-core/releases/tag/v51.0
> 
> This commit drops the package patch, which is included v50.0.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Changes v2 -> v3:
> - Squashed patches into a single one,
>    reworded the commit log accordingly.

  I was just about to squash them myself :-)

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...-util-udma_barrier.h-fix-mips4-build.patch | 56 -------------------
>   package/rdma-core/rdma-core.hash              |  2 +-
>   package/rdma-core/rdma-core.mk                |  2 +-
>   3 files changed, 2 insertions(+), 58 deletions(-)
>   delete mode 100644 package/rdma-core/0001-util-udma_barrier.h-fix-mips4-build.patch
> 
> diff --git a/package/rdma-core/0001-util-udma_barrier.h-fix-mips4-build.patch b/package/rdma-core/0001-util-udma_barrier.h-fix-mips4-build.patch
> deleted file mode 100644
> index 6dfb476faaa..00000000000
> --- a/package/rdma-core/0001-util-udma_barrier.h-fix-mips4-build.patch
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -From 1b1ca539f6e1f0b774e989f1022477686e4fc77f Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Sun, 21 Jan 2024 18:55:34 +0100
> -Subject: [PATCH] util/udma_barrier.h: fix mips4 build
> -
> -The 'sync' instruction for MIPS was defined in MIPS-II as taking no
> -operands. MIPS32 extended the define of 'sync' as taking an optional
> -unsigned 5 bit immediate.
> -
> -As a result, replace "sync 0" by "sync" to fix the following build
> -failure on mips4 raised since version 43.0 and
> -https://github.com/linux-rdma/rdma-core/commit/b7c428344ea96d446f6ffe31c620a238a7f25c9e:
> -
> -/tmp/ccrBy9fV.s: Assembler messages:
> -/tmp/ccrBy9fV.s:994: Error: invalid operands `sync 0'
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/2ab22a3ec4287fc15ff6a90d8715b4897b32a933
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Upstream: https://github.com/linux-rdma/rdma-core/commit/f3f0c06014c6de845032e6fe9f152674919b3ec6
> ----
> - util/udma_barrier.h | 6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/util/udma_barrier.h b/util/udma_barrier.h
> -index 0a1f8a45b..3793d2f18 100644
> ---- a/util/udma_barrier.h
> -+++ b/util/udma_barrier.h
> -@@ -101,7 +101,7 @@
> - #elif defined(__riscv)
> - #define udma_to_device_barrier() asm volatile("fence ow,ow" ::: "memory")
> - #elif defined(__mips__)
> --#define udma_to_device_barrier() asm volatile("sync 0" ::: "memory")
> -+#define udma_to_device_barrier() asm volatile("sync" ::: "memory")
> - #else
> - #error No architecture specific memory barrier defines found!
> - #endif
> -@@ -139,7 +139,7 @@
> - #elif defined(__riscv)
> - #define udma_from_device_barrier() asm volatile("fence ir,ir" ::: "memory")
> - #elif defined(__mips__)
> --#define udma_from_device_barrier() asm volatile("sync 0" ::: "memory")
> -+#define udma_from_device_barrier() asm volatile("sync" ::: "memory")
> - #else
> - #error No architecture specific memory barrier defines found!
> - #endif
> -@@ -212,7 +212,7 @@
> - #include "s390_mmio_insn.h"
> - #define mmio_flush_writes() s390_pciwb()
> - #elif defined(__mips__)
> --#define mmio_flush_writes() asm volatile("sync 0" ::: "memory")
> -+#define mmio_flush_writes() asm volatile("sync" ::: "memory")
> - #else
> - #error No architecture specific memory barrier defines found!
> - #endif
> diff --git a/package/rdma-core/rdma-core.hash b/package/rdma-core/rdma-core.hash
> index fc1d319123d..f8b01e882dc 100644
> --- a/package/rdma-core/rdma-core.hash
> +++ b/package/rdma-core/rdma-core.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  1ea2c2678d48be0b179871e9ae8c58ceab11a0c5b69315a332ff51dd607180b7  rdma-core-49.0.tar.gz
> +sha256  a4065b0454249839dc75b61c6ee428e917d9cddf964ff7a33d479f00d1264ba0  rdma-core-51.0.tar.gz
>   sha256  99e0df1d009a21d0dfb031600c550fd8f4efc0c6b2a4ef8b34a995aa6f79c9f4  COPYING.BSD_MIT
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL2
>   sha256  c46a557f25b8ef9bec76526c4e593fc13e6cba27e7ba30d73b6497a689cf06f6  COPYING.md
> diff --git a/package/rdma-core/rdma-core.mk b/package/rdma-core/rdma-core.mk
> index 5f8989b3bd4..834d9ea3efe 100644
> --- a/package/rdma-core/rdma-core.mk
> +++ b/package/rdma-core/rdma-core.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RDMA_CORE_VERSION = 49.0
> +RDMA_CORE_VERSION = 51.0
>   RDMA_CORE_SITE = $(call github,linux-rdma,rdma-core,v$(RDMA_CORE_VERSION))
>   RDMA_CORE_LICENSE = GPL-2.0 or BSD-2-Clause
>   RDMA_CORE_LICENSE_FILES = COPYING.GPL2 COPYING.BSD_MIT COPYING.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
