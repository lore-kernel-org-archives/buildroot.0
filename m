Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB2ECD3430
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCF7261574;
	Mon,  4 May 2026 14:47:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jS1DrAK5IiGZ; Mon,  4 May 2026 14:47:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 616566156F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906042;
	bh=HLePg/pT8MNPqv0diOfozQ0dWPvbsJEvXL1OM+M1jlM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=N8IO4ptlHc/PX2zBseCRhHd0ObB35VM0fbIHerUkD553nmnIbm6h3fW47AK8pK8U8
	 K8Q8Yg622RumprN9kEFJlIcXJPQ7XnsxoiZs/6b7PZNs5HyIteaZr4/LwnZpNo8g3G
	 GbZf+yfOv44TpykUzc/OVDxVRtoHQSVdWL96NhJi/177s11BC2nj9GC625zSBzkfyU
	 hP8i/ZO56qc7KLHbDpCF3cXpOh7CRC5VoR80fQ8XRyPNI1PLcc7oTTzYfias9Yqa6h
	 lCTKM1Rtso8QYpdSyx+8wgFEZ2Hz5MKaVd8j6ARaRbmtTTP4iS0yw3cMq8/gyh540r
	 loxtZKzBjwLXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 616566156F;
	Mon,  4 May 2026 14:47:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B4FB725D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6B1540E0B
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KZ3v04HAdgWh for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:47:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2F00F40E08
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F00F40E08
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F00F40E08
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:17 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-488af96f6b2so55317775e9.0
 for <buildroot@buildroot.org>; Mon, 04 May 2026 07:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906035; x=1778510835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wO2ftTJ4KYUsqsL8hcCC1JvnF4UJBRCwCiDRyTgDM/4=;
 b=mEKQE24HJGJc/OjLCR51wtcM3o3fJEX++wgb1LBnU+xJNGYWF3v69Cdb4/66Ybdukh
 /TJfU/ssmaycQ7FgXU56o5H+TBUtNBbwxdvsRSUUsLhVA7iVWtybX7szGR0OpRb2H4+P
 LwYSVL1Mwa6DZlP1sqq/pZfIpN9JIf9yJ5FjM3zuWPknY2J0rSDS24yjUgrSDXB/bPWb
 WozyZpd5xy4IxCcVWegCQ2O3CupS6NSRpvxup5QKIEHfsq4wZ+SY0RqpTheJB4CjSOKy
 zRNsaxyYHH3/tOSsexGQTYR8FpOq1rn49mk7CLDh81ex71hbxgqHgD6tsjJfkWOAeawA
 YCFg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9p0WD/6mSndNTAKljtYSiG/HBIWbQxvLAkb6ughCjOAj7rBf7zN/bZu2/nfCA9nH5reHYKXRmMojs=@buildroot.org
X-Gm-Message-State: AOJu0YzD/k46KOJodwGZ/CdDcmBiHb4LFOBz9AktHIIxyQaSK8FV+0U3
 U5FEpufxrnleZaaywSxDLRpfN/zdI6GI7qDaqvnCF5FnpO+91tK+J+kzDwHPd9wO9LA=
X-Gm-Gg: AeBDietd2ZaaD1n+9oKIq44O76yr9HobT+sqOSo4guGypwvfxucfGXfTTzWGvMrDLAy
 TC/ilyzzOhhzggJfItaLmGJ1DlFEpHO7Mvy4NseYaEMUWqemLgkr9HQEf5f8DHEUwFH2mG0NYG8
 axk0kX8ktvN3i65Eb0yFqna2/7Qwp5O21s0tBMgbjPz4eq/aNTp4R/br3QQSUsgm3Zky8vRsm8v
 lMeOmb/FTQAD3j3/ZMJ93rs0a2xpUSMET1rZRqAIQLkq5zA5jICyBE1/2IL+yIArngJk35brAUd
 rgOQ/4iWdQfpQd/oqDLgi3odanIMbHtxyn1pGvyOb1kNmqLL4dpHLyb0z+155eb3BHh6fDSeO+H
 CJrda1lWdYiO24GnpmXcUcij0284XzeviGEoyExolkBv1lZPJoZ1e4fIW5dJ4wKw3AhL98nGBzM
 bwcbGb4pWcAyw9Sz0GpcX5JtzvTQ==
X-Received: by 2002:a05:600d:11:b0:48a:97b6:7420 with SMTP id
 5b1f17b1804b1-48d1271fc9bmr20127505e9.24.1777906034714; 
 Mon, 04 May 2026 07:47:14 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a82301adesm324869975e9.10.2026.05.04.07.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 07:47:14 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  4 May 2026 16:47:13 +0200
