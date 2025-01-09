Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F185E77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 20:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1073D60A41;
	Thu,  9 Jan 2025 20:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JInGYOspjsQ3; Thu,  9 Jan 2025 20:16:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B15B6074C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B15B6074C;
	Thu,  9 Jan 2025 20:16:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FF7D940
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 20:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B42D40510
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 20:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WJvHt22vZ4GL for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 20:16:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 03CE0400E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03CE0400E6
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03CE0400E6
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 20:16:49 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-844e10ef3cfso88354239f.2
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 12:16:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736453809; x=1737058609;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U47m798/94fjMRziNapEpCfNbrelluDFkpapXPDuVsI=;
 b=NkyfqSHiVWJpn8WP/P7TyLjxc3sXddt66SbGl3Yh+SYxnROiCu1fUV8gswm+GRjYNy
 oCnAhSO3f0n0Ir+0X69fxNehKLQjId5JUIxKYj9TZhNoDlZYSKEemp7VwPvX62kYtIkY
 idO45i0a3bnaM4Yjh5vnKLZO772oxFRIM9G7cGz85W73j4y5ALjZHnrMx1R9aTR/60CX
 VUMAKfiiRKfPl3Reh13fcIb6TOHrYtH/v4WVerVczCim0emL3i3nbelcXYZJJ4byRx4G
 +fto+kq751cjcVgaywW3XdxkazsTamcPWbxK4SRJVemKZw20Mxk+XPH3DZCqA1/F1+Kn
 3aHg==
X-Gm-Message-State: AOJu0Yy5GaVw7F7+jVzhm016+7+zWhB29D9BfXR9AKwhNKLiKf+2ZI/z
 ugjh1tH1adLmAJXLKScBuBPXvAgN2zg1UxtuhuunFiZaP4Y0SugdWg8WGyVip3s=
X-Gm-Gg: ASbGncvWVqPos5QkMhs9c6cLl7fwDB8vtgdWbMa/a5CTJ9GB8GSkgrgrF9ByQ/b9JZh
 N0HXeFeIxNMIDgR7DJN5Z7ZgkCdWFq11OchU39TuAWN4ZJMaW9eB7egcRwR6AcXrUtnZVR/Aj9v
 mMvT3UM/9v4sJH+UWOxLvWnBccr0vR3NNxZ7e5Ozwy3PteyzdlwWSEfJek1lfBensFjm3EINK6L
 rQfDXWpC+aH1H7q6eAE0ifOaxCi5yaefRROVUASvTAt9TcdNA43kOGrAEzuTD0lOq6Kc5lw1puf
 48CQ4vZGo8LSE7iO32ePnR9VufqDImg=
X-Google-Smtp-Source: AGHT+IEYjZwtfwoSh0M/L0cXzqSG1MJC7x0NY70DtNzCBGdL2BRnWuZZI+PSql0vEjOHOad0CbPGiA==
X-Received: by 2002:a05:6e02:2607:b0:3ab:1b7a:5932 with SMTP id
 e9e14a558f8ab-3ce3aa72788mr71580345ab.18.1736453808711; 
 Thu, 09 Jan 2025 12:16:48 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3ce4adb3a9dsm5503105ab.21.2025.01.09.12.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 12:16:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Jan 2025 13:16:46 -0700
Message-Id: <20250109201646.2387085-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736453809; x=1737058609; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U47m798/94fjMRziNapEpCfNbrelluDFkpapXPDuVsI=;
 b=YC2gxe4OMYAy6XlGG+7V1RdyruBr+TZpbJ2aodhxZvLFw31+yr375UDLctD2fZGHWf
 kyDkrxWDkrCDMz0awwmUTGIk07u4RE4NU6nTXIoCRB9DUkbu0uGzsM2uVDaSQ0DPg1r4
 dkwK87gPasaVQJAue+UwWhP3ZnuWsh1g82MfDLcH+XuEidi681QN+E1VbDyF6NsKDkHy
 JYa6WwueGf34XH41ks7/ZUb2ObjFiqEl9cIUKPNrczidvcUtjwpbYxB7rpoAnmd/gnqY
 Jh9/bdA7RWZeCUOQSaUY3mArZd7+TpleHRS40ruRTW2nOyIzf2HEar+XcdBcDnBpetjG
 kRvQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YC2gxe4O
Subject: [Buildroot] [PATCH 1/1] package/python-dataproperty: bump to
 version 1.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new host-python-setuptools-scm build dependency.

License hash changed due to year update:
https://github.com/thombashi/DataProperty/commit/ef109407122cfe4784053e58bb7e25d2e75e2032

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-dataproperty/python-dataproperty.hash | 6 +++---
 package/python-dataproperty/python-dataproperty.mk   | 7 ++++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-dataproperty/python-dataproperty.hash b/package/python-dataproperty/python-dataproperty.hash
index ee5644a7ff..49ce188898 100644
--- a/package/python-dataproperty/python-dataproperty.hash
+++ b/package/python-dataproperty/python-dataproperty.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dataproperty/json
-md5  aca50cd5f543b7831d8a48ab1c02a152  DataProperty-1.0.1.tar.gz
-sha256  723e5729fa6e885e127a771a983ee1e0e34bb141aca4ffe1f0bfa7cde34650a4  DataProperty-1.0.1.tar.gz
+md5  b10a82d8c35a1e69f58b921aa7d7f063  dataproperty-1.1.0.tar.gz
+sha256  b038437a4097d1a1c497695c3586ea34bea67fdd35372b9a50f30bf044d77d04  dataproperty-1.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
+sha256  36289157e371aaae5b5d3ba4be87359ed07548cdc7a9f19ff61dc67cfc536a9c  LICENSE
diff --git a/package/python-dataproperty/python-dataproperty.mk b/package/python-dataproperty/python-dataproperty.mk
index 6cac4f27e5..060de7cab5 100644
--- a/package/python-dataproperty/python-dataproperty.mk
+++ b/package/python-dataproperty/python-dataproperty.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_DATAPROPERTY_VERSION = 1.0.1
-PYTHON_DATAPROPERTY_SOURCE = DataProperty-$(PYTHON_DATAPROPERTY_VERSION).tar.gz
-PYTHON_DATAPROPERTY_SITE = https://files.pythonhosted.org/packages/48/e2/31ffb67d2a9ab4ff70b106e08ad01a3e7696f8d409457042d1eb18244f82
+PYTHON_DATAPROPERTY_VERSION = 1.1.0
+PYTHON_DATAPROPERTY_SOURCE = dataproperty-$(PYTHON_DATAPROPERTY_VERSION).tar.gz
+PYTHON_DATAPROPERTY_SITE = https://files.pythonhosted.org/packages/0b/81/8c8b64ae873cb9014815214c07b63b12e3b18835780fb342223cfe3fe7d8
 PYTHON_DATAPROPERTY_SETUP_TYPE = setuptools
 PYTHON_DATAPROPERTY_LICENSE = MIT
 PYTHON_DATAPROPERTY_LICENSE_FILES = LICENSE
+PYTHON_DATAPROPERTY_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
