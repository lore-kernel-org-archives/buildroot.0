Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04664C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 08:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1892402D9;
	Mon, 22 Jul 2024 08:03:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UuYm26sKzE2J; Mon, 22 Jul 2024 08:03:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66C9B402ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66C9B402ED;
	Mon, 22 Jul 2024 08:03:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3420F1BF29F
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 08:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E988810E7
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 08:03:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tg3lDvySLEcR for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 08:03:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B4601810F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4601810F1
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4601810F1
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 08:03:05 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4266ea6a412so28312575e9.1
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 01:03:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721635383; x=1722240183;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eJUHMCYL5MvMHxt9TsWIGPsbJJtWTZK1guzNuEjkdCw=;
 b=VvXLu4CQTOyPQMWIL55dB/Y2+d5TnjIciJHY8kJQIy8U7XS07NRrCwa2ovjtFsTvTn
 cGHzIzvcHj1H22C7WeEHbKvm0u8/eRIbfZuYnfobGGb0JzjDkxlU/jPutPp6EyUwl9hb
 Pr2ba3nvJLSyQbjWyIPU1Ly4CF4Vz7SWGL1GcqGL+O5OWOxqfh1V/EtyS/UDcU/BGm0o
 6xM/j4VM2jrlkA5dU5v4QSeY9C7+KGlM7xLMpkevelrhd3rwQKz5eY7WMRvsFru1aDZX
 zQ3Lw0RH4XQtvnigvhAEUXOYqyN6pLDxsTtydMzTm8ROI0cjm9wjaxuE7bXPwXfS8JjH
 ojkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWO0sx746Pg+VxV8GwaVPZ7w7s0Bc5gTd4gthp6GwiIThMcZigp2GrUy66Io5TVOw6aV/KNMlcY3BbBRwP2wCl9E41t/UR6Eg==
X-Gm-Message-State: AOJu0YzMVgv2d5EqQf7uj+FctUueCyKk6NBeydXlZnmT/NGeW5EWRDp/
 NonzCo/VDb5M7ZCackYn5x28IM5kDq9fy7AnhFGu5Uk5+IJNRs9xTnM/UB8v0zs=
X-Google-Smtp-Source: AGHT+IGaSsaZ3GnXlBqrugBYo0r6jdWYCTSSvGeWCUcyVlb/lxODKCRq3LQI6Ydip/ArsbYA3StHmA==
X-Received: by 2002:a5d:6488:0:b0:360:96d8:ab7c with SMTP id
 ffacd0b85a97d-368315f326cmr11890205f8f.11.1721635383451; 
 Mon, 22 Jul 2024 01:03:03 -0700 (PDT)
Received: from [192.168.6.174] (213.211.177.222.static.edpnet.net.
 [213.211.177.222]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787ed580sm7732452f8f.112.2024.07.22.01.03.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 01:03:03 -0700 (PDT)
Message-ID: <6f13a49a-7b41-4ed8-8127-526a2bdf712e@mind.be>
Date: Mon, 22 Jul 2024 10:02:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240721200430.3070270-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240721200430.3070270-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721635383; x=1722240183; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eJUHMCYL5MvMHxt9TsWIGPsbJJtWTZK1guzNuEjkdCw=;
 b=Hbp6zX9m79m1oadQstVEcLrsYbgOhAAJMqk2oS/66WkL4ZdGPnGJkyZEl6MG0yAOQD
 NzHhmfAPai/DA6sih8ym9W5tRFstk+3QbSZ8UtsfCrzVTZ1v/1CH5qJRKXY20RV/K+ci
 mUcf4vc6fMdGop4wevlhkpIh1AFhFaYHaMVD86mFk3OFcC5/a2h+9vOL4yABiP9JO4Xb
 d3nRMzeFdNT/fMAX8R7gr0G8G21yR7FlJjnYq81P35scCMQKnCjlQr4f1ffnXBZ7E/s7
 28dcmXUuKRUdfojbKvi3UxZUaCerMoVH4gVyFziz2QexcXDDyx631GVmEmD1fvXohrFd
 9jAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Hbp6zX9m
Subject: Re: [Buildroot] [PATCH 1/1] package/vorbis-tools: fix build with
 gcc >= 14
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



On 21/07/2024 22:04, Fabrice Fontaine wrote:
> Fix the following build failure with gcc >= 14:
> 
> codec_skeleton.c: In function 'skeleton_process_fisbone_message_header':
> codec_skeleton.c:119:9: error: implicit declaration of function 'utf8_decode' [-Wimplicit-function-declaration]
>    119 |     if (utf8_decode(header, &decoded) < 0) {
>        |         ^~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/bb5d56d836e7d0f2a62daa9954878ad6e0b190ed
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../0001-fix-build-with-gcc-14.patch          | 51 +++++++++++++++++++
>   1 file changed, 51 insertions(+)
>   create mode 100644 package/vorbis-tools/0001-fix-build-with-gcc-14.patch
> 
> diff --git a/package/vorbis-tools/0001-fix-build-with-gcc-14.patch b/package/vorbis-tools/0001-fix-build-with-gcc-14.patch
> new file mode 100644
> index 0000000000..a05ce8a584
> --- /dev/null
> +++ b/package/vorbis-tools/0001-fix-build-with-gcc-14.patch
> @@ -0,0 +1,51 @@
> +From f4a31fe975ea37537f39ace4420aee893b7e0b1a Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 21 Jul 2024 21:57:38 +0200
> +Subject: [PATCH] fix build with gcc >= 14
> +
> +Add missing includes to avoid the following build failure with gcc >=
> +14:
> +
> +codec_skeleton.c: In function 'skeleton_process_fisbone_message_header':
> +codec_skeleton.c:119:9: error: implicit declaration of function 'utf8_decode' [-Wimplicit-function-declaration]
> +  119 |     if (utf8_decode(header, &decoded) < 0) {
> +      |         ^~~~~~~~~~~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/bb5d56d836e7d0f2a62daa9954878ad6e0b190ed
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Upstream: https://github.com/xiph/vorbis-tools/pull/48
> +---
> + ogginfo/codec_skeleton.c | 2 ++
> + share/utf8.c             | 1 +
> + 2 files changed, 3 insertions(+)
> +
> +diff --git a/ogginfo/codec_skeleton.c b/ogginfo/codec_skeleton.c
> +index a27f8da..f906f8c 100644
> +--- a/ogginfo/codec_skeleton.c
> ++++ b/ogginfo/codec_skeleton.c
> +@@ -28,6 +28,8 @@
> +
> + #include "private.h"
> +
> ++#include "utf8.h"
> ++
> + typedef struct {
> +     bool supported;
> +     uint16_t version_major;
> +diff --git a/share/utf8.c b/share/utf8.c
> +index be378d1..e819b67 100644
> +--- a/share/utf8.c
> ++++ b/share/utf8.c
> +@@ -28,6 +28,7 @@
> + #include <stdlib.h>
> + #include <string.h>
> +
> ++#include "charset.h"
> + #include "utf8.h"
> +
> +
> +--
> +2.43.0
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