Message-ID: <20260504144713.9022-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260428151136.78922-1-titouan.christophe@mind.be>
References: <20260428151136.78922-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777906035; x=1778510835; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wO2ftTJ4KYUsqsL8hcCC1JvnF4UJBRCwCiDRyTgDM/4=;
 b=K40iwGPL7I9KYKtIWhBPnvgfnuw/U9G5kHbmlBL8MSIvfXQNyKqwA8I1wpdlcdS9nf
 HY+rBoXeHGCqhAtPQbNq3OiyntxdrRy0dcortW7FPfphpPSM6T2slpijZ7/e9nP2ZcwR
 DQClBcggj6DszX3jUBUFruqdOsZYSttylTrSq2I/Wv6WBihAVj5E0e3MOB42lOOfwZva
 SR03Aj1LA7pRnkDwvBo7XQD2ssrQfZt5hkGfNA395+7SvloBUS/aVfEjf0GgrtEJoDia
 3mR2KhWpIL2fZ/Tfvc8AV5hu/7HEKkjLZp1KaN8rn/bSpUayf8utn9gtsPnLap0HnR1z
 h65g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=K40iwGPL
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/python-django:
 security bump to v5.2.13
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
> https://docs.djangoproject.com/en/5.2/releases/5.2.13/
> 
> In addition, update the pypi url to a stable one, which shouldn't change
> in each and every release (similar to the url change in commit
> https://gitlab.com/buildroot.org/buildroot/-/commit/60ce218196281d76606849037986b275c4619ae9)
> 
> Finally, one hash file has changed because of upstream commit
> https://github.com/django/django/commit/0ee44c674cf61efbca2056c40f3e4f2335aaeee6
> 
> Django 5.2.13 fixes one security issue with severity "moderate",
> and four security issues with severity "low":
> - CVE-2026-3902:
>     An issue was discovered in 6.0 before 6.0.4, 5.2 before 5.2.13, and
>     4.2 before 4.2.30. `ASGIRequest` allows a remote attacker to spoof
>     headers by exploiting an ambiguous mapping of two header variants
>     (with hyphens or with underscores) to a single version with
>     underscores. Earlier, unsupported Django series (such as 5.0.x, 4.1.x,
>     and 3.2.x) were not evaluated and may also be affected. Django would
>     like to thank Tarek Nakkouch for reporting this issue.
>     https://www.cve.org/CVERecord?id=CVE-2026-3902
> 
> - CVE-2026-4277:
>     An issue was discovered in 6.0 before 6.0.4, 5.2 before 5.2.13, and
>     4.2 before 4.2.30. Add permissions on inline model instances were not
>     validated on submission of  forged `POST` data in
>     `GenericInlineModelAdmin`. Earlier, unsupported Django series (such as
>     5.0.x, 4.1.x, and 3.2.x) were not evaluated and may also be affected.
>     Django would like to thank N05ec@LZU-DSLab for reporting this issue.
>     https://www.cve.org/CVERecord?id=CVE-2026-4277
> 
> - CVE-2026-4292:
>     An issue was discovered in 6.0 before 6.0.4, 5.2 before 5.2.13, and
>     4.2 before 4.2.30. Admin changelist forms using
>     `ModelAdmin.list_editable` incorrectly allowed new  instances to be
>     created via forged `POST` data. Earlier, unsupported Django series
>     (such as 5.0.x, 4.1.x, and 3.2.x) were not evaluated and may also be
>     affected. Django would like to thank Cantina for reporting this issue.
>     https://www.cve.org/CVERecord?id=CVE-2026-4292
> 
> - CVE-2026-33033:
>     An issue was discovered in 6.0 before 6.0.4, 5.2 before 5.2.13, and
>     4.2 before 4.2.30. `MultiPartParser` allows remote attackers to
>     degrade performance by submitting multipart uploads with `Content-
>     Transfer-Encoding: base64` including excessive whitespace. Earlier,
>     unsupported Django series (such as 5.0.x, 4.1.x, and 3.2.x) were not
>     evaluated and may also be affected. Django would like to thank
>     Seokchan Yoon for reporting this issue.
>     https://www.cve.org/CVERecord?id=CVE-2026-33033
> 
> - CVE-2026-33034:
>     An issue was discovered in 6.0 before 6.0.4, 5.2 before 5.2.13, and
>     4.2 before 4.2.30. ASGI requests with a missing or understated
>     `Content-Length` header could  bypass the
>     `DATA_UPLOAD_MAX_MEMORY_SIZE` limit when reading  `HttpRequest.body`,
>     allowing remote attackers to load an unbounded request body into
>     memory. Earlier, unsupported Django series (such as 5.0.x, 4.1.x, and
>     3.2.x) were not evaluated and may also be affected. Django would like
>     to thank Superior for reporting this issue.
>     https://www.cve.org/CVERecord?id=CVE-2026-33034
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/python-django/python-django.hash | 6 +++---
>  package/python-django/python-django.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
> index b1859b0647..a7bf2aed8b 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -1,9 +1,9 @@
>  # md5, sha256 from https://pypi.org/pypi/django/json
> -md5  9b60bb1145abcc97d276694f3f82a3b8  django-5.2.12.tar.gz
> -sha256  6b809af7165c73eff5ce1c87fdae75d4da6520d6667f86401ecf55b681eb1eeb  django-5.2.12.tar.gz
> +md5  4af55cc09a3d1a828259ad0c05330e6b  django-5.2.13.tar.gz
> +sha256  a31589db5188d074c63f0945c3888fad104627dfcc236fb2b97f71f89da33bc4  django-5.2.13.tar.gz
>  # Locally computed sha256 checksums
>  sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
> -sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
> +sha256  a6fa72074c31928128aaa18162204507938b7a9a8b819bd833fa82467441800d  django/contrib/gis/measure.py
>  sha256  570a045a8372b6cd6a00e30ebafe8e3e8dfc0a7fe3d4ef2cc5f16d419eb63aeb  django/contrib/gis/gdal/LICENSE
>  sha256  08bf24b7551238ae325295245425b1caeb9ad0f42f9e2d303c7b353502632045  django/contrib/gis/geos/LICENSE
>  sha256  d48633adb736dac091477ec2206feebeee88e3e6e486aedb21c584e4b49be0ec  django/contrib/admin/static/admin/js/inlines.js
> diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
> index 52d0a2b740..a478c95f95 100644
> --- a/package/python-django/python-django.mk
> +++ b/package/python-django/python-django.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -PYTHON_DJANGO_VERSION = 5.2.12
> +PYTHON_DJANGO_VERSION = 5.2.13
>  PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
>  # The official Django site has an unpractical URL
> -PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/bd/55/b9445fc0695b03746f355c05b2eecc54c34e05198c686f4fc4406b722b52
> +PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/source/d/django
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
