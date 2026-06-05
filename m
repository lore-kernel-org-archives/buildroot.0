Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F63CD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1035A406FC;
	Fri,  5 Jun 2026 12:51:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4w3YK2pL9eML; Fri,  5 Jun 2026 12:50:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAB6740764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663858;
	bh=oe6BhHrkadGn+etXQhe2sm/zY4og2U3YiIjJ9B3f6qs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=k4rTaiwJji9HqDq0O7OJsg0MweEP56OUnI7kVzq3Xpy10uGq5cDcXndA4GAoJGfBp
	 TomgPptGbO80m4Njfgfx31yr0wjin6HdM5raXlEXuIJpbIrHeU8afD0R0b+OA1t5DB
	 9qgnClpqNMSKypJoerrDVjaN0azTKH29KzGQFx0AsdCScrKwHnk0l+RULRbPaYTdUV
	 z84GUuaLfMotKdSthiAgMZSvFTe3MFoBoUMnWxXT573NuUDXXTBx/gHPSKoWkkcgns
	 N6z/yb2kfAw3Ifb0YSKnC7f4i/LiW1vfbNwsIRfMMmL9JQW5xPmaEuwGVYgdqWmESZ
	 n3GLu4exA4GeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAB6740764;
	Fri,  5 Jun 2026 12:50:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 13503F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B63F180759
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5dwgevAUkKbW for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8D97C806A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D97C806A1
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D97C806A1
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:54 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-490abf12f0fso10117755e9.0
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663852; x=1781268652;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RUI3ZSawfFg6OGlahG66qGimSHKMiVW0XmSGPz4pQnQ=;
 b=szN2nQm0T2i7q2ShWAXDS4YY8m/egBT7nHDlSD/jQNXnwKxSRsxIY/Y+bpzzrHZweH
 +UIy69xQpCOVJCfD9enbkHyPdyuYFZCE5rx2EEdair+2jeKPnzA/nv5Y0xOj1IsG1aqF
 6u2KBGiLNQUOXGnNQe4+Igyw+tAiFzcxzDJOIANPR0qwEdQdytj9AcSC1z/OnSwxhF91
 8EqaGlgzKYmhkdYigkDwGeGM6iOsebwLYqVWlktfLT3e99a/0jg+cetdfKXo09BqOxhe
 wsViUw5xnLvsp3vMGEWgMfiqmKho5DuawVr5WWnE8dJgIBe3UWF9o+QYu3ajBzwRb+YE
 WhhA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+gfrV4jkiEkq2CbYHAYziDvuw8k5E0qoCNlOlmNZhrMHj/obXI3+B+EBV/1bFhFMGnUDG8VTotCzY=@buildroot.org
X-Gm-Message-State: AOJu0YyEav5FigBlcW4HlZ2TF0xEm6yeqRvW7NcmAz4ttjhIxXi5GGl3
 uvwPRct5/gPhMkdfneNsuPhiOCP+LfZRDlI7pZulhInpFwCKz6RZQu3OTE4DocFBgMXvrcqF5d3
 nCaQC
X-Gm-Gg: Acq92OF4waoXliKRMEAIqTxsbg2qbrF4Getqe+JD29AB5rRffqO7CLWdGuhqsw3BTQ/
 iMjBhvgOu+GMIeSWDWso2tFgcKj4OKx8CLa8yJUo0OgpDmnFt10D7HdmFZnjp+GOde8C77wlqRU
 0BAVABkcyBzFEsrEZij0HNseB//KSJRZtDN+mdLDfOmFTbFvcQyXtPGQRZhEUraviHoAy0wRGFg
 ofD78MOU/p5u+K4SWWiGrfgokw+XnIA0R1fjxlD/H+ckNv5UY9ceNf47OuC4fwrsZ4y9lK2Q87I
 wE3mPLVsgYi8f/cwPSyu6PIvFXO6YnpHdQAlWcBLJWUg5YPrHQlH6/WDz6v/dY7OkeztN6N/oav
 kiMw7a4fFnD739v8Z6xvOrgmFaDk60qp6GsieC1ZzcdSaA1+6XloTPjVZk4u8j1ZOSTUlRCFGrA
 6OlrIM62qrkCpl3CCM5w4/d/BvSQ==
