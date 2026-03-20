Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A61410987A1
	for <buildroot@archiver.kernel.org>; Fri, 20 Mar 2026 15:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2AB160A3F;
	Fri, 20 Mar 2026 15:54:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DcgO6LA_ZUJY; Fri, 20 Mar 2026 15:54:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D72D361B6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774022080;
	bh=qn5aQg6mSxHpPOA3EBfThOTYYCzsVd55aR0KgfB4UfU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oxu+MHB9KoQAMwzFPquXciRw5FKJtfs2mQqhgcEz0AT0KZZklJCr0yGhFVgxlrywr
	 Xg1t9WnG85d4EgMv/SiEL7xggYMofoGN/aTUJYpffYHsm+VT9cFDa/YQDOYQv2x22+
	 M6Yfiyj3p4T+WIdGmasrRvEcTFFXH+IC3mD98DnNUlw7SxJt6leLKhwlVnoXSMKQ1C
	 EF9ZJGc6qLAn+3C+NEyLHIaA94jPHOrmXUs8BVX/ZFCSLbVx8klSxTAPA1OSrpyMQ4
	 2ZnVmU1IoVoObi+dLbb8s1jmW+NSetfm2e7Zt08wBjYX1s5uHFAsIfUcw47SveqCs8
	 xDN76foJrRIAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D72D361B6C;
	Fri, 20 Mar 2026 15:54:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11E1A1B6
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 042458487A
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:54:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SRx-OOyvppoK for <buildroot@buildroot.org>;
 Fri, 20 Mar 2026 15:54:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 31B7B84878
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31B7B84878
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31B7B84878
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:54:37 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so6440945e9.0
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 08:54:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774022075; x=1774626875;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=07WMlCC0l0FVM3RhgVQzGYy8b0VUVEGaIf82bhvZ+eU=;
 b=NU2VAyu5Fk/ps/yKWSzr79ML+DZs5Q9ETiDJdpsPUxwEyr92V2zesV5+kt/sU2fjGr
 rn7Trh4Hb/lOtpkic3T3IubzG0Xf58V1AYM70jLNzVTMSLLUNRD8o0+OUbRYSAeP8C3y
 KvpP2WmsHtu4SBPoeED8ViNvoqQn4/Ojsapqew/Pr4IkG6RT9CBnkGd3cdXk1c88FVgz
 sxRIxo+pdEB3FgxACtF9nOqfBT591C2xjypNsRyVaqUdNmSDhtuH6TAq14FaqICmdmJ0
 OQzSL7UVH5i2XnKFnjs5d8LpNCShYrP1YyS3n+AZD2cdhfLaAZKu1V2qkuDLvmy5CMZx
 X/xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCULV/1l3pbVrIgCpkD2cxmxIP2T3QemyXCgBHzALCkE3tAeLc4ZYue1nyD7YwWF5BOnyBZqT/ztlDQ=@buildroot.org
X-Gm-Message-State: AOJu0YzN/6fK9RHtrJtIvALcNAfa99+WSPXIJBoHWGl7KN17fH4NVlwr
 k+JEJNTv9z4j+ahdYwwTcaXV+7u6C5g6jriuBsdU1+NCi0QZxtjIlYuE52CnPmfnv+Y=
X-Gm-Gg: ATEYQzwwEj5Tm0kHEvPuc62tVJvZA62VsMaddmQoxbyvE4VGCZa8cQV/ktJbRzgRIxC
 Llf8BmArwiUgPJb6s0QTnQqzUj7exdtThW/5kmlvwrlbb9MufrAMgIl6A/igEOTAnkZZyFYwFbL
 prESxvmRaWjo3AtFGgCMlhGpJ2lnrqo8WzOVQB1xI6B+9K/773qKMBb69Z4MfsZWVR5/UeBMV3j
 N/f/icwIpUMtxO4CoYTb5l3Uh9y73v+1MIc/hEyPu2yCH6sdjFUU8NKZk2tU9pAaUxsB/78qWqy
 0AJl6FVulhcimBD6ZjFAE+Ff1GeOyF2W7cnlNo420mMOyp+RZlhfpeKm19gmk2x1YhOI/mw5l97
 ShDPyJel/86R2VEHYzzL9z3tmRhOxiCuN8SznC0l6IAE5iGvCcvt/I3slbJ8hVkANLZ8P6bJbjE
 KN6YgBrGWZnQMplZNi
X-Received: by 2002:a05:600c:1c0a:b0:486:fbc8:8dfd with SMTP id
 5b1f17b1804b1-486fee231e8mr50603855e9.23.1774022075135; 
 Fri, 20 Mar 2026 08:54:35 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486fe867e41sm19951745e9.4.2026.03.20.08.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 08:54:34 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:54:34 +0100
