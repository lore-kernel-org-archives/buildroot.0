Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1DEF9D0DA
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D65CC6F480;
	Tue, 14 Apr 2026 15:46:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tLDirkTVXBRV; Tue, 14 Apr 2026 15:46:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC7FE6F489
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181573;
	bh=HKxrnacCnGFulCJ2uvUnn3/Nwc988quitk015LbS8dk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sk9hsUDyJD9qzIKpSSFAnC1a2ODoeggmEGBKryHWXKd6Z7cB3GFSEefvADwNFqik7
	 ZCQhbukTXdOc4wVJ/qrO/CyRQh6OifB3+a2rzAVUqO8No7LhgcT+z2yx+cnCzgSyez
	 wm5L7E5Gg8togqm4pdEq8JMxlMe5RENSjwuLpLMq4VGxGafVmhyNtBkIumBc5OhMCA
	 ziZEORx5GYR+LGsUfYNy2NHVHc8Ldx8sdPLT3ZYQ+1vwNnPsOEr8FxpDpYO+T23/D7
	 WwjdtplZ8ublOIfxpExZSUD8nYThJBzI+N5AHWxer2oWnRSY+DDSKB97lCfLTnxUps
	 SYtmgBv0T85Sw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC7FE6F489;
	Tue, 14 Apr 2026 15:46:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EF73D237
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D57BE403F4
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:46:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NzTmY5WYgq0n for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:46:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ABEE740078
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABEE740078
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABEE740078
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:46:09 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48896199cbaso61477165e9.1
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 08:46:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776181567; x=1776786367;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=T6cfdpZ4Z1om2yHIhZsTZwia/lHYCxgbVZoViNP8gu8=;
 b=ko/egijbxLm9DZ3hVsycq0+OSChiblU27yHcxQe2Jz8630rKbhJPq+cowfEX0uGRpM
 iaLO2Ahh7cFwDhLlPK9nzAWVDu7/25S626YOW/PpfGBvnS5iY8cOIcJmwAF9gmW/YCcw
 /y92F8Avcx3bqOVmyoNVNXEzRi1LtENs3I4yVlOWW41eJR2smUlxc1GUNStybs8x5rKI
 LUcQbKMVAGZq162eWQf/ZIMpg/3ofwCi8KV5BkUE9O4d7mIvTxFziaEBPw3OG3A0AgKa
 tYeyaOL2KjxUwwdewbyurGfvatVS3/dcc1ogZE28Ji4dzrncOGZfi/P8hBqzbEk1OTZe
 65QA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8ZUD0az/dgU+4KqGYYJDp+Gq4+nfvNpxc6WZ9xiLszuQJaQXKCVnxDIjO44ph0bMcNu7iFIkVCD6A=@buildroot.org
X-Gm-Message-State: AOJu0YzwWaqHuT4dry+D0GKFui6EK2L6fQKsgagTHueX0V/F8c7VftJd
 w2qMh6wqMkOcAIwY0JBpz9Y6e5rJ32QhbyRV1MGKkfHi+eYsa2kQ3KTjFbpRQJm47U8=
X-Gm-Gg: AeBDiesc0bCVZTdfVH2SRzT+FNeLv31TaPpRU8pMt34pXqmw2Z5U0jzDbjsdVDEnR8J
 p9jjduSdLucugc/60X4pqxJ84Fiq7uiNWZmzNGdAynVmemkUHr0sEQTbeuoB8G4sXhIaH+2Dygo
 dwXqBIY58btSBg++mBo4scI0IOyeTLQCsWDf0NviEXbV1oG/7K6HEbIgfLFcst1Twj4m5vePpcz
 1TPguEFke4ZoYF79eygeT8a812pXC4msdfbDrDfmPigdoPyBU1gOcqfIg0HTShPkTTU57DjDJqH
 HSHDhv/xdunkOJeTsWuAbm5TbiIxi94HamVvHMdDbsSqKfRSEkepE//V/Cr6xUS8zY2xoF6Rbp4
 6bExrnso5JB+gP1oX0TH76RIl0w6Uv3mQnRQAIB6toWlbxBLL5eKIW3kmGAspeGWeiiR4I5ywM0
 an0XngAeL29J5lpO3V
