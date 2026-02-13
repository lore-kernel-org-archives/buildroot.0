Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6685EEF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36DD1422A3;
	Fri, 13 Feb 2026 19:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5BkILR4KaSHX; Fri, 13 Feb 2026 19:40:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4183942299
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011616;
	bh=S8lf51z8hiwxwXyR5MrKEVzExSsFVmoJNStNJsE/eEE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WNtMT0ei8AgGOfUH4WVQn6fStTyLlszedaE2t9BA0pU/smwyLj+ZdS6XAoVdKV7M8
	 0uhGnlQ0Omf6cW/O60z7h/0ZAGnqFzX2lRKLdJHmZDbkPJCmNNHs057o7lQe6c2P9f
	 EcM1nZCh416rFWuOJ/U9KICY19yDeO52y9CPYl2powkRz6BAcyU+iokiQzINaH/fi3
	 sN8bYCf+WYmhBzFUwgYaFrhRsJyYXXGb+DxxEGzqxjfgExmYfzCKN84oOimVS2farB
	 SwMhKn9gBpTNl4XoVA6CHhN7uRLR7wi29BnR1DSc5tRmLmRRFgeKt3iczgFQgOuWGz
	 cGKc+UkmXWV+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4183942299;
	Fri, 13 Feb 2026 19:40:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F23B69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61C4C413D4
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dwAl312bBxrj for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5031241336
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5031241336
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5031241336
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:31 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-483487335c2so11601245e9.2
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011449; x=1771616249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KEKhC3EYCjpnuhuo4LYSAWwumK22tEH1/4C7pIQoQbI=;
 b=tiyQsuZdPskRgGv64fLAR7/sdy+RSVd5JAqbA3OTBS/8k4uKvAM5jcJ/eZwuEcEcnr
 gnkRHduBwOGF6DvdlDPUuESzaWAQoz01C1+lCrd+w01No+MuyA1/g6cNRQ6qgoO8BevQ
 XoRRbFSuUfMx2Z89QIv/UiMlaRHazDWZRvQyANf3zyhsdGBcLUrFT1fSG67Sa8m4YKTO
 aZ78/jWPmvtwscN0QGYCQrNHEGBG2qvEQZcfgANmIfa9xsat3X/dgv6wGO0a+hSSWBz3
 x4CgS23/X9fVWkSm475cUik1lQgwWcrN/kjhc0GY9/jf2nvT3JxE33d+wH3xi8ggL0fN
 piSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8i9KBcdidYQfDi9vdJdpj64J44owFlyeoaYDDAeA62XZVhDnOoRGUeqX2XI7mXQHCZI+ZCtfjV1E=@buildroot.org
X-Gm-Message-State: AOJu0YyS0yC5PlEn6y8TVHqplAM8fMjUTKDqdkuRpNgDsG73YCPwW4F1
 GTtTNZVBJ7/SwtHOMACqC1fk6f7jSzCDIZMhas9pSoElxINJtWhWEr0ELL5KtRhjBqU=
X-Gm-Gg: AZuq6aKhbnC17QYv/M2QQuVoeOACFBq/0XiXpB+SjDvtaQzPSTAed13RFtcQY4mr/Fp
 TnkXZyvVW1j+3ZMk6NR1NEutCgVdbgFfbS/GenRvewuPQYDic8Zqq3wG8TFb7Qb+mrJsbiGZhyX
 gujh3jSy/RbOJCLm70QSZD5Pep8bfvQntFRP+5+haObFe+Sdg9RLrfc431/W1iIv69H+jUoIJ3i
 oFEe3W5qEsf7KHHCbMNv3+CdxRynek9HhaFiU/CpPBhPJpe04kBM2zxu1cTw3pVj5p+hSnevNsO
 VAZ8AVLuvZ++j6ejsdqEfR3YMYM8PE4I+WmjbY0x6j9GANvLZaZHobCtW+UQEZfWcT+Xcgepjyp
 Xzdbzn8TQ2ILKzdO7m3SNNc074ivA0xV5jYf4hrm3chYsmwxmbCpzKdPeDnfQ2YebSVmR32mo3x
 2XfXooGf75xI3Jj+4=
