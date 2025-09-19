Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95274CAC59A
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 13:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 659AD82603;
	Fri, 19 Sep 2025 13:02:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nk9dfCy6cV0M; Fri, 19 Sep 2025 13:02:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7968E8264C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7968E8264C;
	Fri, 19 Sep 2025 13:02:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 71446D7F
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 13:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6337782603
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 13:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c8gb7MQPR4Xe for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 13:02:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D8EF182283
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8EF182283
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8EF182283
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 13:02:11 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45dde353b47so11194865e9.3
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 06:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758286930; x=1758891730;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3/RzjrwqdYQVKc+syv2jxXYUtpwydcCMDnQMl4rXYbo=;
 b=khu0nr91b+mJSKC5tIy/XkCQ/Eoaei9hktfO571RlRTiuTjxbT3ZY2WzjqZ7xHRw9a
 a4BjofusdO8Wq5Q3tffPrpEACtjWImUhSOQqGTTRgTcNC1zbuY/as7IN8WUNOctSVvHU
 ZAPP9S9r3Q3fcB6QX7Ekv03ew52iMQooHOaVdovH36I+wNdZClLhVngULdlwJ3bjQVdY
 y+IwmpgcBDgzhmKmdGpIWS3q41bv/ztydIcps9c+SjXGrLv1uTcviD8HdK1z4eBV+GPw
 TC/Nd1jvRlPlV6zwWCJTOj0vW5ATciUiaKJTwOCwVaa0CZNvmKqNlF/PoZ5YshXvBk+G
 EMJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaNUaJ/BFCNcbKy5EaovnocP32RileJpTkcDH1rXjjES1CcRc9oOMpyNQp5Cyzh32KXA3YPY85hk8=@buildroot.org
X-Gm-Message-State: AOJu0YzMav93mez2iLBfqWpNeLyZQRClEwJffcl+I6L9PMYYJf8Sk24d
 DBGHhY3ZP9s/8oUvtPwN5ZUH8+mNoHZR1O1UE1/TJciyxzFjBKFYAPPqrNsf60fPzWPrCyyfyyl
 Ph9FPqfE=
X-Gm-Gg: ASbGncutF/38zHpVNdjdsAZ2n+dVsz21GdfbOn+/nWxJpPbYawm+miYxKoY7LD3dthm
 5HLF/3DLM3yJU9OwsMRfMfGY+6hYGMHowcIok7XdW4ZuY3rqJb2uKDgxajwkNrtGJzWFDUpjR3z
 mkE2lGB/5f5S5Y3wr886x3XTsO+YumqDUmPUrPtOXDZJiYXn0wwG3Xrhwf47W8HFnyIkIqQhA4A
 3hrxphe4NZ4mRGjPh8kQCX23pzfGCouWkZG5JVEc0956sOrww6kXglQst8BtHkuBHMunu3Na6BD
 G6cZELOoIi86HfgMq5OVxbYkhqm6/HCu7yJtksikJq7QfKCD+in73ZARMvCNUzEkqp49t98FQps
 XTZGiXHv6AQCS1Ss=
X-Google-Smtp-Source: AGHT+IG01LjbPZFfBOnogHzBarkfZRZ1DCw/1yF/JibtoTmDaIDNCsQc3q0oCMms7ZZtMiN5qX8GGA==
X-Received: by 2002:a05:600c:4f53:b0:45d:f81e:6258 with SMTP id
 5b1f17b1804b1-467f2cc8369mr22856995e9.29.1758286929766; 
 Fri, 19 Sep 2025 06:02:09 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-464f0aac33esm86040185e9.4.2025.09.19.06.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 06:02:08 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 19 Sep 2025 15:02:08 +0200
Message-ID: <20250919130208.139286-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911162303.830536-1-titouan.christophe@mind.be>
References: <20250911162303.830536-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758286930; x=1758891730; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3/RzjrwqdYQVKc+syv2jxXYUtpwydcCMDnQMl4rXYbo=;
 b=OoHWSH/blPV32e20fmT1/pnpvG7zf44wtJmB6s7Bbj21XcjTiNLm2Bo/6WRQB2AKLj
 Cl9/hacFcWZq8eACeuxqVfUqwJtHiEuvze4ScpbaTh+NvttR4zjGdWJAvtVm6g2LfHwQ
 8ut644TL0ZDCsP/m07rtRT/FyaFVhg+QNgpjA/VtLLApO0kXfCwbTc8ezMBwP9ND8Bzs
 UkAUPgVual1aE4I6sv5cLJWtZQ85B6bd5WadXG8yWZnuCPTCctliREOqVOPn1oQvKkcI
 dwNP492rAtdta8KvNZYObt+1QdQTOkruMPFjWHFA3JAz6g1PZ90FjFnwmBHodHTm0GRR
 7tYw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OoHWSH/b
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/python-django:
 security bump to v5.1.12
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
> See the release notes:
> - https://docs.djangoproject.com/en/5.1/releases/5.1.12/
> 
> This fixes the following vulnerability:
> - CVE-2025-57833:
>     An issue was discovered in Django 4.2 before 4.2.24, 5.1 before
>     5.1.12, and 5.2 before 5.2.6. FilteredRelation is subject to SQL
>     injection in column aliases, using a suitably crafted dictionary, with
>     dictionary expansion, as the **kwargs passed QuerySet.annotate() or
>     QuerySet.alias().
>     https://www.cve.org/CVERecord?id=CVE-2025-57833
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/python-django/python-django.hash | 4 ++--
>  package/python-django/python-django.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
> index f307c61b0d..155e3af8ef 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/django/json
> -md5  054d6f2ad897359de8378c190d73121e  django-5.1.11.tar.gz
> -sha256  3bcdbd40e4d4623b5e04f59c28834323f3086df583058e65ebce99f9982385ce  django-5.1.11.tar.gz
> +md5  7f7a03e4f19ad7813d96f9fbbad65a5c  django-5.1.12.tar.gz
> +sha256  8a8991b1ec052ef6a44fefd1ef336ab8daa221287bcb91a4a17d5e1abec5bbcc  django-5.1.12.tar.gz
>  # Locally computed sha256 checksums
>  sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
>  sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
> diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
> index 94cc2a86ce..3026c304be 100644
> --- a/package/python-django/python-django.mk
> +++ b/package/python-django/python-django.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -PYTHON_DJANGO_VERSION = 5.1.11
> +PYTHON_DJANGO_VERSION = 5.1.12
>  PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
>  # The official Django site has an unpractical URL
> -PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/83/80/bf0f9b0aa434fca2b46fc6a31c39b08ea714b87a0a72a16566f053fb05a8
> +PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/f0/99/a951d93a27a5bc59fb96edbcdbc03fb9bfac51177f1bc0110888de85af3f
>  PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
>  PYTHON_DJANGO_LICENSE_FILES = LICENSE \
>  	django/contrib/gis/measure.py \
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
