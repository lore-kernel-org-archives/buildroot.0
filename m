Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8261C2BD09
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 08:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FD92607CF;
	Mon, 15 Jul 2024 08:36:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id egAXYz3W1Qp1; Mon, 15 Jul 2024 08:36:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC8766085B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC8766085B;
	Mon, 15 Jul 2024 08:31:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A703B1BF421
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 08:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 928BD81159
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 08:31:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sr4CS6ONgJ9w for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 08:31:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C87368111E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C87368111E
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C87368111E
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 08:31:03 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2eec7e431d9so50638511fa.2
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 01:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721032261; x=1721637061;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+NyQPO06TSWKBv4eBLpem9OU3eB5/Oux0oAgSRKQfsY=;
 b=WqOv0tlPZPh9emo/nvXoyo8HOahbL7CcpfQwdklF8hB8ktvSsq4tRbvfBpPTejDZpX
 5Et83jBleT8jv92EEWzfYweNKBLSvYutQB2ipyX04fRcvzRgHtkOIEZ7+zjB6SIR72ls
 8tCYk+TPq5xBSstaIvZtN7Uoi9X/qcYwd7LX1YPvjjPzI18+JxPb6VDxrAZ5Q0FPXOqG
 DSXZCQaHrMKpp7cGFLCwLB7Oi7zHnONzy6iOh1zVM3ZRmlclmngLcQWLC+yGlY/MxJL/
 sjT2Lhw/4mv+9pIemi4i3bmc6oYMyRsKeRDFwky+hVqswzk388HcF4kJ+e5x/ngiONCM
 R2Qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxdGIvcB94r9HTMwR2i0Mung2BTZ3/nrwyP4Z5mG7e5WSynmrLA25QWnIzvIsH1PU6BQ6aKsQbARvy+GYqJP7MOnFMPtO7YA==
X-Gm-Message-State: AOJu0YyiIjvIAodv1VJntkRC/rjDiCuiM/m3c47XHNZuRqbeqlJNQuaK
 2EhzCphYoKRUyv2HSG6RmbiIJZCECuyS7Wjg07p4SKp2iiJe8Pv7s5mB4DkMPL0=
X-Google-Smtp-Source: AGHT+IE5KNurn0MjRqk/7uTpaRyX1gLlfq0HZLBIVkYsxjScjnxqawJla/K/+P/3d1gebrI6x4ITFw==
X-Received: by 2002:a2e:9510:0:b0:2ee:d8f3:6bdf with SMTP id
 38308e7fff4ca-2eed8f36c37mr46141951fa.44.1721032261303; 
 Mon, 15 Jul 2024 01:31:01 -0700 (PDT)
Received: from [10.8.0.42] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680daccc9csm5632437f8f.57.2024.07.15.01.31.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 01:31:00 -0700 (PDT)
Message-ID: <1967a608-83e7-4ba9-ad73-6c488aa95b83@mind.be>
Date: Mon, 15 Jul 2024 10:30:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Brandon Maier <brandon.maier@collins.com>, buildroot@buildroot.org
References: <20240626-gitignore-output-new-v4-1-fcb3ebc263ca@collins.com>
Content-Language: en-GB
In-Reply-To: <20240626-gitignore-output-new-v4-1-fcb3ebc263ca@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721032261; x=1721637061; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+NyQPO06TSWKBv4eBLpem9OU3eB5/Oux0oAgSRKQfsY=;
 b=O8aSDzhJW9yCm6Qi4FUOZJKsfTMkydyxLiv7JGmehWwVqp5t2FJGOROmiREC9EU5Kv
 VnL3zgNCRm+yICRndWVpL368T31dsrvu+1atjz3JLNmHMWg6XUG0cr252NkfQbqfaziI
 UrVduMc42zVkUdhllxXaZL4YH1z1bRJBO0/fSvSrZNEMCo5ILzC8peYzm209Ns5Y2bNf
 0N3oBhvhFJILMkqKKVki28d+5hHQf1FWaH8K4Rv9l19YJ/OW2tOOwOfH08+FUH01XfRg
 RzCkGaTS06vJbmQDgBItwFIT4DiUR4z0W8AHlVi3DMnGkmWo2alR+/XnxWOOp64vvD0w
 40hA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=O8aSDzhJ
Subject: Re: [Buildroot] [PATCH v4] Create a .gitignore file in the
 CANONICAL_O directory
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/06/2024 18:49, Brandon Maier wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> This .gitignore file ignores all files in an output directory and
> hence doesn't change the git status.
> 
> Remove "/output" entry from the main .gitignore file as it is already
> handled by this general approach.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>

  Applied to master, thanks.

> ---
> This is a resend of the v1 of this patch from Yegor Yefremov, as the
> original patch series seems to have stalled.
> 
> I'm not familiar with the process for resending someone else's patches,
> so let me know if I should redo anything.

  You did it perfectly!

  Regards,
  Arnout

> 
> I find having the output folders gitignore'd is useful as some newer
> tools like fd-find and ripgrep will automatically respect gitignore.
> Otherwise the output directories are huge and quick searches can
> suddenly take a long time if I have created a few.
> ---
> Changes v2:
> - create .gitignore only if $(O) is a subfolder of $(TOPDIR) (Yann E.
>    MORIN)
> - Link to v1: https://patchwork.ozlabs.org/project/buildroot/patch/20240206132051.2838897-1-yegorslists@googlemail.com/
> 
> Changes v3:
> - also support nested subdirectories (Yann E. MORIN)
> - Link to v2: https://patchwork.ozlabs.org/project/buildroot/patch/20240213143025.274988-1-yegorslists@googlemail.com/
> 
> Changes v4:
> - Revert to v1 of code (Arnout Vandecappelle)
> - Link to v3: https://patchwork.ozlabs.org/project/buildroot/patch/20240214071908.297656-1-yegorslists@googlemail.com/
> ---
>   .gitignore | 1 -
>   Makefile   | 3 +++
>   2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/.gitignore b/.gitignore
> index bb02d9f572..14b7ca5040 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -1,4 +1,3 @@
> -/output
>   /dl
>   /.auto.deps
>   /.config.cmd
> diff --git a/Makefile b/Makefile
> index 138cfc5f8d..3d930d64a9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -63,6 +63,9 @@ ifneq ($(findstring @,$(CANONICAL_O)),)
>   $(error The build directory can not contain a '@')
>   endif
>   
> +# Create a default .gitignore file that ignores everything
> +$(shell echo "*" > "$(CANONICAL_O)/.gitignore")
> +
>   CANONICAL_CURDIR = $(realpath $(CURDIR))
>   
>   REQ_UMASK = 0022
> 
> ---
> base-commit: 4f1b7d0ef00af527f6a5c1fcfd18ce204a7d78e8
> change-id: 20240626-gitignore-output-new-5b47c23fde37
> 
> Best regards,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
