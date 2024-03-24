Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19884CD11DB
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 14:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA564405E2;
	Sun, 24 Mar 2024 14:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A3JOYgxmO4uR; Sun, 24 Mar 2024 14:55:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88AE7405DA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88AE7405DA;
	Sun, 24 Mar 2024 14:55:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D4231BF59A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69FBE606ED
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:55:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1jKNfI7K3d3O for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 14:55:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 96054605A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96054605A0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 96054605A0
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 14:55:53 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-414866f92beso2847485e9.3
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 07:55:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711292151; x=1711896951;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9jzEtmAXF1VamqZvH95asYNV2LwreM+/3dr7g48bjEg=;
 b=lSW45397EUpPg3VLRlO+YFqfPeDEoS3HbLEbJVUtdgiSBoLnaWqA/nj+HkpkxQdTvo
 gJqkIf4ZOviPUY2wfoZaW8VEofNs+lnBVmuhsGc2hx63MzrPf+JLIPYgOqnDlDC5UjUn
 2/oUsUNmtJajZBAupGwBvBzqpktoKEtJo3p7gvxUz4DUDF2/VF2XT+7pv456Cx7gfHDa
 b6yiZGK3cAYshGjZHytx+hKaxBrcTYvGaDcB7X8Yful46XBKKjiDpWu3knL/gVzl6Q6W
 iWBAuHA3t8RtvBQKyhbJ2s88CQfQAvo+1x32T68fJZa7nuEr1HYea9pxfoqWhHXqZi9L
 cYsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwwObBHf+2Oqilibg5d/DCIjz7MidCajyGXIG0wAM6yZFsTjYL6nfuYDLgDapdX/CO+D6Ziy7FZAdbw7b+Wi6SWgU8LfviQw==
X-Gm-Message-State: AOJu0Yz+gDRfzzJXl6L++YFIzuI1g3Pr9JGU5jY/+IwAnwBxGmx+gX1S
 9eICSAnZizqYRCMS0rX4M/ih3Vi4S4k6nXP+fttt6lQVGkv+s3QzQ7UnFu9Yj/XLnG4zKxjmFLn
 f
X-Google-Smtp-Source: AGHT+IH1rLV8C1ViQWnmI1Y1eyp9hn5IrsdJcLS+Y1qevbeOvfVyrP99oSsT4p4Dm+E7tZyM03v1mw==
X-Received: by 2002:a05:600c:45d5:b0:414:869b:dbd9 with SMTP id
 s21-20020a05600c45d500b00414869bdbd9mr1381163wmo.9.1711292151060; 
 Sun, 24 Mar 2024 07:55:51 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 co1-20020a0560000a0100b00341cb22a8d4sm1198840wrb.108.2024.03.24.07.55.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 07:55:50 -0700 (PDT)
Message-ID: <d86ae159-3551-414c-9db4-7b0a7c3c0a7d@mind.be>
Date: Sun, 24 Mar 2024 15:55:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20240324130721.29945-1-bernd@kuhls.net>
In-Reply-To: <20240324130721.29945-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711292151; x=1711896951; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9jzEtmAXF1VamqZvH95asYNV2LwreM+/3dr7g48bjEg=;
 b=h+CzrHn1Tsq2Kjb1FzZSzf8r99/g7++8gUgHE3VGD0APXZh6/XTlr8riDrItt661E0
 s0B0vr5FdwbM8+z/U7PK7Ff/1ss+YmSDZrbR9Xt98AgzcvgranKaFn7orLpSbcpK2wgC
 YDNcuWcZptE0FM8nJeFq1YFf/YdmiJMZtPH1FNYx/140rdhtw7fdP4bgfHEIqIciiViY
 pkQZT56OO35atsYQDxTZKTyPIXAe7LblOnbp0Pu5szBEhUIN+yhkjcjCd9j1+sgnFQFt
 M0K41Ee6sCArNTCMMsdSupjBC5Lxk/qpS4+ipw/bM4M39ZPnlbXCKqVv36s6+eycJhQT
 1XOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=h+CzrHn1
Subject: Re: [Buildroot] [PATCH 1/5] package/onevpl-intel-gpu: bump version
 to 24.1.5
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/03/2024 14:07, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied all 5 to master, thanks.

  Regards,
  Arnout

> ---
>   package/onevpl-intel-gpu/onevpl-intel-gpu.hash | 2 +-
>   package/onevpl-intel-gpu/onevpl-intel-gpu.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/onevpl-intel-gpu/onevpl-intel-gpu.hash b/package/onevpl-intel-gpu/onevpl-intel-gpu.hash
> index 8dd42c4713..680ada76ea 100644
> --- a/package/onevpl-intel-gpu/onevpl-intel-gpu.hash
> +++ b/package/onevpl-intel-gpu/onevpl-intel-gpu.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  879a232351ce0647522a0981edded3760104aec9f2bdc2ad31f70df03c95a6a9  onevpl-intel-gpu-24.1.4.tar.gz
> +sha256  e006d59399dbd0c3b3ecd91610822d655e9303b25a385a9a3ac94a42bf34b284  onevpl-intel-gpu-24.1.5.tar.gz
>   sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
> diff --git a/package/onevpl-intel-gpu/onevpl-intel-gpu.mk b/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
> index ca2c866735..440d73efa2 100644
> --- a/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
> +++ b/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -ONEVPL_INTEL_GPU_VERSION = 24.1.4
> +ONEVPL_INTEL_GPU_VERSION = 24.1.5
>   ONEVPL_INTEL_GPU_SITE = $(call github,oneapi-src,oneVPL-intel-gpu,intel-onevpl-$(ONEVPL_INTEL_GPU_VERSION))
>   ONEVPL_INTEL_GPU_LICENSE = MIT
>   ONEVPL_INTEL_GPU_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
