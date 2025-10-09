Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C3FCCD185
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 14:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E95D612E5;
	Thu,  9 Oct 2025 14:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aX0AI6r-AJXr; Thu,  9 Oct 2025 14:54:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91F0F612FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91F0F612FA;
	Thu,  9 Oct 2025 14:54:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BE9CB119
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4538612CF
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UbRYGSqeOY40 for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 14:54:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 64E2D612D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64E2D612D6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64E2D612D6
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:46 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-46e52279279so7475875e9.3
 for <buildroot@buildroot.org>; Thu, 09 Oct 2025 07:54:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760021684; x=1760626484;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pspAYKHd4fDuURErvlHNRWhVqlQnLBAx14pXidL5pbU=;
 b=bMbftkR4rD5ithKHXjirP5j3bsJNhxDE9rBzNuH6zow0dxs/dJ25yo2jRxm+IjDQ1G
 DDtiFeUNZ0syEkPOickGSsaGxVkrGI8sRw6snbRbrGdXsVHhGrrCI2Gw7cxNmw20pqvp
 ee2mpWkiNhYCGMzdgwF26m6i2CE+yOO4AxzRIodgEqaJadoY94AA81QeT7t412ztcgRf
 sWOh+N/NNLrhdT2uiTpubw9b9C53hybjVJ5lrMgY6hs6Ya2ZtxnYKhNJZ5H36JK3Oiqr
 8gRJfXoNRmaN6dqX2SvA6NXDBjgKS+JKAZdgk0F83FM+6clBnP5AE6NidVA3wUHzPO6I
 uxgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNVDCD3UcrSBXVEWlB8jBN1pg+HDU8z5F+u7q8MTZ6qgdSq8MjpS9b3menllrErfV8XiBFkPJHmZE=@buildroot.org
X-Gm-Message-State: AOJu0Yy/klcJa1Oa3u4qlXfsO2INsNyh0FG406Nk3b3CfUZxBPnz3tjk
 qDlSbTK0EHqpoF+5a7fzI30oPprpgO++7GW0ZG9JiJEH0ceZIOAphVKnuSQMh5kELPPdLmbya/R
 KqL3L
X-Gm-Gg: ASbGncsXVKYQG43hrL4bb/TmWe7dZZPXuBdOIhxz80THd5GVHL6hDpDqKLOLZLz75r9
 P/22dvc5xyXfKhmg9rmRTEya5vAoyT8WBNsZeIcgx/j0STmOgBs5DnFr0aaUub5do5573Mq76I0
 qt9NzmDQwA7qBgVfmqiOh9IBvhXWedT3+39gxD1InIw+4vncrztJgrF6EjuRt8llYwT8HWDEADO
 LLLJPVTFg2Nf83ngpeGsOlO9Iz4anlozZMj5I36mRvTsA3WsD+Y9yC3H48pno6WHA4xmJAqv5mf
 D7RKvZZ4YdFMJXJxZiiGnqw5CZ4brAeFbVNbpeoDKjHee1oWEOApC3SqC4kLYBRp5t5iEEApyvp
 YZb6j9ilMHLi8aXAhopcjrI4Kcm0xKBoYPnXHI52Nrk2o0vlde0g=
X-Google-Smtp-Source: AGHT+IER/QFDI/4DGTvapCzgJ8Bt29ZpENVKfT8e1igzO7DHMFhkSDaGq2QIpy2BoZLHM0fjGVFGlg==
X-Received: by 2002:a05:600c:c162:b0:46e:4a60:ea2c with SMTP id
 5b1f17b1804b1-46fa9b17e57mr50598075e9.37.1760021684047; 
 Thu, 09 Oct 2025 07:54:44 -0700 (PDT)
