Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7176CC6FD1F
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 19:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00CA8408D4;
	Tue,  2 Apr 2024 19:55:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sHUx-IejIuFm; Tue,  2 Apr 2024 19:55:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4752340798
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4752340798;
	Tue,  2 Apr 2024 19:55:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 63F711BF369
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 19:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5112640648
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 19:55:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pHUeT_CfPVAj for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 19:55:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E0EF9400C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0EF9400C1
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E0EF9400C1
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 19:55:33 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4156201223bso1410325e9.0
 for <buildroot@buildroot.org>; Tue, 02 Apr 2024 12:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712087732; x=1712692532;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qZVRK1kFHiY+hdSXnIa+1xww3m9lSKw+XNXbWG3Mef4=;
 b=vnWj4DNVIOEJr531j7KiEzSVElL/XWGaCB/3OGBR24Ygag5+PgZwWsRMbp/BP6rzQV
 gcsq3mQKU9cm/chh3ZDjZWeJ90RwQt/r+crm8/vvvBY4IQcm9VNInLY2fibCa2Mr5JJF
 C8jLx4PrFWfpYrD06hTsUdcWYFCHpVcI7a/J314dXZ38rnNfWm4/wa6p+omXefBUyPqh
 Q9FcSgaseNTDp2Bt2udc3bRL+AZz3w7cS0yrmpOYWPKij6gsosZYbfD+jQbu/eYc6jd+
 B5afp34WKWVeMLZo5FCkVDmqZgO86MTPdZ11iGfxNH4l6h3V5jQz22jcrl0dyt2O6Y9y
 vOMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2YSkrqLpRr4l1+O9CBnsgvSwu6lYgiv58HLFuYWwPf5sHrcJ5sqCshWcWwbHsLNULFmpjUlKpOcxtwfR9tj1O3MML9w8Q8g==
X-Gm-Message-State: AOJu0YxuJbW/odXgnbDV3aVo80UfKluAijhf0nUYxpDoIPQDEOtUX5VK
 +G+QXfkx98j3vaf7VzQPecN8L0jHYRYNrvOcUbdRsR5Mt14IcjK2ElYpMwqb9h8=
X-Google-Smtp-Source: AGHT+IEcKRcDw9qyCyzzlw1LvEINo2RVcoYau24y/VqQ4A/1bruDhaos07iFinHh1XC7O0eESjcQKw==
X-Received: by 2002:a05:600c:655a:b0:415:5144:b0a9 with SMTP id
 dn26-20020a05600c655a00b004155144b0a9mr406368wmb.13.1712087731693; 
 Tue, 02 Apr 2024 12:55:31 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a1c770c000000b00414041032casm7121wmi.1.2024.04.02.12.55.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 12:55:31 -0700 (PDT)
Message-ID: <d1b149a1-c5d6-4e6a-84bc-df35660752ea@mind.be>
Date: Tue, 2 Apr 2024 21:55:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240213214510.545574-1-ju.o@free.fr>
Content-Language: en-GB
In-Reply-To: <20240213214510.545574-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712087732; x=1712692532; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qZVRK1kFHiY+hdSXnIa+1xww3m9lSKw+XNXbWG3Mef4=;
 b=GiswOcaWKj1bv8rbV0rAkZSVtTAChEZNZFZOH1HoMsDIK8z875J7AAH3NLmq0cV0Pq
 PSw8JA2hfkj8Zp2OBEQLJ6UgTL20B6TmmjUFaJAvRdYoIfGIZEuyveLWRQJx8f+px6FO
 EPovT/ZQfTzGBW5XHmEQevPtzSd6i24gqoEzc/D78uei6xAj3ODrNzYoPtwS+9YxSxZz
 q9mtPSIHOqDN1LZLnLoDPTwEDqF5IknKSprc3ddA4KTUEiHFjFntm/T0wziZByrO47yu
 2mC2qDuD1pJ7dCTGzPQva1HxHyKa2MqmnvtjUQUNAYxSCz+KhBbEnHHYhia0eQ+MQg9w
 nXpA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GiswOcaW
Subject: Re: [Buildroot] [PATCH 1/1] package/lvm2: bump to version 2.03.23
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



