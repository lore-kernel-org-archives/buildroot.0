Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1988EE57CF
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 19:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72B1B4014E;
	Wed, 11 Sep 2024 19:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J0xSbHL59BwN; Wed, 11 Sep 2024 19:39:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BE7D40229
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BE7D40229;
	Wed, 11 Sep 2024 19:39:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B0AD1BF369
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 19:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 367A84197D
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 19:39:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wbWgnbZOQjrb for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 19:39:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AF9FD4197C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF9FD4197C
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF9FD4197C
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 19:39:28 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-42cb806623eso1017135e9.2
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 12:39:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726083566; x=1726688366;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+27SXxjg5bNZXwtn8dTdYoc+uaexOJ0AXCo2gGhfOO8=;
 b=tFVLcqopMIGkRk0wMGxmVMufEG+vZHY9nclH1VlOxZjIHQ5nZeokDUs+JOZP2pOx62
 PB7wf3pNX1maf06IEsXb9Nrt5TopQ4knhs07fXnEoiMDQVjr/DIeBh+a2eE0pjdWT+uN
 1kQzMOsqpE7xjlflUMubwzZjmu554BpUTbOomr7eSW69Cb6EBfy2kpllq+stO3TcGroQ
 t8AB/oRAqkPLZ3iGhYjslRsNtJzi+LbqEjCVPaMiPJQi9DF9HUONtVNuzKKKSqZE23dw
 uTMRUXlYmEjgzlFiFKvByS4K638bz+BCPp4w6vxNDT5zti9xAf34Hhg86u5Lyoddnen3
 jgNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqmXxO0x4yZ1wD3FU0VUJJL+QVOIzmENUMOjwWehFO3mQRF1hCSfAmErxc0W6MDa6oMc/sOtXX/sg=@buildroot.org
X-Gm-Message-State: AOJu0Yy1/vok6Qb5eLS++sLk4QLPO18T6idkzln8fscv/dwdJl26hzyW
 /3CXW7AGwR2k1L+rWwfudoOnAu/Q9T6p0u62MWqO90VTKO45XaGEuxh4dieSEnBWrRZeA/19ibA
 B
X-Google-Smtp-Source: AGHT+IHmU7GHBV2+9EBjDBhgO45xFGUHL2csVDM6GbD24GFI8vMLqbtPaobiLNIrwNEpxNeTHQMAVw==
X-Received: by 2002:a05:600c:4fcd:b0:42c:bf0b:c489 with SMTP id
 5b1f17b1804b1-42cdb53bf72mr5010925e9.18.1726083566322; 
 Wed, 11 Sep 2024 12:39:26 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42cb2a08a1dsm131363765e9.1.2024.09.11.12.39.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 12:39:25 -0700 (PDT)
Message-ID: <12d6d1b8-f5dd-4961-bc39-7214a3e6b084@mind.be>
Date: Wed, 11 Sep 2024 21:39:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <Zr6uJlRPgiprr48c@waldemar-brodkorb.de>
Content-Language: en-GB
In-Reply-To: <Zr6uJlRPgiprr48c@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726083566; x=1726688366; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+27SXxjg5bNZXwtn8dTdYoc+uaexOJ0AXCo2gGhfOO8=;
 b=MCNF82CtizD9LC0h08cY4ghYwXhcsuD75r6XrWVyUYfplqcHuQVLArzJVnNCPUKPE7
 rM70HF7FzIii19McaLVQ4cFGPxBHzW12J8CSO/SkvLXasnajEpu2BO5ufH088oD7tXWq
 FPZh8PMe7M8YbRukRzF/qlEV2EK55SJhWIXfH6iAGRaateQFbLX/8hwpbb54xN/+XPqu
 vSk65dYT8S2yITVy+56eNnC2+UMLnewmJdgy7QwQezAH5Iv8oyH6GcOsEwL64Yj2zGwa
 7C13YgfXpR5TMfFFeJaAac9jHegQisn+6Rvo9GSuiCYzBko54i1CxmOJQa4MBWkXBNYt
 Sfgw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MCNF82Ct
Subject: Re: [Buildroot] [PATCH] package/nginx: fix static build error
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



On 16/08/2024 03:40, Waldemar Brodkorb wrote:
> In commit 761259c93400bc806611a242c7dc3df7ff67c231 the SSL patch was
> removed, without testing any static compilation.
> Reintroduce a small version of the original patch.
> 
> Upstream does not use pkg-config, so the patch is Buildroot specific and
> not suitable for upstreaming.
> 
> Fixes:
>   - http://autobuild.buildroot.net/results/a85/a85b00dfe9b55607390ebacc0e4e55c7cfbace3a
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...auto-lib-openssl-conf-use-pkg-config.patch | 34 +++++++++++++++++++
>   1 file changed, 34 insertions(+)
>   create mode 100644 package/nginx/0009-auto-lib-openssl-conf-use-pkg-config.patch
> 
> diff --git a/package/nginx/0009-auto-lib-openssl-conf-use-pkg-config.patch b/package/nginx/0009-auto-lib-openssl-conf-use-pkg-config.patch
> new file mode 100644
> index 0000000000..05fb48b76e
> --- /dev/null
> +++ b/package/nginx/0009-auto-lib-openssl-conf-use-pkg-config.patch
> @@ -0,0 +1,34 @@
> +From 232ac61984720401b0c3854da1644ec20ed218e0 Mon Sep 17 00:00:00 2001
> +From: Martin Bark <martin@barkynet.com>
> +Date: Thu, 15 Aug 2024 19:47:23 +0200
> +Subject: [PATCH] auto/lib/openssl/conf: use pkg-config
> +
> +Change to using pkg-config to find the path to openssl and its
> +dependencies.
> +
> +Signed-off-by: Martin Bark <martin@barkynet.com>
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +Upstream: not suitable
> +---
> + auto/lib/openssl/conf | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/auto/lib/openssl/conf b/auto/lib/openssl/conf
> +index fdf430dff..c9fe4c8bf 100644
> +--- a/auto/lib/openssl/conf
> ++++ b/auto/lib/openssl/conf
> +@@ -63,8 +63,9 @@ else
> +         ngx_feature_name="NGX_OPENSSL"
> +         ngx_feature_run=no
> +         ngx_feature_incs="#include <openssl/ssl.h>"
> +-        ngx_feature_path=
> +-        ngx_feature_libs="-lssl -lcrypto $NGX_LIBDL $NGX_LIBPTHREAD"
> ++        ngx_feature_path="$(${PKG_CONFIG:=pkg-config} --cflags-only-I openssl|
> ++			    sed -re 's/(^|\s)-I\s*(\S+)/\1\2/g')"
> ++        ngx_feature_libs="$(${PKG_CONFIG:=pkg-config} --libs openssl)"
> +         ngx_feature_test="SSL_CTX_set_options(NULL, 0)"
> +         . auto/feature
> +
> +--
> +2.39.2
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
