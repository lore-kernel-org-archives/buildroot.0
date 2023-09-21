Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A73E7D0A2
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 19:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01DB381EF9;
	Thu, 21 Sep 2023 19:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01DB381EF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K3luSm1EJrHk; Thu, 21 Sep 2023 19:44:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24DB281E44;
	Thu, 21 Sep 2023 19:44:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24DB281E44
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3CDD11BF98E
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1549141EA3
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1549141EA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ky_M893fEL-U for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 19:44:43 +0000 (UTC)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D150541DA5
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 19:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D150541DA5
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-53136a13cd4so1599996a12.1
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 12:44:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695325481; x=1695930281;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aTpK/r3KKKt+VqjwPFH1EMvHiNkVeehKhlfXXx3kqv0=;
 b=tDULNLujiRrODlfTigPoh77FmwLAqWgWDkjLaSTXzLaoOMpIL1CC6LmR8+s5lHcuSO
 nXzg23sFrWGwsNPoo8RV/AbiPU1yUoYsZIqJ6m5leV2SvVvW5f7MFlnEus3Aoe0D7hPu
 fF35UIFaE8AwEJB48SY/siRdNBA7Zuf7wZ6i3DOKamoq/ftGeYYumGjhI7QV9jeFu5j+
 A8m8J3mbdRz01conhs9HoTrb9afhTPJyKqBU/Oobu2ZGxS+W8L2aC4O1MW2ifKvoGrxb
 sQOX45EyxGE6/BaP2qCX50XHOv5lhKXCzjWa5nnxlxrboEOgAhWcbfdd/GTTslYgYa6x
 Tp+Q==
X-Gm-Message-State: AOJu0YyqESmiCPzpOHDb6NPLl669WpnozG58sZpV7fAYU9TWGYDbvPGH
 AP7oR7iUrLL6EoI0v/5TiEmhGQ==
X-Google-Smtp-Source: AGHT+IGVV2Ns5Q8TGTXbaPzUpa9bqYON3HhTQqiWiTlzz0pDtE5fr2VAO+jNNJ/b8u68/WH0nkwueA==
X-Received: by 2002:aa7:c550:0:b0:52f:bd60:b54b with SMTP id
 s16-20020aa7c550000000b0052fbd60b54bmr5614506edr.37.1695325480733; 
 Thu, 21 Sep 2023 12:44:40 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 n23-20020aa7c697000000b0052ea9ad21bdsm1253581edq.72.2023.09.21.12.44.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 12:44:40 -0700 (PDT)
Message-ID: <1081d757-9e7b-c40d-c83f-10940bd902b2@mind.be>
Date: Thu, 21 Sep 2023 21:44:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20230917192243.753931-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20230917192243.753931-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1695325481; x=1695930281; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aTpK/r3KKKt+VqjwPFH1EMvHiNkVeehKhlfXXx3kqv0=;
 b=EziMKfTOD5JxOwejc6SB48CmvlF4ShDUh50Bc3rgNouA9N2QEHW/wlbOpqzNzcja0P
 qunlcHC6nO1Vn0EnC//K9bUgqTjVQf9puJs0TEU9n9y8Kdew/PqWOcotKY+iGZa/bj7j
 ITa0Rnrt0Qq7iVS5bpC0l5b0aTU+5kIOxsJuvo+bdKRtaxmsYKx+4caIYbzDtjovRA7U
 WFFMSfFP3BT/mS/wWsy3QWmht5+/G+cMVvME1dEaFX8ajRfqdq1tf3CujB9splQ1b4j0
 3D0oa1/6fxApkushPEHXf8P/du0oNYSThw6Cbm29PhFOYgTDKVu0d6Tx0y480eDADRbV
 vo9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EziMKfTO
Subject: Re: [Buildroot] [PATCH 1/1] package/swupdate: fix musl build
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



On 17/09/2023 21:22, Fabrice Fontaine wrote:
> Fix the following musl build failure raised since bump to version
> 2023.05 in commit b86542085df87da91057017b17f261a213bfd918 and
> https://github.com/sbabic/swupdate/commit/8228b1390632195158f4387d7aae659ebd6f1469:
> 
> In file included from core/bootloader.c:9:
> include/util.h:210:23: error: unknown type name 'mode_t'
>    210 | int mkpath(char *dir, mode_t mode);
>        |                       ^~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/e545f294c7f032fd7434fdb91aa18a38b2e19038
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...001-include-util-h-fix-build-on-musl.patch | 41 +++++++++++++++++++
>   1 file changed, 41 insertions(+)
>   create mode 100644 package/swupdate/0001-include-util-h-fix-build-on-musl.patch
> 
> diff --git a/package/swupdate/0001-include-util-h-fix-build-on-musl.patch b/package/swupdate/0001-include-util-h-fix-build-on-musl.patch
> new file mode 100644
> index 0000000000..d1e0db6b56
> --- /dev/null
> +++ b/package/swupdate/0001-include-util-h-fix-build-on-musl.patch
> @@ -0,0 +1,41 @@
> +From 1999685830d6e9b57014666b9e53e46de17a471c Mon Sep 17 00:00:00 2001
> +From: Dominique Martinet <dominique.martinet@atmark-techno.com>
> +Date: Fri, 15 Sep 2023 18:14:57 +0900
> +Subject: [PATCH] include/util.h: fix build on musl
> +
> +Building on musl 1.2.4 fails with the following error/warnings:
> +
> +include/util.h:211:23: error: unknown type name 'mode_t'
> +  211 | int mkpath(char *dir, mode_t mode);
> +include/util.h:269:36: warning: 'struct timeval' declared inside parameter list will not be visible outside of this definition or declaration
> +  269 | char *swupdate_time_iso8601(struct timeval *tv);
> +
> +These were caused by a recent reorganization of the headers and glibc
> +appears more tolerant here.
> +
> +Fixes: 8228b1390632 ("Reorganize includes to have smaller files")
> +Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
> +Upstream: https://github.com/sbabic/swupdate/commit/1999685830d6e9b57014666b9e53e46de17a471c
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + include/util.h | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/include/util.h b/include/util.h
> +index 2f5c7adc..5f4cdc01 100644
> +--- a/include/util.h
> ++++ b/include/util.h
> +@@ -8,11 +8,13 @@
> + #ifndef _UTIL_H
> + #define _UTIL_H
> +
> ++#include <fcntl.h>
> + #include <stdint.h>
> + #include <stdlib.h>
> + #include <string.h>
> + #include <stdio.h>
> + #include <stdbool.h>
> ++#include <sys/time.h>
> + #if defined(__linux__)
> + #include <linux/types.h>
> + #endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
