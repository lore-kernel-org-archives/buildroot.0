Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A53ED5E37F
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 19:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB1C160722;
	Sat,  9 Nov 2024 19:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sj2lmIkcNLIN; Sat,  9 Nov 2024 19:24:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5AC860723
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5AC860723;
	Sat,  9 Nov 2024 19:24:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EE08D8F
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 19:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F3C84036F
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 19:24:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xf9e2cAeIoQM for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 19:24:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 14ACE403B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14ACE403B8
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14ACE403B8
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 19:24:26 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3a6c2077afcso10880875ab.0
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 11:24:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731180266; x=1731785066;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P+y7IP23aVIE8BOJYEQGjMSmGELRNJrTpJ/TKqvbHGY=;
 b=a6/4Wvu04I37nKf+vc9ioJW1C5JJAxl0IZotGqgwqi8aNSBKLH++vPt6bAyEG+aBtt
 fRJ/sPIDPsz/wXBmXHK2Yeuo3Mmkl4TOKVy8tzbh3XTt6DIg46LF4s1+X/4HgzURX4EU
 Ra/1P/NnsiqmWoWC+Tjh7Rp3AWH6Vh20mNstp0ZzJqHugVqYi69PVks+wFKaa48LxG2N
 5rhvWC2ytUveOLfcB0/azn+cYxCEuSOuMwz34wX6Sm4M0kOhI7GgHRd1YV4J5Fxieu8J
 7gVZ8Uzib3qbEfuUXmu/2hW2P2hRpeiysilmveqbKe1rZxIZU7dbraBCXc7Oy6TUMs0W
 PzHw==
X-Gm-Message-State: AOJu0Yw47q5QwdiP8KCmffceBzrPhnr1dBJXShuBFqUn4ygeoaUwVlsy
 Osr/xnYbVDQAZfq0hTKhp15ocrCxgKVmhGliATHunW1W08LEeygmEYLF8w==
X-Google-Smtp-Source: AGHT+IFqEwCkMmJwgWtrrIPQfktk3hJ0rHx+oDCF54UWcDgbx0dlIMeGuKAmge2T88lIY+FotS3QNg==
X-Received: by 2002:a05:6e02:1b09:b0:3a1:f549:7272 with SMTP id
 e9e14a558f8ab-3a6f1a4548amr81548975ab.23.1731180265863; 
 Sat, 09 Nov 2024 11:24:25 -0800 (PST)
Received: from james-x399.localdomain (71-33-148-91.hlrn.qwest.net.
 [71.33.148.91]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de787155d7sm448933173.32.2024.11.09.11.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 11:24:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Nov 2024 12:24:24 -0700
Message-Id: <20241109192424.798342-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731180266; x=1731785066; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P+y7IP23aVIE8BOJYEQGjMSmGELRNJrTpJ/TKqvbHGY=;
 b=RGTetDCfvDw5sXoTSmlV0RFxGKgEsiIb9K6r7OAqRapUUZ/oA3Jg5Q438Iz83lNTSX
 F11P/pIfhz9Bph3HggSKxPtZ2EKTT4rJJ5c1IcYRrExXzdJs9RQutoceGLVxwONHxUyD
 +da+PgmpDIEFBz6quj8FEQ2gKKnwYNGQaCYySE0TlEfn0G+2FE4xUXicATBMVU0iz4Nn
 AkFKeJppmoGQ0RrPXUNwWpaJAlZqAE+u4u0SkOvR+dl2qHm9bVG6AChb0W8EI2MP6Wxa
 MbEdfj1GmfzwZoLsfrDRkmDXxfQIEt0aV+RNXW3/dtgRjSILBEHeFOz+hOPm4BqDhsH5
 RFFA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RGTetDCf
Subject: [Buildroot] [PATCH 1/1] package/python-werkzeug: bump to version
 3.1.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-werkzeug/python-werkzeug.hash | 4 ++--
 package/python-werkzeug/python-werkzeug.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-werkzeug/python-werkzeug.hash b/package/python-werkzeug/python-werkzeug.hash
index 2e6e76baa3..29621bb332 100644
--- a/package/python-werkzeug/python-werkzeug.hash
+++ b/package/python-werkzeug/python-werkzeug.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/werkzeug/json
-md5  6fd3f04f07bed8ee00bf417b68544849  werkzeug-3.1.2.tar.gz
-sha256  f471a4cd167233077e9d2a8190c3471c5bc520c636a9e3c1e9300c33bced03bc  werkzeug-3.1.2.tar.gz
+md5  b6005d403d01d08b9fe2330a0cfea05a  werkzeug-3.1.3.tar.gz
+sha256  60723ce945c19328679790e3282cc758aa4a6040e4bb330f53d30fa546d44746  werkzeug-3.1.3.tar.gz
 # Locally computed sha256 checksums
 sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.txt
diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
index 141d9059dd..f9b6a6c27a 100644
--- a/package/python-werkzeug/python-werkzeug.mk
+++ b/package/python-werkzeug/python-werkzeug.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WERKZEUG_VERSION = 3.1.2
+PYTHON_WERKZEUG_VERSION = 3.1.3
 PYTHON_WERKZEUG_SOURCE = werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
-PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/9f/e7/58868f1a95bd6f2ffa0a26af212675fb74be2a4c4bfa3541077b0ca14ad3
+PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/9f/69/83029f1f6300c5fb2471d621ab06f6ec6b3324685a2ce0f9777fd4a8b71e
 PYTHON_WERKZEUG_SETUP_TYPE = flit
 PYTHON_WERKZEUG_LICENSE = BSD-3-Clause
 PYTHON_WERKZEUG_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
