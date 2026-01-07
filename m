Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114A3D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAEA04100F;
	Wed,  7 Jan 2026 17:54:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rrij54QCW7_H; Wed,  7 Jan 2026 17:54:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3268541003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808457;
	bh=slnoQ1GajYmnfvO4P+d9ySw1ENR4eV3jXTa1cymXhaU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Zwj/vTtnzhMm1PkGi6MB8wMa6cVevaiEFJmOgFPrniWCvxf5nWV+qvEGHMItNV8Qt
	 FvjUsXiAuVBoLl7/TyurOmU6+49XgoIHwzOUsLL05Lb9H/JYwxwQ9Jiiqlm8GTkoMx
	 6EbSUlMy20teMpWxxCUe0dWsrVmk6ADVkz8qdE7PljxD4O8BZqGUr6P/vGgbrBE4hY
	 YJl9tzbIsba6XhAwQ4M6xQK3dN5W6z7oh6yBcxz0j2SqNQnuMsG3BmSYRB51/KvndN
	 K61/oQPZdDUojhASY6Vqtc8f3UvY16K6/nl681y6oGHOB8ONYXPj216q3uMaW8VmWi
	 TmeSzB+3mJU4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3268541003;
	Wed,  7 Jan 2026 17:54:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C26359ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B455160667
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PXg4_pIMTqXb for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:54:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 49B1360661
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49B1360661
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49B1360661
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:54:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2669AB97A596; Wed,  7 Jan 2026 18:54:12 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:54:10 +0100
Message-ID: <20260107175410.229291-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228181840.37501-1-thomas.perale@mind.be>
References: <20251228181840.37501-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808452; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=P0Jii/h10nwS0gXqzsPcoFnf7fizjcvuCWggEzzA+5Y=;
 b=pSiRKb3B8+RAsy4JDPFB5PpVRfTi4xcomYKE+1+y/KdJusuMRB2zaB236LF14pNdspncDL
 QDLTQjMGAh0e3hq3Ltq9PErLX2mexiVFJqErzKoHP8E02UySIDjxJlrRGGbiXK8J6QxpqM
 w9oB/RoD0b8+9LCYbo5g/83/r43bDYG+1yiIvArehYbIrLzbdWXLHdTiMs0VhGIhaEQthZ
 Ae+I0sZRZGoWjlbsQPfbt9F9FberHfVO1eNrWuQHogfoeL8+S/TvPjDBhXionF5iH2Bmlw
 8NYYPFg0V2env9EWzhm1qR4C9scSelkazjU7ZBOB7c6NkFEcsKET+T9N7ReufQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=pSiRKb3B
Subject: Re: [Buildroot] [PATCH 1/1] package/python-django: security bump to
 5.1.15
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> For more details on the version bump, see the release note:
>  - https://docs.djangoproject.com/en/dev/releases/5.1.15/
> 
> Fixes the following security issue:
> 
> - CVE-2025-13372:
> 
> Potential SQL injection in FilteredRelation column aliases on
> PostgreSQL.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-13372
> 
> - CVE-2025-64460:
> 
> Potential denial-of-service vulnerability in XML Deserializer.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-64460
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/python-django/python-django.hash | 4 ++--
>  package/python-django/python-django.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
> index 97e568ea14..0c9b70959f 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/django/json
> -md5  b0c6556282e4ef15209b34b09604b9a1  django-5.1.14.tar.gz
> -sha256  b98409fb31fdd6e8c3a6ba2eef3415cc5c0020057b43b21ba7af6eff5f014831  django-5.1.14.tar.gz
> +md5  232748d1f2d6d1074f873dde91f7d75b  django-5.1.15.tar.gz
> +sha256  46a356b5ff867bece73fc6365e081f21c569973403ee7e9b9a0316f27d0eb947  django-5.1.15.tar.gz
>  # Locally computed sha256 checksums
>  sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
>  sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
> diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
> index fc5494cd80..32821e19a0 100644
> --- a/package/python-django/python-django.mk
> +++ b/package/python-django/python-django.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -PYTHON_DJANGO_VERSION = 5.1.14
> +PYTHON_DJANGO_VERSION = 5.1.15
>  PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
>  # The official Django site has an unpractical URL
> -PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/6e/f9/284077f0e61f633e5279518a9ac5924ade4bef12bc841174ca48c57f2438
> +PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/10/45/1ac68964193cfcc0b0912a0f68025d5bdb54f71ba7b8716e85b959874bd0
>  PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
>  PYTHON_DJANGO_LICENSE_FILES = LICENSE \
>  	django/contrib/gis/measure.py \
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
