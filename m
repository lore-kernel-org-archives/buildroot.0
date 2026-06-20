Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DF6CD98E4
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 09:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF8974ED87;
	Sat, 20 Jun 2026 09:10:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AyjamW7ffpVX; Sat, 20 Jun 2026 09:10:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC8284EE34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781946626;
	bh=CYRB142FaI1nZuY63TOpEpLlVJx0udxiKMNY1jtTY5Q=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fLO4pUfQ5Xl4sSjpmSRtg+UH/rr3S7LjxN5nQ8UXORXoG8rGL3E4qznApMH2dwDYg
	 5+ukXLTC4pYxDK0xqKt2Ctr7MWBOMD/yxAZAg0Ohx3UV3++j8+WJ8zkaDCz0nnmcB0
	 Tvxo5azJ+RYrvs8PDxxqe/VNvQpjALmVtkdP96f1qe2giArvhES1x6kyplMktfW17m
	 9IOpg29sry/nAswE1vQjI9mVSjysWwBfmULt0nkJuwnkITgMTx5eovaCa2SkTchQMj
	 ja4CXsnzKWuZmlTr/pcfvnNaiointWpDi/63ZlHs8e8oJUW0G29IkqdHC6EdyVFMJu
	 iV7qqIPNvDUyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC8284EE34;
	Sat, 20 Jun 2026 09:10:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 49A79112A
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37896401EF
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:10:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tLpX3oHIkuzC for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 09:10:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1E6354019A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E6354019A
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E6354019A
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:10:21 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-490b211ee6aso19011945e9.3
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 02:10:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781946620; x=1782551420;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=B9CNfiYZDNsQv4GINH4DxjMpZJNvAgLek+7XLZMQ5o8=;
 b=QfWVCmXmlrR8h7G8MD56+ElxSNEKPB19oZIqD2/qWt0FBhMdvHr2dsIQ9YwK/gGkpI
 S9kJkkX0gThX/xO8hr2ey6Ijjxx4Wdf3UThnXpA8wkH5/f7KURv/+jCoYGOaZWwHUvR3
 CuL3ZsedURGl3UnvWlglLfGHlZzeUZnCOXYuD9oUiV9o/aD9LhvIyUJT4J7WXK0HoK3R
 b7vbl7W5YIQ/RTnqfLIFDw+bKZpEdTHdxzNorHCdBRk28AGGqy8ie+DHGG9fPtqu4rFK
 BqoOUAmn4+qj6kQp23hjJvJMqLQrgngRT4DJ76cwkmZNHelKFqL0VqltUchKdmIxBw6G
 zQ9g==
X-Forwarded-Encrypted: i=1;
 AFNElJ/DlU8BevuAGOBxF6HAlK2Ytpvb2PbkcwFzmz2fd5s/jdaKCsebSsvC1gVfLZq67Pv5Twc22G+aMKY=@buildroot.org
X-Gm-Message-State: AOJu0Yzewm4EEeDRxmQ/ca9F5PQ4idq20EdetkR6onIUCkPP1hSqnl4R
 542RBz954bNsGKTuQz5WWI5Fj8htcdk7YxmXhhfKTrTH4WZvSRPNydnzXXwVfqO1m+8=
X-Gm-Gg: AfdE7cmtUMIEWGN/aeYdt7V0tLJOqLlXZit2TfDqlOnXaF91j/eQjagWWyShVGZDGVN
 0r3QAzk64P58xtQZqfxx2LD/N6nl/yGIcgGyMnmzLIDlLC45dluPAooeyN8x/Xuyhm6ARiesfjy
 jmYF6YC32gcYXKINgvZpPX/sWNm+sbf5uGpqGY9XMdeDuZbWeN5Cb9RX0wGO93WkyI5HBWkkXaA
 8azWKH+tig6/qpYbIDfL9PQnnEoOoJsYPTvlaO3s3IYFrnOpdiqILSXkmtvK7AGn8Is9rjyMDhw
 I/RzonggpO3paoc3e405x8xytv2JiOGisMnLn/tqFn7JEwUcpEO13prdlulK4JobfPoFEE+M8NQ
 rMOHbgxISk6JZQlasujgbIR6BaGeiZmYpwlLj5rb7y8muIm46KQwCKFJhupi6cHyAtFHSaQJ2H6
 xa5iNS
