Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B30AC7115A
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 13:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49A55409A2;
	Wed, 18 Jun 2025 13:02:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Exm9FEETIVgk; Wed, 18 Jun 2025 13:02:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B972440915
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B972440915;
	Wed, 18 Jun 2025 13:02:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B2065E2
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 13:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9803940915
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 13:02:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2uzJSL0_wh85 for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 13:02:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6503940913
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6503940913
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6503940913
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 13:02:34 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-607ea238c37so14518834a12.2
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 06:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750251752; x=1750856552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GFWIR/6MHp2DZBeGrFbPGDnusHHwrZQZ00IjYqfnZeI=;
 b=nEEuf9t6wlnyn6zuIeaVRfk5La7Bo6642Rfd6kQYP0mhgJPoL9cPRPFADhj9RHiNUO
 NWqQ7t1+58dSnZWijOs07t6APVYJ8EScIaYfeHU0XZpw+7eXfx2wW0UK1lW9QQ6JTtQB
 kFOp6E1FRTIDwoMkd077NZh10SFDNHY9Tcy/d+hcfCiIVnR0rltNYjP9ofeXeoorEQaF
 k7ZBNbIW1v+3BVWi5VCG+I7rweRk2LQ7TzQTspJoV8LE9QmzwzUf2AWn7tgl4R1hOjyC
 f3pPGK1XnPoDSE/W6kALwq1gBRFMFB8nQ/zsSeISNuE6lAVJQmZeBRAUTjUtzX8Kv8oq
 BRJw==
X-Gm-Message-State: AOJu0YxjJiIyaYb8+QtGYUloykZy9waGhoNA78/LzeAHw9sG5ll+Iah8
 caIpyMV+hK/QkfPZguztswuVcw8G0HsDlZ0frvKDwXxY5N6dXxuOfqkJIfXd3lX5WkM93pi+TSd
 xE3JG
X-Gm-Gg: ASbGncvQPaNSJuSc3G3ge7Yh/qfLWQpe9YSwlD2lLQhPJYHMec73CaVxyfneUR6SCub
 wwAu50FRGs28XxRWYlAA/2YVm0jvu4H69RWdV7UwMzuhppXpViozJOTVLay6CaUHr9+yqAzr/EQ
 OYDrn0DVDIfVTgrX0uinm8d1dPkC692fatx1RW6S8ToX88vmYvmZutv/AkP5Kqd75zcUqj2tO+S
 kzhBF+nwri1GEl5JsxVZFr6bXjAw0TyV0VpeRDTMS5Gze7GrvOxt/XjWBrGx7jxAxkBUDyDYaHl
 Xci0OwuU0Rv3+VyA27SsqcIBmCDdytgUsCY4d5qcuBEaRJZPaydzWErHC40VW31raIpp54dQk/K
 1
X-Google-Smtp-Source: AGHT+IH2JCGneh947Mrhl+cz55BsSf1RyFKHzyihR2anPsGOIPNkZWnLlkYnjyRRIw5gShNB7ffvwg==
X-Received: by 2002:a17:907:6e94:b0:ad2:46b2:78b2 with SMTP id
 a640c23a62f3a-adfad3aa4e8mr1729650166b.18.1750251752011; 
 Wed, 18 Jun 2025 06:02:32 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adf37467a91sm952127066b.166.2025.06.18.06.02.31
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 06:02:31 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 18 Jun 2025 15:02:22 +0200
Message-ID: <20250618130222.215877-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612204420.493055-1-thomas.perale@mind.be>
References: <20250612204420.493055-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750251752; x=1750856552; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GFWIR/6MHp2DZBeGrFbPGDnusHHwrZQZ00IjYqfnZeI=;
 b=etVA/GOgbTnMIgaYOzsfIZffTrMgYFd5N9MjHyeAaf7BrXznHO9OT4NqUJSmnlfkDB
 9cI1ljdlKgy2n2eUyYZ5RliF27EkJdNH2simY7CxSMt6eYcA7e+ZflpeptgfUIBEPwvJ
 Ajtr7UvHhiwjjHQzvuRui56PYlspkKue05OV6xMKKq/7ezAyhJfJ1EQXWI4LyxN1UNYw
 3OP58OLOfCR9CY85jp1fhX/LeTAwnWezgQQi/42f93yD87H97oIbFnrNJxSxfMUJhpId
 YRdRmZu+CYRMZo4kwc0BLy+v5qKLiDXmnEbu+KUM75APZdsAcHRwCaefgJOMptFgnEmg
 x78Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=etVA/GOg
Subject: Re: [Buildroot] [PATCH 2025.02.x 1/1] package/python-django:
 security
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
> Fixes the following security issue:
> 
> - CVE-2025-48432: Internal HTTP response logging does not escape
>   request.path, which allows remote attackers to potentially manipulate
>   log output via crafted URLs. This may lead to log injection or forgery
>   when logs are viewed in terminals or processed by external systems.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-48432
> 
> For more details on the version bump, see the release notes:
>  - https://docs.djangoproject.com/en/5.1/releases/5.1.11/
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/python-django/python-django.hash | 4 ++--
>  package/python-django/python-django.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
> index ff3f8105d8..f307c61b0d 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/django/json
> -md5  d3b7a04b581dec5d74769df44e0ddbd1  django-5.1.10.tar.gz
> -sha256  73e5d191421d177803dbd5495d94bc7d06d156df9561f4eea9e11b4994c07137  django-5.1.10.tar.gz
> +md5  054d6f2ad897359de8378c190d73121e  django-5.1.11.tar.gz
> +sha256  3bcdbd40e4d4623b5e04f59c28834323f3086df583058e65ebce99f9982385ce  django-5.1.11.tar.gz
>  # Locally computed sha256 checksums
>  sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
>  sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
> diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
> index 8fa2a474e2..94cc2a86ce 100644
> --- a/package/python-django/python-django.mk
> +++ b/package/python-django/python-django.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -PYTHON_DJANGO_VERSION = 5.1.10
> +PYTHON_DJANGO_VERSION = 5.1.11
>  PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
>  # The official Django site has an unpractical URL
> -PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/73/ca/1c724be89e603eb8b5587ea24c63a8c30094c8ff4d990780b5033ee15c40
> +PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/83/80/bf0f9b0aa434fca2b46fc6a31c39b08ea714b87a0a72a16566f053fb05a8
>  PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
>  PYTHON_DJANGO_LICENSE_FILES = LICENSE \
>  	django/contrib/gis/measure.py \
> -- 
> 2.49.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
