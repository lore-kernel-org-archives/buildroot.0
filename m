Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDEACCD185
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 14:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52E934102A;
	Thu,  9 Oct 2025 14:55:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OpUocnsIJrHI; Thu,  9 Oct 2025 14:55:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 635144105D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 635144105D;
	Thu,  9 Oct 2025 14:55:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 267BC119
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D51840F28
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qyp6vTM24Y_6 for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 14:55:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E0790410F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0790410F7
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E0790410F7
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:55:45 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-46e42deffa8so10158455e9.0
 for <buildroot@buildroot.org>; Thu, 09 Oct 2025 07:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760021744; x=1760626544;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gET5mRRI9rlqBby0GBh3fG61VcxTImvcSMom3HSsUqU=;
 b=WLTsoFjC7l+0lHDcDPoUtfMQ7yyJIeFXk2C3PoALzFssJ1T6P9Sl36WnPf35QbTU1Y
 4E//LW+xbG8Ny/BYq8lVxWZlx/ulli4aVp5zXLyz84p/7ZiX678XRm4kTtd0XmmuudcQ
 ct+nf+ohftWZURpt+s1XaH924G2iYAAMAiROisxzbnKhNge8QcNk/MHXnT8ZUimdxGTp
 Vx8b3FBZw8VbNmeyFK6dTfm50Y+EhZGSOkd+5vU9ESgDa2/Jyem+xmd0j8BxmTS6fcXC
 6U48EjGsYlXAhxyac4PiqmEc9MPNkzSesrAylTkrm3urf7RZAyuWSjm4i6/ZqW4J41Aa
 VoXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuidcSsAWXd/LC0iL9A891CcVj9PDuNj6SMwDGvpGi4NvJxZwmJwGzSL5bcq/glMNVHm4T94WhEzk=@buildroot.org
X-Gm-Message-State: AOJu0YyDUq9BBeyBAURo5aHaMNAOQsUFWDVMF+DBFUwcmoleXV2uaMm8
 5H10cpY3mN/P76lWiArJZHOaRrYKuNAiHo6bWNqStJgirYnOf0bWZZ09s543N8Np6Fk=
X-Gm-Gg: ASbGnctYkA/nG0FSCdiDl6b6Q6318pf4pO+V+NVbuACEPNluxmqxjIa8Yf5UInQM0TY
 kJbZkXuwgu55bM3DYIo8bQdE/0GZT7Ti6fjAnsQt9Txd0Swtzb9zdrlmmNl33/Ym91WC/Ym/uWU
 M7RAMNa2kFM/d6bxhznXcKIQ+X6zlXaWRFBSpS7odRMZY4ojEU34mBx0gjR8fZubrIrLevwSBQ3
 RNbGq/0KAtNaAZomLry1Kv0U7wFPg59zJ4cFNo5+xNIurm1B8kjNaRBngZCGSCz3KKmOu7wNrFm
 nYUP/JPw3Iq9y2x5czlSVqUA7XVDQnE1yuaC/ECQmGud/1xaUrJHAWxS/TLtU/lMGeihnLfZlAX
 +vlTqPyt4ITPiHAOwpu06lVBJ36LZSsS78czEnhEhNe6nYbg7T34=
X-Google-Smtp-Source: AGHT+IF0ouwPFZ8Srvro77Y1vKE29fUUqBIY9dAyoyFGDVFak7WurjwFl2ImcQBk620wUI+8EfmNOQ==
X-Received: by 2002:a05:6000:60f:b0:3ee:13b1:d6fb with SMTP id
 ffacd0b85a97d-4266e7e1799mr5107094f8f.32.1760021743800; 
 Thu, 09 Oct 2025 07:55:43 -0700 (PDT)
