Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89602CCA471
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 10:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 479336072F;
	Fri,  3 Oct 2025 10:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mYQ-2uVH8b1J; Fri,  3 Oct 2025 10:47:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C3716077A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C3716077A;
	Fri,  3 Oct 2025 10:47:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D3AD3226
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 10:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C32406077A
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 10:47:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EFbn8JYVii5I for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 10:47:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 92BE460675
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92BE460675
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92BE460675
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 10:47:43 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-62fca216e4aso4899445a12.0
 for <buildroot@buildroot.org>; Fri, 03 Oct 2025 03:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759488461; x=1760093261;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NoBbTiFy2CIaaI6bsLktS2o38StmkbP8IJRxcJEdT6Q=;
 b=cJki+LvXEr7lKCaFocndVsZxvfxvEqv/F8WI468p6WovRhvqBJ8HFnue78Leh98YnU
 Um4oF5yd9oz+SXt5KtgC3F2vzzAO7cfPnW1Bvb1y0tfc63Wyn/w1mcHHlhMXUaLx+43P
 7z5tt+f0z+h+aC421I0b2sM5+1pkTzuB94hzfpon4xPm2abLZp6LX+SSMur8l4RjHJc+
 fEygI6ai9sNglZ6R3NiNhHI8HHRSV21vCEquwF5F7SSj6qJGalRlrtfUaJWDiAROSZ4l
 H8b3Oqm0wm1qGdtQsGEO0eBgdEQRilJI/GyJXjxLa3wA8I9hKpkBNLPu8NjE3zoDuCVC
 knsw==
X-Gm-Message-State: AOJu0YyxHF8VcC0VPIhRteup+FVBVHmBqKhqNZQtZEJtgbh+Y3qqNJVZ
 B3yaSALVIIPR1Dyz7w65y5DXmuAwkUJxTDSfhO+1PAa/xmBgTqCtUwlA/rIXpY5k8u0gLkDgF4D
 Gv8Vm
X-Gm-Gg: ASbGnctjk7KJiJjeq4JCnkQJz653cwmT//g/z05nldofAZ7lFAA8HXASFArfda9E0zC
 w+xkJrcpDhBtNYombB6pT74W4KdZALSdxcL3hwudI/bWV7+4hguIcyx1OVXSCiG40M4LJEsg8GM
 sYeZktVahUuHfmRA3HwPzspBTxFCvbY+PiTAR06UjAp9G296LGDFesdHZ2pU6WRdMIAcgPVUSXt
 A+apx8GKtKiX0r3wSYPAKg5qSFsTxoiSk8AEZG9iaGYSY/UNO5w+psgFVJG7pi5w6RlTqPUMVPD
 BsG8Vf+Mil8ZSc145tCKih0gOL4/Vp8Ic51z9Y6I2Vb4R6Cry7JPEqzqGQmEJqOD/yGxIsAuXx/
 ED7ZrpKmrFDpwYWqcxaLVY95fRVYjOMmziKJRiFxFfiO1CntgHBszxh3nbljlYKTE4cHfU7w=
X-Google-Smtp-Source: AGHT+IHVTktVw8Lo7FkNyGq2e9ek3UOBxySBde1NrHQdjiJslQpyUz4BzE9XvqmnIP2Uv/v1Dptcvg==
X-Received: by 2002:a05:6402:54f:b0:62f:8bad:76e5 with SMTP id
 4fb4d7f45d1cf-6376aace6cemr5027894a12.5.1759488461638; 
 Fri, 03 Oct 2025 03:47:41 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6378811f14bsm3785088a12.45.2025.10.03.03.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 03:47:41 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri,  3 Oct 2025 12:47:39 +0200
Message-ID: <20251003104739.55723-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1759488461; x=1760093261; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NoBbTiFy2CIaaI6bsLktS2o38StmkbP8IJRxcJEdT6Q=;
 b=SngCvZm7CmbXoYajLYEM7tMlKi/jXkmmeN1CdgGaVPK56JsdmNPNqkWkN1vOc0IHX8
 uf4AmemYjRJj2DzojNqoNMvZ0gPw8X/yInJajX9ZCAV+/KWJk3vqFrxGTrXcRfLeHp2D
 jpWvv2yNUF2MGX0DwU7Yk+ko8ykvuZKq/Ih6pNIxgCjrkIQK5lztUydaNlLaf1OX+LwU
 zwLPKHOm+KpDEf0vTlq0gKL+ygnvJopxMc5HkU4f3fjTNKrSVgWsPAifiB2sXLVBgTz/
 RhTDD0hBcysYXUiDTBhqKI5ryx0cMp7IwkaHqQMgrTWdrwVHPs6Vs6RLFrFPNZJp8E34
 lWNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SngCvZm7
Subject: [Buildroot] [PATCH] package/python-django: security bump to v5.2.7
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

See the release notes: https://docs.djangoproject.com/en/5.2/releases/5.2.7/

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
index 3ff4eb4e36..f13f5e9d7a 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  1f0327293cc3768903ce8cd390ec3f47  django-5.2.6.tar.gz
-sha256  da5e00372763193d73cecbf71084a3848458cecf4cee36b9a1e8d318d114a87b  django-5.2.6.tar.gz
+md5  699a77ac347ca3484939762483dc4b08  django-5.2.7.tar.gz
+sha256  e0f6f12e2551b1716a95a63a1366ca91bbcd7be059862c1b18f989b1da356cdd  django-5.2.7.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index e3959f4192..139a15b13a 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.2.6
+PYTHON_DJANGO_VERSION = 5.2.7
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/4c/8c/2a21594337250a171d45dda926caa96309d5136becd1f48017247f9cdea0
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/b1/96/bd84e2bb997994de8bcda47ae4560991084e86536541d7214393880f01a8
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
