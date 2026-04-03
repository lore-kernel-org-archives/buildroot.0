Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9069E7E363
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9138D60E2E;
	Fri,  3 Apr 2026 10:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qzG7lWYS1h4F; Fri,  3 Apr 2026 10:28:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37CF3608A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212118;
	bh=NvNfdWS1hTENMSr+fNhAcgdqjt7YILMEQL0+4Wexs/4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jA7in5oRjyUhYMOwGw0nvepgLGPvXgquTKc7TbrVW+MgJ35Gp92NT6a+67x9VohoD
	 6AghBQfIkK4ApKUBZOJu69JnjUPWAE6SG2W95CLnW/TryhX8N/vBVYvADxviTqeKah
	 cI3ffH7Xw1kOUXY/8FsjNdQ+oI8ByXesZzSTymB2DFXgdnyA3T2iUe+DKrh389dOBk
	 /eplwt7n24rVoGuUUBhbO/Tx3aRUPa3c92Ao4HkpUN6AN10GN34iq5A+ExU0XDEYbe
	 Al6cGNBLWF4g8o2t7oUNqbrhoqAR8bx0GwcRojIt22leJ4RhsNGZgBaHKQougZhBQ6
	 QmWR1v/HlH3Bg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37CF3608A1;
	Fri,  3 Apr 2026 10:28:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6039E1A9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5232381C38
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1nEzIxt7Y3BR for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:28:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2950781A29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2950781A29
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2950781A29
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:34 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-486fc4725f0so17765795e9.1
 for <buildroot@buildroot.org>; Fri, 03 Apr 2026 03:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775212113; x=1775816913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4J2MljLMoJJ1IpOGUBcOqC32HVdGNj+P74MdVzCD3w0=;
 b=h/fuDnor/m7QVFfnkaF3f+aRJxmqyQnulLqV4rXRDLNBUsoAP1/1oFt6UeW8DkvhW1
 DR4FKBGBZYyFp136yiME7jinnp0NnOWAt3spdHngm92IQytyl1re62BhltKrc9xg0at2
 ebkhnXwFHiGXyb7MyYgeYXk7g5UulgRVdRWn/ZYLUNsLJd8S8XHIZtGuPyAmHWtEjjXo
 l+nyE7Jqb+oOEym5P8NcjbeYTYhKFk3YtcHRQYxA2VbXKYXCscCjJ/k6W69Qm0DdvBxM
 Mug3Z+yV8M6l9K2zc/2M/lV0DEJHP8ZwR8xQ5Cuv6oU2BsCbvCF2ztqvFS2QQE+o3LhG
 wvLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCzeHrJ0rVfwuxuXTp480zPhdlkKXLkoHonBZBUVaHf4ysYgUDXF+9Da+Kqup7C9ZNwMbVFHrdbFY=@buildroot.org
X-Gm-Message-State: AOJu0YyYUatX4EfB51edk/0rAHhcrspny+JWhS3o1hzBFAABNQdj122L
 epITuBZLuv85i6XI1s244vOsfXRXCfcsJVs3rBYxeUTPrQ1VCTuOT+zhh15QhVVeC6g=
X-Gm-Gg: ATEYQzzwDGHKYdZYtsxtNQcH9HEzotMaF58qBw/G8FXGi6D83XNKuhYWxWBeIGgizC/
 cHfqfmrguZVrM1ZDneGZGTK9K4p2PLZilhE+8Bp9UKT75q66acefoeGSy3GeGQMvPhM24j9xQQ1
 oDUd2D5KPOZ9pdrhFgmdcXZyvx2y5gTYx4DlMtvyr4WRBaaO4vVa1OqBH4SMZWj9CwP8w/8kZB+
 hmfYGgM9xlLmUAhSNM75S1gBjXzbH0odHHJYfZUzeuCGKeNFX3N+7Ek478MIuoqgw3Cvlnt2gRU
 xfgSBBHtoVlD09rsrQwCDTzSGqzpjasJ8u6Fd2dm+wk72jYz6wfLG4MrbDUTiVJsqSPcPGC1k3w
 rHOfzzbiQHIKBwwgq+SIKAQGEwyQkpx3wxCsfuaotd8nzTXBfc0uaH6V6ROG+D7kI/OUFip+kOh
 NIjNWfYS7jMG9IIlieiuoEQkSLSQY=
