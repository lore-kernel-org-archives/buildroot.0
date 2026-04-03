Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC400E7E369
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CBDB81A29;
	Fri,  3 Apr 2026 10:27:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PwuZvIm80OkR; Fri,  3 Apr 2026 10:27:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 804AA81A58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212074;
	bh=EjRhD2Z6EWIuTuuuby8JNxJ6nAm1uYXhsqFLp+rzsNA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pmgPlBYiKMps0DkuR1INnng05VfSsHZljNDocXSHeGhJTy1qRy8KoVpy5kZ2XOVAb
	 f7HLHmHIq4qNSF88cpVnfoTJUMfXflkGOvYEjphbEtWEllajmiFWHMdsDMH4ATGa72
	 4Q07DDl5AsVv+VuRBkvXOh2XWfTgwhVXjUD4k+7fY0rK8r+3jpADkf/XYLQvB3y7mp
	 ucew0Q5eQ9TvbYMywV+DJl0yu+f6Fx6XiF289OHNO27E+I7UlAXghTkrsLfunMdtFX
	 EnG9b4HFQ4oPCdmTsuCC3mggtDSHn+ff/D44c8J6QTZgsyTuzjzWZTjpAfVOn4tHU1
	 LNbxswWjL4YrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 804AA81A58;
	Fri,  3 Apr 2026 10:27:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F83F1A9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25A274020D
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:27:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nQ8oW3idvhVE for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:27:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0729840055
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0729840055
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0729840055
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:27:51 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48897fd88ebso5835485e9.2
 for <buildroot@buildroot.org>; Fri, 03 Apr 2026 03:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775212070; x=1775816870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UZ/Csq19zprr4LlTUayuAEXHoklmJVjM+GsBzPr3bpg=;
 b=CTtmIkfuueWSnspm+8QuNzOUEqBhJrXc9UaAYStTu6GbrGBarZfKV1RHuEEMkD/uyd
 ovuc2p/w3F/t8yS1shoQagbNEISlzWA12jbaNNW4BbeYoqLIpOX99aywYlJXeYAlVKRB
 1vXvNFDKXx6HupZQX3nLu2u/BeObA+Z7e8RT+Bhm/eHx9zc1SyHzTXzJFDUlgCzSe7ho
 ESQOSbiZuEaMAG6sUo+9GOjGfyKybbzSDjqUpA7hC/xYrXV/G1K63jcmOpoQp5u5kVK5
 VT/SQKR9bpTG0OgQQQtH05PX6B6MsnkOuN7VLrS3MRpqXjj6MdX7M9lrpvKX0ASE+UIv
 Y+Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBXNu61jD22dkm9fQ+UMHy8uV/yoWPUpcxVWBbFCGyS0vtKZ8SVtQqTn1t9Z8n2eftlpY7NMnCgMA=@buildroot.org
X-Gm-Message-State: AOJu0Yy4uyzf2JlOgC39mwHytSme4iSFdXGT2EQ8h0WKi2/2hgN6Jtjb
 aW2tw/u/6n5/SkNYEzMV+qLedYBnss4gn/GNK+fHxpzaCt2CRAiJnMgM17pYVhudUkY4NeqSZas
 tZR2NYtY=
X-Gm-Gg: ATEYQzzoNlQTkJuez/KNih9RJuTwQYs+xWZ9LpU/AaTN0LmiGC+6G1Kkv7hZDVkkM3I
 o4FF6ZYsWZ/aO3AVGy/HTfRg5ArJbC/qTtBt3h94CCEWBILN67Aqqe8HAkUCNehX9pckHvb+d/W
 La6zv7qBdmJv9sDGtuQ43RdWkpDysFsTVQiUAlfdVOd5BS3XhZ0vaQY20xUMDQwuGnHyb1F5Yrj
 nNdp6jlo1pqmsDOt5eBpeanYs8TulXZJibHMJ54GGjZT7T0EvGU2sxBldpnO7PZSVSA1ae/uD0l
 /fI49N6DxiYde7xn7+fSInkkiqKzFPxQ0dP8KcAPtZaSDHfpAY5nIp8c/i4/pe40ysjMyGwk6Og
 gOmirPQfFfv4USoxS+z2B6b+Pf0sDPuVQZkhZTcd678qBuP6ZAAE+y032JydhnPqnAazQGAtq8g
 5EewVDBORQzERqATj/
