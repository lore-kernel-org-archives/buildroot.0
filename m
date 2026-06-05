Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200BFCD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAB8941138;
	Fri,  5 Jun 2026 12:49:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YWWE9FIIcyud; Fri,  5 Jun 2026 12:49:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E937D4105F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663752;
	bh=EiA3Y4bkP2BeBiztquNBjsUh4Kv2vUXFevZ688XQ4P0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YbsYOGX0QKGLSRRCaFcYKFjlyxm3OcK/a/p40gNWUDWz4e12Dqip/MU6sEZoStsiC
	 GD6ZjELH4A0ZKZPLhMQTAoG/wu39fZ+rgDVvgSlURB/bavStrTH9x5sGmuu4YMdPNm
	 QWrpCtQoktqmbUHbkMrIP1MaEsA/77dIQG0wbQbMMwF3K8OGvy4WrDvUJpBjAEZ6HY
	 TOtD/AXKEuGilI6mV+HcJ9Z4P6amrZ6CzLTkBX5lyNLwxEMdGSHiBjYJJyuCivA/eH
	 eQxJ7zMVGLKvees0/5JEcPvmz98VHyBRp9T7BNsvMWrOf7BSkbLNbLOrDFyOH7tJAa
	 mtZrBimapjPKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E937D4105F;
	Fri,  5 Jun 2026 12:49:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 082C5388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D09560AED
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QsY2m390Q4RS for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:49:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0F27560B5B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F27560B5B
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F27560B5B
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:08 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-490b1bbcf3aso15186175e9.1
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:49:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663747; x=1781268547;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ysoOvSTn5cvwu7trRJUZ/ts7csf89Teis3++NU/zgFs=;
 b=ZU6pE08n3ESOkFdaIzes64kuu1IU459EAxK/1WL+jtK1dL3DIqODyqBKgufIeRbk5D
 8pNPSZgXMhRwAJXaukGasFpZh+hXObu+5vbefeOt2qRCpGUmS6jTuyUMidX3DnSsYRlm
 CQhY0wnPxPhZwrengBX/Rr0r7bJP2851YZUqHHHLEuTuN7JoI6T9szTgZEruxERNoLeI
 tXUBzq0MnoywA+UBAzIrUer9Jnis68bzU7i3HvQCa0yXtaZXIuxjmIzkmQX4s/HjyT/N
 QrEVne+m2rHaSmUlBXQB7MwSUW9Nm9kJCCDI3438lj9eW08Ezpv8YJBswscpNG1Rji1f
 YlDg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+5xcPVAJAlN6FbH3uY/LYgrZ8/ktDa7eBPdGUo3nC/dbr0ek529pgZlk4tqO4PLLAaZP8QnGFpUV0=@buildroot.org
X-Gm-Message-State: AOJu0YytAHspTEhll8ZS8gBoM6XWcr2kjOuO0gtQhwFE1fa3fLC6/k8Y
 Rg9cnk0mOJRwEG2b7XKgpoTUMl8hPtPj4ws4A7wnPYCN5jtql/BrATMZYT5UkC9TuIrugdS9z4+
 2uvLV
X-Gm-Gg: Acq92OGVjtVaqNWgd69ie2Zpt8E79OogykzW6TOMqrYLYXTmuUCry+Yo/tlTBzCDVFY
 1baUKTFeaI5NNl45CAqFQfO5cRv613voVuiUvg4yjUypaEL+sceciJWIkqk2xb2etUTKAJjdaQg
 dwU0zSxvWUhwGy0M6oiGe3W1YmhnK/BHfdV+WqS5UozqZxNjFZp2KeREQW4BsKKvQVV8IMurKNa
 KJTI0O3wPhN6MmK+bO25ZjQkJ7g9aE6au5qvgjpTAPIK7cdmh5gHrJbo0mdPhWL5isDG8x0TI0L
 yO/9Rj6MZC5lWtGa2T7fBDaQQ7HNTEh6BJetttNB2/G9KIS+lFtPVDgG/+AkkAOVulr5oxI9U7g
 czNwqhrI27hCKY8tqsSvIVqd+7trgc/bz3usPfmAzK71V1PVtlNpv/xHY8rdrrhaVUDAyrMapxD
 5N9m5aWEOlqO+nTNpmeMULF0jQ3g==
