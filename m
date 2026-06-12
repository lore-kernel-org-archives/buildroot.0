Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED65CD4F2C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 09:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F60360D8D;
	Fri, 12 Jun 2026 09:08:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hOHr2X-629GJ; Fri, 12 Jun 2026 09:08:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B91E60799
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781255296;
	bh=N5pEwvojJhJf/k13oi984XeturhqbripeVhhUxqYhyk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=YIXelv1B6UZJcSGTno6XfkPvnTasb+T3gxfq6aeDZHJ5Xr29QO6cFEWL5NwVDfRtS
	 sExJ82hJPy1JONVx8tkdr3b3q1yrx+BOKyGXFX9p8+T1diKER/z11WG3ZnTMRumM2X
	 EEOUqD6l9wOcPrMxQknIZaTmqDoTwsMWOWUEWt7N9ZLjkTzv1+9QJE+8NetChUkXGI
	 +PujmAN2ToZnOS4EpjFdzxC4NKkKUqRiyCEJBfK93dmii7XQV5EJCkdmBPbH0Ch2yV
	 wwVK/tz5nsQhpICoUt7+5EGrqC0VFttcIN+7QqmCJ5N9PUZ595tMhFdQIy3wJQTPw7
	 oQr3CK2lj0pKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B91E60799;
	Fri, 12 Jun 2026 09:08:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AD35F4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 09:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E2D060799
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 09:08:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 42eLf5fpRGFW for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 09:08:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B4AB4606F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4AB4606F1
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B4AB4606F1
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 09:08:12 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-490e1904089so6115785e9.0
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 02:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781255291; x=1781860091;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m8LINJurU8uEyWVUWYrcqfWlU6xwM6Xtu89bBPhgxfA=;
 b=IQwHfD6AcA2axfXt+QC4+fdteeEE6vIuXlttv110SkLLL2XhCnn9X9Dco+7bg9zqqc
 inmatwpCXQMypEEhuH3DM2EoV8/Iu9u7NYiSMCTDnCnUubbQ2P7dI9NutlZYm3wNtTvx
 j2eZm6pdr+DQyyKj5rfeTaGcTGr8Oh6owRBnGWeQSwdWNT5Rv1lOYlLBoiyDUs+zPvsZ
 tn9a+o7wVrWulLlx1lQKoQl6IvJNoODLFjx2MjBgP4wIjLkpoYr1QOtlF4sy3mH9GnP7
 uLT6s7DadrPDEaABadQA6tB6QgaNtbY7B6nFQsSiqEPktbdKusTJhosfchUvuTYHmKVq
 ukrQ==
X-Gm-Message-State: AOJu0YwLCUZQf4FMQQPoWhE8AJV8u57BS6mAT/1pmgnco6ctGCU045wq
 8SKNgfHfMQwwA3XARS/3XR0di3PshGJ7BPMTQcW/LDcGfRq3en+tf2wCHdSLuQbHiHBP9F4Qn1S
 dEpBD
X-Gm-Gg: Acq92OF5BNO4ZOyAoUzEY1X7Rw6tmcPj86ipKMJa/mF/tFX6xvgBvmgcDn8b5tgqW4d
 uvPioMCKA66oTF4RAhOETYdEUPKwOC1ODAgTcBR91q8W78isYDB9tMzvVj8TLchEj7zcsYi5eHO
 9YdFR4pPNzB5MzFCK7gsHLM7KnEvYSro68fZlSADRSN69kxtjwu1HqDILQsx2lYytOygn5o5cEg
 aqZdBa0rgWfmG/aCNaqdICB6nYs4113H8nb0utz6t1xuOm2eeECjZx/PBqi0ImubF83Wmx5p1q5
 ag5joilokZEYMkLIDPMvTmLyBWeHAZdfW7jB0HZUFyDhZbxrIdGOoNt4Fsj2ljkScSo5vam26Fj
 Zt4x0Yo8WerXxcanJ589n7L+Ely1pnBKG2md6i5BtNLT58SfQHEYbwFUsM3y/q6JksiOvleT1kG
 yxjpax9Hr+9YWVifeRXEpEyeiCtbSa5bXuOVpDmNR2T5f2nzKZ3id+B0ffs0/CxJLWfL5f3S1eR
 UCh
