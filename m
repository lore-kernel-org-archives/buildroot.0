Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC1AC4706F
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 22:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0921440207;
	Mon,  1 Jan 2024 22:46:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0921440207
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nH1S1vlfapwY; Mon,  1 Jan 2024 22:46:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5919408CA;
	Mon,  1 Jan 2024 22:46:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5919408CA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 834D61BF3D5
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 22:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BF6C41B8B
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 22:46:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BF6C41B8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yx3-6WOOG8YX for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 22:46:04 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D64E41B88
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 22:46:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D64E41B88
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40d89446895so3711085e9.0
 for <buildroot@buildroot.org>; Mon, 01 Jan 2024 14:46:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704149162; x=1704753962;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xmRsF/yNbVXq7/hiftE9ycFKdnLmSto3FoeHqXriBrU=;
 b=c5Spp/aPpMPcRa4dnvrjiRMsZIfe0KDgJ4xsY+K+ifrTublPi9phVXBu116dY5SomM
 8dW1V/r8+/uWuLTWqkW6KrHyfAovXGxQXxbG8tqDGpyhMiKafFhv9Dxc2OmKgLXHsPe8
 2ou5L9z2PndhIg4JpvvYCXtqe3zrsBFlzKldPtpkNbSJ/Tyx+JSchsfCinoTh/bF+crp
 GMBUpcsKGjBjhEllIjPDga+Ct6axYFLduEtuMGEqoL8d8xF/bgJZMjOXrniVvTTZjDeX
 A5vuEiuwNjYl4CAd2KlgK6eJvcSkSHgOVauKoJ9+moD+uKrYE1DUhnBjOkA7iy4PIt0o
 CcHg==
X-Gm-Message-State: AOJu0YwVcClToBFhejmIYFef929OPqU35MkJqktCzkeUjzosmZGbPDCu
 BiUOEWcmklbCTj9AyVeQcdEu9zbF184=
X-Google-Smtp-Source: AGHT+IEU7jokkIydcF7YDIx0oDO4xg3hm08mcsWJiBUWO4/FJi8K6LsuQ288aCyhy1E+/q7XOa+9gg==
X-Received: by 2002:a7b:ce95:0:b0:40d:5c50:f76f with SMTP id
 q21-20020a7bce95000000b0040d5c50f76fmr4587493wmj.158.1704149161684; 
 Mon, 01 Jan 2024 14:46:01 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bh19-20020a05600c3d1300b0040d885bb131sm5747154wmb.36.2024.01.01.14.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jan 2024 14:46:01 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jan 2024 23:45:52 +0100
Message-ID: <20240101224552.69358-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704149162; x=1704753962; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xmRsF/yNbVXq7/hiftE9ycFKdnLmSto3FoeHqXriBrU=;
 b=UWSgGnU+8Nmv55XC7/KnmQUOfvOkjRVDXrpB5rupsUOZra+U3Y8lpVfos5BlD8nf4P
 9idnAoIjaffS5IsVTLGpKj8/AZIAot+7WIjTkA/fLfFglV74qhEOo5/22uSQFjrzyCZV
 hrP2JcsrpSU1QJ9PHYuFw5uRVvVn0dDaFxlPf8/zFQhKVVYSk4MRsYWG7WFtk0K6eLyD
 SqrZwSGE2/zVB5EDSYE5vvhwhXBXG4zG2TcSGO0C9qAMLYXWTFEwIWm016Nk+gUsQ3ct
 y973uJhzBdPU5/GznpdmHQLTZjtKo25Cf6xV9eo1y0EezYX3aRGTEV/RvsbBUAiW4kda
 IgPg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UWSgGnU+
Subject: [Buildroot] [PATCH 1/1] package/python-validators: bump to version
 0.22.0
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

- python-decorator is not a runtime dependency since
  https://github.com/python-validators/validators/commit/b6255c49088cbe6563eb93a7224c86eee04be06a
- Replace https://github.com/kvesteri/validators by
  https://python-validators.github.io/validators
- Update hash of LICENSE file (update in year with
  https://github.com/python-validators/validators/commit/2e0d0ec703eab5c9b0d303d8d318d5389dcef9fa)

https://github.com/python-validators/validators/blob/0.22.0/CHANGES.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-validators/Config.in              | 3 +--
 package/python-validators/python-validators.hash | 6 +++---
 package/python-validators/python-validators.mk   | 4 ++--
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/python-validators/Config.in b/package/python-validators/Config.in
index 8a2ddb49fb..6eb6913ab6 100644
--- a/package/python-validators/Config.in
+++ b/package/python-validators/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_VALIDATORS
 	bool "python-validators"
-	select BR2_PACKAGE_PYTHON_DECORATOR # runtime
 	help
 	  Python Data Validation for Humans.
 
-	  https://github.com/kvesteri/validators
+	  https://python-validators.github.io/validators
diff --git a/package/python-validators/python-validators.hash b/package/python-validators/python-validators.hash
index 4f4e1c21f8..3682850cb3 100644
--- a/package/python-validators/python-validators.hash
+++ b/package/python-validators/python-validators.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/validators/json
-md5  f03b5acb91079450bae664726ae01948  validators-0.20.0.tar.gz
-sha256  24148ce4e64100a2d5e267233e23e7afeb55316b47d30faae7eb6e7292bc226a  validators-0.20.0.tar.gz
+md5  e7b36d935ebafe149629146cbfe5b0c8  validators-0.22.0.tar.gz
+sha256  77b2689b172eeeb600d9605ab86194641670cdb73b60afd577142a9397873370  validators-0.22.0.tar.gz
 # Locally computed sha256 checksums
-sha256  a7fd9d761c7ca1c6508b9baf030f6e21f5752d1caea3e49a270634aa9ef01e6f  LICENSE
+sha256  7c1bdc4712afecb46d402ec79da0ea2877811711e76dbaf1e425ee0b0e331b1f  LICENSE
diff --git a/package/python-validators/python-validators.mk b/package/python-validators/python-validators.mk
index 731aca11f6..09ccbe6ab7 100644
--- a/package/python-validators/python-validators.mk
+++ b/package/python-validators/python-validators.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_VALIDATORS_VERSION = 0.20.0
+PYTHON_VALIDATORS_VERSION = 0.22.0
 PYTHON_VALIDATORS_SOURCE = validators-$(PYTHON_VALIDATORS_VERSION).tar.gz
-PYTHON_VALIDATORS_SITE = https://files.pythonhosted.org/packages/95/14/ed0af6865d378cfc3c504aed0d278a890cbefb2f1934bf2dbe92ecf9d6b1
+PYTHON_VALIDATORS_SITE = https://files.pythonhosted.org/packages/9b/21/40a249498eee5a244a017582c06c0af01851179e2617928063a3d628bc8f
 PYTHON_VALIDATORS_SETUP_TYPE = setuptools
 PYTHON_VALIDATORS_LICENSE = MIT
 PYTHON_VALIDATORS_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
