Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BF0C71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BB1540851;
	Thu, 12 Jun 2025 20:44:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TiKJIpXaRZbv; Thu, 12 Jun 2025 20:44:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BABCE40848
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BABCE40848;
	Thu, 12 Jun 2025 20:44:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C9381E0
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 730EA820D6
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:44:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0zmhRQ1K8Hdu for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:44:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 67FBF81A73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67FBF81A73
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67FBF81A73
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:44:40 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-451ebd3d149so9819445e9.2
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 13:44:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749761078; x=1750365878;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wp56rFVSSiX36fyM+jFZcORRLMwZjGjGaM5oij5LPwU=;
 b=XOMMlUppIDCOOcEJQ3JfFZn2VeJPe9dm1X8ZFPdPJw5xbLWHgtu0F2GRKzBjXMk7YJ
 nOgRtAM98vRt/okpAbB/eLDJeqrgLe8lTDLCLPGt7QXI/bPDmD+Cod7yq23iXWftCIpD
 r1yv2mCj/SemaqwZX1krcNZhIGSV1vJu9v7srEa4MS9BrvvC1EvO4eUfDzgHG6BqL0cU
 ALmYz9UYyYRjNC5xvZH3CwKp0YUCsgk/R4dZSPQcy0dcQnaK0mAMa7aPY9vLGUoua/LL
 tJ1gBoeUjVE6B8Hk8jl+ln5GhiM5+Z43a/eeRqOr7Ysc5dPp/5SdahGyqVo2dThvmlYF
 dzWg==
X-Gm-Message-State: AOJu0Yxe8oMJETUez/5BZ2RtJrZOxR5fK2BfYNAIrZQQz1DEhOnKx3hr
 tRP20mnYum+2aVBFidIt8JE2TCRpYbd+oVdalIOVl4ZDNfMbdDEDUPffCDMFIo8GoID+RBsa8W8
 Vo52R
X-Gm-Gg: ASbGnctsO8j7hbx/NY38mL22FT3Uh3EeTCM1d1BfQxKj7Pt43I6nLe98gSomxhvv8j4
 cYQFjuYKqYPdE9iYg1OmoRiH5G809evVQeKN1Iee2mWE8lBnay1wB1UUi/ciCAOmSKuOTLgCWyr
 ZWKWplqKRF8+Rrq6OBBqnMk1n+/QFCTO2+GzJJnWALoJjQm3xT4Fbad2VdYLMXJFbTAlbiun21t
 WsJZRrlPb30GzTcDqxLC4NLXocA/T+e9NhGw0k4kPoZcN4iOJF/WD9D+jHJliux0k7zPIrGsJMk
 cG57/0HDJSUuLmjTc6jPDHI4mGoaTJZRNBMNvWLBpcQ1JB3klt+bh5F26zGGvlS1xH6o2+FXm4b
 X
X-Google-Smtp-Source: AGHT+IFk1CpPNt1b1VX+Kldw5E6/yne23x2uVUdVw2FQkzJ26K5ocd/+FNvH3PpbIibuLMroeAyO8A==
X-Received: by 2002:a05:600c:474f:b0:44a:775d:b5e8 with SMTP id
 5b1f17b1804b1-45334a7217amr4536605e9.1.1749761078130; 
 Thu, 12 Jun 2025 13:44:38 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532dea15b0sm31737615e9.11.2025.06.12.13.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 13:44:37 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 12 Jun 2025 22:44:20 +0200
Message-ID: <20250612204420.493055-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1749761078; x=1750365878; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Wp56rFVSSiX36fyM+jFZcORRLMwZjGjGaM5oij5LPwU=;
 b=hNup8R9isaHXR9DutFIwOI79oZ8z6dSDrroqp1wUIJ4PpkltbItBbOoyR2yJetmsrr
 MGxZq3f1cBFjq/oPhm3r88qBJLiPtaf/c2w+AuOJs7KuL3kGBqaUiTiYKlVdfoE4THPg
 004yaIgucBu7+Tw3GKfsltlIT5mefSqITQGOucRZNUXr1pIH61BA3uUJ2h8sSTW3vlgF
 UGY4p0cvU7e5x2xp1WbFHTfPghbeMTvOLUxfTSR0Syb6PcweLxfuqsWnZVGX/lHLxsRu
 gjU/EY1yHRCxPgSDSRPSumyZ83h26yLh1phwzZvGrjYeGlXXDMSm7kpR/cikX6qlOnLj
 aEyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hNup8R9i
Subject: [Buildroot] [PATCH 2025.02.x 1/1] package/python-django: security
 bump to 5.1.11
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issue:

- CVE-2025-48432: Internal HTTP response logging does not escape
  request.path, which allows remote attackers to potentially manipulate
  log output via crafted URLs. This may lead to log injection or forgery
  when logs are viewed in terminals or processed by external systems.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-48432

For more details on the version bump, see the release notes:
 - https://docs.djangoproject.com/en/5.1/releases/5.1.11/

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index ff3f8105d8..f307c61b0d 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  d3b7a04b581dec5d74769df44e0ddbd1  django-5.1.10.tar.gz
-sha256  73e5d191421d177803dbd5495d94bc7d06d156df9561f4eea9e11b4994c07137  django-5.1.10.tar.gz
+md5  054d6f2ad897359de8378c190d73121e  django-5.1.11.tar.gz
+sha256  3bcdbd40e4d4623b5e04f59c28834323f3086df583058e65ebce99f9982385ce  django-5.1.11.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 8fa2a474e2..94cc2a86ce 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.1.10
+PYTHON_DJANGO_VERSION = 5.1.11
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/73/ca/1c724be89e603eb8b5587ea24c63a8c30094c8ff4d990780b5033ee15c40
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/83/80/bf0f9b0aa434fca2b46fc6a31c39b08ea714b87a0a72a16566f053fb05a8
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
