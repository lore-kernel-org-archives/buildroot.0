Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FADEE9A056
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11CA26126E;
	Thu, 19 Feb 2026 17:27:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQRCsBHDYa7W; Thu, 19 Feb 2026 17:27:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3397E61256
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771522019;
	bh=peFOLNgPVNHagr0YzGQY5ZCLAFtz/kvf01W40jSuIn4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Bh7Ao4TLtnYjBtrnFP3fv+bo7karJODevYD1WC0zO9aUlCQZUPdimCyaNwsukxfO/
	 VcyzV/WjncDpIoZtynU963aaDl+G+9GPW6cJRNYfs8fzyrZN0xzXzalsPpBrJGMtbp
	 MtBGKadBK7terezga4iKta378UY25Fb4fwRDgA7FTkv44F7L2xUM+SibDv27JSh0Lw
	 TAM1zYUCrr/bIg+xDlVIirwagSIvcVxo4I4xTpY5Aeke1+WjKMXNFn1XxRkvTR64AJ
	 B1Wkq57pjjrEwVIaioXsnvdZF9ZVuCfREybImzdOQcY5YChUTPxkhZIjZWQAUIqcwJ
	 yzc4PUqi1VUOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3397E61256;
	Thu, 19 Feb 2026 17:26:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B00BA1CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1DC3403E5
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kFL6aYFczkBO for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:26:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9195B4045B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9195B4045B
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9195B4045B
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:46 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48374014a77so13370945e9.3
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 09:26:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771522005; x=1772126805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ak0f/8zK9qo6ULxR5cEr20AeDtkjBz+KrUx1G94VX8o=;
 b=NqA3haS7ObH0j3uGEpxdWm9CrWHTP9R7cIOTAFE86lzaxlm/FVq5DSUzR3d+PID7wC
 yAzRhI6tPkCHMODkFdYHztfzmx3Lo7DnIzDDtxOzKq//kA1++Md+7gGva8lzt11OGsV/
 lMk4M/F5vPMINWY1LlBJk71TxtdiaxnQm7hOvb26y8PGi4JitUl8u532PuspK6nYBCHs
 x9ZoE3HH7qzX/KystdgAE/egX6KrukKcXY+Q+IJxtXtjiM/rLGFKS1FPbenUq+AmdxBA
 A2vq4f4cZsHq6O54uHw26FwxgvvIAylZRBLNL70IfBaSF9DA8p/zQIrldp5sfO2uv+uN
 mTjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAn7tUva25A4ob2mlytRPZ36ORWQEmVumkOo7Z7DVZ/l5G/nPJnWMaHAouXPLdSQgic3SqEIdsT+k=@buildroot.org
X-Gm-Message-State: AOJu0Yx+FtQhDLGluOnukliVD3z9/WM6YXvx96ije37j+70mFQDZLJJp
 d77ewonPxL74bE/flcXe+p8ZaTVGAhEK2GoWueC4Pbya25vnhXxIk/gryig2lyZYMykoxzGaBQ7
 1IJul
X-Gm-Gg: AZuq6aLBfurFvSWGpS97nWtbiDG5O2B1qbXuuAbIpU8m7wv+JAfLIiy5zBJTl/PQoOI
 cOf5gZVlye5DB7Y/6wcFF871lfUlaz2ek3bFvNNnSdQutKU9OnYPfK6OXtvJ+RIZWAQnxK5mqyE
 pxuJdU5jEMWhGzcsozPLAvUsmXPcLrQZTbZw7TTFZhHx2umyxxiSr294QrZxiQAfrUdsj4e56Zq
 41ztFo5fLkBqC2IHdl/9vTSeVsu+bRaDGsdslOyAvL1cp84yYk26q5e/sW5HVVpd52ZC9pvVNEj
 xWO+0/ZAVhjbfPsOmUaEUOC+f3sT37xmUGTMswXnTRPMQIzuQxsxlfO/eYSNUztowjTg4ooqndh
 zmhRHtj+RFXpV+tR9u/ZyU+IhfBQLiTVofM3ewyKGzCaERt8pnuuLZweyRYTtkXdWRX6EdSHzRM
 KibBI6SLmC6N+1MTk=
X-Received: by 2002:a05:600c:4e56:b0:480:20f1:7abd with SMTP id
 5b1f17b1804b1-48373a58997mr399223795e9.31.1771522004607; 
 Thu, 19 Feb 2026 09:26:44 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31bac27sm17315095e9.5.2026.02.19.09.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:26:44 -0800 (PST)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 19 Feb 2026 18:26:43 +0100