Message-ID: <20260320155434.175739-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20251013175513.86276-9-bernd@kuhls.net>
References: <20251013175513.86276-9-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774022075; x=1774626875; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=07WMlCC0l0FVM3RhgVQzGYy8b0VUVEGaIf82bhvZ+eU=;
 b=Rt7xV/YuYi6iREhHyzF46MnakYqUtsFzScpKlvB9IVfpr65xhXxxBzJvpwjm7iWrKP
 sMU/ZBY8acd2WqsLKP6q6qKdB2lnrL2Z77fSvDywMFI4vQ0qkydIHKc9GKJZ/T61+tzk
 8oi8Mpc+jjSA0LpeQozKKRnoxdwvxxZiHQP+T7gZPJm8Mz0wCTzSSVx1Fa6WJIeHI1Zd
 NUv3C9qKIcb2DKKNtQVK8fzFJ7mIOUZ7vOOo1D5Xs80nD9E/J8QThU5cx9+N81BbXCYq
 RxWBxOYE0LbrXPcRxkoPIhUYqxSRnPwCoDbRrKYvSE1yIlWjdkibWSWSCbo8GMlzE4Lp
 nbXg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Rt7xV/Yu
Subject: Re: [Buildroot] [PATCH 09/36] package/python-pyasn1: bump version
 to 0.6.1
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
> Changelog: https://github.com/pyasn1/pyasn1/blob/v0.6.1/CHANGES.rst
> 
> Updated project URL according to https://pypi.org/project/pyasn1/
> 
> Updated license hash due to copyright year bump:
> https://github.com/pyasn1/pyasn1/commit/acb78299d1270a2fea0d11e5509777b7c5777f3f
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/python-pyasn1/Config.in          | 2 +-
>  package/python-pyasn1/python-pyasn1.hash | 6 +++---
>  package/python-pyasn1/python-pyasn1.mk   | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/python-pyasn1/Config.in b/package/python-pyasn1/Config.in
> index fea63813b9..fb576ffb71 100644
> --- a/package/python-pyasn1/Config.in
> +++ b/package/python-pyasn1/Config.in
> @@ -3,4 +3,4 @@ config BR2_PACKAGE_PYTHON_PYASN1
>  	help
>  	  ASN.1 types and codecs.
>  
> -	  https://github.com/etingof/pyasn1
> +	  https://github.com/pyasn1/pyasn1
> diff --git a/package/python-pyasn1/python-pyasn1.hash b/package/python-pyasn1/python-pyasn1.hash
> index 4347a43c46..4268d82c38 100644
> --- a/package/python-pyasn1/python-pyasn1.hash
> +++ b/package/python-pyasn1/python-pyasn1.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/pyasn1/json
> -md5  dffae4ff9f997a83324b3f33fe62be54  pyasn1-0.4.8.tar.gz
> -sha256  aef77c9fb94a3ac588e87841208bdec464471d9871bd5050a287cc9a475cd0ba  pyasn1-0.4.8.tar.gz
> +md5  75cdc260597f112fdfefec85379e710d  pyasn1-0.6.1.tar.gz
> +sha256  6f580d2bdd84365380830acf45550f2511469f673cb4a5ae3857a3170128b034  pyasn1-0.6.1.tar.gz
>  # Locally computed sha256 checksums
> -sha256  22c5cc6922ab5d69fba32d8c5ee4cdd14981508cb53afc0ebd85593847fd95a5  LICENSE.rst
> +sha256  2aad5fc00f705c4a1addb83eed10a6a75d286a3779f0cf8519d87e62bc4735fd  LICENSE.rst
> diff --git a/package/python-pyasn1/python-pyasn1.mk b/package/python-pyasn1/python-pyasn1.mk
> index 60050bef18..7a5cde40fb 100644
> --- a/package/python-pyasn1/python-pyasn1.mk
> +++ b/package/python-pyasn1/python-pyasn1.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_PYASN1_VERSION = 0.4.8
> +PYTHON_PYASN1_VERSION = 0.6.1
>  PYTHON_PYASN1_SOURCE = pyasn1-$(PYTHON_PYASN1_VERSION).tar.gz
> -PYTHON_PYASN1_SITE = https://files.pythonhosted.org/packages/a4/db/fffec68299e6d7bad3d504147f9094830b704527a7fc098b721d38cc7fa7
> +PYTHON_PYASN1_SITE = https://files.pythonhosted.org/packages/ba/e9/01f1a64245b89f039897cb0130016d79f77d52669aae6ee7b159a6c4c018
>  PYTHON_PYASN1_SETUP_TYPE = setuptools
>  PYTHON_PYASN1_LICENSE = BSD-2-Clause
>  PYTHON_PYASN1_LICENSE_FILES = LICENSE.rst
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
