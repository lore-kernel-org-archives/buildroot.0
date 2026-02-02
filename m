Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876C0E7DEED
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 14:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33EC060602;
	Mon,  2 Feb 2026 14:04:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aTtcadw9COi2; Mon,  2 Feb 2026 14:04:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D129606B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770041070;
	bh=ZSKvqQUCVkDWBBmBUixAI1OIrzB6fZB7a9GoQOvmCvs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UYCBCt5GusgY3NZGspxF0/++qjaipGnGY5p8DCNqgf/zucHjI/mp5TIO+u0DnFYoG
	 P9/nRgMpFhqaHLNOoG4P10eiPJycrOZp6/DgnVZ9ynEBmP+HjQwOXidLQZO4gilGlG
	 7zI3BzEWPi99EqGoMo3LI4YhcxRKZsYApiTCoINk8Kgzib7X/7giFflar/iEOAjxpB
	 ZC/nUigShKBJDp1RIexOqjpz2DwqtUexlVjNgHKdpPPGkA+jhHumKNgc3ET3d5wS97
	 iEyPua8WuUtzUtmqwsLidcqe4obVlVrnk87rFIWTf4JN12Cy0s+n2jwy5vhjzASB9e
	 io+/BibIuno+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D129606B0;
	Mon,  2 Feb 2026 14:04:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E9457149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D832680BA8
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:04:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EEszGe5UNgLK for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 14:04:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 78E7E80002
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78E7E80002
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78E7E80002
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:04:26 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-435a11957f6so3552553f8f.0
 for <buildroot@buildroot.org>; Mon, 02 Feb 2026 06:04:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770041065; x=1770645865;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4XY4rFJcTiCXPO/K8OzQk8fYpHtWMfki5baN+XG+aiY=;
 b=PiVAa8BJ4U3qhQNY4b87Q2nl8qo1hu3LKYGaMRQl64fd+SxEQV1BPOMYxp3LNvu8eJ
 JItzy+ErwC1cv+uFZ8tIwXl4xF1uS6spcP5wpDkRb/LGc00hMPShLHxYQPJpWE0jbvOr
 ZjczxxXLC4v13oW997Talti3rCFaCmcEvAOyja5HRtCpVq/56mUvtATBc1sxx+LEZj3i
 GNaF7enilR6uyH0BS1loZCt9aToQj/jIiHcqJwHCF1XngY5bfO8DfuLNZLlfUjQC0jt9
 vglTEKJQWYO9jovHwlPcMK2ioT4lOYXXr0fCGbMT/M4IiCwalH0MEZwNjWQZYPBZWxhU
 0YOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYR/9F9/td16rCSUEjOSwz9WP11QfLHAuNNT1/p3DD9pti4+mKZ5ecfLmCNAjwr39NiqquF151O+4=@buildroot.org
X-Gm-Message-State: AOJu0YyUGGJWjrEfTsSz/c/jPSM4QHznUqQn26EaXNfX2xdu+Y/id3I4
 VhBWinlGat88MXwLErn9QNVfFAqYdlbudH26qgaT82irPr3e4tnbl1QCUDS7TRYD3+o=
X-Gm-Gg: AZuq6aJsCzpqnCym7M4QsYgqVeKKEvV2+iqAoVWn1NIOdfbdiglgw56hIm+L5Zzf31Z
 AeNgGZXdeIkzAHjR4cIdy7So3bbV1ggjddfeGLi3Crbmxwj+1VAEsylIKjXLfphT5hwbRsCFYtk
 Vz9rKRtijJjX8rAKg7iIzMJBbFCD4m2VCNsVvxQbrgdfA0dnmSUvuxcMXERrQPe+m49j8xRYZqg
 zstzzhsFO6yly8iOHXVeGnFjYAexCf0GV6ebUIjywcZXTi+md7vGA6nKmzR55MwckLh8aMKtktj
 LaH/MpYgyfStARw1rred8IcaGh4/7Mg1n1I6bs9i1n9pHF3JdDlXPaa8Cdcfy9uE8bMTnGtitht
 xwnXAjbTUZ0PfrvFLl4EAXffn9VAqqSXiYNUXJE/BP/KOVadSfeELY48ZCc5oVn2D8HJn8k2ZZf
 EaGgzAkwWQWuZhW7v+gwrT+oN/wrVjMNOvc/G4Sq3iZutu74iP7ZTXQKCh70g=
