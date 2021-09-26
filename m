Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E624C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:50:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0963960F91
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0963960F91
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C37FC4029D;
	Sun, 26 Sep 2021 19:50:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VoHiMx8MHzoG; Sun, 26 Sep 2021 19:50:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFE6B402D4;
	Sun, 26 Sep 2021 19:50:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A87FA1BF383
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9858D606DA
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:50:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IarMdG8v8cYB for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:50:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 541B960596
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:50:41 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id ee50so60025872edb.13
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 12:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=lB0MbWmcHJk1tT5zwBx8hharEjz9z54hRumBeOlRB/M=;
 b=PX3ZkAzmCH8M9F5pwUbV9MGmzzhwRbMQJFDUYRG4bxi/qrtN3brh4G4tBhmm4pxfDh
 QYM6vPNz8+pv8HqjAFIdT0p0dr2M3UEan3IHVq45gGjTgU5TjVjoXlEFV9fclKjuk5Mh
 HUaJUGVQQTVfrzFmWlaApde7IUn08ByHOpv159XetCHgV6L/NyaFTNxQv4hGTsp0H96J
 L6cpM7bpNeAYHS9AMt2Ce+d2p4Yq75v7T05fXdTr0YZHl4MImuu/E0QnFpbV7Agf5/mb
 6sediSq6vJ7uVSmZ/X4ZXlLpMUtd6GJYvYwaJkNKrW/iGDVX1zRj3Z28B2OZpfY/RQWt
 zuzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lB0MbWmcHJk1tT5zwBx8hharEjz9z54hRumBeOlRB/M=;
 b=gKGLbPGlDEYZuz2/3ZXLjHFwXvr1K8mC2JfDnVO+1s+cQE6ym+dmuuxZyJBnL+ZepK
 J6LG7aCuXUb4Z9hJXuTJ7Esra2kXBReUB+eYP99l6iiI0U2fEVyJ3wiSWVJ3nJIHVk5x
 4gEc2jbUY8S4/cUJZRpjczqlTD0iTOx4bI7Y0t3T3h1iH0sq37b+e4FGR47B9qlPfUXA
 fiImHW9sTrwpUwwRjKhTIAPpXr1wuSA0jfRWSPyvSFYLiViL8TBGO97aKaOwTTAt9fmI
 +HDiECFr6mIuLpayA6aT/wEqJ/M5YGQyxmtdPcNh85tCTL50TSZWYhWPsNqf86irbBKi
 ErDw==
X-Gm-Message-State: AOAM530ldpVd2JHi+MejMvoHw2e5ApQAi76QEdzKt6mNHUZDcHMkNw6M
 oY/J0Due/OP8ADpHVcxmuFdfCvMY1UJEzQ==
X-Google-Smtp-Source: ABdhPJzl3gQYxN1mNRVjzOahx6VEEyaaVtHEUw1wZ8qhq6sy8+uzGBOUhwAS0ZnySn+HeCFONZ7CCA==
X-Received: by 2002:a17:906:60c7:: with SMTP id
 f7mr11108970ejk.57.1632685839578; 
 Sun, 26 Sep 2021 12:50:39 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id j6sm7618065ejk.114.2021.09.26.12.50.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 12:50:39 -0700 (PDT)
Message-ID: <557a3895-d456-c4aa-0994-78ff262eba82@mind.be>
Date: Sun, 26 Sep 2021 21:50:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20210926110513.1660955-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210926110513.1660955-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi: fix build with fmt 8.x
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/09/2021 13:05, Bernd Kuhls wrote:
> Backport upstream patch, no autobuild errors detected so far.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../kodi/0002-utils-include-fmt-xchar.h.patch | 34 +++++++++++++++++++
>   1 file changed, 34 insertions(+)
>   create mode 100644 package/kodi/0002-utils-include-fmt-xchar.h.patch
> 
> diff --git a/package/kodi/0002-utils-include-fmt-xchar.h.patch b/package/kodi/0002-utils-include-fmt-xchar.h.patch
> new file mode 100644
> index 0000000000..70c88412e9
> --- /dev/null
> +++ b/package/kodi/0002-utils-include-fmt-xchar.h.patch
> @@ -0,0 +1,34 @@
> +From 18ff80a9c169fb969b75e2143d9f1f234b71a730 Mon Sep 17 00:00:00 2001
> +From: Craig Andrews <candrews@integralblue.com>
> +Date: Thu, 24 Jun 2021 20:41:11 -0400
> +Subject: [PATCH] [utils] include fmt/xchar.h
> +
> +fmt 8 moved wchar/custom char overloads to xchar.h, so for fmt 8 compatibility, xchar.h must be included
> +
> +See https://github.com/fmtlib/fmt/commit/76ee490468212f8705a1421b4c88f8f814b2d351
> +
> +Downloaded from upstream commit
> +https://github.com/xbmc/xbmc/commit/18ff80a9c169fb969b75e2143d9f1f234b71a730
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +---
> + xbmc/utils/StringUtils.h | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/xbmc/utils/StringUtils.h b/xbmc/utils/StringUtils.h
> +index ca6f82953d..2dc5c3f03a 100644
> +--- a/xbmc/utils/StringUtils.h
> ++++ b/xbmc/utils/StringUtils.h
> +@@ -36,6 +36,9 @@
> + #if FMT_VERSION >= 40000
> + #include <fmt/printf.h>
> + #endif
> ++#if FMT_VERSION >= 80000
> ++#include <fmt/xchar.h>
> ++#endif
> +
> + #include "XBDateTime.h"
> + #include "utils/params_check_macros.h"
> +--
> +2.30.2
> +
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
