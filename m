Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ABF1C433FE
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:15:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCF0260230
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CCF0260230
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90726400F0;
	Mon, 25 Oct 2021 20:15:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wqpMqz2tmMr5; Mon, 25 Oct 2021 20:15:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91E324014B;
	Mon, 25 Oct 2021 20:15:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6BA631BF870
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A1BE400F0
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:15:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id clpI7IAK40Gw for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 20:15:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 26EE34014B
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 20:15:42 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id w15so4061725edc.9
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 13:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ap4RYMjGM+CnlMjkFes3GVf4E9P/a2NJtr6EyGgmNPA=;
 b=gVrh/otGp/Jz+l3y88TpUdQhf4q/xrqkmOMHlsLp8mAINyYoko2FPrBVl+3Nye/7SG
 ZpQXFNuyBbEPKJ4d8KgP/AfA7M6sWHuOXCjLmYniyJjBG/e9rBqNq8pzEHPCWRVUyLuz
 86mf44iRr/5Vsv4qgx2Z0/4pss+Mon4WQE9q3C7XY5Q6t57qcy51JMVDpQ/wSIqObT5O
 lbmpVm3teFQFOLJtBhoaKhYgHc1Ci+AGlVvZhSam2ju3XE+rJeHgSkNkAOvQc9vKYiHg
 4gfq1oRoAd5wvoFJyxvJiqm0bFpUe/T7JMqyopLARhCTnL/rwkhAdIsQJz4AApIiWI/j
 pEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ap4RYMjGM+CnlMjkFes3GVf4E9P/a2NJtr6EyGgmNPA=;
 b=oZhCG/XCwWVo+etvmObmsfXcr502nzkM14HVbDQvAuiWN+VPGloojMOZ3envgV7chL
 OlBZSm9PIIrSx2kbN8tgH3O8GI8fnMHS4oNW4kYhMexCZNnFMse26paMwiJsCE5Yhw8n
 KblfgfW7ALop0UYlUMVdFf0GKciagnlOYL5PopCRIIFGb8ZCOS378E0A9bwZbFEp9Ox1
 0D8XwE3y0gv0IfWV8ulzJ0bKa8Z2DYoll2rLLtVUUJwSBMPZSif1qRXzpV2GLppDGNkh
 M4eVh3FPWbFtEoZ6YPIfXvjMQGSnBQA3EB8j9X4StheW2qaa2MwfYERhXHYbyo2hODbD
 jUzw==
X-Gm-Message-State: AOAM531AxrvbEejnBcDwBAgCfQuOebQinQMbNP2pAyHUVsrTYLaqwPGu
 yUmBI9HljQbXfILiOwrU8G10X8W99UzW19NA
X-Google-Smtp-Source: ABdhPJz6QkPP6BrIGyPJdF1rlIyrn6JWTl58JXAZfMj6D8HlVQJelR5T3jX9Cf53C7HQp+d6zvQLGA==
X-Received: by 2002:a05:6402:5c9:: with SMTP id
 n9mr28850721edx.90.1635192940299; 
 Mon, 25 Oct 2021 13:15:40 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h18sm7919911ejt.29.2021.10.25.13.15.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 13:15:39 -0700 (PDT)
Message-ID: <d1a6dde7-8fd9-0bf7-72de-8b3ccdfb5f32@mind.be>
Date: Mon, 25 Oct 2021 22:15:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211016130029.2855627-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211016130029.2855627-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libuio: bump to
 6ef3d8d096a641686bfdd112035aa04aa16fe81a
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
Cc: Joris Lijssens <joris.lijssens@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/10/2021 15:00, Fabrice Fontaine wrote:
> Drop second patch (already in version)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libuio/0002-fix-build-with-musl.patch | 57 -------------------
>   package/libuio/libuio.hash                    |  2 +-
>   package/libuio/libuio.mk                      |  3 +-
>   3 files changed, 2 insertions(+), 60 deletions(-)
>   delete mode 100644 package/libuio/0002-fix-build-with-musl.patch
> 
> diff --git a/package/libuio/0002-fix-build-with-musl.patch b/package/libuio/0002-fix-build-with-musl.patch
> deleted file mode 100644
> index 6e5b168c14..0000000000
> --- a/package/libuio/0002-fix-build-with-musl.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -From c378ee112857128002754c616acb6841ee32aaf6 Mon Sep 17 00:00:00 2001
> -From: Romain Naour <romain.naour@smile.fr>
> -Date: Sat, 2 Jul 2016 10:52:28 +0200
> -Subject: [PATCH] fix build with musl
> -
> -limits.h header is missing in attr.c, base.c and helper.c to provide
> -PATH_MAX.
> -
> -Fixes:
> -http://autobuild.buildroot.net/results/702/7023104e6018ea46c54073ddbe5119d0f66ae5a3
> -
> -Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ----
> - attr.c   | 1 +
> - base.c   | 1 +
> - helper.c | 1 +
> - 3 files changed, 3 insertions(+)
> -
> -diff --git a/attr.c b/attr.c
> -index 4245140..7512f4e 100644
> ---- a/attr.c
> -+++ b/attr.c
> -@@ -25,6 +25,7 @@
> - #include <dirent.h>
> - #include <errno.h>
> - #include <fcntl.h>
> -+#include <limits.h>
> - #include <stdio.h>
> - #include <stdlib.h>
> - #include <string.h>
> -diff --git a/base.c b/base.c
> -index 14ebcee..4ce7301 100644
> ---- a/base.c
> -+++ b/base.c
> -@@ -25,6 +25,7 @@
> - #include <dirent.h>
> - #include <errno.h>
> - #include <fcntl.h>
> -+#include <limits.h>
> - #include <stdio.h>
> - #include <stdlib.h>
> - #include <string.h>
> -diff --git a/helper.c b/helper.c
> -index 170f084..1fb0b4c 100644
> ---- a/helper.c
> -+++ b/helper.c
> -@@ -25,6 +25,7 @@
> - #include <dirent.h>
> - #include <errno.h>
> - #include <fcntl.h>
> -+#include <limits.h>
> - #include <regex.h>
> - #include <stdio.h>
> - #include <stdlib.h>
> ---
> -2.5.5
> -
> diff --git a/package/libuio/libuio.hash b/package/libuio/libuio.hash
> index 54fb02b112..48904a94ce 100644
> --- a/package/libuio/libuio.hash
> +++ b/package/libuio/libuio.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  1494375bd493ef1a1b868ce2cbc7d29f3f9f692c21f70689eae28566e56f2c15  libuio-ca28ff0f69d89a789a47552c72db5a43d280710b.tar.gz
> +sha256  cb6d2ed1c6c7fd8e0e4a9cb1d81bd88f3af37bd239fdf8966b3cb3671ff6db86  libuio-6ef3d8d096a641686bfdd112035aa04aa16fe81a.tar.gz
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/libuio/libuio.mk b/package/libuio/libuio.mk
> index b6e8e7e774..a0285277ab 100644
> --- a/package/libuio/libuio.mk
> +++ b/package/libuio/libuio.mk
> @@ -4,8 +4,7 @@
>   #
>   ################################################################################
>   
> -# v0.2.8
> -LIBUIO_VERSION = ca28ff0f69d89a789a47552c72db5a43d280710b
> +LIBUIO_VERSION = 6ef3d8d096a641686bfdd112035aa04aa16fe81a
>   LIBUIO_SITE = $(call github,Linutronix,libuio,$(LIBUIO_VERSION))
>   LIBUIO_LICENSE = LGPL-2.1 (library), GPL-2.0 (programs)
>   LIBUIO_LICENSE_FILES = COPYING
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
