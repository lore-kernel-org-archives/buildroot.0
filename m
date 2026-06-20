Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8B8CD98E4
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 09:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84B9460E78;
	Sat, 20 Jun 2026 09:10:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k6y4j0QOn8ZS; Sat, 20 Jun 2026 09:10:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A3B76FB04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781946654;
	bh=YY/TBX2tirdBBachJlHutr/GjOKkITA8BMMOKIGhkkc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=f3SHIe9APFNFjAK+QW9vI/0SmLEwRDdF0sUOWQnLtduGHMm4I5PU9RGjxVMwZ/fPP
	 W18sEw1hwiB+4i+NeiGa4ViTuRA2zH5cJv6FnmdfI4wgBChk11ghAG4qBoA1af8So9
	 2QyHnzUtYm8HsNBgwlUBxAUJ9ofuDv5hjTaiRaIi1lT165Nn7+NTLnlehTtECRCaT7
	 5GnN0uMxc0SQePo3qH7W8pKDsCtkBas4vx+HgwAHmB6SUdUhnl+7hlG/yxFhygklHU
	 59KBjr6PBfuJJKT/4Ci5u+ba37iXIXGo/hw3tRvdQ4HVWx/1yPA7YbASpHBBchnfsf
	 5xUij7VxwAYpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A3B76FB04;
	Sat, 20 Jun 2026 09:10:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B3711D06
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 999C74019A
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D0n1JhvmkMNd for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 09:10:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 975AD401EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 975AD401EF
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 975AD401EF
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:10:50 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-490b613a17bso22256095e9.3
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 02:10:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781946648; x=1782551448;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JhNHsXftEN6El8g6vfwP+WGytc1uXp8xqBzLMaNAUTA=;
 b=kmS7VD7eveohtO9GYlLALD0JBuGhi3pc6JtaNRyMO2sHEh+bZ80Q/2oZKQbR9vICcD
 yZIzmsI7/hix9AR5mD0aCkhYTLcQJsQPTCewQ1cc6DwNErEeyR7fIuKPFTF2qKggTyoW
 oSURRtLBzBJsqBv9b2PSPl4khct4PTkq6ytOSDMyyo6yQ2i5S99mmp9WPdnqxmF3ktDH
 kjzXd/NKTkqwpx3lQLktNncQoTj8p0i6pttipCDuKgt5ct6fHSXkUb8x30h5v3tREjgU
 BDVC/LOhkB04txEWwEpMG6DceVW6mCTF8/Rq/41puBF3a0DuUDyddf3rGSscEiMSdGjx
 P1sg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9neld0k57c1qDcX8Sgw/SS/d1f7K9XocX5nLC2yO3AO9v52uDLmR1HxOdzjlKZDQiWjY38PTUSEVc=@buildroot.org
X-Gm-Message-State: AOJu0YwYdy9FnZ4ij9KFluvNG1p4VaEeqHLxduHZE1kj/yMtFg2r6cuC
 qb0xH26upkOkd9UCq2b7M6L3yIygzGgxs6c281YzYjph3XDKxD667XwOFpeXIKYstZk=
X-Gm-Gg: AfdE7clpjJx1OTJQlKst3szSuDnSVcY9TmkrTLUfE51CKXqx2/cOjb3JaxzC8JtR3+4
 y7fe0AUEL+gtggD2dnenbNFuiQ33kHRZUOLChbjWP1ugya2ylmm2NnntteHG1rAFrJ0Yfw9CVQ9
 NcJIXDmrhjPRiHcxUrH2ncZjBPJnUrpMsw90DSVUIKekNZs3ICBjzjLDOC3EG263VwH7RPJyRcj
 Ul96iHRT3oB9RqHhLsOp6VJdGgOakA3IR74r5+EXiPwxi8CO43NsvICBq+rkkkVxh/ddgxZu6EJ
 ocCMF8gjgWKCjse/Qw5cd3wEWqkkWGLA6HZXUfBePnxH/ZgTB9A9i+sPiCWxnSxdf3nfRItTg3h
 xN3Z3bHy0ZrcatwOsnkzsHgTM6rTwT4NDWU0EpL9NaZI63QfNggv2obks2uvfjdYUcvkwwrCynf
 jplhSI
