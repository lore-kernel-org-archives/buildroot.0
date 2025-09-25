Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16395CAC5B5
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFCC861538;
	Thu, 25 Sep 2025 20:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oY4Y3vR1G84p; Thu, 25 Sep 2025 20:17:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67892615B2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67892615B2;
	Thu, 25 Sep 2025 20:17:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 340A3177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1691261545
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xbkNZirqfoex for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:16:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 29BD261531
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29BD261531
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 29BD261531
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:56 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-46b7bf21fceso10242425e9.3
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 13:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758831414; x=1759436214;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9lljNEr0eB8e86yml9yD2wRNepSbdg8yksYNp0AjMfs=;
 b=pIUHFQnHxhETTcttxzTHAadBmSSd54ToZRUXHWVOBE4RhVMsfpJlh6hMIzbLFcFhKj
 uJcDhiPKqE/fKUP81xfFkP7MKRkpUNJpqt+8cNiWw+CBL2+FGBoR0aHjICyGDhIv0xBD
 ZOgar6MK28njt1JSOESRd2DOvf9sqf6i+W8Zi95TpPcz1LfaW4zyUTMKcqufCisk/lu1
 Vk+yLZkqQA9P0wa16z5K2/GpbJUZyZb2R1KKhprRUaaz3aruLAVfarK7YNFmqrh7sYX4
 EgqwKX8nc8OOX4VJ7Qo1C3JBHHElmctYJXLeKN1j29f6kvdM6/YbkcAKJqZMTOMSy343
 Iu2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWJKTyaUmAlc1HkU2pSsXA1iDo7OI47Oa0ReK35ynpm5ZCk71ybdrruqgEle4LPDMU8ZLbexOOQu4=@buildroot.org
X-Gm-Message-State: AOJu0YzjFUbemGJd5+QnZmyU1Mk+gDbQu6S+nU2qDwGecZ4DM8u6oW9X
 6/gRi3YGCzoxwu2pU+OLLqhV4aTmsww9x69KA4qphlrXVvmalCZfGc1amcknBvGX8AI=
X-Gm-Gg: ASbGnct9AWsNeMfEAY6vfUNkVOUvvwUoY/P3av6i0Dhu4jpT4m/ueCLwM2kclsA7AQv
 POaGJJmtLyCUhzPwYR+258p24IMe3bwfkC6Vr7ELOJ9d8XUaN6J4vw1GeWf53bYaCKI2fDQPvKf
 IYPoppJacIeZYAqJeD5BxnLyhR7EmzOzJd/PUD7hOMaMPRWaPauU39kwHJGmSD3Cq+/lf4hvASM
 bT8bCvpCMspYaNxsxnW2U/SyGxQKgBsLaoMnA9Z5HDpv5vn+WRBAcRw+GE/qK3z4pF6f4PJGr8X
 45MjNyPVqjrl5qW6BnoFfcA7B2LTdkbBbCBAxlnwjXDO0aV7+YWJIHX35x93UPr48opjjTPG2U4
 OoISinqPWXk1QTc/c8VbuzEHrYg==
X-Google-Smtp-Source: AGHT+IGlL8svPeDcPI4vdL78uQoGlWO+frEYh9DAitIEe10dTyh6f3SCFpZ2w+vRZdJTmuc5CM07jw==
X-Received: by 2002:a05:600c:22d3:b0:45d:2ac9:4240 with SMTP id
 5b1f17b1804b1-46e329eaeffmr43853145e9.17.1758831414139; 
 Thu, 25 Sep 2025 13:16:54 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab7d4e3sm88344215e9.23.2025.09.25.13.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:16:53 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:16:53 +0200
Message-ID: <20250925201653.43904-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250917112337.2521059-1-fiona.klute@gmx.de>
References: <20250917112337.2521059-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758831414; x=1759436214; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9lljNEr0eB8e86yml9yD2wRNepSbdg8yksYNp0AjMfs=;
 b=YSRyETDPOTKcOY3V8K/7Rz6CdBvuIytLpkhYc6pySM1vgwj2JetENjeXKyNb9XabrW
 t+JQMg7g2pQvmMTHWiIq1QxOqRTuYUL+HNRyE2IbSOc0sG9wADd9+7acmjJdtt02QI7G
 zKD+VA3+WFp1NPndemsjcWVhm3KO0j8HZQNYDvpBniqwPMROj8UBaj5TPm4Vu2loqGqd
 A7nq/fwVKIgyMdZ36zvBWyuHbXHU/AFyEadVNKDEyOf1WBTxfckpuFPehkxOCJEDaSTa
 UbIwSXubKhT7+TAo+GF0AQgy41DZhj2nYGc7nu9i/QRTxxTMGfHAkRDJJe1ykvIYrSI9
 e0zA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YSRyETDP