Received: from arch ([79.132.232.153]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8ab909sm34810177f8f.19.2025.10.09.07.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 07:55:43 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  9 Oct 2025 16:55:43 +0200
Message-ID: <20251009145543.483526-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251004094128.270821-1-titouan.christophe@mind.be>
References: <20251004094128.270821-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760021744; x=1760626544; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gET5mRRI9rlqBby0GBh3fG61VcxTImvcSMom3HSsUqU=;
 b=ZTSeYYKjYxQTNRlHmqkiSoJhdzifUiJzYzBMU0ldEIuG2TsYImY1epXqFG5EqvVnBm
 yKNFUxcfX+NbE+phlPjMdmd5OcivwzgAbmcCWQVFc/fdOsSC5xDfNPcVTdxZgosIwilq
 PvfbIyB2QLYxGaTSRfsvl3JwNjq8eR3/iLkSpj8TfJW3g992p2l7q4VnqrlJQYj/moFO
 AJiLPBSnqsZNzRz2FbFOkH/xEPFO1EANn2wxbT62KLd2ZoDhNpGEQrF/cjfggcHzPesA
 QcSInbv3XTHrhx8tV2fV5dCz+RQSdXB4uOHBxgdbJxHexg5tiexFFEQKF7f8RulCEYNP
 UF2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZTSeYYKj
Subject: Re: [Buildroot] [PATCH v2 for 2025.02.x] package/python-django:
 security bump to v5.1.13
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
> This fixes the following vulnerabilities:
> - CVE-2025-59681:
>     An issue was discovered in Django 4.2 before 4.2.25, 5.1 before
>     5.1.13, and 5.2 before 5.2.7. QuerySet.annotate(), QuerySet.alias(),
>     QuerySet.aggregate(), and QuerySet.extra() are subject to SQL
>     injection in column aliases, when using a suitably crafted dictionary,
>     with dictionary expansion, as the **kwargs passed to these methods (on
>     MySQL and MariaDB).
>     https://www.cve.org/CVERecord?id=CVE-2025-59681
> 
> - CVE-2025-59682:
>     An issue was discovered in Django 4.2 before 4.2.25, 5.1 before
>     5.1.13, and 5.2 before 5.2.7. The django.utils.archive.extract()
>     function, used by the "startapp --template" and "startproject
>     --template" commands, allows partial directory traversal via an
>     archive with file paths sharing a common prefix with the target
>     directory.
>     https://www.cve.org/CVERecord?id=CVE-2025-59682
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
> Changes v1->v2:
> - Update hash for utils/archive.py, because this file was updated as part
>   of the CVE fix
> ---
>  package/python-django/python-django.hash | 6 +++---
>  package/python-django/python-django.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
> index 155e3af8ef..a525410582 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/django/json
> -md5  7f7a03e4f19ad7813d96f9fbbad65a5c  django-5.1.12.tar.gz
> -sha256  8a8991b1ec052ef6a44fefd1ef336ab8daa221287bcb91a4a17d5e1abec5bbcc  django-5.1.12.tar.gz
> +md5  dad76d0dbdbc86402061182fc708a442  django-5.1.13.tar.gz
> +sha256  543ff21679f15e80edfc01fe7ea35f8291b6d4ea589433882913626a7c1cf929  django-5.1.13.tar.gz
>  # Locally computed sha256 checksums
>  sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
>  sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
> @@ -12,4 +12,4 @@ sha256  4ee0cbc51370afde358652a0f977972053729ed578b6a42f5e2a037d114f0b39  django
>  sha256  73af2949bff9296cb0f816c3be19a4da4e95adc94c1f924796e8bad3f03f2f29  django/contrib/admin/static/admin/js/vendor/xregexp/LICENSE.txt
>  sha256  d114faff3488c16c319b3235dc41f90239d3d63d9853733033d8f7535f5c0004  django/contrib/admin/static/admin/img/LICENSE
>  sha256  54004c4b606964ebc163af16d04607c16e428f8a78a026fecb53f70c09f4a94f  django/dispatch/license.txt
> -sha256  1ce0483ad554cf135efec70ad2097e82ed72790194f17e1591821dc82c2416e0  django/utils/archive.py
> +sha256  9f37277d682cf06369041e60fb6fda5a85dfcf118d9176489087a3d40293f015  django/utils/archive.py
> diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
> index 3026c304be..c2581f5f90 100644
> --- a/package/python-django/python-django.mk
> +++ b/package/python-django/python-django.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -PYTHON_DJANGO_VERSION = 5.1.12
> +PYTHON_DJANGO_VERSION = 5.1.13
>  PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
>  # The official Django site has an unpractical URL
> -PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/f0/99/a951d93a27a5bc59fb96edbcdbc03fb9bfac51177f1bc0110888de85af3f
> +PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/bb/57/ad9905d03a2ee39064ee7ba69f8e2790db4a7ffaef9c54f95e7a8f2cb0a1
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
