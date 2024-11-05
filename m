Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0702ED36108
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 19:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B749F605C7;
	Tue,  5 Nov 2024 19:19:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bcVAzND19Lkj; Tue,  5 Nov 2024 19:19:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFD2860878
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFD2860878;
	Tue,  5 Nov 2024 19:19:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C74023B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 19:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B462140363
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 19:19:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id imWZNP5PbNp8 for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 19:19:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 82ABA402A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82ABA402A8
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82ABA402A8
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 19:19:33 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3a3b7442db5so19000145ab.2
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 11:19:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730834372; x=1731439172;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=diuB0NP+5zTkmO/q5p+l4GH2MKdy7FtfhFYf/IWUk+4=;
 b=RtaGCLQpQBaUtIpfKz5SBGtKp8sIgTLUUjxucLlTKzywi4B1H5fWevcq+i5k4iwOcU
 rlZ63KqX5MRligdp4lKrVpnu/KdNxJs76oYNSBANtcIIF02O+t6yFgvWbYboUpeQvoC3
 fvkN0YqQa2GF8S2TKdo6nFjyGFE591eGgfCiTRmXjVmpLNK9QA7ket5XcZrGbA3rYaA5
 zF1PZubIG77xaKLoCX6CjRdZlaJZUQXzp/zL5P1K9U6/pjrqumkdqVKCP9qCH63znFsh
 4x3KvNXV3o9VAOrzUeIpfqYOL06XkCXzC68ZtWGVbBa3FPyBNDPWeUH8UHADzdakn7Sb
 2Qhw==
X-Gm-Message-State: AOJu0YzlizKQOKyqj9JRA++Sekq7vS56gB+yQt+IP3hnV9ocWXk63gs+
 jw14DgD5hULK0TsHTY7pG+BaR5HshmNLEt8azmVrbg3UATvQqt79hfWVTg==
X-Google-Smtp-Source: AGHT+IE1R3K3Wj29BoI8dtz8tD8UftvrwbJ+aMxTetMS6YMoEnMz4OipYQuKi/JWVIFktyOHv065zA==
X-Received: by 2002:a05:6e02:1fc3:b0:3a6:b0a3:5400 with SMTP id
 e9e14a558f8ab-3a6b0a35a3bmr173708485ab.16.1730834371959; 
 Tue, 05 Nov 2024 11:19:31 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de04887f79sm2505171173.7.2024.11.05.11.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 11:19:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 12:19:30 -0700
Message-Id: <20241105191930.1584051-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730834372; x=1731439172; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=diuB0NP+5zTkmO/q5p+l4GH2MKdy7FtfhFYf/IWUk+4=;
 b=giRocOoKhzkzN4RlqDiT+7rpPbZiWj/9hxYXN3//XL3x2Mx08a+9kP2nO4nUqlg/rN
 jKErvCyg22wDS3nC8XgH8mits4mrNd2hegZbLfE9F0hHUX8KVmXciyxqrBM/SVs5iNvv
 0l4P9JEr2q6kilQ86w8j+D01oipCAIOOa7TqLq3sLsr57kE0XbYYR8afHL7USm+tmQ08
 nJukDqSHZVJzMys5yhKRsAh8gPRzMOwX16BnU9LeL/viwsc3CPKDXKDyuA4HOwTCuWgj
 0e0rnVo1By9QwkNUTgMkrm1hwi4F4SGbarh2y1bEr/evWBzFkzI6JyOTntTNPpYUBm/x
 TwoQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=giRocOoK
Subject: [Buildroot] [PATCH 1/1] package/python-werkzeug: bump to version
 3.1.2
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
index 927400f833..2e6e76baa3 100644
--- a/package/python-werkzeug/python-werkzeug.hash
+++ b/package/python-werkzeug/python-werkzeug.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/werkzeug/json
-md5  6d7c384dc2616f434be9893bc1ae4452  werkzeug-3.1.1.tar.gz
-sha256  8cd39dfbdfc1e051965f156163e2974e52c210f130810e9ad36858f0fd3edad4  werkzeug-3.1.1.tar.gz
+md5  6fd3f04f07bed8ee00bf417b68544849  werkzeug-3.1.2.tar.gz
+sha256  f471a4cd167233077e9d2a8190c3471c5bc520c636a9e3c1e9300c33bced03bc  werkzeug-3.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.txt
diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
index 04e345f422..141d9059dd 100644
--- a/package/python-werkzeug/python-werkzeug.mk
+++ b/package/python-werkzeug/python-werkzeug.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WERKZEUG_VERSION = 3.1.1
+PYTHON_WERKZEUG_VERSION = 3.1.2
 PYTHON_WERKZEUG_SOURCE = werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
-PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/32/af/d4502dc713b4ccea7175d764718d5183caf8d0867a4f0190d5d4a45cea49
+PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/9f/e7/58868f1a95bd6f2ffa0a26af212675fb74be2a4c4bfa3541077b0ca14ad3
 PYTHON_WERKZEUG_SETUP_TYPE = flit
 PYTHON_WERKZEUG_LICENSE = BSD-3-Clause
 PYTHON_WERKZEUG_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
