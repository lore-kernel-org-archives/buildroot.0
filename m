Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C387C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22C32410AB;
	Sat, 23 Jul 2022 19:38:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22C32410AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NLk1m9BpHyQx; Sat, 23 Jul 2022 19:38:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD86740256;
	Sat, 23 Jul 2022 19:38:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD86740256
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 819A01BF5A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C35A61B15
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C35A61B15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QH_XiNgKe2PU for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:38:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73295605AB
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73295605AB
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:38:25 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id v13so2903290wru.12
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qKkQCIzo+6JG56qUNL/0dEN7GTiBNPpqsOJMKxw0qZk=;
 b=BOwlmGiTpaio2ooC22MFL+/OgqPEllbxP/uifUXR4PKLYHdEydYD1tXYvDc3nOEsvi
 qeN3U8SLf10t+coXDMNKlfZux/4zJsE3QbIf7ayiLlPAulpQvHwLS4KdUmZfsBY1ppJr
 bsp/9Mgbvz61kYGKQ2crdjvObWWcpHQBnl68Cl1wkIcxz2VZAEv1C2R7KQAqgspztxi6
 EcADWMsHh3fV1pggfaDiUbTbnNbWMYZlMiLc4Em1/IRGsTv72ReWV4+yeu82LioN6sDA
 LwdZ46q2v2tcaFKLHw8Yv5R9VbA33zBEVN+9SmgFCeQpCsse0cjwkgZ4YATr58s5vSWB
 X9pw==
X-Gm-Message-State: AJIora/OZNpKoX0b/T9DjYpeWAV4bkW8Du5oWd8R5DgnP63fiTN4nLqu
 8nc5I5xwhmYWMjNlpvYcna/umg==
X-Google-Smtp-Source: AGRyM1vXC9+U9Sy6hDT0NNXC7B/aY4RMiIcgj4aoL4TxXIYzF/2IC/PlgqGLXeWZfA85NnYmGC+0DQ==
X-Received: by 2002:a05:6000:15ca:b0:21d:a72d:beb8 with SMTP id
 y10-20020a05600015ca00b0021da72dbeb8mr3440163wry.624.1658605103681; 
 Sat, 23 Jul 2022 12:38:23 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 l22-20020a05600c2cd600b003a2f96935c0sm9137249wmc.9.2022.07.23.12.38.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 12:38:23 -0700 (PDT)
Message-ID: <a54e3a05-1e51-ce7d-438e-1ecdba219cfe@mind.be>
Date: Sat, 23 Jul 2022 21:38:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Vincent Fazio <vfazio@xes-inc.com>, buildroot@buildroot.org
References: <20220620170940.513445-1-vfazio@xes-inc.com>
 <20220620190115.541032-1-vfazio@xes-inc.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220620190115.541032-1-vfazio@xes-inc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qKkQCIzo+6JG56qUNL/0dEN7GTiBNPpqsOJMKxw0qZk=;
 b=XqG0zEtSC1dRAMKhlo52rOl7jTn8mbVTcOBulxHhOpZiEain+lnw0mwJeNaDVQ5V1A
 3JU6AR+VEiTb+mPRDHD4ymzg0Bd8TXY8m0jX4M8vQzfZrcWjCJtT8xIFYQRLAp1MQnO1
 8pnBnG0hYrbDcUCG6TiAfIyKcW8qahQ/1WtsPH2HzUlJ0Seowwho4dcghOzC/wqmUlRU
 OCC9DvzOJKHiQkO91L1HPD8f82EgSc+vlFwB4d8c9VmPw4meroZuMfnrfEoOD+AjSt+K
 8rheGyaVkozS2gJ0o98tq+Z35TEPLUf19Nc8Qn6Q/oQniZuVYobk738BvEn7OS9qVrhe
 rhWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XqG0zEtS
Subject: Re: [Buildroot] [PATCH 1/2] package/nvidia-driver: define
 IGNORE_CC_MISMATCH
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/06/2022 21:01, Vincent Fazio wrote:
> Leverage IGNORE_CC_MISMATCH for kernel module builds to avoid an issue
> where NVIDIA's `cc_version_check` in kernel/conftest.sh may fail due
> to matching on the pkgversion substring of the GCC version string in
> the kernel's include/generated/compile.h.
> 
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/nvidia-driver/nvidia-driver.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
> index 54c2aa46d8..ec070e3ca6 100644
> --- a/package/nvidia-driver/nvidia-driver.mk
> +++ b/package/nvidia-driver/nvidia-driver.mk
> @@ -137,6 +137,7 @@ endif
>   # because they don't recognise the usual variables set by the kernel
>   # build system. We also need to tell them what modules to build.
>   NVIDIA_DRIVER_MODULE_MAKE_OPTS = \
> +	IGNORE_CC_MISMATCH=1 \
>   	NV_KERNEL_SOURCES="$(LINUX_DIR)" \
>   	NV_KERNEL_OUTPUT="$(LINUX_DIR)" \
>   	NV_KERNEL_MODULES="$(NVIDIA_DRIVER_MODULES)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
