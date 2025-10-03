Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B08CCA471
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 10:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A28360878;
	Fri,  3 Oct 2025 10:47:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 827VBXch4pXY; Fri,  3 Oct 2025 10:47:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 271676067F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 271676067F;
	Fri,  3 Oct 2025 10:47:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D10FE226
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 10:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2A8C6067F
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 10:47:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MgsUnFwDQidr for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 10:47:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2BC3160675
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BC3160675
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2BC3160675
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 10:47:37 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b3ee18913c0so347745266b.3
 for <buildroot@buildroot.org>; Fri, 03 Oct 2025 03:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759488455; x=1760093255;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZZbzarPGf2ZaZEOqlt3b5n0b/QNzkglDtOWw5WluX+4=;
 b=h+iqhCv2UrbKzCb63qPWpDqL4WJgJXvV5q1+dLsXFoS79iOrPyl5oNCKqj1U03TEwf
 pyD70riIEuq9Gj9qy4j2isnyABxN2OMd85qr37uA1X8bUkobwTMFgs/puLAlvxaECT8i
 jcUgCMDi8BUfmS+dosbDFwKUi/pr9nGwcutpAg5xqGRQTZ42Uue6iQ6xU4IQCSeyRTUZ
 pI2/Rk9sAm4rFw6LLYdbUmwzfHVlYjcGRZLRdzrUILySl6yeNBfNxdYAU34xEWFk3dOG
 yzxyyUOccC8J8gF6W/Tu4HpF+JWazLnS1NawEmnDUhmpZBOl1zH40UteS5wFJREFJXJh
 uHeg==
X-Gm-Message-State: AOJu0YzN0VtA2i1n/go7UsXiVdj2uaNAuRmArdMuoD54hG8b/vEyLMzE
 CAvLW9UoPcmx0Y8PDB7JJMqal+lY6l4hLMyFLu5CefJHd20F1uNTVpHPD23RfWrqglgMLiDsHo8
 7BGdj
X-Gm-Gg: ASbGnct0vOVNlVcu42mkFgwdpQqgUUnh2mZiwh2rua2p/cSjy4rpj9p5rKclHI0wxFv
 hvY4oNnDqbBzVrxkNOUi2gHMANCLWxq0GTdgRi5xpq7KF7DEqsrfObR2mAc6MY7I0ntgWZBmBsE
 gChp1ZcCGrBEC94K7Kyun8mgA7vvHrtT5+fiPJmeUIQ1W19Ip2lG8m1z8LFqaKjHkH7WR+EK1b7
 eSXIxUimBR6M4MC/y68YhMxShZ0h6G0cI4rlbc+Wd1JnukzdePvZ4fl0VzNaT5E51FjWwEI+Uz0
 siQ2kxzHpcT5A1ohqdUYGDqeoeyFKozeV8jGV/N9Z9x3UFhtPGn+yCqFol+DP4Q6QomqgbE1fwZ
 nCM+C6V3LVEi64a5h1VnaiCWxZhYfh06p84ZxLB6poj/NZMhuQ/x6TvKNX/yI
X-Google-Smtp-Source: AGHT+IHawrpyIF9qEXR42gZrGBb1+QddgF8y3gBtT1sbi+bIBXOocnbZIBVL/YxFIDaPomipGNuM3g==
X-Received: by 2002:a17:907:1c0a:b0:b3d:b3fe:27ed with SMTP id
 a640c23a62f3a-b49c3f71d55mr367685566b.57.1759488455512; 
 Fri, 03 Oct 2025 03:47:35 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4865a83482sm415655766b.26.2025.10.03.03.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 03:47:35 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri,  3 Oct 2025 12:47:28 +0200
Message-ID: <20251003104728.55578-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1759488455; x=1760093255; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZZbzarPGf2ZaZEOqlt3b5n0b/QNzkglDtOWw5WluX+4=;
 b=O+8H/ueUu0JFTKBj2PXhSwiFXE1UuXl5VhCOYx3aXJ1d/+kpFTkw3cWdUrpAldRlds
 gLAh4P9virBRB+0q3YlEyhHxUfeLxRKPOdIiaIgbo/GlG8MrimHZuwRI9E8nBAjHxPZQ
 ndBduiadDsiUF3bGYct5Dk20ndQgdyxV3ia3UQ/xPZuxc8WA5m1PdOOAybncLzidgpNI
 KknPmwST5dNPVMMaGNcD7ranJxJ7rp8H9VSxqq9SVy7vWm9RBYVhp9PMSxl+Xo7kS02M
 fv1+fMegfaLnaC880tls6MiCxBmuVP30MTzU3ge3Dr4aeSJ5VPoPq7md68zWZF/19zrX
 7FPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=O+8H/ueU
Subject: [Buildroot] [PATCH for 2025.02.x] package/python-django: security
 bump to v5.1.13
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release notes: https://docs.djangoproject.com/en/5.1/releases/5.1.13/

This fixes the following vulnerabilities:
- CVE-2025-59681:
    An issue was discovered in Django 4.2 before 4.2.25, 5.1 before
    5.1.13, and 5.2 before 5.2.7. QuerySet.annotate(), QuerySet.alias(),
    QuerySet.aggregate(), and QuerySet.extra() are subject to SQL
    injection in column aliases, when using a suitably crafted dictionary,
    with dictionary expansion, as the **kwargs passed to these methods (on
    MySQL and MariaDB).
    https://www.cve.org/CVERecord?id=CVE-2025-59681

- CVE-2025-59682:
    An issue was discovered in Django 4.2 before 4.2.25, 5.1 before
    5.1.13, and 5.2 before 5.2.7. The django.utils.archive.extract()
    function, used by the "startapp --template" and "startproject
    --template" commands, allows partial directory traversal via an
    archive with file paths sharing a common prefix with the target
    directory.
    https://www.cve.org/CVERecord?id=CVE-2025-59682

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 155e3af8ef..3946565f22 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  7f7a03e4f19ad7813d96f9fbbad65a5c  django-5.1.12.tar.gz
-sha256  8a8991b1ec052ef6a44fefd1ef336ab8daa221287bcb91a4a17d5e1abec5bbcc  django-5.1.12.tar.gz
+md5  dad76d0dbdbc86402061182fc708a442  django-5.1.13.tar.gz
+sha256  543ff21679f15e80edfc01fe7ea35f8291b6d4ea589433882913626a7c1cf929  django-5.1.13.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 3026c304be..c2581f5f90 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.1.12
+PYTHON_DJANGO_VERSION = 5.1.13
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/f0/99/a951d93a27a5bc59fb96edbcdbc03fb9bfac51177f1bc0110888de85af3f
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/bb/57/ad9905d03a2ee39064ee7ba69f8e2790db4a7ffaef9c54f95e7a8f2cb0a1
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