Received: from arch ([79.132.232.153]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb481e172sm2540305e9.1.2025.10.09.07.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 07:54:43 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  9 Oct 2025 16:54:43 +0200
Message-ID: <20251009145443.482359-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002150628.528563-1-titouan.christophe@mind.be>
References: <20251002150628.528563-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760021684; x=1760626484; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pspAYKHd4fDuURErvlHNRWhVqlQnLBAx14pXidL5pbU=;
 b=hhDTqM4DNvugLQXh2M3PBF+lA0azzW4dvf+25ciwuamkCG+JZEHntqtj5agaOW6nd6
 UEWCkkE16zCqzh+97OXnPExMngJxiQ+C0gIdPBClsu4eRv1sRGykM9QOwWc7zMTZzzdt
 3N2PTPzrDs4PXwKGvgMFNB11pjcouzUcRDsPZr6uNJgsIi4ktvGP8u9NtRqXpnNVWOGm
 sjT9MT88QbD4+PaKZznMDoGAdduzcRQeIpK3gCgtgugSePABBP34q8X9rtGXfbOSIz6G
 yhZvx/AnqBVquLmrqdG86vEMt2OyrDBrZyA5OYucXMNwGUg+BJjNNnTIp5VhRbmdx2aH
 yrNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=hhDTqM4D
Subject: Re: [Buildroot] [PATCH v2] package/python-pip: security bump to
 v25.2
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
> This fixes the following vulnerability:
> - CVE-2025-8869:
>     When extracting a tar archive pip may not check symbolic links point
>     into the extraction directory if the tarfile module doesn't implement
>     PEP 706. Note that upgrading pip to a "fixed" version for this
>     vulnerability doesn't fix all known vulnerabilities that are
>     remediated by using a Python version that implements PEP 706.  Note
>     that this is a vulnerability in pip's fallback implementation of tar
>     extraction for Python versions that don't implement PEP 706 and
>     therefore are not secure to all vulnerabilities in the Python
>     'tarfile' module. If you're using a Python version that implements PEP
>     706 then pip doesn't use the "vulnerable" fallback code.  Mitigations
>     include upgrading to a version of pip that includes the fix, upgrading
>     to a Python version that implements PEP 706 (Python >=3.9.17,
>     >=3.10.12, >=3.11.4, or >=3.12), applying the linked patch, or
>     inspecting source distributions (sdists) before installation as is
>     already a best-practice.
>     https://www.cve.org/CVERecord?id=CVE-2025-8869
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
> Changes v1->v2:
> - Fix PYTHON_PIP_SITE that must be updated along the version bump
> ---
>  package/python-pip/python-pip.hash | 4 ++--
>  package/python-pip/python-pip.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
> index f6b11ee26a..ad70f0da7b 100644
> --- a/package/python-pip/python-pip.hash
> +++ b/package/python-pip/python-pip.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/pip/json
> -md5  c698f55e2015dc7dbb5b77c6df1cc88a  pip-25.0.tar.gz
> -sha256  8e0a97f7b4c47ae4a494560da84775e9e2f671d415d8d828e052efefb206b30b  pip-25.0.tar.gz
> +md5  6d109857fa69274dacfc1d6528471eb5  pip-25.2.tar.gz
> +sha256  578283f006390f85bb6282dffb876454593d637f5d1be494b5202ce4877e71f2  pip-25.2.tar.gz
>  # Locally computed sha256 checksums
>  sha256  634300a669d49aeae65b12c6c48c924c51a4cdf3d1ff086dc3456dc8bcaa2104  LICENSE.txt
> diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
> index 9ffc0b66ea..02d7da6fe9 100644
> --- a/package/python-pip/python-pip.mk
> +++ b/package/python-pip/python-pip.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_PIP_VERSION = 25.0
> +PYTHON_PIP_VERSION = 25.2
>  PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
> -PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/47/3e/68beeeeb306ea20ffd30b3ed993f531d16cd884ec4f60c9b1e238f69f2af
> +PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/20/16/650289cd3f43d5a2fadfd98c68bd1e1e7f2550a1a5326768cddfbcedb2c5
>  PYTHON_PIP_SETUP_TYPE = setuptools
>  PYTHON_PIP_LICENSE = MIT
>  PYTHON_PIP_LICENSE_FILES = LICENSE.txt
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
