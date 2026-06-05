Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D4ECD6E74
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1791382143;
	Fri,  5 Jun 2026 12:49:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O1dA8wc3JRIN; Fri,  5 Jun 2026 12:49:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DEE4820C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663764;
	bh=aAymMpQET/i77uXRC6XzD9lc+urZbQo5DpSmVVYwoHo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Cclq0SLc0lsU/8wCpa7hYbGF3ut78aEi+39Lm1dWUHM1jkREeHtThHYvYRCyPnqyl
	 vdhtSYbu5DtS2qtgnkS5mzLjHXlpo98TFvg1JCD43WvUgDWEvhP8rQRFHqeNaKGjr/
	 joqyH54FQtp+91v5Kn/Pj4xjyjE5j2PhkuPwzf9oT7Mxk1y9Uz8MQzvY4ZACGnMdQ6
	 wVGB/M2q9oW2BTW8vLuAkS1taviopErRdAqxg/WnlLti0SmqDnrAelPj99SI+6WbqZ
	 rNKeDsZHxoXoG80Dl1kW721hvHsjVkb06lCaXfUFnmPqX13B+VMIqRCtaIvtdX9vg4
	 MUvYxw+Ubpn5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DEE4820C4;
	Fri,  5 Jun 2026 12:49:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EDA69388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3F17821D6
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A6QuckjRh3-6 for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:49:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E625782135
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E625782135
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E625782135
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:19 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-45ef56d9b67so1464332f8f.2
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663758; x=1781268558;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=loyc2rJ3jQUw1y7QsKcqLKgDLzrcOVCvreq8Gf0a2Bg=;
 b=CShpb67ChHa0FxvShfPMGIbODC4MoFGhONQPb3ObvezCX010tyR/WE5uAQBEUryiAv
 QdsDmUQ367+HJxocvPPLG+Ltsz939zaDUMsMbi3o3Dl1QKVJphDPIroxIxFMy42IKpP1
 pvDyXUC6Cry/QOREmd44a+UO3pC4Wg24Axr4vncADSpm9NC02su1hXZlGxitMJDsA4ti
 7kGEHyhA8c0sR+ieeMvWug3h7sRS3L6B1d5FJ3f5Rjyev19QmTX6Mte5iQ7fCqeFOO2t
 jLQOefJZ57IHcioD3HlJVJO7NnIdp4ggf1tK4AGn/LIGDyObl/bI8GmMFZbzsBdjRCD4
 TbMA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/gFiXJNVY94dNrBq0s9+8uGuBY76gcPTCNT9rnvmv9ThePoXjso5HvcMztmBRlRqrfJmW4IZamHOg=@buildroot.org
X-Gm-Message-State: AOJu0Yzeimiv5QNhDVYGPiItvHSjhIv5N9Hho06Pm8yA9/zt2cU+3b+z
 ctz1Q2WZ+RMjYbxXy2IsUVecYwMyKOTxPBO4RoZRyRSMN/4NUktKfz9zv2oEOmllcKBbWsQ9Y6U
 SKmNr
X-Gm-Gg: Acq92OF4Qhlrirs/1BxKICxRksEnJ3d8JrsuUrYGbq60rCP5JOses/jUthMOaeFFuEt
 XiF5AoulLyeQof7lm7CgK2QEXtii7qmGCic+kHeO0KWeilmPBtH2teNeShzAtMs9fZliEObtD4V
 3xyVNptJcuT5L0tHNwbk/2qPT3lcHt5dy2A46zYtkl4plev5RgL7BaRjEEmIIBaAkn6aVEgzri/
 5lDejyXFrr19GL08n2D8bMci3KHwDidlQX06G9lSLV5ZxxBCoDuJn+nN/dbYlNuF6RML+U+XpyO
 ws7ZavxN69A5HdkyZGGuxkpl8a+tUthKE91BIoGoed7WlriKiWcsDLR2+29aEyXkMpDcszJtoG0
 1HRM/X+A4ti5pjnjX9QqHfZzNrd4Bm0IGwT7sj5JOyLJLYK85VE7mHiwvHEIPrLfW+yAC90Lv3q
 bbdRC7qPJIxAfJl6ekrgYD+x43jg==