Subject: Re: [Buildroot] [PATCH 1/1] package/python-trove-classifiers: bump
 to version 2025.9.11.17
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
> package/python-cffi 2.0.0 (bumped in commit
> 07903d2b274bc98f930e06dee237682015acb1d7) fails to build due to an
> unknown trove-classifier:
> 
> * Getting build dependencies for wheel...
> configuration error: `project.classifiers[8]` must be trove-classifier
> DESCRIPTION:
>     `PyPI classifier <https://pypi.org/classifiers/>`_.
> 
> GIVEN VALUE:
>     "Programming Language :: Python :: Free Threading :: 2 - Beta"
> 
> OFFENDING RULE: 'format'
> 
> DEFINITION:
>     {
>         "type": "string",
>         "format": "trove-classifier"
>     }
> 
> For more details about `format` see
> https://validate-pyproject.readthedocs.io/en/latest/api/validate_pyproject.formats.html
> 
> The list of trove classifiers Setuptools checks against is provided by
> package/python-trove-classifiers. Upstream has added the classifier as
> of version 2025.5.8.15 [1], as well as a bunch of others [2], so
> update to fix the problem.
> 
> [1] https://github.com/pypa/trove-classifiers/commit/331838aaea0eea6374e4e51e8fe05e13bf7e4957
> [2] https://github.com/pypa/trove-classifiers/compare/2025.1.15.22...2025.9.11.17
> 
> Fixes: 07903d2b274bc98f930e06dee237682015acb1d7
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  .../python-trove-classifiers/python-trove-classifiers.hash    | 4 ++--
>  package/python-trove-classifiers/python-trove-classifiers.mk  | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-trove-classifiers/python-trove-classifiers.hash b/package/python-trove-classifiers/python-trove-classifiers.hash
> index bb9f40a7f3..008c3a0b3e 100644
> --- a/package/python-trove-classifiers/python-trove-classifiers.hash
> +++ b/package/python-trove-classifiers/python-trove-classifiers.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/trove-classifiers/json
> -md5  3656424a10a761108fa8250033ffe3d4  trove_classifiers-2025.1.15.22.tar.gz
> -sha256  90af74358d3a01b3532bc7b3c88d8c6a094c2fd50a563d13d9576179326d7ed9  trove_classifiers-2025.1.15.22.tar.gz
> +md5  769cd978e6756c423958bbfe76f130d8  trove_classifiers-2025.9.11.17.tar.gz
> +sha256  931ca9841a5e9c9408bc2ae67b50d28acf85bef56219b56860876dd1f2d024dd  trove_classifiers-2025.9.11.17.tar.gz
>  # Locally computed sha256 checksums
>  sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
> diff --git a/package/python-trove-classifiers/python-trove-classifiers.mk b/package/python-trove-classifiers/python-trove-classifiers.mk
> index 8d2238d41a..a556cbd3dd 100644
> --- a/package/python-trove-classifiers/python-trove-classifiers.mk
> +++ b/package/python-trove-classifiers/python-trove-classifiers.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_TROVE_CLASSIFIERS_VERSION = 2025.1.15.22
> +PYTHON_TROVE_CLASSIFIERS_VERSION = 2025.9.11.17
>  PYTHON_TROVE_CLASSIFIERS_SOURCE = trove_classifiers-$(PYTHON_TROVE_CLASSIFIERS_VERSION).tar.gz
> -PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/f3/cb/8f6a91c74049180e395590901834d68bef5d6a2ce4c9ca9792cfadc1b9b4
> +PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/ca/9a/778622bc06632529817c3c524c82749a112603ae2bbcf72ee3eb33a2c4f1
>  PYTHON_TROVE_CLASSIFIERS_SETUP_TYPE = setuptools
>  PYTHON_TROVE_CLASSIFIERS_LICENSE = Apache-2.0
>  PYTHON_TROVE_CLASSIFIERS_LICENSE_FILES = LICENSE
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
