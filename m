Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27CDCAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 16:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3299140AA8;
	Thu, 11 Sep 2025 16:16:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bQq7PvMeiUmf; Thu, 11 Sep 2025 16:16:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 038E44099E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 038E44099E;
	Thu, 11 Sep 2025 16:16:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EDF6234
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 16:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FA1941247
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 16:16:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xVWGXKXmi06A for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 16:16:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::643; helo=mail-ej1-x643.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 57B0F404C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57B0F404C4
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57B0F404C4
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 16:16:16 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id
 a640c23a62f3a-afcb7322da8so176078766b.0
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 09:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757607374; x=1758212174;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CtmGE5+NWfVzBAmNylpv3eRcGNqlf7K5SuymG7mbtI4=;
 b=D03JrMOrUa7OYMMpL9BtEPI4vP6tU4q31l8TEdp9YtDavhgYS69Cyv8G0AwnAogRko
 RLVf630UdGk2Qip8++nDQXZX6mnoooAbC6fHZoncGG/jeubX8aAr7dd6snbQ18bG3lr7
 vOcrRNjD7C0roJAMsH/wG1uSNS2Pmt6hwZ2eWUPQTQUojbjrwBjsWSxItVZSsmUwEic9
 GgXvtR8oGXKQgHY3SMHpNiuvB3mxQkZfuEgNaV1dYnOJAE0MWOa1nw4IJ9L/YCq0OGOJ
 30rR1kx8XACfK0km20XnA5qUBSy6HfD12x6oW9KXgcDrqgF3I2DNWnfPnFlR+m+KGhFB
 1qIg==
X-Gm-Message-State: AOJu0YyAL4AQ9adIwGT+X0PvuiuT2CGHz9uYuwJ5t4g0qhKm/jWolcp/
 O9nMGdEOoXUMSmSgIxzUIgMD1vSHiObi0Mahh9lNIZWqhqHDdtRJ1E+tPvqwMwKdB0S5cLtd7SD
 rhgatdSx6bA==
X-Gm-Gg: ASbGncvLdoITKvdeUbKTehUe76XwIGWifvlL3MrR61iA2MhbgfPqWTMzwSc/JQWmHf3
 WMGegko2Ov11wHwDxeE+U13yngCGCnRd5TxD9Iwx7Z3G05iUrHPV1xk3httjDQz+13TrtwTgvfF
 Yf3hHWKizMMOSIqO281hvz7N8hHmNej60aHHRrpJNuAhqxKcfMjQ7fIeVLrJ/PyqlNRj8uuqVSA
 I7PQxAneOLiFxJe/YhErtZrtxgk77xeyk6Q7coEOIsdasxw8mm2VzDohOJ/yfsKJeBDNjHeVd1/
 1G7ZbepwofsKxfEbxWC4tExtEWaWWLGAJyeOosCeXwr9A4gJjQ+Om97rEnuMg86d2ZM63OA57+V
 EfjvMUtMR+U5oO0Ez/c64a2D3afOIkmZmKlXiFiEGV2+XM2s=
X-Google-Smtp-Source: AGHT+IG1sroIUudKvn8NMEz65gP7Y82gr7QYSZPKJKY05sf8v4AQEHCr4O6Pad7k8OiAyr42RzYRdA==
X-Received: by 2002:a17:907:3d12:b0:aff:17b1:dde1 with SMTP id
 a640c23a62f3a-b04b13fe7d2mr1888107966b.1.1757607374195; 
 Thu, 11 Sep 2025 09:16:14 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:49b1:76d4:3e52:5347])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b32f21a2sm163256366b.83.2025.09.11.09.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 09:16:13 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 18:16:03 +0200
Message-ID: <20250911161603.827971-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757607374; x=1758212174; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CtmGE5+NWfVzBAmNylpv3eRcGNqlf7K5SuymG7mbtI4=;
 b=bnlgb3mrfcD+IbAvD6bVEOvzeYCo8MHrcFg+Zyni4DHXcx0e15OnbLmo8mUkMj8MQI
 +zWimoZhQh/8/jp67qN88EIHaf4XQEeQbCNKAKTq2mtHuDXpbPLhGqFbmbhPaNuZrcPM
 z/d0TZH28APM8/yDnjskZ1YwHZxxfEBpZ1266sTaw3FCUXUDwUMwFRjea9oX+pcEG70i
 8NYu9P3HTh/7hMcEEWoF2QitspNsMomj0aFq7BiqGhytyHFMDa4Zu74NW7gL9tDH74TB
 vjn9AEUHRq2GCo8+g1Fd/NJit/U8tVYR6dZLgjQrUTapsgtQ8TMhWd533pphw9THiTuk
 d7TA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bnlgb3mr
Subject: [Buildroot] [PATCH] package/python-django: security bump to v5.2.6
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

See the release notes:
- https://docs.djangoproject.com/en/5.2/releases/5.2.6/
- https://docs.djangoproject.com/en/5.2/releases/5.2.5/

This fixes the following vulnerability:
- CVE-2025-57833:
    An issue was discovered in Django 4.2 before 4.2.24, 5.1 before
    5.1.12, and 5.2 before 5.2.6. FilteredRelation is subject to SQL
    injection in column aliases, using a suitably crafted dictionary, with
    dictionary expansion, as the **kwargs passed QuerySet.annotate() or
    QuerySet.alias().
    https://www.cve.org/CVERecord?id=CVE-2025-57833

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 25200ef783..3ff4eb4e36 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  6ecc4875e8cdc08706faea1cc4740fdf  django-5.2.4.tar.gz
-sha256  a1228c384f8fa13eebc015196db7b3e08722c5058d4758d20cb287503a540d8f  django-5.2.4.tar.gz
+md5  1f0327293cc3768903ce8cd390ec3f47  django-5.2.6.tar.gz
+sha256  da5e00372763193d73cecbf71084a3848458cecf4cee36b9a1e8d318d114a87b  django-5.2.6.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index ca258bbea5..e3959f4192 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.2.4
+PYTHON_DJANGO_VERSION = 5.2.6
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/9c/7e/034f0f9fb10c029a02daaf44d364d6bf2eced8c73f0d38c69da359d26b01
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/4c/8c/2a21594337250a171d45dda926caa96309d5136becd1f48017247f9cdea0
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
