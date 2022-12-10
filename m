Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BAE6C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 16:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2137581779;
	Sat, 10 Dec 2022 16:58:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2137581779
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zpnepp7N9Tqc; Sat, 10 Dec 2022 16:58:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52C098176F;
	Sat, 10 Dec 2022 16:58:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52C098176F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A25DE1BF59F
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 16:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D59960736
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 16:58:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D59960736
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MftHSgQ9q3nW for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 16:58:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9750C605A1
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9750C605A1
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 16:58:07 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id r72so3676930iod.5
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 08:58:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0fUF0UCuMKNGDHfqmJJlMp0KskorvVQAdvnzkw1QIJ0=;
 b=reQLy7tIrUCRVGwzZ9V8OUI0egL3mtYFtfAgL5AS+KhPL913MB1edk0mUIhFSje+Ph
 F2Y1oQFCxODXtWT++OMFSd2rqqNo8MKzVxhDSPg1sCb556x/H3fFWkoadQstu1jkhQ9o
 egezDV/CFfskyLcaGaGYguED8f0k8VmNL2BF6ryKAe9w0u7rWw+wF1w91ySoOUe4J8Or
 SGZs5I6U19E2LKWz9ayFCT52QCL7O1MncDiPJgWELy59rZB/NFnyZetuPsk0iypS7r7v
 M7f4WolSxUgEqLXxf5TW+GqTwphB/yocPZMQV6HJJpXz2hrBKYgZqjArlRrTMyy7vsHM
 EbWg==
X-Gm-Message-State: ANoB5pk5GRSZiLe6/aQui1vy+ujiEeUsJhK7WNQXLuzAUXaod7GWF/6f
 de4WUSoODO+8osAL05DZYzKwDAXoNdvNoA==
X-Google-Smtp-Source: AA0mqf4a2dcUEd+ao51kQhiXOHEPdDvCnc0YhdG6ipjOKP5f+Dfb13B1HnzNJ2pJKS66QZ/pxYAAVA==
X-Received: by 2002:a05:6602:2289:b0:6e2:dc1e:527b with SMTP id
 d9-20020a056602228900b006e2dc1e527bmr4514208iod.19.1670691486470; 
 Sat, 10 Dec 2022 08:58:06 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 t4-20020a5d8484000000b006e2f2369d3csm299672iom.50.2022.12.10.08.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 08:58:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 09:58:04 -0700
Message-Id: <20221210165804.2571879-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0fUF0UCuMKNGDHfqmJJlMp0KskorvVQAdvnzkw1QIJ0=;
 b=B09N3xdPREGDGRhxX3lGZTTUBJjtLQWK4mLMybyeipNcqgaHMxROj/dvfNVd0ADNCl
 JWjN2xYUlfYcdIPyHoyYoKRe84e7wVaWc0L07XpraDsa9BuVL8flkBCzgpSEdpaKURvE
 m6fbwUHqwHSuYRxwYBQkFLNxpHq6h+Q2+/GcSbJIItPFQoE0iNm6eYi7WsVEisGc23HO
 FK26UfPNyTqZs/a9Lrm0eOrLirjH+GG8p62Nzp/ywEJbmzcsrgQZspf+jWuwa8wt5k0l
 C8ttTmvSebTeRJFF+UFGmQYkhYCIQIpjgW6iF/JHjFzFzF4O6u7+70gt4gowNXrnb3jr
 ZQ+w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=B09N3xdP
Subject: [Buildroot] [PATCH 1/1] package/python-django: bump to version 4.1.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop no longer required pytz and setuptools runtime dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-django/Config.in          | 3 ---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/python-django/Config.in b/package/python-django/Config.in
index 8ffceb7275..5830cadc93 100644
--- a/package/python-django/Config.in
+++ b/package/python-django/Config.in
@@ -3,10 +3,7 @@ config BR2_PACKAGE_PYTHON_DJANGO
 	select BR2_PACKAGE_PYTHON3_UNICODEDATA
 	select BR2_PACKAGE_PYTHON3_PYEXPAT
 	select BR2_PACKAGE_PYTHON_ASGIREF # runtime
-	select BR2_PACKAGE_PYTHON_PYTZ # runtime
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_SQLPARSE # runtime
-
 	help
 	  Django is a high-level Python Web framework that encourages
 	  rapid development and clean, pragmatic design. It takes your
diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index b9ae8a1da1..40526bc0ff 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  60c54c37ecf9e5e635ee6bb07a13a9fa  Django-4.1.3.tar.gz
-sha256  678bbfc8604eb246ed54e2063f0765f13b321a50526bdc8cb1f943eda7fa31f1  Django-4.1.3.tar.gz
+md5  02e2222d064d800f37c6a0ba78ce87f3  Django-4.1.4.tar.gz
+sha256  d38a4e108d2386cb9637da66a82dc8d0733caede4c83c4afdbda78af4214211b  Django-4.1.4.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index c90caa9635..96ec53f82c 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 4.1.3
+PYTHON_DJANGO_VERSION = 4.1.4
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/d0/ab/33f9c2bd4cf7ff2d319131eca7231247f962f781ebc8a012ebe02582244a
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/de/7d/ca5d224f7d345b0defd0a57c6deb0c6115fbe5304e4d9571f728b617f1a3
 
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
