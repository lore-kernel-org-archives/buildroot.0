Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3AAC61DB2
	for <buildroot@archiver.kernel.org>; Fri, 13 Jun 2025 08:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BEB284266;
	Fri, 13 Jun 2025 08:40:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hNbHRNHzZUZH; Fri, 13 Jun 2025 08:40:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32F558425A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32F558425A;
	Fri, 13 Jun 2025 08:40:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17F141BD
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 08:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09B3540518
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 08:40:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9s3exfWTYfSZ for <buildroot@buildroot.org>;
 Fri, 13 Jun 2025 08:40:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7285240515
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7285240515
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7285240515
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 08:40:04 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-adb47e0644dso324648766b.0
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 01:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749804003; x=1750408803;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=86s3qbJnIi1dL1d6xgrBVuXIETxfnQQWBltIH0a3L/o=;
 b=xIFcjxlLIhvcT8HY8YWHTgB5nM5s32Pf3T/iS1H6kSd+C04u8k8CfP2msCVeVNOvRv
 rhlyPKMn/6ZMSD54OYaGTNSNQKapxUenytBXya9IRI0ctuKfESfQkZD7J/UL0D6m2wEt
 o/s/dNTdyENm1LfnJp7Zi+JvGXovQrtVt8U+FB8LEsmistairkYDv8HjzAYjoGGanNJD
 H3kiVoMQafshhInOjtFcuASgkLPywpKP541ssb6rzJgWETfcFG0yzq6DKwUHWGn7AEyp
 SJ2gpoqjCEFCJKGNv2e14u38yICTQrIORkvxGVEUg434rogED7riIe4wjJYMAGLR4B8i
 BkqA==
X-Gm-Message-State: AOJu0YzK9VdDqN1wyAg3FGqcxAoyogcyXZXjyT44GIUKlUsOo6wkGKA6
 NdfcKT/JTVC7DfNcNepB1JYhQtRo4c7JnyFQ9IZxtC05+6mTU3yEqwDx+y7DPteNLWbMNM3cnH2
 pOq5T
X-Gm-Gg: ASbGnctnNsajlOst0ty8eBXDidFtqbmjT0vPZxKmW1/wNQD2CSf9y1Y55q1di6yRs4M
 /cgWNBAThorDJmKyQWrTs4RjoQkLYXowxOpfC57srqWmX9ooEKZw2ujpGA18NMI0K+RJZqLByOx
 kT/mIDsMMN72KpDJqNkz4uzRDKTfgJ3pa8s77rfO6A3bsT/LR4Emb44VMtfTR3gfKFYmiqjaYz3
 XiHdT5jicj7v58ezsfcZFgr6zRiGlVt6R8q+F3h4c9xUt/1SQLuwN9mj2w16pyvH9DKurJJAbp5
 5HrxXtQNpTdY31mMJ6iM3cY8NTj5v2s8Eb3o8PmNK8Pp+oRQPtH38Mug6gkT9LzQTCd89Y+Cfdk
 =
X-Google-Smtp-Source: AGHT+IGJ5wU9MwqMSSxkOXVNzwIGqVglxhhnDXpchbgIG5Z3bvI4nMsbGMcwU+Ut9rCH25RxaaQmyQ==
X-Received: by 2002:a17:907:7f0d:b0:ade:4800:402a with SMTP id
 a640c23a62f3a-adecfd40e5emr153383166b.15.1749804002661; 
 Fri, 13 Jun 2025 01:40:02 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-608b4a94d18sm865368a12.67.2025.06.13.01.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 01:40:01 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 13 Jun 2025 10:39:41 +0200
Message-ID: <20250613083941.2223627-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1749804003; x=1750408803; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=86s3qbJnIi1dL1d6xgrBVuXIETxfnQQWBltIH0a3L/o=;
 b=NKrMCErClBbn+Q6LE36DczvP2plpzdJU8aJGDbqfmv+XfR4YM+GH9G69f+IsZ5cG3M
 uu7UPw4IVYuxEM55ouw2zOyWiW1ze1BXA5sskM+6BndSMa7IF4Coe1hsPvJd9T5xrkXY
 HAKz00qu3tD9Q7bTAplUMWmbc6L8WYBhIh8fJIzjZv1IqdisB9HcyVjT3AAEnLIyHGpP
 +2a3hluxaISoA99wioRFEotY8A3MksTbVT1E9LHZI06ZogsT3D981Tv9OCacHZYTVuAB
 M/QAv+vpNNKFn9aF/c2gWL8oqEbk7U3j9Qx750/Jl4VP7iO/uX15PJbQTy0Tz11gQbzH
 eM+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=NKrMCErC
Subject: [Buildroot] [PATCH for 2025.02.x] package/python-django: security
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>, thomas.perale@mind.be,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release notes: https://docs.djangoproject.com/en/5.1/releases/5.1.11/

This is a second fix for the following CVE:
- CVE-2025-48432: An issue was discovered in Django 5.2 before 5.2.3,
                  5.1 before 5.1.11, and 4.2 before 4.2.23.
                  Internal HTTP response logging does not escape request.path,
                  which allows remote attackers to potentially manipulate log
                  output via crafted URLs.
                  This may lead to log injection or forgery when logs are
                  viewed in terminals or processed by external systems.

See https://www.cve.org/CVERecord?id=CVE-2025-48432

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
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
