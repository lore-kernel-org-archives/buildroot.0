Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630CDD5E378
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 17:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 159B942B8A;
	Sat,  9 Nov 2024 17:10:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AMoiw6abf_Sn; Sat,  9 Nov 2024 17:10:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C501342B8C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C501342B8C;
	Sat,  9 Nov 2024 17:10:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F3B6D92
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CDAD400BF
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:10:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ooaXsFjax9wG for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 17:10:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DEB70400D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEB70400D0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DEB70400D0
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:10:23 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-83abc039b25so120649939f.0
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 09:10:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731172223; x=1731777023;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tB4axNQiQKiv7nFO2dJ5IxRoBVZ+URSdvi96JuKT+TQ=;
 b=iojhhXxJi6BwVo08GyATmVKgabIGjW2y92WtFR1AXbuCeo5seOP1tKvQ3cNQiAKAO5
 kbYKnuSHT8PAEMoarGvV5AItkBp3tJ64lAbXgBci4EvKD8nOc9X4UwPHSghbllTRrEKE
 tbotzWwYckj5SCZCSHQMv4okmzZoDV4rfTg6A+lu3HizUM8izLN3O/d2zmpBWHwBifWa
 9FVrSKtfbdbESkQQFZz+OWeD3WBFQos5qqzIF/uobtAb+4E/iEMBXNSbQXHPXS2OJbMY
 rtYIYuJx5O8LDsvXH3oP16K+X9YT4pt89Q0PGeR5FeZDDIQinrc5ti2pp1hQgVbBxeLC
 93+g==
X-Gm-Message-State: AOJu0YxsEPNd+zQ6nzh7ETThoBmzrshxj8xTjeyoHVT5HwgPKUqU/9ta
 iCu8Zo5b4+OmHhV2lr1W/ddXCTsOOp/8FupKmwwQ62eFpTAkk3TZoqLC9iLZ
X-Google-Smtp-Source: AGHT+IEArF41I6yeeHPGuE356cs6roQPhGY7VXX8iaRn6MG6gvS73/x5gTw9Y3AT3bJwnGP2JnkHVA==
X-Received: by 2002:a05:6602:14cc:b0:83a:a82b:f856 with SMTP id
 ca18e2360f4ac-83e03294ac0mr677244839f.3.1731172222761; 
 Sat, 09 Nov 2024 09:10:22 -0800 (PST)
Received: from james-x399.localdomain (71-33-148-91.hlrn.qwest.net.
 [71.33.148.91]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de787d706fsm419608173.84.2024.11.09.09.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 09:10:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Nov 2024 10:10:18 -0700
Message-Id: <20241109171018.591895-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731172223; x=1731777023; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tB4axNQiQKiv7nFO2dJ5IxRoBVZ+URSdvi96JuKT+TQ=;
 b=K4fLZeKI/4gQEJkLmqfeGrYDN7v39gN6gA9js1hvexqdeALZxWxYCe4ab/GCg2L5LU
 ufFRuMe2eS3ooz2arY09TbLwcqOeQBu7KCF09JPMTEtAkV1AJ2bpPm/FXBy7AkOC8Qv4
 QiMr1kUZG5o/D2BFKBXK1HGQMow2RJrYF1ag7nuiTkC3zMNotGUcljVQDuY0fQAUrVFX
 6uh/VOcYjlL5b2J/htWFbUSYpXMpbr2t5DvcOmxWNmml7VxY4qvRirpJWw7yj/ucwpBr
 N/WoShwzCPwgY6cfRgoL9mjQ/Ljufz9PBJ7kfopbNweu7dMnXslr2WceFrIxXHUFv+Fi
 Rblg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=K4fLZeKI
Subject: [Buildroot] [PATCH 1/1] package/python-django: bump to version 5.1.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 2d0b0d46fd..656d9eee9a 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  bdd601132b94080200e71137a20d0d6a  Django-5.1.2.tar.gz
-sha256  bd7376f90c99f96b643722eee676498706c9fd7dc759f55ebfaf2c08ebcdf4f0  Django-5.1.2.tar.gz
+md5  3f556d14e7999a9700a27a325efc0833  Django-5.1.3.tar.gz
+sha256  c0fa0e619c39325a169208caef234f90baa925227032ad3f44842ba14d75234a  Django-5.1.3.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 8fc95c8417..6588acc31d 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.1.2
+PYTHON_DJANGO_VERSION = 5.1.3
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/9c/e5/a06e20c963b280af4aa9432bc694fbdeb1c8df9e28c2ffd5fbb71c4b1bec
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/c6/85/ba2c2b83ba8b95354f99ed8344405d9571109ce0175028876209d6b93fba
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
