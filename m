Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A90CC3DA59
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 04:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 933B8409F4;
	Fri, 19 Jul 2024 04:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8tHez6XoScqW; Fri, 19 Jul 2024 04:56:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 056D0409D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 056D0409D1;
	Fri, 19 Jul 2024 04:56:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 84DF21BF841
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 04:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72740402E8
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 04:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RifVL6RH1M6G for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 04:56:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 22B30402E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22B30402E5
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 22B30402E5
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 04:56:49 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-375e96f5fddso5740985ab.1
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 21:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721365009; x=1721969809;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kwIfg4u6sUpcEMKXMJ8ATMx/uOOyytdIfg1rqTrPduE=;
 b=CUdRka+nneRmleMq3Xh6S6U4kYDy5cj08/IhosNXGi4cJlngNZ+jtkc9krYXFrZ+0l
 IY4BcyrzI/SbKvX5yCZK+rukfrduaZ9uJUAqct9Y9icR0kFoy6glVMjVvLZTgNYaMoWg
 P82DBzN1RkPpuD4WL5xhT6YUd5yeIMq5bkjav+gS4NWFsyBQ2joV+R8kpflHK5F0wG3O
 ROiXiiTHyvIbnkOXdcolgM36rI8f6wLs/Z+Xr4KPTou+ACLEr934tbfg1ehyuzyMKkS0
 GHiOqn2nYlrHLNwR4wXLpCWSIJy6w+Pe3EcCuDbqgnbbHskF5uVlFJaGiLIFDeqKaNft
 5wbA==
X-Gm-Message-State: AOJu0YzbfPG8YVJLA26vRi3wnwmEwhT06vrLS0CLHN0fpeWS0VE2+eIE
 zPQx6PoRBNmdr3F3Ic6xnDPcMzodGsvm2ooBdEfgbAFtqFyC+saGEky8iA==
X-Google-Smtp-Source: AGHT+IE/RNKZEbdtRp3vPOIOHAdrxiutBwadZ6iXTL9CHibOo8CRLCGtivy2WTgUk1OON/kXIDxnMA==
X-Received: by 2002:a92:cda8:0:b0:375:d79c:16c7 with SMTP id
 e9e14a558f8ab-39555cd269emr86359085ab.14.1721365008666; 
 Thu, 18 Jul 2024 21:56:48 -0700 (PDT)
Received: from james-x399.localdomain (97-118-239-252.hlrn.qwest.net.
 [97.118.239.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4c2342bf480sm180600173.17.2024.07.18.21.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 21:56:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jul 2024 22:56:39 -0600
Message-Id: <20240719045639.3336541-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721365009; x=1721969809; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kwIfg4u6sUpcEMKXMJ8ATMx/uOOyytdIfg1rqTrPduE=;
 b=kWd6caLx6Ab/FnYl5gwVHRK88kaQg8v6rkFgU9ibaSzsTaaddTUBJ1/OYX8Of1AovT
 X0QcK0HYm7BLV+IuCETgW6cLC69+Bsvv0OvWfQScvmVrh3NoZ5T+5LnhbleILeRiYLWL
 pkbwicUtfYvl5cgX3tf06B6l4nzBICcpP9Op1m7vvmt4wFWGt1mTitUssa6zGEHKFWne
 s0bMz6xg2/6iVU413QFo0vdFbATpayYA0RWpu/njEvs3k+It9o5NbVWSLZKV28UkaVmJ
 yNF6diGMXsb3u8YvaG1EY5oDZmc7855ill8WD9aqz872RmOvsRMBpeiGWtlPF1TBZaFv
 cPNg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kWd6caLx
Subject: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 1.7.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-maturin/python-maturin.hash | 2 +-
 package/python-maturin/python-maturin.mk   | 7 +++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index 9807260ebd..3c5f836ad5 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  53d51f5e2decca9af248748684aefa9245910757f19ae147dcf566172ecb0907  python-maturin-1.4.0-cargo2.tar.gz
+sha256  56c18b09d38080f9975fb679be1fda01b936d21f5ef233967cda3dd74905e683  maturin-1.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index 37479dd7e7..70cdb15949 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 1.4.0
-PYTHON_MATURIN_SOURCE_PYPI = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/20/90/43a3aa35f037e91582ec7516a92084a71f84e89e39ef580813bed072b154
-PYTHON_MATURIN_SITE = $(PYTHON_MATURIN_SITE_PYPI)/$(PYTHON_MATURIN_SOURCE_PYPI)?buildroot-path=filename
+PYTHON_MATURIN_VERSION = 1.7.0
+PYTHON_MATURIN_SOURCE = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
+PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/80/da/a4bbd6e97f3645f4ebd725321aa235e22e31037dfd92caf4539f721c0a5a
 PYTHON_MATURIN_SETUP_TYPE = setuptools-rust
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
 PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
