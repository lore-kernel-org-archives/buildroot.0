Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0B0CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 20:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49B9A414ED;
	Sun, 15 Oct 2023 20:00:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49B9A414ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DIu6zmKw2IvZ; Sun, 15 Oct 2023 20:00:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BCE6414CE;
	Sun, 15 Oct 2023 20:00:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BCE6414CE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 681A11BF489
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DF40611A5
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:00:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DF40611A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d8E68MG3QEsl for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 20:00:18 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33517611A4
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 20:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33517611A4
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-32003aae100so3120266f8f.0
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 13:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697400016; x=1698004816;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=14/qJijFbh3BOcJ2OXEEjh9cFHlm9y14JMGJMpl/Pks=;
 b=MiLPfYhH5VQdZf67Ow4gicu6tKD8pI0qtZ5Pc16U6ipTr9AFq1sl/whICJhxikQ9MF
 lOIJ5VMXnoAjXnDmhH9aqtYTTSYLFnrbyhTxF7I4fELQs5abxcZxk3sk44RznU2JYPjC
 2lUpMML+HVWdl/IY7v3byF0GqrsybnwLLiU2I4M9R/9XX78aeDNEBX8BCD0+RVrDHGBq
 BzPzBHiYzXQMrLOAQPCn58+UaFzqdacBSLJLlLpbiTGfDDZsh1IHKbfgO2v3OY1SYVEA
 Rz4dpTOsfRbfuwOpDbGIw9H/LDW8tvr1OCLidn+uPg8QNutxjN3371pSwuum+YKcbjlv
 RtTQ==
X-Gm-Message-State: AOJu0Yw+XmupeQDLo7eetwtU4WonqaqPBo0Z8rfZ9JU0YKgNfeG3XW05
 1XETploO81JuqshZvqbXqMiaLKxgr9hj/YCSBW8=
X-Google-Smtp-Source: AGHT+IGBuyj2YYKI2Zzywh2lxfK286WesVtnwhDT/nLsDZv6oCQSpjvFZyQIOUfto0z/LylbOsjhmg==
X-Received: by 2002:a5d:6782:0:b0:32d:a46e:cc3c with SMTP id
 v2-20020a5d6782000000b0032da46ecc3cmr3060217wru.35.1697400016303; 
 Sun, 15 Oct 2023 13:00:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a5d5582000000b00323293bd023sm5237497wrv.6.2023.10.15.13.00.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Oct 2023 13:00:15 -0700 (PDT)
Message-ID: <8aaf5c1e-e7c0-bc4f-2e8a-18c155c39a4b@mind.be>
Date: Sun, 15 Oct 2023 22:00:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20231015194511.1158058-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20231015194511.1158058-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1697400016; x=1698004816; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=14/qJijFbh3BOcJ2OXEEjh9cFHlm9y14JMGJMpl/Pks=;
 b=ZNpUnmzzUktet9rRLxR/ZVrqrtPLYQfDSIGqHD+oQL4G5lgqHKKIJeCNKN92CK+xyk
 MFVJQYGqcqI5xdNwm112FyJ4iPEsQQgCyau8aeHhQZGVPGTFe0D0UnoaqqMThfWp3X6J
 e5rXM6H2PXOS4xtLksTpVg/9Rp/7wrBbOYb67dPJraYZ867PC0KxzMrc4POO5c2VDi2X
 fsc8NpxVBWIhkYLwHnuwREnIZID9z0s94IKmldBrVRgpamZYeLgxT8CnAf0VHCVJN4k5
 0qUKgPMD+CD2zTfL2BgcIZyWqS/rrtiga2jtxTCnNx5pgPvNOYfwH2CxVYxKMKRHlSDL
 Ujuw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZNpUnmzz
Subject: Re: [Buildroot] [PATCH 1/1] package/casync: fix build with gcc >= 13
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
Cc: Yair Ben Avraham <yairba@protonmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/10/2023 21:45, Fabrice Fontaine wrote:
> Fix the following build failure with gcc >= 13:
> 
> In file included from ../src/compressor.c:3:
> ../src/compressor.h:59:59: error: unknown type name 'size_t'
>     59 | int compressor_input(CompressorContext *c, const void *p, size_t sz);
>        |                                                           ^~~~~~
> ../src/compressor.h:19:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
>     18 | #include "cacompression.h"
>    +++ |+#include <stddef.h>
>     19 |
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/ab08f3b90d253db45643dd058b80ae1dd5f49d0f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...c-compressor.h-fix-build-with-gcc-13.patch | 40 +++++++++++++++++++
>   1 file changed, 40 insertions(+)
>   create mode 100644 package/casync/0001-src-compressor.h-fix-build-with-gcc-13.patch
> 
> diff --git a/package/casync/0001-src-compressor.h-fix-build-with-gcc-13.patch b/package/casync/0001-src-compressor.h-fix-build-with-gcc-13.patch
> new file mode 100644
> index 0000000000..32af9142a7
> --- /dev/null
> +++ b/package/casync/0001-src-compressor.h-fix-build-with-gcc-13.patch
> @@ -0,0 +1,40 @@
> +From 8db993c32f97188bdd6de4b2aa177fc513ee7e9f Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 15 Oct 2023 21:22:58 +0200
> +Subject: [PATCH] src/compressor.h: fix build with gcc >= 13
> +
> +Fix the following build failure with gcc >= 13:
> +
> +In file included from ../src/compressor.c:3:
> +../src/compressor.h:59:59: error: unknown type name 'size_t'
> +   59 | int compressor_input(CompressorContext *c, const void *p, size_t sz);
> +      |                                                           ^~~~~~
> +../src/compressor.h:19:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
> +   18 | #include "cacompression.h"
> +  +++ |+#include <stddef.h>
> +   19 |
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/ab08f3b90d253db45643dd058b80ae1dd5f49d0f
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Upstream: https://github.com/systemd/casync/pull/270
> +---
> + src/compressor.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/compressor.h b/src/compressor.h
> +index 2c9f93b..ae2eb30 100644
> +--- a/src/compressor.h
> ++++ b/src/compressor.h
> +@@ -4,6 +4,7 @@
> + #define foocompresshorhfoo
> +
> + #include <stdbool.h>
> ++#include <stddef.h>
> +
> + #if HAVE_LIBLZMA
> + #  include <lzma.h>
> +--
> +2.42.0
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
