Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B876BE9A047
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 18:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6663440819;
	Wed, 18 Feb 2026 18:18:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u65_3LqUkgsp; Wed, 18 Feb 2026 18:18:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FF5940886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771438711;
	bh=Vw+tNB3+J5pFoprrnesn+MYg7RJtBWefjbKnJxPZEXc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SphBMNzyBTa7V6ZK4XbzsaqB1SFs7+e7sD8z2Xyz/cXaLOPr/lvEshxsCgT5GcZZY
	 Ic950gJWgEC6n0R2LfM0AmQo7TQ9w2swT1ivTQDJ8G4mmyiudl9dSlYpLl47PYFENe
	 aDI5kFOMedvEMqFRU6zgbAIt3ebnA/xmm7hhdbK3kVcMh+SBwELxzQtTGVsq/xIlCN
	 6nRI06I57i0awOp+MI6wW2YrLCmc5b3AJbf6y5WCNKzeM6Ns1svjWruUW3iPtlZtxY
	 AoIM2x0OHmlv8uVv3lvX6NiApKa9ANRjNvzCFwYZGN6HyxxwfWuAu8giWArHJBS6t4
	 OpCmHxGoK/cMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FF5940886;
	Wed, 18 Feb 2026 18:18:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3ECB7183
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 18:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F9FA60806
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 18:18:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dUJWYyyUfNt2 for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 18:18:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B049E606E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B049E606E5
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B049E606E5
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 18:18:28 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-48372efa020so986605e9.2
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 10:18:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771438706; x=1772043506;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YWOuFW81yjEmt+ePf4hvZnmuA0hSP8kr8yj/znVuHT0=;
 b=csuE+OHYqXG0aGFT1Rx+NlFw+tzfZ9QiUPxcnoWgTJBm20cNcQV6FHLPh7oCicIATt
 dVCUe9Re+SLdlrtnbV6LR/64z2l9ds1PFnVYbGslBqzv/X4vT4QA+SiPAw5nDmEqH2yi
 R1mb99Qfq3t/2a1Ms2SIZ7VdRb5D3VEX/DpSTmmQB/5Nz2F1hVZvaf8JRSPo3OYOhZQF
 d3CguECTdRRg+Ite5mIVeMVEEjj5jk6NGfy9kVz0uiRx4Hl0PWBdcsr8EL20MPEZhCXk
 ddXiZHfP5BbkGHP+egVupVa4wJHgnWyA9nPDAxQPuvXP/I923ubORV/GIPiVsve9y8He
 VaOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW63Q080bOURGP9nyMxIYLyJ/EHTjciZicIikVYEL+5PY0lIwleyWThF2Vg8iKbIiGmNkhzHiD/bHM=@buildroot.org
X-Gm-Message-State: AOJu0YxpOYvXc5KR2YwmoX7HjGyhgzA+GULfCCD/4vyYu7eDXUWMgSx1
 mCXicvXEIDmRUke8Irbsar8xR1wggkypzwAJYWsK/UnAP/m/3GPgWX/37zYgs2z3Tyw=
X-Gm-Gg: AZuq6aKgxSoX6WNKE+a/a65iHcH62keErO/7KNNbSRzDCjSeoACYRaa4IfeaSeTbuqH
 LsVY9lMf1+gDf8XJaxuQwwQ3z6FW2kVdRqHCkTT0LP2IJKJA7vpt0BtH12UD9UVfF4dGsoCiilZ
 TTc8cfoU3Kx6zDUdIEdM508/ljCKer6QtlXmwVFE+xkhejLYcwZMaTSns6XxR6o3/XCKJu2bEGe
 g0h9mPulu6ZI7yqPkzIRjIiutfSsz3kIKOixhOt0MjrtP8eVPIJDOP9gDBP6ArZaGO5UHB0eDUE
 dwSY3JDMdboZ6/cWADnv0whFbJv1k/ksWo5h9REsdtKmaWQ9jDbSxoB73O04WPB3JbldaRaJTrs
 HUfUNg7Ms3GRmKzVGczA6kKpwBw80l2r5KUSQU7HClaCWPAcDsa68nr2H4f63ubFYU4zJ+TSXjI
 srvQ6k9fWmVUQlhU8=
X-Received: by 2002:a05:600c:34d4:b0:45d:f81d:eae7 with SMTP id
 5b1f17b1804b1-48379c1fab5mr261692225e9.28.1771438706053; 
 Wed, 18 Feb 2026 10:18:26 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483971232f3sm46604325e9.1.2026.02.18.10.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Feb 2026 10:18:25 -0800 (PST)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 James Hilliard <james.hilliard1@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Date: Wed, 18 Feb 2026 19:18:25 +0100
Message-ID: <20260218181825.147718-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260216171220.370985-1-titouan.christophe@mind.be>
References: <20260216171220.370985-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771438706; x=1772043506; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YWOuFW81yjEmt+ePf4hvZnmuA0hSP8kr8yj/znVuHT0=;
 b=LPLMoj2nxioPEXw6L+39kDYrKRr1NoFhYYXjnahceTGYoEsPgf/rshIgRIe9MtnBOa
 MIxT1mMmOspXy+CxPbV5EFbC04kvJCbDdJiiSXOsrhVEqmCnzKcSnwahm99J2gPyDzwQ
 OEivNpX6fidsCbV5F6hMVTvVWXlrrx5O7S/DD3kMxSdkR4SBExPdy5VgiO5cRS/8K1cq
 XTuyaxE226hd/zKrTsQJJnY46LBZTT7+OesT0suWEdwOkrZitZEg90SHBxq/95VkFEMy
 IcT30t3irttduCaISAsjo6oOFGBVVM22xQFxh2nNZSThQiCEvjdVqeokUs0MpDOW6wlr
 Rqdw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=LPLMoj2n
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

Hi Titouan,

I had to  update the inlines.js hash to d48633adb736dac091477ec2206feebeee88e3e6e486aedb21c584e4b49be0ec  

On the repo I checked
https://github.com/django/django/blob/stable/5.2.x/django/contrib/admin/static/admin/js/inlines.js
for change but the last commit seems to be from 2years ago. 

Do you know where this change come from ?

PERALE Thomas

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
