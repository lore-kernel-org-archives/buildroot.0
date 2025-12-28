Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58154D3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 21:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E6E64047E;
	Sun, 28 Dec 2025 21:30:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gMSJprQYWgc1; Sun, 28 Dec 2025 21:30:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C925404B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766957414;
	bh=ipMQ7TO9NGbeI251C1UbpncfwrabL9LiYaP2eMNDdVE=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=JEJoNGUztt+xxufEShOqAXJCLyEfLZlREK0GHyhWEio370N23NTfyvqzAL9L64xo2
	 OHt1ZkYZasYDWuGNkGmstPSE3/a03g/w2sLxdqvCwcvgD5maBrAMvIZwRALneTW9qP
	 Cl7+IeeB4t8zK5cNwXweR5gQhWcmXRazxtwC/Xm0ACKy8s9v5POw3bXMVgV/ATfv82
	 +8kJddO2GJooFX0bCXhNPwvOHe5kU/3AeoI7smqVrhIQ85tl2z0ajxfjAPCMZiBfig
	 L9wJlwxnLs1hFGAaFKLicff36y1y251s3KVJxHjfpFh4zxBHk1f2rPLd5p31L5LE/g
	 I7HQ9UHK88GjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C925404B8;
	Sun, 28 Dec 2025 21:30:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FA7BD8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9096D404B8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:30:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SdFv517tyfFg for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 21:30:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 768FC4047E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 768FC4047E
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 768FC4047E
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:30:11 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-42fb03c3cf2so4316386f8f.1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 13:30:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766957409; x=1767562209;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fp8xjFtr0jypOEjngaCdg6pi6BKT2fjqgLwBnF6vLZM=;
 b=FQtD+jGh1WvTDztia1t4i7R+EgSZBkwvDQAq8KC9O2hFSpnMs7eDhzNT8kLSndrj3y
 AbVlWzb/MOSBMzOVp19xOYuL5s6q0nZ+RKnOQLO2ncuqV7bFCF11l9QBuTZg3HPwY6dr
 N8kqVE8S8ObmxPMxFRbJdVdBM6JeufIe3pAurr/K4TiuBpicIYl93/9NaC69dYKbsumr
 5oW3l2HK2HHYBCI4edRpLjx/xCwlKEaAZwa1Bzy3Zn7Zzh4WGUSxpBuDm1eiuRuKbnUi
 RzZO9esoML4p7yLhD/Ambs5DX+Yjfc+4xxrEAHO8Lx3fK4/3E842A6RgoGjqve0fR0th
 u5sg==
X-Gm-Message-State: AOJu0Yzi2v7U608SL+pSIzUSvda2MWNVU0zmj/sa8nDlzjB1zVCC4zfV
 DQoWzM0MDkmrjnvOXMi1eLIC/QuwymJhfMMPSDvg7kLsgZiFFKkgern4MsrQd/CyoO0zUbuSs8b
 etG5C8+E=
X-Gm-Gg: AY/fxX4lJz8hZcYo1NwiJXVpVks7hZ1j48S7Dj3kHTAtSui+JgYm624cfiURnJyZiCE
 8zOioA8hg5dhpkpZwbbqfOQGzr26bpJShCfOuuRT/bZOalJ3I42rm+NrSYpGjzMxPZLNYnl8KCJ
 mED3QtGq91WmyoYncns2thoCqJsVYoOxGlfk9AVTU3rNlzdh8aEb2AIpnY1uGBGEVPkeUjHv7s2
 jLKmLqMBl/4vmcRkQBt42hEV3UKNs+Dr9BInUfTQ84QVcrLbWzoFNvTpNIbK/UklqPJ5aiGrYWi
 QtoXAtmtrvvj/NF9llpoimILiUlyQntGkAQnAzCrrd1cC2DhqPM5KO54wPI2v8IuMuV1B09L9Nv
 8LaA36cT1fEP9aPyT7/IC6VMT0JTS2KFjc2/G9OI3O/dSOql4DEOBdS23pnwIIAmu6gAaKi2p37
 9nLTqfhKImAGnQC8Mr238Ho0dn+ZPaQAj6UH7/hhIQ4RHw8kfI/7qkzy1FDFIUkEP1LLLzYKa1W
 mpy7dza5uA02OWfm2/tna6iHrzIU+UQhDVsEx0mK4+VlXvRtM8Q