On 13/02/2024 22:45, Julien Olivain wrote:
> For release notes since 2.03.14, see:
> https://gitlab.com/lvmteam/lvm2/-/blob/22e482d9655e8d041703af984b81d9b742027a78/WHATS_NEW#L4
> 
> This commit removes the package patches 1 and 2 which are now included
> in the new release. Patches 3 and 4 are kept and renumbered.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...sible-better-compilation-with-musl-c.patch | 30 ----------------
>   ...-freopen-to-reopen-standard-streams.patch} |  0
>   ...-freopen-to-reopen-standard-streams.patch} |  0
>   ...m-preallocate-memory-only-with-glibc.patch | 34 -------------------
>   package/lvm2/lvm2.hash                        |  2 +-
>   package/lvm2/lvm2.mk                          |  2 +-
>   6 files changed, 2 insertions(+), 66 deletions(-)
>   delete mode 100644 package/lvm2/0001-clang-possible-better-compilation-with-musl-c.patch
>   rename package/lvm2/{0003-cmdline-use-freopen-to-reopen-standard-streams.patch => 0001-cmdline-use-freopen-to-reopen-standard-streams.patch} (100%)
>   rename package/lvm2/{0004-log-use-freopen-to-reopen-standard-streams.patch => 0002-log-use-freopen-to-reopen-standard-streams.patch} (100%)
>   delete mode 100644 package/lvm2/0002-mm-preallocate-memory-only-with-glibc.patch
> 
> diff --git a/package/lvm2/0001-clang-possible-better-compilation-with-musl-c.patch b/package/lvm2/0001-clang-possible-better-compilation-with-musl-c.patch
> deleted file mode 100644
> index f537331a2c..0000000000
> --- a/package/lvm2/0001-clang-possible-better-compilation-with-musl-c.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From bac596b3685520acaa404dc3ebd2131e6de96d47 Mon Sep 17 00:00:00 2001
> -From: Zdenek Kabelac <zkabelac@redhat.com>
> -Date: Wed, 16 Feb 2022 00:48:49 +0100
> -Subject: [PATCH] clang: possible better compilation with musl c
> -
> -Try to help resolving reported compilation problem with
> -clang & musl C.
> -https://github.com/lvmteam/lvm2/issues/61
> -
> -Backported from: https://sourceware.org/git/?p=lvm2.git;a=commitdiff;h=4fd76de4b69f8e5e6d5afa03d54cb4b8986c4bcc
> -Signed-off-by: Simon Rowe <simon.rowe@nutanix.com>
> ----
> - libdaemon/server/daemon-server.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/libdaemon/server/daemon-server.c b/libdaemon/server/daemon-server.c
> -index 88905a7dd..96cfc392e 100644
> ---- a/libdaemon/server/daemon-server.c
> -+++ b/libdaemon/server/daemon-server.c
> -@@ -18,6 +18,7 @@
> -
> - #include <dlfcn.h>
> - #include <errno.h>
> -+#include <fcntl.h> /* help musl C */
> - #include <pthread.h>
> - #include <sys/file.h>
> - #include <sys/stat.h>
> ---
> -2.22.3
> -
> diff --git a/package/lvm2/0003-cmdline-use-freopen-to-reopen-standard-streams.patch b/package/lvm2/0001-cmdline-use-freopen-to-reopen-standard-streams.patch
> similarity index 100%
> rename from package/lvm2/0003-cmdline-use-freopen-to-reopen-standard-streams.patch
> rename to package/lvm2/0001-cmdline-use-freopen-to-reopen-standard-streams.patch
> diff --git a/package/lvm2/0004-log-use-freopen-to-reopen-standard-streams.patch b/package/lvm2/0002-log-use-freopen-to-reopen-standard-streams.patch
> similarity index 100%
> rename from package/lvm2/0004-log-use-freopen-to-reopen-standard-streams.patch
> rename to package/lvm2/0002-log-use-freopen-to-reopen-standard-streams.patch
> diff --git a/package/lvm2/0002-mm-preallocate-memory-only-with-glibc.patch b/package/lvm2/0002-mm-preallocate-memory-only-with-glibc.patch
> deleted file mode 100644
> index db16d60ace..0000000000
> --- a/package/lvm2/0002-mm-preallocate-memory-only-with-glibc.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From b668022f9b8aecf52109c9e0b7e5847054231361 Mon Sep 17 00:00:00 2001
> -From: Zdenek Kabelac <zkabelac@redhat.com>
> -Date: Fri, 19 Aug 2022 16:15:17 +0200
> -Subject: [PATCH] mm: preallocate memory only with glibc
> -
> -Use mallinfo() only with glibc.
> -
> -Backported from: https://sourceware.org/git/?p=lvm2.git;a=commitdiff;h=8370d117d7ef8a472c95315a3cd085696c90b3be
> -Signed-off-by: Simon Rowe <simon.rowe@nutanix.com>
> ----
> - lib/mm/memlock.c | 7 ++++++-
> - 1 file changed, 6 insertions(+), 1 deletion(-)
> -
> -diff --git a/lib/mm/memlock.c b/lib/mm/memlock.c
> -index 3d1a3927c..efcc6d91f 100644
> ---- a/lib/mm/memlock.c
> -+++ b/lib/mm/memlock.c
> -@@ -160,7 +160,12 @@ static void _touch_memory(void *mem, size_t size)
> -
> - static void _allocate_memory(void)
> - {
> --#ifndef VALGRIND_POOL
> -+#if defined(__GLIBC__) && !defined(VALGRIND_POOL)
> -+	/* Memory allocation is currently only tested with glibc
> -+	 * for different C libraries, some other mechanisms might be needed
> -+	 * meanwhile let users use lvm2 code without memory preallocation.
> -+	 * Compilation for VALGRIND tracing also goes without preallocation.
> -+	 */
> - 	void *stack_mem;
> - 	struct rlimit limit;
> - 	int i, area = 0, missing = _size_malloc_tmp, max_areas = 32, hblks;
> ---
> -2.22.3
> -
> diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
> index 126748d339..74c5f4f1bc 100644
> --- a/package/lvm2/lvm2.hash
> +++ b/package/lvm2/lvm2.hash
> @@ -1,5 +1,5 @@
>   # From https://sourceware.org/ftp/lvm2/sha512.sum
> -sha512  6a93bed1d5cf36f0f48d4d413d028b0e480cd4fc20e25d173770a892f265d2a0cc68d01a720b1513469953649e989532cd0c45f9538f92a4190eb3dc4555857d  LVM2.2.03.14.tgz
> +sha512  293430a80c7f599d14e77610456d0f44cac8164e6159cd0e2e287462278a89787e289fdb4d481eb8fd6b5eea07a6535c41cb7fdc3deee83df7fea9bf77dcbdaa  LVM2.2.03.23.tgz
>   # Locally computed sha256 checksums
>   sha256  e76fbcd2fb97cf202da330301327754d2db5c58b5b4bebd3a8a749393e7603d1  COPYING
>   sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LIB
> diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
> index 810d668ec2..bda1648955 100644
> --- a/package/lvm2/lvm2.mk
> +++ b/package/lvm2/lvm2.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LVM2_VERSION = 2.03.14
> +LVM2_VERSION = 2.03.23
>   LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
>   LVM2_SITE = https://sourceware.org/ftp/lvm2
>   LVM2_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
