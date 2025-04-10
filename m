Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167EEC3601E
	for <buildroot@archiver.kernel.org>; Thu, 10 Apr 2025 20:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C995A6F5DE;
	Thu, 10 Apr 2025 20:12:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yQwEgFAf4vos; Thu, 10 Apr 2025 20:12:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 493406F5EE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 493406F5EE;
	Thu, 10 Apr 2025 20:12:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DFAC3108
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 20:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC18C404BD
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 20:12:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o9ox6xlPtaeF for <buildroot@buildroot.org>;
 Thu, 10 Apr 2025 20:12:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6ABDA40593
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6ABDA40593
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6ABDA40593
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 20:12:16 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso13025955e9.3
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 13:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744315935; x=1744920735;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xVyPrJanSdj6cFN2dKdlF/g6OKSlgekqRDGZlkaPnRA=;
 b=n33/iaQ3Uimh/+2e8rc97KuRmezsBnBEAUemGNltfABgy0j5M7XZX7FmygCR7vdtgm
 RZGvYJNXRG9mhoROBwqcrB7EinbGjeVpGR5xCSK3jZeCQf37XGVggcCC9xOuqvTHhJFL
 2eNXVr8eJrCtvv1KhsF5vwvNu9HPC1HELpytM+dhH0l6uHOPErmmtEPE8mvr4w1SY2gA
 BhxC+ke8jwTMh4eOHWDHNh9zHwA+MFvxZI49btsyYzS8prW3EE+cKFWfZ/X5YAaT5zSO
 xSY9VJloc8LwjxKijucDt1P2Atq2LmIUnSYl1Ys45bRdEL/vCVddPV+yPiEgsFRfC3FS
 d2IQ==
X-Gm-Message-State: AOJu0YyCoQ8wFo4aTU5sOyNqI/YK3MD5007iro3y+/T7CbZu2S212Kqh
 mg39HgtlLlTa3TDvUBqG23dt0twoNRp4pxmz8JgBy4OYMyTzi5m2AGBe4jX6NCl5Up6230J1yGK
 q
X-Gm-Gg: ASbGncveIC2UFPJx5Hgep5i5b03+bCofzUSL0JCSydWDR5hpyF+UaGcF3ECi+ATz0JR
 RGhwIhW12n9BqtDI17EF3MM4b7P/ZnG7brqTztFKExzZTlAoPB53HwnU+3oNhQHDVrsiqsIzBLj
 TQDuCqwjRBmU4wJcYQFf2AuAhPskfCptUA2d7g887prlismMfRSeHEhEH2D9DjWqcOT+7xgxx6s
 NKJqwb0eJQ0l0mAngwyqa2Lil979jUUw+P+39WYuDHjW1kvtH5krsLYdiNjgpZt+qmRzKTOJ9ei
 zlZ9g4yrCRBbRox4itedaZP5tK3e+mBQXT3JMbbum4ouvCMou/ZX2k0=
X-Google-Smtp-Source: AGHT+IE135EIYWCoxDabLlFZ5hs4l4DymIMsG4wDtXWNBTyVjXIawr3+99r54smPLG8YWNd9nvmaCA==
X-Received: by 2002:a5d:6da4:0:b0:390:e62e:f31f with SMTP id
 ffacd0b85a97d-39ea51d108bmr48326f8f.3.1744315934723; 
 Thu, 10 Apr 2025 13:12:14 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893611d0sm5634715f8f.6.2025.04.10.13.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 13:12:14 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 10 Apr 2025 22:11:54 +0200
Message-ID: <20250410201154.1128082-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1744315935; x=1744920735; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xVyPrJanSdj6cFN2dKdlF/g6OKSlgekqRDGZlkaPnRA=;
 b=MGXgHlFWSmX2MQZGq72fJ0vs8xqZbmTnAO0SnJ/XPBk2+M4V5AvWJFYaK9YHtOoeqW
 OEvdhhlvW+OlNzKQvKWL/LY6CO8cohQ9Xe8KvElRg1uPL62MRHOiwW6Dw92AhvnKnq41
 8hy/DpmsUhplj5zB+xWo8o1Cj48NDUoBk3K5RWUR2fbCqkdoCcRSq+mr8JOVMx5Pnw10
 +6UWiMTKhPMZoqyM7H6DFBmBokhTL7kAlaOKHvXDoBVtDxoziGBF3JeaOZxTunCfVhOx
 efuPaDOKnyt1IfuOmqdanHju5Vpb9zdg5O/hWbT2tmIlrGcyNmfoDvD4nAwonPSX/Pbb
 7Rog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MGXgHlFW
Subject: [Buildroot] [PATCH 1/1] package/python-django: security bump to
 version 5.1.8
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
 Thomas Perale <thomas.perale@mind.be>, Oli Vogt <oli.vogt.pub01@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:

- CVE-2025-26699: Potential denial-of-service vulnerability in
    django.utils.text.wrap()

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-26699
  - https://github.com/django/django/commit/8dbb44d34271637099258391dfc79df33951b841

- CVE-2025-27556: Potential denial-of-service vulnerability in
    LoginView, LogoutView, and set_language() on Windows

This CVE isn't related to buildroot has it is only applicable on
Windows but this package version bump fix it.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-27556
  - https://github.com/django/django/commit/edc2716d01a6fdd84b173c02031695231bcee1f8

For more details on the version bump, see the release notes:
  - https://docs.djangoproject.com/en/5.1/releases/5.1.8/
  - https://docs.djangoproject.com/en/5.1/releases/5.1.7/
  - https://docs.djangoproject.com/en/5.1/releases/5.1.6/

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 6632246af8..1e197004d0 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  272e951dbc4ccb7854c5a69aa5650749  Django-5.1.5.tar.gz
-sha256  19bbca786df50b9eca23cee79d495facf55c8f5c54c529d9bf1fe7b5ea086af3  Django-5.1.5.tar.gz
+md5  80247a8b48cdac55e5ad3fb682ab71a3  Django-5.1.8.tar.gz
+sha256  42e92a1dd2810072bcc40a39a212b693f94406d0ba0749e68eb642f31dc770b4  Django-5.1.8.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 81d526ca35..b64d8e4cd1 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.1.5
+PYTHON_DJANGO_VERSION = 5.1.8
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/e4/17/834e3e08d590dcc27d4cc3c5cd4e2fb757b7a92bab9de8ee402455732952
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/00/40/45adc1b93435d1b418654a734b68351bb6ce0a0e5e37b2f0e9aeb1a2e233
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
