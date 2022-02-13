Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7277AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 230BA403CF;
	Sun, 13 Feb 2022 15:29:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BiC4mKpsfjoK; Sun, 13 Feb 2022 15:29:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDBD140360;
	Sun, 13 Feb 2022 15:29:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 67D0D1BF3F2
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5773481420
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:25:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8x96RPey-MKx for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:25:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5979F8140F
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 15:25:27 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id p9so9726428ejd.6
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 07:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=v8REkH/TKQ+gH/WatHxZPHurLylNokmrj02T4SiOpoA=;
 b=aA5MArlmjR8mARhqjYIG3kmX0c3C78j9GRwtsiVUG7Ak/T8zvZXLV/LmNy8ZfuYRyt
 Hr+C3bZYWg6dLNoZ7S/GdzEwYOgKdqkGmQBTxPOiHK4TSl2tWrkdfvGX7hIWjn+qXJnp
 z7k+kXbHXyqCfYVJuLG1KzWDpfP5c+lvI7duIDEfk9fnC+fmimkUgvd703Ez/S48V8rs
 rw4zsTSRG5NCRm+bmehD3RtgZI1Q3kmmlu8JsOh0pQVPX+zGe+SQlOsV6EuoySsefYnT
 nVJUT4uK12qH74utaxVozb4dC96IctnRwmJe/5O5Vw7Z+Igb9PpKH3kWc4H3Vq2/u4sl
 w9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=v8REkH/TKQ+gH/WatHxZPHurLylNokmrj02T4SiOpoA=;
 b=TT4eqr6H24DSLjIcBofqSrMUoY/rYIom5zctb8nr7c6yit8sfagz3CDPltE5GTBKAA
 0sdC09rl4E/qWM3hHrAojyvo8/3dPErnxJ+FUuU019jgk1Rk7lLUTKX8RBibcJ+R2T+2
 WGDHGBMle3HJEcbv7UWSvA5rgmEJKw5KK2WnqyOp6l/mP4XzA9rTLBqOVNpEDVghSgkc
 hWf5eq9mXAyKiHR8QfYlUjP8+eYN/Tq9n+WIOEzmQPWhdHJ3Vb3yBzqjasRQRShScXqT
 XRTLQsB5iw5E3d5Xay2Hn5vxBAqVReYZgVYX7qXsq9No9Bz5rXW650RICbgzMqAqM7fb
 lrYQ==
X-Gm-Message-State: AOAM533VZbf9SlQHRCHE4/4A0WGPdbuGmDYJ01ngMlqkrPbQbgDSNjcs
 vU+UP0h/c/tQS0KkmOSgCpppVeOW/y0h2Q==
X-Google-Smtp-Source: ABdhPJxgan9Tzlp79Lk9cSiNHsIsfQl6QlWNZZIV5Vf5R5R+0XsYKL7U5CfNLb0y+vZaaVmJg8hfhA==
X-Received: by 2002:a17:907:6d07:: with SMTP id
 sa7mr1307826ejc.582.1644765925600; 
 Sun, 13 Feb 2022 07:25:25 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id n25sm10368529eds.89.2022.02.13.07.25.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 07:25:25 -0800 (PST)
Message-ID: <e4a93e86-5a89-9eb6-f144-14ca099a7cac@mind.be>
Date: Sun, 13 Feb 2022 16:25:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220206140459.1622884-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220206140459.1622884-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gerbera: fix build with fmt >
 8.0
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



On 06/02/2022 15:04, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump of fmt to version
> 8.1.1 in commit ec7fd50d08690a383fec40748ac9b78c3f764316:
> 
> /home/peko/autobuild/instance-0/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/fmt/core.h:1728:7: error: static assertion failed: Cannot format an argument. To make type T formattable provide a formatter<T> specialization: https://fmt.dev/latest/api.html#udt
>         formattable,
>         ^~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/009db44f83c3b02025c910ce4f190bd709c5ab49
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/gerbera/0001-Fix-for-fmt-8-0.patch | 44 ++++++++++++++++++++++
>   1 file changed, 44 insertions(+)
>   create mode 100644 package/gerbera/0001-Fix-for-fmt-8-0.patch
> 
> diff --git a/package/gerbera/0001-Fix-for-fmt-8-0.patch b/package/gerbera/0001-Fix-for-fmt-8-0.patch
> new file mode 100644
> index 0000000000..c4419209a5
> --- /dev/null
> +++ b/package/gerbera/0001-Fix-for-fmt-8-0.patch
> @@ -0,0 +1,44 @@
> +From 82d84ac5e62c23e717198fc7b2ef190ff95e70d1 Mon Sep 17 00:00:00 2001
> +From: kyak <bas@bmail.ru>
> +Date: Wed, 12 Jan 2022 19:41:37 +0300
> +Subject: [PATCH] Fix for fmt > 8.0
> +
> +[Retrieved from:
> +https://github.com/gerbera/gerbera/commit/82d84ac5e62c23e717198fc7b2ef190ff95e70d1]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/util/logger.h | 15 +++++++++++++++
> + 1 file changed, 15 insertions(+)
> +
> +diff --git a/src/util/logger.h b/src/util/logger.h
> +index 58696e52f..ba64afa79 100644
> +--- a/src/util/logger.h
> ++++ b/src/util/logger.h
> +@@ -32,7 +32,9 @@
> + #ifndef __LOGGER_H__
> + #define __LOGGER_H__
> +
> ++#include <fmt/format.h>
> + #include <spdlog/spdlog.h>
> ++#include <type_traits>
> +
> + #define log_debug SPDLOG_DEBUG
> + #define log_info SPDLOG_INFO
> +@@ -40,4 +42,17 @@
> + #define log_error SPDLOG_ERROR
> + #define log_js SPDLOG_INFO
> +
> ++#if FMT_VERSION >= 80100
> ++template <typename T>
> ++struct fmt::formatter<T, std::enable_if_t<std::is_enum_v<T>, char>>
> ++    : formatter<std::underlying_type_t<T>> {
> ++    template <typename FormatContext>
> ++    auto format(const T& value, FormatContext& ctx) -> decltype(ctx.out())
> ++    {
> ++        return fmt::formatter<std::underlying_type_t<T>>::format(
> ++            static_cast<std::underlying_type_t<T>>(value), ctx);
> ++    }
> ++};
> ++#endif
> ++
> + #endif // __LOGGER_H__
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