X-Received: by 2002:a05:600c:6388:b0:48a:53cb:8604 with SMTP id
 5b1f17b1804b1-490c2d1412emr41083295e9.14.1780663852495; 
 Fri, 05 Jun 2026 05:50:52 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2dcbe3sm24663316f8f.8.2026.06.05.05.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:52 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:51 +0200
Message-ID: <20260605125051.274563-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527195633.3540374-1-bernd@kuhls.net>
References: <20260527195633.3540374-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663852; x=1781268652; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RUI3ZSawfFg6OGlahG66qGimSHKMiVW0XmSGPz4pQnQ=;
 b=LlUO/DKvVzyB1vs922m8DrjeP8l8+qAF1MSsQhBUosgoaNk6Ib+NRTB58HdZRSmADF
 ah9B5HQutKZD2JVTPlzdzKw6MdHIj6F5TRsW+qu0W77QIeLnnIUPJXjYEp+lk2CdB/K1
 4163MP/rFBMBEwumLHBV9hGdsesv/Qos+9TFhFjy0r95doM7EUsUpkCY/Ju9HfjGcspq
 XNPBWmGf6oKVh50D9+1sLU43vwGH+2vZl7mAiCJ/reOu/FLTjlw1WLdJARi+iGak7X0E
 Py58ql3QMYwk44uePwgpMLXvmoom/hA2VTeUEv/4puttqbo/ZneiynqcBrZqyjUHswSH
 X5tA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LlUO/DKv
Subject: Re: [Buildroot] [PATCH v2 1/1] package/vorbis-tools: Fix build with
 gcc 14.x
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Buildroot commit ce5d1735710d11b135fc6cb235e976b306833e7d removed
> 0001-fix-build-with-gcc-14.patch which the version bump to 1.4.3.
> 
> The patch originally not only fixed share/utf8.c but also
> ogginfo/codec_skeleton.c. Upstream only applied the fix for
> ogginfo/codec_skeleton.c:
> https://github.com/xiph/vorbis-tools/commit/68c5a33685f5b86e7f18f239ceb8861484fee552
> so the build still fails:
> 
> utf8.c: In function 'convert_buffer':
> utf8.c:271:9: error: implicit declaration of function 'charset_convert'
>  [-Wimplicit-function-declaration]
>   271 |   ret = charset_convert(fromcode, tocode, from, fromlen, to, tolen);
> 
> Added upstream commit to fix the problem.
> 
> Fixes:
> https://autobuild.buildroot.net/results/135/13520e3cbf6b6d169985f4d1378c2a1baab852e0/
> 
> The build error can be reproduced by this minimal defconfig:
> BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
> BR2_PACKAGE_VORBIS_TOOLS=y
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> v2: replaced backported patch from Fabrice with upstream commit
>     added result of Gitlab pipeline:
>     https://gitlab.com/bkuhls/buildroot/-/pipelines/2556996655
> 
>  ...r-charset.h-to-find-charset_convert-.patch | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/vorbis-tools/0001-Added-include-for-charset.h-to-find-charset_convert-.patch
> 
> diff --git a/package/vorbis-tools/0001-Added-include-for-charset.h-to-find-charset_convert-.patch b/package/vorbis-tools/0001-Added-include-for-charset.h-to-find-charset_convert-.patch
> new file mode 100644
> index 0000000000..3e97976fd8
> --- /dev/null
> +++ b/package/vorbis-tools/0001-Added-include-for-charset.h-to-find-charset_convert-.patch
> @@ -0,0 +1,32 @@
> +From 5155bf98a5b10fdf950dfa8f6edad624c0db7030 Mon Sep 17 00:00:00 2001
> +From: Petter Reinholdtsen <pere@debian.org>
> +Date: Sun, 22 Feb 2026 23:33:59 +0100
> +Subject: [PATCH] Added include for "charset.h" to find charset_convert()
> + prototype with gcc >= 14.
> +
> +Patch from Bernd Kuhls.
> +
> +Fixes #2334.
> +
> +Upstream: https://github.com/xiph/vorbis-tools/commit/5155bf98a5b10fdf950dfa8f6edad624c0db7030
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + share/utf8.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/share/utf8.c b/share/utf8.c
> +index e1199bc..1e6965f 100644
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
> +2.47.3
> +
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