X-Received: by 2002:a05:600c:3b90:b0:490:9ea0:c11f with SMTP id
 5b1f17b1804b1-490ec4c5bb8mr23533435e9.5.1781255290742; 
 Fri, 12 Jun 2026 02:08:10 -0700 (PDT)
Received: from dragon.home (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea4a128csm61209445e9.0.2026.06.12.02.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 02:08:10 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 12 Jun 2026 11:07:52 +0200
Message-ID: <20260612090752.1195330-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781255291; x=1781860091; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m8LINJurU8uEyWVUWYrcqfWlU6xwM6Xtu89bBPhgxfA=;
 b=NthCZSxmFqSLARg+npCXz7tiIMxaUJG5i96gw4z5r2TyrPHFlqk5gZSGG8v4b6RwR5
 P+akiqc/b49pPG1dVkOyXVttvhmVmlHZbrAe9EGly8KoIIUWugrZ2+xuPr7DPTOX+qkN
 aRc5zKXghHgbHQljyZEzr1pTUnrBfq46NMznmeeSZywRAQcIA0cKYSUVONbowFCQ3eLd
 1PnbBuFiYXgHKyi4Xts6FkkVTeYLliN7o4cGdvxk/a4PThmGAfYRQ7JTpePHV3EO3Ng4
 6oQ+YIaSi5RPl6qCZiOLR/iMFu4yMP+zlh6sG6oo94gBZ0cp/wopmF8liZ8p0mFNET5M
 5brw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=NthCZSxm
Subject: [Buildroot] [PATCH for 2025.02.x] package/python-django: security
 bump to v5.2.15
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
Cc: Manuel Diener <manuel.diener@oss.othermo.de>,
 Oli Vogt <oli.vogt.pub01@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, thomas.perale@mind.be,
 Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release notes:
- https://docs.djangoproject.com/en/5.2/releases/5.2.14/
- https://docs.djangoproject.com/en/5.2/releases/5.2.15/

This fixes the following vulnerabilities:
- CVE-2026-5766 : Potential denial-of-service vulnerability in ASGI requests
                  via file upload limit bypass
- CVE-2026-35192: Session fixation via public cached pages and
                  SESSION_SAVE_EVERY_REQUEST
- CVE-2026-6907 : Potential exposure of private data due to incorrect handling
                  of Vary: * in UpdateCacheMiddleware
- CVE-2026-6873 : Signed cookie salt namespace collision
- CVE-2026-7666 : Potential unencrypted email transmission via STARTTLS
                  in the SMTP backend
- CVE-2026-8404 : Potential exposure of private data via case-sensitive
                  Cache-Control directives
- CVE-2026-35193: Potential exposure of private data via missing
                  Vary: Authorization
- CVE-2026-48587: Potential exposure of private data via whitespace padding
                  in Vary header

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index a7bf2aed8b..8121d67796 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  4af55cc09a3d1a828259ad0c05330e6b  django-5.2.13.tar.gz
-sha256  a31589db5188d074c63f0945c3888fad104627dfcc236fb2b97f71f89da33bc4  django-5.2.13.tar.gz
+md5  9db6f4aaaf130e3f53a4c5255c1b1bcd  django-5.2.15.tar.gz
+sha256  5154a9bf84ac01dde011e367f355c07dbb329532e06810dcf3ef2af269e236e7  django-5.2.15.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  a6fa72074c31928128aaa18162204507938b7a9a8b819bd833fa82467441800d  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index a478c95f95..cae4542099 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.2.13
+PYTHON_DJANGO_VERSION = 5.2.15
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
 PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/source/d/django
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