X-Received: by 2002:a05:600c:c0c8:b0:488:8bdd:cfb9 with SMTP id
 5b1f17b1804b1-488d67bbbf8mr180478795e9.1.1776181567552; 
 Tue, 14 Apr 2026 08:46:07 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e46a85sm42747372f8f.24.2026.04.14.08.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2026 08:46:07 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Tue, 14 Apr 2026 17:46:06 +0200
Message-ID: <20260414154606.335904-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403182806.4087549-1-bernd@kuhls.net>
References: <20260403182806.4087549-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776181567; x=1776786367; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T6cfdpZ4Z1om2yHIhZsTZwia/lHYCxgbVZoViNP8gu8=;
 b=Wy19Fe/75aT/sL8gNoC3dC+113+YoSfQ/DxgPPyHmXn8gcADzi2VDSaRTdg84B2KiE
 1R9siso/Imr5e7nBl29yOz3mdAtCW67BtpudaTSaK7KJMHTqQN38esC7jGvKaJn3ngnd
 9vxcFGfeS5FZWKzwpvZXSRPIBXitHJ+g3eEE6xr+Q4E0WUlyEJrE/v3MamIRVDuVW/J4
 3LejhTz2XFNdg/FlqhnmMP7tNGN3buHke6aMdIpBnf3ZSnn6/yFUoh98l5VRIOwfd4Li
 En/lHf3StW584nDOpMiQav9Gfzn643BX0yjGdc2wMUwa3UU/0uWylfFdmaXDK044nrTk
 FkEw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Wy19Fe/7
Subject: Re: [Buildroot] [PATCH 1/1] package/sway: needs pcre2 instead of
 pcre
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
> Buildroot commit 0645cb39e0ce3af743190e587812a5bd4c1f4b24 bumped the
> package from 1.7 to 1.81.
> 
> Upstream included commit
> https://github.com/swaywm/sway/commit/f614f35e7354980bf4f0a66ca99be9b5f3a7ac90
> in version 1.8 to switch from pcre to pcre2 but the buildroot package
> was not updated accordingly.
> 
> Pcre2 was already selected by pango -> libglib2 -> pcre2 so this bug was
> never noticed.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/sway/Config.in | 2 +-
>  package/sway/sway.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/sway/Config.in b/package/sway/Config.in
> index 1e4c8bfd3e..c89c0607d3 100644
> --- a/package/sway/Config.in
> +++ b/package/sway/Config.in
> @@ -14,7 +14,7 @@ config BR2_PACKAGE_SWAY
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango
>  	select BR2_PACKAGE_WLROOTS
>  	select BR2_PACKAGE_JSON_C
> -	select BR2_PACKAGE_PCRE
> +	select BR2_PACKAGE_PCRE2
>  	select BR2_PACKAGE_CAIRO
>  	select BR2_PACKAGE_CAIRO_PNG
>  	select BR2_PACKAGE_PANGO
> diff --git a/package/sway/sway.mk b/package/sway/sway.mk
> index f27d147852..a497a2cbe7 100644
> --- a/package/sway/sway.mk
> +++ b/package/sway/sway.mk
> @@ -8,7 +8,7 @@ SWAY_VERSION = 1.11
>  SWAY_SITE = https://github.com/swaywm/sway/releases/download/$(SWAY_VERSION)
>  SWAY_LICENSE = MIT
>  SWAY_LICENSE_FILES = LICENSE
> -SWAY_DEPENDENCIES = systemd host-pkgconf wlroots json-c pcre cairo pango
> +SWAY_DEPENDENCIES = systemd host-pkgconf wlroots json-c pcre2 cairo pango
>  SWAY_CONF_OPTS = \
>  	-Dwerror=false \
>  	-Dzsh-completions=false \
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