X-Received: by 2002:a5d:64c7:0:b0:431:62:d946 with SMTP id
 ffacd0b85a97d-435f3a7bafdmr15938964f8f.23.1770041064862; 
 Mon, 02 Feb 2026 06:04:24 -0800 (PST)
Received: from [172.16.2.211] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e1322f40sm43029835f8f.34.2026.02.02.06.04.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 06:04:24 -0800 (PST)
Message-ID: <f1aa5ff3-90b8-455f-ae58-5278823e5c4f@mind.be>
Date: Mon, 2 Feb 2026 15:04:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
References: <20260202135512.3833917-1-buildroot@bubu1.eu>
Content-Language: en-US
In-Reply-To: <20260202135512.3833917-1-buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770041065; x=1770645865; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4XY4rFJcTiCXPO/K8OzQk8fYpHtWMfki5baN+XG+aiY=;
 b=J9kjcklIGz9bI8HDLBal7+m8NSY3pPsU6cetpW/FSD6m06iSp6sA2p8lUPPGhJm0PC
 YKHtZSubgkwIv6En3tZF1QMfbpJzihPbaL7zYKTnkHwcfOzaHZtuj6eNClcUv0gxYYOE
 YVmVv8C4vyU1/XiwqBe9vCYR/BBSty8wAzHv0F6AgBXONp1y7md+jV6fkU2HiEFQQeFw
 5xXCsoWA67OIMWjTNk8NsYh3PYamS1zLe35myTMXDGpZknwEuoCLet7YJAYmycI6jVyP
 xQEgDHyEHAFIHMcZCoXNfejLPu/QUrDK6U7xgravsPyfaOYbD/6n13T1NkBSPiB/0Rvj
 +8DQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=J9kjcklI
Subject: Re: [Buildroot] [2025.02.x] package/python-django: bump to 5.2.10
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Marcus,

Thank you for updating Django to its upstream LTS !

On 2/02/26 14:55, Marcus Hoffmann via buildroot wrote:
> Django 5.1 support ended December 3, 2025, bump to 5.2 LTS that's
> supported until April 2028 [1].
>
> [1] https://www.djangoproject.com/download/
>
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Acked-by: Titouan Christophe <titouan.christophe@mind.be>
> ---
>   package/python-django/python-django.hash | 4 ++--
>   package/python-django/python-django.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
> index 0c9b70959f..1c2b9bcd29 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -1,6 +1,6 @@
>   # md5, sha256 from https://pypi.org/pypi/django/json
> -md5  232748d1f2d6d1074f873dde91f7d75b  django-5.1.15.tar.gz
> -sha256  46a356b5ff867bece73fc6365e081f21c569973403ee7e9b9a0316f27d0eb947  django-5.1.15.tar.gz
> +md5  98e667c17123f7bbd2d7d1db32f9ccdd  django-5.2.10.tar.gz
> +sha256  74df100784c288c50a2b5cad59631d71214f40f72051d5af3fdf220c20bdbbbe  django-5.2.10.tar.gz
>   # Locally computed sha256 checksums
>   sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
>   sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
> diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
> index 32821e19a0..184f91bfa1 100644
> --- a/package/python-django/python-django.mk
> +++ b/package/python-django/python-django.mk
> @@ -4,10 +4,10 @@
>   #
>   ################################################################################
>   
> -PYTHON_DJANGO_VERSION = 5.1.15
> +PYTHON_DJANGO_VERSION = 5.2.10
>   PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
>   # The official Django site has an unpractical URL
> -PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/10/45/1ac68964193cfcc0b0912a0f68025d5bdb54f71ba7b8716e85b959874bd0
> +PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/e6/e5/2671df24bf0ded831768ef79532e5a7922485411a5696f6d979568591a37
>   PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
>   PYTHON_DJANGO_LICENSE_FILES = LICENSE \
>   	django/contrib/gis/measure.py \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