X-Received: by 2002:a05:600c:6211:b0:490:688b:f9f8 with SMTP id
 5b1f17b1804b1-492490af44amr37793465e9.27.1781946648649; 
 Sat, 20 Jun 2026 02:10:48 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4666712ce9asm6012825f8f.37.2026.06.20.02.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2026 02:10:48 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 20 Jun 2026 11:10:47 +0200
Message-ID: <20260620091047.22405-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612090819.1195510-1-titouan.christophe@mind.be>
References: <20260612090819.1195510-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781946648; x=1782551448; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JhNHsXftEN6El8g6vfwP+WGytc1uXp8xqBzLMaNAUTA=;
 b=EzfCynDiNDPNCRgTJ9sGkuqD+FJHkRNxUSeQBhe7qJWDhNbBQBhJJQ+ReExMQ81rzu
 KacI0+sH8+hpKf2WVYFj+36zWgvP2RiQOCq/+zz+RGhULS8xkj5LlLV3LC6PbwicR28y
 SrmxMTZq5xA8v52OFqn3PkhC+CZOGWQE/VhMRSD9ceRxHwnHzgTlB26fPHRmzQ/sIiV0
 15SRTWLSM94r7CJOCLyx0ldjUeV8eTxp6bZAiaHcH94y57QQFmJVfemFYT3Cu7S/sgJn
 nT5Q+KgI+HWE7iPhhzhaEoL9o9dAJGCJsWZwcyWsVhNokFYxm0gVVc2mKZjrEDSJRy0y
 C3wA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EzfCynDi
Subject: Re: [Buildroot] [PATCH] package/python-django: security bump to
 v6.0.6
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
> https://docs.djangoproject.com/en/6.0/releases/6.0.6/
> 
> This fixes the following vulnerabilities:
> - CVE-2026-6873 : Signed cookie salt namespace collision
> - CVE-2026-7666 : Potential unencrypted email transmission via STARTTLS
>                   in the SMTP backend
> - CVE-2026-8404 : Potential exposure of private data via case-sensitive
>                   Cache-Control directives
> - CVE-2026-35193: Potential exposure of private data via missing
>                   Vary: Authorization
> - CVE-2026-48587: Potential exposure of private data via whitespace padding
>                   in Vary header
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2026.05.x. Thanks

> ---
>  package/python-django/python-django.hash | 4 ++--
>  package/python-django/python-django.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
> index 5af043f2c2..993b7b0d68 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/django/json
> -md5  44c18a8f264c1326e6fe4f1053fea5fc  django-6.0.5.tar.gz
> -sha256  bc6d6872e98a2864c836e42edd644b362db311147dd5aa8d5b82ba7a032f5269  django-6.0.5.tar.gz
> +md5  b45e074d29f85e1417fb2d2ea97c2df3  django-6.0.6.tar.gz
> +sha256  ad03916ba59523d781ae5c3f631960c23d69a9d9c43cecda52fc23b47e953713  django-6.0.6.tar.gz
>  # Locally computed sha256 checksums
>  sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
>  sha256  be30dc0e3f7010af6c453d205feaece1f89494789b6e92f0c255ef597a1e6864  django/contrib/gis/measure.py
> diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
> index fe88128e24..764e72084c 100644
> --- a/package/python-django/python-django.mk
> +++ b/package/python-django/python-django.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PYTHON_DJANGO_VERSION = 6.0.5
> +PYTHON_DJANGO_VERSION = 6.0.6
>  PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
>  PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/source/d/django
>  PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js), CC-BY-4.0 (admin svg files)
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
