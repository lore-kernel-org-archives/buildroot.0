Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FC6C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 16:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D99974026A;
	Sun, 24 Mar 2024 16:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mGKFB7EVvBMM; Sun, 24 Mar 2024 16:52:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6AC340469
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6AC340469;
	Sun, 24 Mar 2024 16:52:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 398701BF4D6
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 16:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32963405CA
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 16:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4UZ0HZBFFyeF for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 16:52:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A71FD405B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A71FD405B0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A71FD405B0
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 16:52:50 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-33ec7e1d542so2507427f8f.1
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 09:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711299169; x=1711903969;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vRlC+GpneDe8XwK1OdzUwpHTVZmTEUEt73fU4snqIMs=;
 b=TlbwlX7R+OYyzTDaUZ5d96+FMTFY9FsIQ3KSEL0JtoYAMdxZabWpjS9uAkdAgEk3Tt
 O2ciTw3y5g5h4J8AwVEfyCmoaB7F3OVJ74f2LBcpBrtw2WlBZ54Bp+XY84ieLlSdzi2b
 D8ZvwqBhO9iQA0Uhhd5er0Fu9+gQU+esDNCMKNA40NRaiPSV2bkp7CXA9wsSjGl9DBRW
 sjeh1bRen2K/F7nzSRQNx100/dQD13YGF3TDI29daVQxf0AewVlhymQxsO7vb3KYkHwG
 3HWIsvhL14zJRtKK7N2vrUlDJxbBcwBh8BPzrRfigtp4bmji4RbKW0OqrjhC9iRwK4u3
 uCkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVapDoWXvrPa+JanGVBR8dCksyn/LY/f2olBrCJVUQ0Fe1tk0CRxOPhGa4O4p+NaQchmnSG9J0EfvptzKh4LGjhxAdWQBaQVA==
X-Gm-Message-State: AOJu0Yw3XrHQNj2Q9sKw8BAoHewsbjsveJOvo2ixOxczCeQYlR8Fa+3q
 5dWhwKfGmgVC1K9hEtUcz42xTyjzaClar04Ox3wWB65zrur4LAlYpgSEyqbgTnUY7Tnxi8eqwQq
 5
X-Google-Smtp-Source: AGHT+IGAhlK3FFa0RuioLRwkuiAY4oU/bkaw1jv/qk+OzFYqUjQkeJ4EvaQS8ETSTl3PcZUHp+bb3Q==
X-Received: by 2002:adf:e612:0:b0:33e:4810:a052 with SMTP id
 p18-20020adfe612000000b0033e4810a052mr3100845wrm.70.1711299168544; 
 Sun, 24 Mar 2024 09:52:48 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 df4-20020a5d5b84000000b0033e7b433498sm7192618wrb.111.2024.03.24.09.52.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 09:52:48 -0700 (PDT)
Message-ID: <8cf6b1a4-b64b-48a3-8a5f-d72a93751d5a@mind.be>
Date: Sun, 24 Mar 2024 17:52:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240317095811.52758-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240317095811.52758-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711299169; x=1711903969; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vRlC+GpneDe8XwK1OdzUwpHTVZmTEUEt73fU4snqIMs=;
 b=S4zvbrxC/BLZ+dNoRnSQHgir6rpkuGwccUKY2zmLTIQITg3yGyl9QUdsxoKp6Rpq5z
 huYRtBvOZeyYUstZ0HSy5e5G8wMHG8wn2ZIcQKZjMdGSPp6Pe5ZliyKeLPLardI6K8hb
 X9tXypWrg8Z8yQ2TUAbudDwpHmZNR1CaPj5JPZCxuNKLZRfIYB1DmSIP/HFNjzldv290
 0pjgyLdWfg3VqRIYTTl4oTyB8tARXBHybhxTPRARSQtC7FCVPOWj86EDvBk7pQPsC/Qu
 IGVOWVdoYZRrM04DJ+E3lgdLqUGUS4l7ks2Kq0XnUD0CJKmWKLB/F1pqKP+hzomoepBT
 WNpg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=S4zvbrxC