X-Received: by 2002:a5d:4e05:0:b0:460:e2e:6e25 with SMTP id
 ffacd0b85a97d-46030505e58mr4185600f8f.21.1780663757834; 
 Fri, 05 Jun 2026 05:49:17 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f351d69sm42538359f8f.29.2026.06.05.05.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:49:17 -0700 (PDT)
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:49:17 +0200
Message-ID: <20260605124917.270749-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260417060553.10171-1-chakrabortyshubham66@gmail.com>
References: <20260417060553.10171-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663758; x=1781268558; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=loyc2rJ3jQUw1y7QsKcqLKgDLzrcOVCvreq8Gf0a2Bg=;
 b=ZGqXjl4z3PSaM+5qX8UP7mFcjWnYr6WuBoPRxdr5ZKdA0KYMJnpyi3ANZWGmW6kwqH
 XY/v4iwTIsDdNeq6/N6OCZ/4/t108KxlcPkLvj7YsnPooT2i6LpKEg13uaXCFnxZPoZ0
 22Lqvf4BqOr8TOOnQ0jnPBWboyc05BK2nKZ/R6+qfzhsXV3L3wz7sUPNFqnZ8O/KJ/Rb
 yP62x3ynPE/lEQjq4pLK5y1ykpQiOzNeb3IgjR04Wi8/4pX9vpXPkgM4p2uzKv8fj8v1
 oRoO/et7pqI3Ug4VLAloD76GS37CyaKMxbGLfEUXq1+saYiWBLg1QtZb6RphOqMDg1IM
 IdWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZGqXjl4z
Subject: Re: [Buildroot] [PATCH v2 1/1] package/util-linux: fix LSMT_ROOT
 fallback definition
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The fallback definition for LSMT_ROOT was incorrectly guarded
> with #ifdef instead of #ifndef, making it ineffective on systems
> with older kernel headers that don't define this constant.
> 
> This caused build failures with "LSMT_ROOT undeclared" errors on
> autobuilders using older kernel headers.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/ac2/ac2bc633db0c605564c79bfdfa0e257a9b4f1b28/
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> 

Applied to 2026.02.x. Thanks

> ---
> Changes v1 -> v2:
>   - Add missing 'Upstream:' tag to patches (fixes check-package failure)
>   - Use symlink for util-linux-libs patch to avoid duplication
> ---
>  ...api-utils.h-fix-LSMT_ROOT-definition.patch | 27 +++++++++++++++++++
>  ...api-utils.h-fix-LSMT_ROOT-definition.patch |  1 +
>  2 files changed, 28 insertions(+)
>  create mode 100644 package/util-linux/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
>  create mode 120000 package/util-linux/util-linux-libs/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
> 
> diff --git a/package/util-linux/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch b/package/util-linux/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
> new file mode 100644
> index 0000000000..3d0de62bfd
> --- /dev/null
> +++ b/package/util-linux/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
> @@ -0,0 +1,27 @@
> +From 72ff3b8998a675900fcb7c18c0e03f1552b13a8b Mon Sep 17 00:00:00 2001
> +From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> +Date: Tue, 14 Apr 2026 11:04:08 +0530
> +Subject: [PATCH] include/mount-api-utils.h: fix LSMT_ROOT definition
> +
> +Upstream: Pending
> +Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> +---
> + include/mount-api-utils.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/include/mount-api-utils.h b/include/mount-api-utils.h
> +index a916f99..87e173e 100644
> +--- a/include/mount-api-utils.h
> ++++ b/include/mount-api-utils.h
> +@@ -339,7 +339,7 @@ struct ul_statmount {
> + /*
> +  * Special @mnt_id values that can be passed to listmount
> +  */
> +-#ifdef LSMT_ROOT
> ++#ifndef LSMT_ROOT
> + # define LSMT_ROOT              0xffffffffffffffff    /* root mount */
> + #endif
> + 
> +-- 
> +2.53.0
> +
> diff --git a/package/util-linux/util-linux-libs/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch b/package/util-linux/util-linux-libs/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
> new file mode 120000
> index 0000000000..88f6b841f7
> --- /dev/null
> +++ b/package/util-linux/util-linux-libs/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
> @@ -0,0 +1 @@
> +../0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
> \ No newline at end of file
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