X-Received: by 2002:a05:600c:5253:b0:492:486d:77ff with SMTP id
 5b1f17b1804b1-492486d7820mr50193345e9.37.1781946619939; 
 Sat, 20 Jun 2026 02:10:19 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4924923392dsm81456115e9.2.2026.06.20.02.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2026 02:10:19 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 20 Jun 2026 11:10:19 +0200
Message-ID: <20260620091019.21935-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612090752.1195330-1-titouan.christophe@mind.be>
References: <20260612090752.1195330-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781946620; x=1782551420; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B9CNfiYZDNsQv4GINH4DxjMpZJNvAgLek+7XLZMQ5o8=;
 b=YiPWfvXC6BF+ejVZOIr8AkNarlvDvp0YhEjMsq3WjNhPX61amW6qYfekagarIoQ58N
 w9X9lMBjWwpdBKt8EgtKTtbYvR5hFNhWyzuiHjhffphdc23mBRvP+/RnRFUsUMbBeuHg
 THlwe9EN+o4estPYNg/dim+JEoHPH7Z8R6eHdQP8RoTLDIhYMTa2reTU4I17Q37DINOb
 dzeyYoFMvnutUoXMNeZEZixGaPxd98ow4Ta/cI5aSQzdMGs8gH2ShXa+BA/J5qZPonkD
 j+LIFXFCSg9bk4pl4IQXFsWwfNjpxXdc4elbkbtyLSwLHUTuMy9xdsZGZB6GvBVJZfAU
 oddA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=YiPWfvXC
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/python-django:
 security bump to v5.2.15
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
> - https://docs.djangoproject.com/en/5.2/releases/5.2.14/
> - https://docs.djangoproject.com/en/5.2/releases/5.2.15/
> 
> This fixes the following vulnerabilities:
> - CVE-2026-5766 : Potential denial-of-service vulnerability in ASGI requests
>                   via file upload limit bypass
> - CVE-2026-35192: Session fixation via public cached pages and
>                   SESSION_SAVE_EVERY_REQUEST
> - CVE-2026-6907 : Potential exposure of private data due to incorrect handling
>                   of Vary: * in UpdateCacheMiddleware
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

Applied to 2025.02.x. Thanks

> ---
>  package/python-django/python-django.hash | 4 ++--
>  package/python-django/python-django.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
> index a7bf2aed8b..8121d67796 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/django/json
> -md5  4af55cc09a3d1a828259ad0c05330e6b  django-5.2.13.tar.gz
> -sha256  a31589db5188d074c63f0945c3888fad104627dfcc236fb2b97f71f89da33bc4  django-5.2.13.tar.gz
> +md5  9db6f4aaaf130e3f53a4c5255c1b1bcd  django-5.2.15.tar.gz
> +sha256  5154a9bf84ac01dde011e367f355c07dbb329532e06810dcf3ef2af269e236e7  django-5.2.15.tar.gz
>  # Locally computed sha256 checksums
>  sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
>  sha256  a6fa72074c31928128aaa18162204507938b7a9a8b819bd833fa82467441800d  django/contrib/gis/measure.py
> diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
> index a478c95f95..cae4542099 100644
> --- a/package/python-django/python-django.mk
> +++ b/package/python-django/python-django.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PYTHON_DJANGO_VERSION = 5.2.13
> +PYTHON_DJANGO_VERSION = 5.2.15
>  PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
>  # The official Django site has an unpractical URL
>  PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/source/d/django
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