X-Received: by 2002:a05:600c:4f86:b0:47a:810f:1d06 with SMTP id
 5b1f17b1804b1-483739fc258mr49127785e9.4.1771011449113; 
 Fri, 13 Feb 2026 11:37:29 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796abd259sm7703089f8f.24.2026.02.13.11.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:28 -0800 (PST)
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:28 +0100
Message-ID: <20260213193728.39626-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251001-fix_license-v2-3-bf18911c835d@bootlin.com>
References: <20251001-fix_license-v2-3-bf18911c835d@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011449; x=1771616249; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KEKhC3EYCjpnuhuo4LYSAWwumK22tEH1/4C7pIQoQbI=;
 b=dZN2w4Lfn+ztotfWdVfdfdH49c+10BTl0Ah0p3m4BqOlDy9FjvkbtzHKpTIvlbBPn5
 da5x+fZQlo5tjL8LtY9RX3598DpDVyRM9xadO8BHgBRDGkmIqBAYuK6lEzEh1PI7cKmO
 xSJpTIlmHtvOzdRIwvwUQww0q5gf+aisZ80J2KrfZkXLk0oMAuSwQqN+FCBCFFYsa/t9
 S+MqiDCh7arK44zL9nsVF4rayux7LyRq6/7iX2sSERqAOMVE8S8pBhW/hwwm9tDx62Uo
 AbIhso37in1jFmCzIIcUNAjjyhdBq9dWMEDg8p0OcOYN+crO6PmxV34gW1K+6BoynloE
 RkyA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dZN2w4Lf
Subject: Re: [Buildroot] [PATCH v2 3/7] optee-os: Add support for custom
 license files
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
> The OP-TEE OS package was not providing any license file when a custom
> Linux version was selected.
> 
> Fix this by adding a Kconfig option to specify the license file,
> with a default value set to the commonly used license paths.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
> 
> Change in v2:
> - Do not show license option if it is not a custom repo version
> ---
>  boot/optee-os/Config.in   | 16 ++++++++++++++++
>  boot/optee-os/optee-os.mk |  4 +---
>  2 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
> index e737d2a0acd7ecc335a9b00cf9b1daa98d866e92..22e63c0265595e272c49ea368026ebc13e8b8838 100644
> --- a/boot/optee-os/Config.in
> +++ b/boot/optee-os/Config.in
> @@ -86,6 +86,22 @@ config BR2_TARGET_OPTEE_OS_VERSION
>  	default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
>  				if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
>  
> +config BR2_TARGET_OPTEE_OS_CUSTOM_LICENSE_FILES
> +	string "OP-TEE OS license files"
> +	default "LICENSE"
> +	depends on BR2_TARGET_OPTEE_OS_CUSTOM_GIT || \
> +		   BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
> +	help
> +	  A space-separated list of license files related to the
> +	  OPTEE-OS package.
> +
> +config BR2_TARGET_OPTEE_OS_LICENSE_FILES
> +	string
> +	default BR2_TARGET_OPTEE_OS_CUSTOM_LICENSE_FILES \
> +		if BR2_TARGET_OPTEE_OS_CUSTOM_GIT || \
> +		   BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
> +	default "LICENSE"
> +
>  config BR2_TARGET_OPTEE_OS_NEEDS_DTC
>  	bool "OP-TEE OS needs dtc"
>  	select BR2_PACKAGE_HOST_DTC
> diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
> index 25c917e2fce7af850521111681dd8ecd66efe554..16395974079298a8d33da3fbcc06371c2ca051b4 100644
> --- a/boot/optee-os/optee-os.mk
> +++ b/boot/optee-os/optee-os.mk
> @@ -6,9 +6,7 @@
>  
>  OPTEE_OS_VERSION = $(call qstrip,$(BR2_TARGET_OPTEE_OS_VERSION))
>  OPTEE_OS_LICENSE = BSD-2-Clause
> -ifeq ($(BR2_TARGET_OPTEE_OS_LATEST),y)
> -OPTEE_OS_LICENSE_FILES = LICENSE
> -endif
> +OPTEE_OS_LICENSE_FILES = $(call qstrip,$(BR2_TARGET_OPTEE_OS_LICENSE_FILES))
>  
>  OPTEE_OS_CPE_ID_PREFIX = cpe:2.3:o
>  OPTEE_OS_CPE_ID_VENDOR = linaro
> 
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
