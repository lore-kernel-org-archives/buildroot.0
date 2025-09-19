Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56A4CAC592
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 13:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCBE660A4B;
	Fri, 19 Sep 2025 13:00:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LnUapCbixPjG; Fri, 19 Sep 2025 13:00:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E488B60D7A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E488B60D7A;
	Fri, 19 Sep 2025 13:00:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 81F3EE7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 13:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7343340DB0
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 13:00:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P47vD1ojnPMa for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 13:00:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 72B2D40D31
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72B2D40D31
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72B2D40D31
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 13:00:55 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b2381c58941so214892166b.1
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 06:00:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758286853; x=1758891653;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gfv09CXFABwefe6BpwFNymFQi5UvrNiM09UDXVI8blM=;
 b=IrXInw+eU/OxWEIzLEQET0vF8hblDUXd5sOaPwAc4OPoe3ATOn9Jg5DfEXH4X1tDe2
 8py1keNQ5kOVrVhhnbAiEl2ROstlP9px8Ih3Au/zJF+Ejglzc5jaQyrX/mcuhPMVt4qs
 i1AzZFTy+ZMJeLomynuwRBQEHS9MoGl5AmWurMlwUau1BQglK/kelF3ULHrhfcBPy6kM
 DPVpGwdkiFwE9j2rDqrYDWdg8L+FGxu5ZvmI8hg52o7cqhOkpaq2PHi7fjLyVEN1R4Ol
 /T2z/aHBcg9Yo1h+/3RuLjW2vkrp0RXHLpGlCfn6V3Zgsz7loCS7YR/gEVhkdQttnK7/
 mPkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8UOoYs/b8AQ+V1d88ufyP/2mPaCqCE9qtwggWPuXDausDTsrBaaum7EihzPvoJOmqCRnptNxwQF0=@buildroot.org
X-Gm-Message-State: AOJu0Yw0laV/hQTJMPxpTt2yy+oO7jOlP77tuTtHjBSI+51XHC2FGeHw
 G2dt3LBL5Af9Xha6+GXfIPcjngI9dv9pj3RE0GXneJAgoDZni8txNCCuS8rU9zTojjI=
X-Gm-Gg: ASbGncvGj7aCLwe0wj7F/oxr8F6NngDJldfi89SvClt5bbgChHAnHswgbFWZfCtAA/C
 G2FLgl7hlixJlnntvFJJ8H4ZgcCcjSmF4PShfguCJ6j5oCeK1c0j4Vbl0PLq7MFwpCY09Uc6+Q5
 R+/+DEzzumebd0IH47YbCdzIe/rRBqXQJHa3y9GIr8Z5FUi6eOeB5PCbcmmOy6Tn+E1gdsIHM6s
 3te69zkGaxnTw524xtHNeET224zkWsjw/nleAZU4Un2EJo94DOLtw0RAq80iUT53vzXnhndboNe
 CO1iG6lfv7FgH547WJ6UPn8LLoILEUAHzVy+F4LisJFqg5d54ZhxcX4xkFhvtCJZrnqWCoXk3xZ
 /Hr6BSiELLhnNPtE=
X-Google-Smtp-Source: AGHT+IFSpFaRPgSy1kThV5n6H90yIQCch4fYYOwp1fXp/7c2x1O+czuwU4LHjmyOgwfuvGAHXhVpIw==
X-Received: by 2002:a17:907:608d:b0:ae3:8c9b:bd61 with SMTP id
 a640c23a62f3a-b24edd5374amr354527966b.12.1758286853095; 
 Fri, 19 Sep 2025 06:00:53 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b1fd2814abdsm436273866b.108.2025.09.19.06.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 06:00:52 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 19 Sep 2025 15:00:52 +0200
Message-ID: <20250919130052.138802-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911161603.827971-1-titouan.christophe@mind.be>
References: <20250911161603.827971-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758286853; x=1758891653; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gfv09CXFABwefe6BpwFNymFQi5UvrNiM09UDXVI8blM=;
 b=eJwKhffWaTiC4IhH/vu2siV17HCb3iA+B5FZkbEINvqUpgwWc05IXE/mCNxpC4meC9
 YF6xI9GhnSfg1THKPNL2J/kStXOXwyOtvhoU2olLAmjNl5fRk7CzIwvfKh6ZLp5UMDH7
 gLR3/HvZAMMB74ciInTyJXxsJSEQLqIFDqOOXbZoMaaWXAMXj3kgnXNMsgJ1elZ6+bun
 xxuS1zfb+jzUNJEOsDZiIE13TZHB09YSnSQliqUThqWo2KcZ9El+jZL5pc1usXCTLBph
 JdNk3PGvtnHSWviCmVBZQLrKCNFO6r/t9Mh9/8rlF0kvA9WCa+vvnCFarI8GO3stvgLI
 ddGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eJwKhffW
Subject: Re: [Buildroot] [PATCH] package/python-django: security bump to
 v5.2.6
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
> - https://docs.djangoproject.com/en/5.2/releases/5.2.6/
> - https://docs.djangoproject.com/en/5.2/releases/5.2.5/
> 
> This fixes the following vulnerability:
> - CVE-2025-57833:
>     An issue was discovered in Django 4.2 before 4.2.24, 5.1 before
>     5.1.12, and 5.2 before 5.2.6. FilteredRelation is subject to SQL
>     injection in column aliases, using a suitably crafted dictionary, with
>     dictionary expansion, as the **kwargs passed QuerySet.annotate() or
>     QuerySet.alias().
>     https://www.cve.org/CVERecord?id=CVE-2025-57833
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.05.x & 2025.08.x. Thanks

> ---
>  package/python-django/python-django.hash | 4 ++--
>  package/python-django/python-django.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
> index 25200ef783..3ff4eb4e36 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/django/json
> -md5  6ecc4875e8cdc08706faea1cc4740fdf  django-5.2.4.tar.gz
> -sha256  a1228c384f8fa13eebc015196db7b3e08722c5058d4758d20cb287503a540d8f  django-5.2.4.tar.gz
> +md5  1f0327293cc3768903ce8cd390ec3f47  django-5.2.6.tar.gz
> +sha256  da5e00372763193d73cecbf71084a3848458cecf4cee36b9a1e8d318d114a87b  django-5.2.6.tar.gz
>  # Locally computed sha256 checksums
>  sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
>  sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
> diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
> index ca258bbea5..e3959f4192 100644
> --- a/package/python-django/python-django.mk
> +++ b/package/python-django/python-django.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -PYTHON_DJANGO_VERSION = 5.2.4
> +PYTHON_DJANGO_VERSION = 5.2.6
>  PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
>  # The official Django site has an unpractical URL
> -PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/9c/7e/034f0f9fb10c029a02daaf44d364d6bf2eced8c73f0d38c69da359d26b01
> +PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/4c/8c/2a21594337250a171d45dda926caa96309d5136becd1f48017247f9cdea0
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
