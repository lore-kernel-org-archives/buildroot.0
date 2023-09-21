Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB66E7D0A7
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 19:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 215DC8223F;
	Thu, 21 Sep 2023 19:31:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 215DC8223F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qH7nDCLv--N7; Thu, 21 Sep 2023 19:31:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EF5582CF1;
	Thu, 21 Sep 2023 19:31:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EF5582CF1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C6CC1BF390
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7559582CF1
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:30:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7559582CF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U6wP3fTo22yu for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 19:30:56 +0000 (UTC)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 785918223F
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 19:30:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 785918223F
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-530ea522f5eso1512946a12.3
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 12:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695324654; x=1695929454;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tH4XQuKifxvP0q0OwMXCv93UZSTn9bOl5QFH218V+m8=;
 b=ibDC5Fes2C7GjD2uYbDZM0AotWs1GiLXrvaU5AyuYIKK9helkiMGk168hlOFzq5buB
 6NPcoW8l59hV6w7WI+Swl5LABQWuMSrFcAYIOPZLLk8xTXVx5cmtnwguxOTyOEOyQU/m
 FQcjaQXYNMWgWQ6CLmqkDAjLsFwfOUd6jadFboART+LLITqK8nfWbj4BnOUz3BUrGNWg
 nE8DYjzlCjuCjvESWTUbzmLtWUNxoGm+s5hPXZuyVjKKy2tZ0vSqXzhQUaNcJy6lPxoK
 4ShHfiS1y0EZMrJQ7tjnS5xhH/+e4MCg5W0iErSBWFrygUdpmes5KbCUkge3kcE9c8k1
 ziVg==
X-Gm-Message-State: AOJu0YwAS67RHttXzMausXcxy3OPjUv4fFZ5m/P69lUWLMF5oNfJLE0r
 zQiTthvHmOt4zHubtmY2+FDkWV1jZ4RAO8bjBW0=
X-Google-Smtp-Source: AGHT+IFcjBUqPkJurOlphhL2mnS93ukVzgNs1Xfg4P+u00C8IxMYpGEcDk3Sw7ErnVzJ2y2DCoWVGQ==
X-Received: by 2002:aa7:d745:0:b0:522:4dd0:de72 with SMTP id
 a5-20020aa7d745000000b005224dd0de72mr5882971eds.27.1695324654537; 
 Thu, 21 Sep 2023 12:30:54 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 dy6-20020a05640231e600b0052718577668sm1227507edb.11.2023.09.21.12.30.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 12:30:54 -0700 (PDT)
Message-ID: <613b419f-3731-b4a6-0074-4b4c62b18405@mind.be>
Date: Thu, 21 Sep 2023 21:30:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20230917201348.1124404-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20230917201348.1124404-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1695324654; x=1695929454; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tH4XQuKifxvP0q0OwMXCv93UZSTn9bOl5QFH218V+m8=;
 b=WAp/WLQGmO/oabJYys2CIZpzmEy5OgbpYd++m9tRPmqtI3wCTiA1GOI530W1m6o6Jv
 eiFpXHbfW32/waIFOlphoHlPc3KA03+gNmRXWcgbJR7VAHq+ffqP/tLi5Vn7kqeCUIHT
 RO/YjZ6rAZHldihiRGA/W57hjk3ioTHi933pvxA/E9qOlFO1qOFyH+9TxkK9RXJ7CQup
 jaaj9FXeTOSrOA6bFJasM5cNxl0xE2XkIxY+prsA6amHPoUE+iGzSk6cCu4lp7o63dt0
 NBeKdnPDoe1Ea4E1BgtqxCuf1eubDOcaE7UWzw5YkCYhI5jYGuaDmVNOFs7WULSkhZ4/
 yE/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WAp/WLQG
Subject: Re: [Buildroot] [PATCH 1/1] package/pound: include limits.h
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



On 17/09/2023 22:13, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump to version 4.8 in
> commit 525cb6a8fbe04a959ea6e3a21a3f6f8828d7e9dc and
> https://github.com/graygnuorg/pound/commit/c951f2357d9f606a9e1f8727e74b55f1da91fa2f:
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/4edfffcd5d4383c57947d97139331e0bf2cb6155
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/pound/0001-include-limits.h.patch | 75 +++++++++++++++++++++++
>   1 file changed, 75 insertions(+)
>   create mode 100644 package/pound/0001-include-limits.h.patch
> 
> diff --git a/package/pound/0001-include-limits.h.patch b/package/pound/0001-include-limits.h.patch
> new file mode 100644
> index 0000000000..8f188af07c
> --- /dev/null
> +++ b/package/pound/0001-include-limits.h.patch
> @@ -0,0 +1,75 @@
> +From a0374d946e55129b36ba1e0024e1d94675a8f044 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 17 Sep 2023 22:01:21 +0200
> +Subject: [PATCH] include limits.h
> +
> +Include limits.h to avoid the following build failure:
> +
> +poundctl.c: In function 'oi_getn':
> +poundctl.c:232:29: error: 'INT_MAX' undeclared (first use in this function)
> +  232 |   if (errno || n < 0 || n > INT_MAX)
> +      |                             ^~~~~~~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/4edfffcd5d4383c57947d97139331e0bf2cb6155
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Upstream: https://github.com/graygnuorg/pound/pull/17
> +---
> + src/config.c   | 1 +
> + src/poundctl.c | 1 +
> + src/svc.c      | 1 +
> + src/tmpl.c     | 1 +
> + 4 files changed, 4 insertions(+)
> +
> +diff --git a/src/config.c b/src/config.c
> +index b7e3150..12f5cfa 100644
> +--- a/src/config.c
> ++++ b/src/config.c
> +@@ -21,6 +21,7 @@
> + #include "extern.h"
> + #include <openssl/x509v3.h>
> + #include <assert.h>
> ++#include <limits.h>
> +
> + 
> + /*
> +diff --git a/src/poundctl.c b/src/poundctl.c
> +index bd1459f..7fa18c8 100644
> +--- a/src/poundctl.c
> ++++ b/src/poundctl.c
> +@@ -19,6 +19,7 @@
> + #include "pound.h"
> + #include "json.h"
> + #include <assert.h>
> ++#include <limits.h>
> +
> + char *conf_name = POUND_CONF;
> + char *socket_name;
> +diff --git a/src/svc.c b/src/svc.c
> +index 6e810a6..457f1e0 100644
> +--- a/src/svc.c
> ++++ b/src/svc.c
> +@@ -20,6 +20,7 @@
> + #include "pound.h"
> + #include "extern.h"
> + #include "json.h"
> ++#include <limits.h>
> +
> + /*
> +  * basic hashing function, based on fmv
> +diff --git a/src/tmpl.c b/src/tmpl.c
> +index 2efa72f..0e5b65d 100644
> +--- a/src/tmpl.c
> ++++ b/src/tmpl.c
> +@@ -26,6 +26,7 @@
> +
> + #include "pound.h"
> + #include <assert.h>
> ++#include <limits.h>
> + #include "json.h"
> +
> + static void
> +--
> +2.40.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