Subject: Re: [Buildroot] [PATCH 1/1] package/xvisor: fix build without
 python interpreter
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/03/2024 10:58, Fabrice Fontaine wrote:
> Fix the following build failures on a system not providing the "python"
> interpreter binary raised at least since bump to version 0.3.1 in commit
> c4f8b8968770ecbf6444a5921c6472f126717626 and more probably
> since the addition of the package in commit
> e23ddf0c13e6d3b054782b86188396a0c2add1a5 and
> https://github.com/xvisor/xvisor/commit/ba904b4066f4b375cb1ad76ca41570741dbec62e:
> 
> /bin/sh: line 1: /home/buildroot/autobuild/instance-2/output-1/build/xvisor-0.3.1/tools/scripts/d2c.py: cannot execute: required file not found
> 
> or
> 
> /bin/sh: /home/buildroot/instance-0/output-1/build/xvisor-0.3.2/tools/scripts/d2c.py: /usr/bin/python: bad interpreter: No such file or directory
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/2e100bacc9e9face8351287e4c979c1729709d7b
>   - http://autobuild.buildroot.org/results/5d8a08512db1b3095158753e3a7843b0fd6c9749
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...plicitly-use-the-python3-interpreter.patch | 35 +++++++++++++++++++
>   package/xvisor/xvisor.mk                      |  2 +-
>   2 files changed, 36 insertions(+), 1 deletion(-)
>   create mode 100644 package/xvisor/0001-TOOLS-d2c-py-explicitly-use-the-python3-interpreter.patch
> 
> diff --git a/package/xvisor/0001-TOOLS-d2c-py-explicitly-use-the-python3-interpreter.patch b/package/xvisor/0001-TOOLS-d2c-py-explicitly-use-the-python3-interpreter.patch
> new file mode 100644
> index 0000000000..349d4415e2
> --- /dev/null
> +++ b/package/xvisor/0001-TOOLS-d2c-py-explicitly-use-the-python3-interpreter.patch
> @@ -0,0 +1,35 @@
> +From 888c94e7a121d96aa88f84c58fe7e2bd771fc5ac Mon Sep 17 00:00:00 2001
> +From: Julien Olivain <ju.o@free.fr>
> +Date: Fri, 25 Aug 2023 21:56:37 +0200
> +Subject: [PATCH] TOOLS: d2c.py: explicitly use the python3 interpreter
> +
> +When compiling Xvisor on a system not providing the "python"
> +interpreter binary, compilation fails with output:
> +
> +    (d2c)       core/vio/keymaps/modifiers.c
> +    /bin/sh: 1: /build/xvisor-0.3.2/tools/scripts/d2c.py: not found
> +
> +This commit fixes the issue following the PEP 394 recommendation:
> +https://peps.python.org/pep-0394/
> +
> +It sets the "shebang" to `#! /usr/bin/env python3` to allow using other
> +interpreters in the PATH, or virtual environment.
> +
> +Signed-off-by: Julien Olivain <ju.o@free.fr>
> +
> +Upstream: https://github.com/xvisor/xvisor/commit/888c94e7a121d96aa88f84c58fe7e2bd771fc5ac
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + tools/scripts/d2c.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tools/scripts/d2c.py b/tools/scripts/d2c.py
> +index b46a7bc468..daac4a5450 100755
> +--- a/tools/scripts/d2c.py
> ++++ b/tools/scripts/d2c.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/python
> ++#! /usr/bin/env python3
> + #/**
> + # Copyright (c) 2013 Anup Patel.
> + # All rights reserved.
> diff --git a/package/xvisor/xvisor.mk b/package/xvisor/xvisor.mk
> index eba37be9b7..2a51706b55 100644
> --- a/package/xvisor/xvisor.mk
> +++ b/package/xvisor/xvisor.mk
> @@ -11,7 +11,7 @@ XVISOR_LICENSE = GPL-2.0+
>   XVISOR_LICENSE_FILES = COPYING
>   XVISOR_INSTALL_IMAGES = YES
>   XVISOR_INSTALL_TARGET = NO
> -XVISOR_DEPENDENCIES = host-bison host-dtc host-flex
> +XVISOR_DEPENDENCIES = host-bison host-dtc host-flex host-python3
>   
>   XVISOR_MAKE_TARGETS = all
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