X-Received: by 2002:a05:600c:5292:b0:485:39d1:b4dd with SMTP id
 5b1f17b1804b1-488996fae03mr41316205e9.10.1775212069749; 
 Fri, 03 Apr 2026 03:27:49 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e1fe0b0sm13948167f8f.0.2026.04.03.03.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2026 03:27:49 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Apr 2026 12:27:49 +0200
Message-ID: <20260403102749.209880-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330090648.14672-1-titouan.christophe@mind.be>
References: <20260330090648.14672-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775212070; x=1775816870; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UZ/Csq19zprr4LlTUayuAEXHoklmJVjM+GsBzPr3bpg=;
 b=fJzrHh3qRSOZWTxrcAxaZe7fsI0xrODKWg16KFb0vmLXLi+rGx1Z4Bf7P/yz51mQDk
 GVOyTof3Ou84ycgk3k3hHTk1UTqHSiTsqyA4IdnCeEI9c9NICb6JmF5ax9bGf9alPnmO
 2tgZQWqEXJXqJUNUVgv1xDtoiDtpKB9R88UM54+mYabM5urRxLnswf9XUrUDS6xLhDp6
 +tyV+c0qYKDqyr48ChvfIo038fM7ltwIG6BPiX+IjlkaMJQhFnEXPYJscSPBgMKwNBz3
 6DjcMyBjpdUAzZGzeM5Fptrh/r6yE8JRVL1PR2Y04m3BRherMF8GQv9mtxlbd3Ulo4H0
 fr3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fJzrHh3q
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/python-django:
 security bump to v5.2.12
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
> https://docs.djangoproject.com/en/5.2/releases/5.2.12/
> 
> This fixes the following vulnerabilities:
> 
> - CVE-2026-25673:
>     An issue was discovered in 6.0 before 6.0.3, 5.2 before 5.2.12, and
>     4.2 before 4.2.29. `URLField.to_python()` in Django calls
>     `urllib.parse.urlsplit()`, which performs NFKC normalization on
>     Windows that is disproportionately slow for certain Unicode
>     characters, allowing a remote attacker to cause denial of service via
>     large URL inputs containing these characters. Earlier, unsupported
>     Django series (such as 5.0.x, 4.1.x, and 3.2.x) were not evaluated and
>     may also be affected. Django would like to thank Seokchan Yoon for
>     reporting this issue.
>     https://www.cve.org/CVERecord?id=CVE-2026-25673
> 
> - CVE-2026-25674:
>     An issue was discovered in 6.0 before 6.0.3, 5.2 before 5.2.12, and
>     4.2 before 4.2.29. Race condition in file-system storage and file-
>     based cache backends in Django allows an attacker to cause file system
>     objects to be created with incorrect permissions via concurrent
>     requests, where one thread's temporary `umask` change affects other
>     threads in multi-threaded environments. Earlier, unsupported Django
>     series (such as 5.0.x, 4.1.x, and 3.2.x) were not evaluated and may
>     also be affected. Django would like to thank Tarek Nakkouch for
>     reporting this issue.
>     https://www.cve.org/CVERecord?id=CVE-2026-25674
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/python-django/python-django.hash | 4 ++--
>  package/python-django/python-django.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
> index 1cd2959b69..b1859b0647 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/django/json
> -md5  051357d45eb71a115a64e6d2a79c7c51  django-5.2.11.tar.gz
> -sha256  7f2d292ad8b9ee35e405d965fbbad293758b858c34bbf7f3df551aeeac6f02d3  django-5.2.11.tar.gz
> +md5  9b60bb1145abcc97d276694f3f82a3b8  django-5.2.12.tar.gz
> +sha256  6b809af7165c73eff5ce1c87fdae75d4da6520d6667f86401ecf55b681eb1eeb  django-5.2.12.tar.gz
>  # Locally computed sha256 checksums
>  sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
>  sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
> diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
> index 4b840701f4..52d0a2b740 100644
> --- a/package/python-django/python-django.mk
> +++ b/package/python-django/python-django.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -PYTHON_DJANGO_VERSION = 5.2.11
> +PYTHON_DJANGO_VERSION = 5.2.12
>  PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
>  # The official Django site has an unpractical URL
> -PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/17/f2/3e57ef696b95067e05ae206171e47a8e53b9c84eec56198671ef9eaa51a6
> +PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/bd/55/b9445fc0695b03746f355c05b2eecc54c34e05198c686f4fc4406b722b52
>  PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
>  PYTHON_DJANGO_LICENSE_FILES = LICENSE \
>  	django/contrib/gis/measure.py \
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
