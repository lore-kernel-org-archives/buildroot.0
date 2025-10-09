Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F88BCCD185
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 14:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FD2760AE5;
	Thu,  9 Oct 2025 14:58:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WfaK7B7woXqA; Thu,  9 Oct 2025 14:58:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F18060EDC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F18060EDC;
	Thu,  9 Oct 2025 14:58:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 24C9021B
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15DBD60EDC
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:58:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i9PlBZ7MLSmR for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 14:58:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DD66A60AE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD66A60AE5
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD66A60AE5
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:57:59 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-46e47cca387so10710835e9.3
 for <buildroot@buildroot.org>; Thu, 09 Oct 2025 07:57:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760021878; x=1760626678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UpgWDYjflIvWAYpIgeyKiaOtD94QEJ6GhTEIGynGNdc=;
 b=vaSz/8U/g6nPaRvlSlUUB8uuTO62XGAWKFhCFGAKt4GNJXV3ZNrrxSQMLQwgzj1O4g
 Rjs7RYW2TinFR6ROKx+RQZgaMY5QIYYVReFlAbUOFX/Jqpr5CukQQ9S/RgrHcX2MPGZh
 kUzyRQYTz8ASDKlUyyrQkMHlyjnfIzTmh5PjlL1l7Z3bTUiQu2JEJ0Y4kp0s2AmYPbNE
 FQD12ZB6ZabnxH8CJiOlMjV9WtBEAzahxctlBPWSo8pTBrrNfWDe0vfLyHUD14r7O/uG
 ZEvYSsrftisnYIc3a2OYwX+7+GpaYIAYEwhsZ8427SmWcq67Dp1dTn9LojgyWXEpyYGA
 LW2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0NzuEvyvuR7Vruv9KHxHym4+KB6YiwqASL19W4TvM4mZ/cTWUS0CWVIhVy7CF9tZuC3E7sadxyFM=@buildroot.org
X-Gm-Message-State: AOJu0Yy9rtTTbjN/13IOKJtukGpFIm40uoGiFUVt5/slWod9+EVM/H3E
 deQsykfQ0v6cuJWNLP1L+tWE9NtA5h6lApYPXdqFZGlMkYY5Y+v58H7veLHEk4GNdFw=
X-Gm-Gg: ASbGncvfNsdcgAaGu0QP2CezWDcfoRKr3Q5HAQayOwTGcbqL7gOz/WcGiP+GT5U3Lgq
 3qKhc/IWw6kpBPj39vqkygfs5sB9F6sqSRZtpDSqvrjDKio82QrS9LLc7blNaoSeHAhmkXLZWbU
 qvES/wcp7+Jq3PAgLksZOoc/cfA4012XEpGDjaIKx6X2vQl9vXTfz5JXPU2TzTvDIUGyAbd7haw
 uU17MGXbrp/VQMLoX86gqzNjxvu/yEG381h8XBhtkS1qcx+TsGPTdIna7IkW3x4+OtVbp6kw0Ru
 P35kiZRJcnVRDh1yyc38RToGJuNLf67jDgPr8SrkErdPk3NqVov+rreBkFTODXLvwSr/LV6+Xmj
 B0G0bHxadhD6qBxuZG0/NADA3THX3FJ/+UNdUu9lq
X-Google-Smtp-Source: AGHT+IFAJaVsfebS+bi4YupZyei6e+RzT/MhmP6a/uugAevkt41Sc7SPJVoZ6PIPXCLkt0I3toAblQ==
X-Received: by 2002:a05:600c:3483:b0:46e:1b89:77e5 with SMTP id
 5b1f17b1804b1-46fa9a996cbmr54695235e9.12.1760021877858; 
 Thu, 09 Oct 2025 07:57:57 -0700 (PDT)
Received: from arch ([79.132.232.153]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fab36a773sm40987835e9.0.2025.10.09.07.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 07:57:57 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  9 Oct 2025 16:57:56 +0200
Message-ID: <20251009145756.484748-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251004093348.269213-1-titouan.christophe@mind.be>
References: <20251004093348.269213-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760021878; x=1760626678; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UpgWDYjflIvWAYpIgeyKiaOtD94QEJ6GhTEIGynGNdc=;
 b=K1T/G6wAMTZrR4vQMngUEf/9fSnrqIWi6BElOw8BrTN0yCyccww94n72m1QqiMDwtV
 0j1IJ2NiGWeN6eVc3lQst6vrqvd8MAytjmYVA/bfhC74zG+EgBSUT8n0UGmIfECi31c6
 qpmFcVw+e1zbea1BpQQ+xe+e69xph23rcxTlFgva1G8lUZEluWsV6czVr98Bb+MLKYf2
 vt45q5UYh+/xS5V+mdAUNmLkvWtAmiprYE7B+AMIDXyiqYA9U675zQUELAwGOLFGd6ku
 FWodoyznKGQAxHcsogfXevVndPpgGeTR1zrGuQqLhLQVEKcelMXVyVUb3lBnasAbdiv6
 amyw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=K1T/G6wA
Subject: Re: [Buildroot] [PATCH v2] package/python-django: security bump to
 v5.2.7
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

Applied to 2025.05.x & 2025.08.x. Thanks

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
> index 3ff4eb4e36..1ec80dc1c2 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/django/json
> -md5  1f0327293cc3768903ce8cd390ec3f47  django-5.2.6.tar.gz
> -sha256  da5e00372763193d73cecbf71084a3848458cecf4cee36b9a1e8d318d114a87b  django-5.2.6.tar.gz
> +md5  699a77ac347ca3484939762483dc4b08  django-5.2.7.tar.gz
> +sha256  e0f6f12e2551b1716a95a63a1366ca91bbcd7be059862c1b18f989b1da356cdd  django-5.2.7.tar.gz
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
> index e3959f4192..139a15b13a 100644
> --- a/package/python-django/python-django.mk
> +++ b/package/python-django/python-django.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -PYTHON_DJANGO_VERSION = 5.2.6
> +PYTHON_DJANGO_VERSION = 5.2.7
>  PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
>  # The official Django site has an unpractical URL
> -PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/4c/8c/2a21594337250a171d45dda926caa96309d5136becd1f48017247f9cdea0
> +PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/b1/96/bd84e2bb997994de8bcda47ae4560991084e86536541d7214393880f01a8
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