X-Received: by 2002:a05:600c:8b17:b0:490:c2a2:e91f with SMTP id
 5b1f17b1804b1-490c2a2ea7cmr50530535e9.35.1780663746966; 
 Fri, 05 Jun 2026 05:49:06 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3d6c65sm150350115e9.12.2026.06.05.05.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:49:06 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:49:06 +0200
Message-ID: <20260605124906.270399-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603072312.956030-1-giulio.benetti@benettiengineering.com>
References: <20260603072312.956030-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663747; x=1781268547; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ysoOvSTn5cvwu7trRJUZ/ts7csf89Teis3++NU/zgFs=;
 b=QPCW0+kYth6EqGqEy8EQ7PsOo9wK0lBVm2dDDcI23HClwozH4LIHe0EPkOp7pRvMDI
 K1kqGqT/SEYza0hxD5dmVHlbHbhKInEOwZOw7luDwgQi63brl/r2PKAzb3f/rCUfBnG2
 bgGAyi+AvaUWU7RqOwCkiZrRffdX9bt0mNt590LzVhiOpPwRrb4R2KeLZ8AKFF1D83Z6
 jAp4I2JIYg959nufswwx52abk694px0RGf+R+AVSEROwhoBp1qNcoIsr0XGetbUsBmqS
 fZyDerEgxg4I37JTtnzfgGT/YH3xIIqiF1Ukq8BQ3ZjgSWhOAyIw8dodQNxesBXWuCte
 tplw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QPCW0+kY
Subject: Re: [Buildroot] [for-2025.02.x] package/swupdate: fix build failure
 due to missing limits.h
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
> Add local patche committed upstream to fix build failure due to missing
> limits.h include.
> 
> Fixes:
> https://autobuild.buildroot.org/results/6ed019be7ff0144679f150dbd67cec4dd31fdb15/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x. Thanks

> ---
>  ...001-lua-add-limits.h-to-set-PATH_MAX.patch | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/swupdate/0001-lua-add-limits.h-to-set-PATH_MAX.patch
> 
> diff --git a/package/swupdate/0001-lua-add-limits.h-to-set-PATH_MAX.patch b/package/swupdate/0001-lua-add-limits.h-to-set-PATH_MAX.patch
> new file mode 100644
> index 0000000000..4dcc88cbfb
> --- /dev/null
> +++ b/package/swupdate/0001-lua-add-limits.h-to-set-PATH_MAX.patch
> @@ -0,0 +1,30 @@
> +From 3de6491463f4b1ddf2e792771831acfb705e246d Mon Sep 17 00:00:00 2001
> +From: Stefano Babic <stefano.babic@swupdate.org>
> +Date: Tue, 11 Feb 2025 09:08:15 +0100
> +Subject: [PATCH] lua: add limits.h to set PATH_MAX
> +
> +This fixes github action (debian slim), with other builds the file is
> +automatically included.
> +
> +Upstream: https://github.com/sbabic/swupdate/commit/3de6491463f4b1ddf2e792771831acfb705e246d
> +Signed-off-by: Stefano Babic <stefano.babic@swupdate.org>
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + corelib/lua_interface.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/corelib/lua_interface.c b/corelib/lua_interface.c
> +index 02d48259..ffe62d88 100644
> +--- a/corelib/lua_interface.c
> ++++ b/corelib/lua_interface.c
> +@@ -16,6 +16,7 @@
> + #include <sys/sysmacros.h>
> + #endif
> + #include <sys/types.h>
> ++#include <limits.h>
> + 
> + #include "lua.h"
> + #include "lauxlib.h"
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