X-Received: by 2002:a05:600c:450d:b0:485:3428:774c with SMTP id
 5b1f17b1804b1-4889946a42dmr38463285e9.4.1775212113008; 
 Fri, 03 Apr 2026 03:28:33 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4888a567bfasm289543075e9.0.2026.04.03.03.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2026 03:28:32 -0700 (PDT)
To: Manuel Diener <manuel.diener@oss.othermo.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Apr 2026 12:28:32 +0200
Message-ID: <20260403102832.210797-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324071027.885476-1-manuel.diener@oss.othermo.de>
References: <20260324071027.885476-1-manuel.diener@oss.othermo.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775212113; x=1775816913; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4J2MljLMoJJ1IpOGUBcOqC32HVdGNj+P74MdVzCD3w0=;
 b=a1FoP0t1pfMHewF41PaMS61Q/SiNtV9LUxi0o8iUt8tqPRd6rHm3YOOBKgSMsG9Y/5
 HUHO1f7/3yTJ8PJipYt4V5WiptKOQ1b1Ovlq5aSauu8LvC2Uk8x6E+JPQLw1oGVlEeua
 m4jRLdxQ4/0Ybnwxnq5W8ShAdF1ZyFlq2A+GW92+KgF5Js56XjdHf/6Lsfdfv93CgsRi
 H5gw+7ftlqpEE/3k9tH/k2WFw6eHhzJN1KxBOwDLLLLWyvv+bU5OK8CSySojfLD48/yF
 we8fp2GkbjbOa9NPo9O7Zgu24IXjo10UXg4aWLknREaWLpH20t3JLcPVn7e/imwRroAX
 xdEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=a1FoP0t1
Subject: Re: [Buildroot] [PATCH] package/python-django: security bump to
 6.0.3
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
> Fixes the following security issues:
> CVE-2026-25673 (moderate): Potential denial-of-service vulnerability in URLField via Unicode normalization on Windows
> CVE-2026-25674 (low): Potential incorrect permissions on newly created file system objects
> 
> See the release notes here:
> https://docs.djangoproject.com/en/6.0/releases/6.0.3/
> 
> Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>

Applied to 2026.02.x. Thanks

> ---
>  package/python-django/python-django.hash | 4 ++--
>  package/python-django/python-django.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
> index f1ddcc7128..2722dd45f9 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/django/json
> -md5  0836ceb8f1f4694f87f0a698c64bd00e  django-6.0.2.tar.gz
> -sha256  3046a53b0e40d4b676c3b774c73411d7184ae2745fe8ce5e45c0f33d3ddb71a7  django-6.0.2.tar.gz
> +md5  0bb395b518e2f2f17e1a936deb7ba74c  django-6.0.3.tar.gz
> +sha256  90be765ee756af8a6cbd6693e56452404b5ad15294f4d5e40c0a55a0f4870fe1  django-6.0.3.tar.gz
>  # Locally computed sha256 checksums
>  sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
>  sha256  de642dff9b1019c2c7209032fb94ea92060084efb0bc4238d81a2219e21c7382  django/contrib/gis/measure.py
> diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
> index 18871163d6..0cc68129ee 100644
> --- a/package/python-django/python-django.mk
> +++ b/package/python-django/python-django.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_DJANGO_VERSION = 6.0.2
> +PYTHON_DJANGO_VERSION = 6.0.3
>  PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
> -PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/26/3e/a1c4207c5dea4697b7a3387e26584919ba987d8f9320f59dc0b5c557a4eb
> +PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/80/e1/894115c6bd70e2c8b66b0c40a3c367d83a5a48c034a4d904d31b62f7c53a
>  PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js), CC-BY-4.0 (admin svg files)
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
