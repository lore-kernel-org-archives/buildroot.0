Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22367CAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 16:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEC7061116;
	Thu, 11 Sep 2025 16:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bCuIMThrYSUt; Thu, 11 Sep 2025 16:23:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F14F3611D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F14F3611D9;
	Thu, 11 Sep 2025 16:23:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E55E9234
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 16:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D717E84936
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 16:23:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f38nlRyFwaZv for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 16:23:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::544; helo=mail-ed1-x544.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2E48184935
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E48184935
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E48184935
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 16:23:17 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id
 4fb4d7f45d1cf-622b4b14a75so1826921a12.1
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 09:23:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757607796; x=1758212596;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sbXgkVfGGi9A+gYq5fXFhqccJ6LGKPGHbLGkEQlrelk=;
 b=lZmnXVZBy7eg8VhYI6xOL64MgfpA4HBQ4ZFV6AmDsgvGELXCzni5W1uzdjf/b9lBty
 ZqAApH7QHFo734O7CoyaiZy+wIeMhxxAQBzbuXPLUchUbzvKDDOMy/WqVJNVfCikaYHs
 DYtkla1Bxem42IlQl7M53UC4GsGKUQ8+8M19Dm4syf2MpnyniwcQ6Q/6pN3FcqL98f0K
 2Na9TVNshoAzPPnHrbrGoRFXa6Q9Yg2n6lUJO30waBR8zRNlnwTY0dDRM+HG9qJ6QSiv
 AeWaJj0BmUGyCQySWBFTdTOWzXr/+CH1E6PGW1czShNLce/Gx65uaeFMIZjNmWhlmfK/
 sX3Q==
X-Gm-Message-State: AOJu0YzZu0UiPpTnctIXURGKFodO5ASVWUdfKcrGmaOqHqa8z9nVGmHr
 af3nLh/SuYLFOgq0EbTuQBP5rHmRpbHG/CvlEYy996FiSFBkYNGitvkSwhp71bRcqyXEC9FruN9
 BwV3rwCK/5A==
X-Gm-Gg: ASbGncuAF8f2Nry1mvteyAL3LgpHkUE9nsEF38Cd7u3mBqQ+BwnxS8b9BWxHM3C3Ai4
 zopFmadKLhNb7VXV0MLuhbzMY0qMXpP46MR7WrHz499RipRBocJjPysfx0V9UO6/n0u6FGNd7KJ
 8UcH2tUEt6s6hHrzF5iNr343hpmfNbw64AKzobntWjmMpAU2KpU6FZ39LNOQFDHHYUKSPJMx/wM
 sYxdJZ1z9mCbfVOVxYe1LN9mIiXWrbh6SPJ1knOfNMvngCCDflVMNHgk2SssvMWPb3kshVdR/PB
 66tZHcbo5VBgFhwH2LvXja5eX5rGcAxkJt9Ly5jtUzjtYA8X4RuuHobfPTV+i7N9uJr33eJJLmI
 1NCCo/GfiuEdoZFoXlPpriPr9u2bV4n1hulvpwA5FUuU94MQ=
X-Google-Smtp-Source: AGHT+IFsvsZ6vlnM7nmt+FvRgYXDqPqvB48qzmvLcnVlGgyl6e46UNAO5mI3z4E5JMDnQeFFdmEXWQ==
X-Received: by 2002:a05:6402:4607:b0:61d:2d2b:76ad with SMTP id
 4fb4d7f45d1cf-62ed8250e4bmr165236a12.14.1757607795083; 
 Thu, 11 Sep 2025 09:23:15 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:49b1:76d4:3e52:5347])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62ec33f3c0dsm1445697a12.31.2025.09.11.09.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 09:23:14 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 18:23:03 +0200
Message-ID: <20250911162303.830536-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757607796; x=1758212596; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sbXgkVfGGi9A+gYq5fXFhqccJ6LGKPGHbLGkEQlrelk=;
 b=DgiDdUepolmIienp2pe0tOOChDdUcQ4PSNK0Ra0ivfzPYDjjhAlujRO1fgl7MVusax
 YguvqxACnWUg6IwDY7/pFDNJAY0nupPXy5CauYJtq5F1ngPq8kYNoCDh82SbxltvPHhT
 nox9cRRTsi5eEvljGH75GARD4lO57EO9T4VuW/C02dOgtrMHnpmJ0Mgf7rT2Tl09eZHM
 8hWrZ23xnqg3EQfrmuFO5OE2OMpLDN/CE0FrBR+RwtZCYmD4wyKjBr8/Hn6IcIFZoQAY
 wcgnGbzOK70JdKTSWY4yDoX7Cs3ZLnnIX3vedr24MRgMXSANK7QMWUrgNU1b83NEdNEe
 x/0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=DgiDdUep
Subject: [Buildroot] [PATCH for 2025.02.x] package/python-django: security
 bump to v5.1.12
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
- https://docs.djangoproject.com/en/5.1/releases/5.1.12/

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
index f307c61b0d..155e3af8ef 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  054d6f2ad897359de8378c190d73121e  django-5.1.11.tar.gz
-sha256  3bcdbd40e4d4623b5e04f59c28834323f3086df583058e65ebce99f9982385ce  django-5.1.11.tar.gz
+md5  7f7a03e4f19ad7813d96f9fbbad65a5c  django-5.1.12.tar.gz
+sha256  8a8991b1ec052ef6a44fefd1ef336ab8daa221287bcb91a4a17d5e1abec5bbcc  django-5.1.12.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 94cc2a86ce..3026c304be 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.1.11
+PYTHON_DJANGO_VERSION = 5.1.12
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/83/80/bf0f9b0aa434fca2b46fc6a31c39b08ea714b87a0a72a16566f053fb05a8
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/f0/99/a951d93a27a5bc59fb96edbcdbc03fb9bfac51177f1bc0110888de85af3f
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