Message-ID: <20260219172643.341480-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260216171220.370985-1-titouan.christophe@mind.be>
References: <20260216171220.370985-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771522005; x=1772126805; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ak0f/8zK9qo6ULxR5cEr20AeDtkjBz+KrUx1G94VX8o=;
 b=O/PMi6tPScwyQ1DnoHo0PSn9dyFZwaAXcJpNellP9fh4eLrYGA3L5L6Pq3h6QYmP+p
 6kSEmdC7AducXtSPGPuvlqrVrtrHm7YJGZ3/zkzqibNDqUyPe3rgyg0wQn2z+wGPWVjj
 oB7Z8fz9sSGiaaOOl3HRvVdKfJHPiGfK4ZtwZf68qr3daCwoxXN+nDVwvMiDkgOTgH27
 ik4rkLWnt+wJBStftkEnB+cVES3fN8mMi/MDSgD3yZ9k3EDs7edA4WI7heekNKjszT21
 KpR0wVzcCfYwZwRUP+nT89V/4jaZ18Gq275inZM7Za1qEyEY4uskCToGKJtqsqmX1i6/
 XeeA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=O/PMi6tP
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/python-django:
 security bump to v5.2.11
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
> https://docs.djangoproject.com/en/5.2/releases/5.2.11/
> 
> This is a security release on Django's LTS branch,
> fixing the following vulnerabilties:
> 
> - CVE-2025-13473:
>     An issue was discovered in 6.0 before 6.0.2, 5.2 before 5.2.11, and
>     4.2 before 4.2.28. The
>     `django.contrib.auth.handlers.modwsgi.check_password()` function for
>     authentication via `mod_wsgi` allows remote attackers to enumerate
>     users via a timing attack. Earlier, unsupported Django series (such as
>     5.0.x, 4.1.x, and 3.2.x) were not evaluated and may also be affected.
>     Django would like to thank Stackered for reporting this issue.
>     https://www.cve.org/CVERecord?id=CVE-2025-13473
> 
> - CVE-2025-14550:
>     An issue was discovered in 6.0 before 6.0.2, 5.2 before 5.2.11, and
>     4.2 before 4.2.28. `ASGIRequest` allows a remote attacker to cause a
>     potential denial-of-service via a crafted request with multiple
>     duplicate headers. Earlier, unsupported Django series (such as 5.0.x,
>     4.1.x, and 3.2.x) were not evaluated and may also be affected. Django
>     would like to thank Jiyong Yang for reporting this issue.
>     https://www.cve.org/CVERecord?id=CVE-2025-14550
> 
> - CVE-2026-1207:
>     An issue was discovered in 6.0 before 6.0.2, 5.2 before 5.2.11, and
>     4.2 before 4.2.28. Raster lookups on ``RasterField`` (only implemented
>     on PostGIS) allows remote attackers to inject SQL via the band index
>     parameter. Earlier, unsupported Django series (such as 5.0.x, 4.1.x,
>     and 3.2.x) were not evaluated and may also be affected. Django would
>     like to thank Tarek Nakkouch for reporting this issue.
>     https://www.cve.org/CVERecord?id=CVE-2026-1207
> 
> - CVE-2026-1285:
>     An issue was discovered in 6.0 before 6.0.2, 5.2 before 5.2.11, and
>     4.2 before 4.2.28. `django.utils.text.Truncator.chars()` and
>     `Truncator.words()` methods (with `html=True`) and the
>     `truncatechars_html` and `truncatewords_html` template filters allow a
>     remote attacker to cause a potential denial-of-service via crafted
>     inputs containing a large number of unmatched HTML end tags. Earlier,
>     unsupported Django series (such as 5.0.x, 4.1.x, and 3.2.x) were not
>     evaluated and may also be affected. Django would like to thank
>     Seokchan Yoon for reporting this issue.
>     https://www.cve.org/CVERecord?id=CVE-2026-1285
> 
> - CVE-2026-1287:
>     An issue was discovered in 6.0 before 6.0.2, 5.2 before 5.2.11, and
>     4.2 before 4.2.28. `FilteredRelation` is subject to SQL injection in
>     column aliases via control characters, using a suitably crafted
>     dictionary, with dictionary expansion, as the `**kwargs` passed to
>     `QuerySet` methods `annotate()`, `aggregate()`, `extra()`, `values()`,
>     `values_list()`, and `alias()`. Earlier, unsupported Django series
>     (such as 5.0.x, 4.1.x, and 3.2.x) were not evaluated and may also be
>     affected. Django would like to thank Solomon Kebede for reporting this
>     issue.
>     https://www.cve.org/CVERecord?id=CVE-2026-1287
> 
> - CVE-2026-1312:
>     An issue was discovered in 6.0 before 6.0.2, 5.2 before 5.2.11, and
>     4.2 before 4.2.28. `.QuerySet.order_by()` is subject to SQL injection
>     in column aliases containing periods when the same alias is, using a
>     suitably crafted dictionary, with dictionary expansion, used in
>     `FilteredRelation`. Earlier, unsupported Django series (such as 5.0.x,
>     4.1.x, and 3.2.x) were not evaluated and may also be affected. Django
>     would like to thank Solomon Kebede for reporting this issue.
>     https://www.cve.org/CVERecord?id=CVE-2026-1312
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/python-django/python-django.hash | 4 ++--
>  package/python-django/python-django.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
> index 1c2b9bcd29..b39b8c54cc 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/django/json
> -md5  98e667c17123f7bbd2d7d1db32f9ccdd  django-5.2.10.tar.gz
> -sha256  74df100784c288c50a2b5cad59631d71214f40f72051d5af3fdf220c20bdbbbe  django-5.2.10.tar.gz
> +md5  051357d45eb71a115a64e6d2a79c7c51  django-5.2.11.tar.gz
> +sha256  7f2d292ad8b9ee35e405d965fbbad293758b858c34bbf7f3df551aeeac6f02d3  django-5.2.11.tar.gz
>  # Locally computed sha256 checksums
>  sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
>  sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
> diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
> index 184f91bfa1..4b840701f4 100644
> --- a/package/python-django/python-django.mk
> +++ b/package/python-django/python-django.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -PYTHON_DJANGO_VERSION = 5.2.10
> +PYTHON_DJANGO_VERSION = 5.2.11
>  PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
>  # The official Django site has an unpractical URL
> -PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/e6/e5/2671df24bf0ded831768ef79532e5a7922485411a5696f6d979568591a37
> +PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/17/f2/3e57ef696b95067e05ae206171e47a8e53b9c84eec56198671ef9eaa51a6
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
