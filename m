Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FA7C47074
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 22:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9641940207;
	Mon,  1 Jan 2024 22:56:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9641940207
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nUzOxNhqc0yz; Mon,  1 Jan 2024 22:56:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E6D94049F;
	Mon,  1 Jan 2024 22:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E6D94049F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 789F21BF94D
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 22:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 556014049F
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 22:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 556014049F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hIE01pMds-jx for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 22:56:29 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F34A840207
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 22:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F34A840207
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-33731db55d9so1942861f8f.2
 for <buildroot@buildroot.org>; Mon, 01 Jan 2024 14:56:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704149786; x=1704754586;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W93R4gU0wP4CY9jFVq9lgs0q+43WXgHmhhhWpjNctzY=;
 b=fkEMfCew9xQbU9xsBUWgQ1NPUA1M8z9rOV8JWyonpyzZ+xLfRwnBkBh+Cm1GlJWIdm
 IV3sRoTP5wj0uORBZxge3aKZRU5Uy52hp/5/J2B1sir01ecWtos0YxJBHzsYcF4Khhiw
 mpSYM1020yMJctmtDTGF5/zoiVfcLBiOF4O9Gy9uhJwoA15xai8AG/xXo3/JC7YhYQUC
 wigVPex2Mk9a7hfWExCIxjTIedOVRcSiuyDGdbRWB1mOB/tigq80GN2bupEZRCviAkV+
 ronEmlQd+a2zMgQRlqKqF0COYLrMuxWn+SwE1kDUXLkqbsiap/TN12tFUktcdiFtwsoU
 SLGg==
X-Gm-Message-State: AOJu0YxZtRncLHIOqsZOOhlnghie6lxUJZl8QAvrwsbT+IletIDLoEQA
 e54fjSP2ZHxPTMRhD9n2YlrV3h3Xdik=
X-Google-Smtp-Source: AGHT+IE2KaEB8N++X1tXIkWOE9NAv2u8FzmD3msoUVstUy7H0yCLybhqz8OeQsxW1ZPcO+9udb1Dpg==
X-Received: by 2002:a05:600c:154e:b0:40d:5f55:3297 with SMTP id
 f14-20020a05600c154e00b0040d5f553297mr4265462wmg.22.1704149785940; 
 Mon, 01 Jan 2024 14:56:25 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u15-20020a05600c138f00b0040d7b340e07sm12924315wmf.45.2024.01.01.14.56.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jan 2024 14:56:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jan 2024 23:56:21 +0100
Message-ID: <20240101225621.77371-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704149786; x=1704754586; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W93R4gU0wP4CY9jFVq9lgs0q+43WXgHmhhhWpjNctzY=;
 b=KLKBULlLua0rMQ42di/jdUBiRNDvEnB7S/uI3GH7NizvwIUEb5wTGw2xCNBwC/JXyZ
 1Cph7RyTCxbyDTyUAc4uSVPIHAcrKjW4U5l6kBPXlmKOSl7rUw9k2LZah5fDbjdhrrWJ
 MeTiFz88ro85pkgg+qK503Xtwq6rrg6XF5k6knMwbB0ErEFY3cPs2Ko+lhG5oU6cm9mV
 7Hx5fCC4E1RpVQRpqlxxDYOgcdUtMuAuT1bc1NsDFBXFGvshxuMBn3cVQH6NhFki40gC
 ScTUiW6decnHOKYz/I+1fx9cUrcjlQ1kqcGyoCxDXF/TyzkL0nAtMQ6iWtpl7IeQnNbp
 t9CQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KLKBULlL
Subject: [Buildroot] [PATCH 1/1] package/python-werkzeug: security bump to
 version 2.3.8
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix slow multipart parsing for large parts potentially enabling DoS
attacks (CVE-2023-46136):
https://github.com/pallets/werkzeug/security/advisories/GHSA-hrfv-mqp8-q5rw

https://werkzeug.palletsprojects.com/en/2.3.x/changes/#version-2-3-8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-werkzeug/python-werkzeug.hash | 4 ++--
 package/python-werkzeug/python-werkzeug.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-werkzeug/python-werkzeug.hash b/package/python-werkzeug/python-werkzeug.hash
index 07b6f2f40d..34adc67088 100644
--- a/package/python-werkzeug/python-werkzeug.hash
+++ b/package/python-werkzeug/python-werkzeug.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/werkzeug/json
-md5  de26f240d6f95689a8d15170c2d958b6  Werkzeug-2.3.6.tar.gz
-sha256  98c774df2f91b05550078891dee5f0eb0cb797a522c757a2452b9cee5b202330  Werkzeug-2.2.3.tar.gz
+md5  3bb49cd2f2b51a1c638532e9a935e207  werkzeug-2.3.8.tar.gz
+sha256  554b257c74bbeb7a0d254160a4f8ffe185243f52a52035060b761ca62d977f03  werkzeug-2.3.8.tar.gz
 # Locally computed sha256 checksums
 sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.rst
diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
index 3b7c663437..e8ef32bb1b 100644
--- a/package/python-werkzeug/python-werkzeug.mk
+++ b/package/python-werkzeug/python-werkzeug.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WERKZEUG_VERSION = 2.3.6
-PYTHON_WERKZEUG_SOURCE = Werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
-PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/d1/7e/c35cea5749237d40effc50ed1a1c7518d9f2e768fcf30b4e9ea119e74975
+PYTHON_WERKZEUG_VERSION = 2.3.8
+PYTHON_WERKZEUG_SOURCE = werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
+PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/3d/4b/d746f1000782c89d6c97df9df43ba8f4d126038608843d3560ae88d201b5
 PYTHON_WERKZEUG_SETUP_TYPE = setuptools
 PYTHON_WERKZEUG_LICENSE = BSD-3-Clause
 PYTHON_WERKZEUG_LICENSE_FILES = LICENSE.rst
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