X-Google-Smtp-Source: AGHT+IETk6tRW2cJIkBSrT/JcLmlLtT/szS9fVVTHkBBbWVIdIhtPj/QIE270NiKUI59spxoXUN7qw==
X-Received: by 2002:a05:6000:144c:b0:430:ff81:2965 with SMTP id
 ffacd0b85a97d-4324e50bb11mr36088342f8f.49.1766957408875; 
 Sun, 28 Dec 2025 13:30:08 -0800 (PST)
Received: from ?IPV6:2a01:cb0c:115:7300:72a6:ccff:fe7d:afc3?
 (2a01cb0c0115730072a6ccfffe7dafc3.ipv6.abo.wanadoo.fr.
 [2a01:cb0c:115:7300:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324e9ba877sm58211572f8f.0.2025.12.28.13.30.08
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Dec 2025 13:30:08 -0800 (PST)
Message-ID: <8231d40f-c111-45dc-9cbd-d418dd476db7@mind.be>
Date: Sun, 28 Dec 2025 22:30:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20251228181840.37501-1-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20251228181840.37501-1-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1766957409; x=1767562209; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fp8xjFtr0jypOEjngaCdg6pi6BKT2fjqgLwBnF6vLZM=;
 b=NbKxNduN3+M+chLbQh1/5iynxIOV9El3Hi3mDPrdYtk7Mz1kCewcnyhGKt+JHUK9sN
 5+ISd6+KyJdC6aDFtEWXjuo58MKfY4DO66/gkIxDhvpndOOf6dIvfOUtOuiKGCIU7ptL
 RGib2SKM5tpQi07Trv52CV1DQC+tPXC/MZBlTaN2f7z2e0jzKpGxmgXGlqWhnc4JlUVd
 UQjNSGf+mm/p4Qoc6qYElYWTqfhzr6vhPDDvc2TW822LGHX/nWoOinwoq52mvbrgi/+E
 U9GGEjs2qE/9U2nTvmX1PMW4MSlfa7z/sIUPu71XcRyVxlrLc8AEWx2jHYf5NdvzHfxE
 YmHw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NbKxNduN
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The title forgot to mention it targets only 2025.02.x

On 12/28/25 7:18 PM, Thomas Perale wrote:
> For more details on the version bump, see the release note:
>   - https://docs.djangoproject.com/en/dev/releases/5.1.15/
>
> Fixes the following security issue:
>
> - CVE-2025-13372:
>
> Potential SQL injection in FilteredRelation column aliases on
> PostgreSQL.
>
> For more information, see:
>    - https://nvd.nist.gov/vuln/detail/CVE-2025-13372
>
> - CVE-2025-64460:
>
> Potential denial-of-service vulnerability in XML Deserializer.
>
> For more information, see:
>    - https://nvd.nist.gov/vuln/detail/CVE-2025-64460
>
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>   package/python-django/python-django.hash | 4 ++--
>   package/python-django/python-django.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
> index 97e568ea14..0c9b70959f 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -1,6 +1,6 @@
>   # md5, sha256 from https://pypi.org/pypi/django/json
> -md5  b0c6556282e4ef15209b34b09604b9a1  django-5.1.14.tar.gz
> -sha256  b98409fb31fdd6e8c3a6ba2eef3415cc5c0020057b43b21ba7af6eff5f014831  django-5.1.14.tar.gz
> +md5  232748d1f2d6d1074f873dde91f7d75b  django-5.1.15.tar.gz
> +sha256  46a356b5ff867bece73fc6365e081f21c569973403ee7e9b9a0316f27d0eb947  django-5.1.15.tar.gz
>   # Locally computed sha256 checksums
>   sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
>   sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
> diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
> index fc5494cd80..32821e19a0 100644
> --- a/package/python-django/python-django.mk
> +++ b/package/python-django/python-django.mk
> @@ -4,10 +4,10 @@
>   #
>   ################################################################################
>   
> -PYTHON_DJANGO_VERSION = 5.1.14
> +PYTHON_DJANGO_VERSION = 5.1.15
>   PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
>   # The official Django site has an unpractical URL
> -PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/6e/f9/284077f0e61f633e5279518a9ac5924ade4bef12bc841174ca48c57f2438
> +PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/10/45/1ac68964193cfcc0b0912a0f68025d5bdb54f71ba7b8716e85b959874bd0
>   PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
>   PYTHON_DJANGO_LICENSE_FILES = LICENSE \
>   	django/contrib/gis/measure.py \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
