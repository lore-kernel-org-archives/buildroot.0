Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5E7E7719C
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 14:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCCB260605;
	Fri, 10 Jan 2025 14:17:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xcNZ4X3sEIQk; Fri, 10 Jan 2025 14:17:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFB10606F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFB10606F6;
	Fri, 10 Jan 2025 14:17:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A4885940
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 14:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7216B407D6
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 14:17:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BBYGJU8hPVNH for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 14:17:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3D0E8407CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D0E8407CA
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D0E8407CA
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 14:17:21 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3cddfa9a331so6796485ab.3
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 06:17:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736518640; x=1737123440;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J+E3rK+pAV9i1034E0K8Ki9dbv0lNOGogaxvdRXm+Aw=;
 b=wBR904oog5I71y8/wzRV6g/ZF8wbkiSDu7oma+Mb7ECUDF8AIUPXHViZKpuMCjt2S7
 oqeOYsz5kbubv+aHW39yyOafo0VJQZ8MRzAl3/4NBgCUfqj5Y1o8utWFPMF6++m0e748
 iKQUa/BptfwF+VSs6NMzdUW0H7DF9Q5V/L+O7KaxHshyBGUF+T6Bcpi2h0DsYMDG87ql
 gvr+wJN5ldHtqkmxKDdvhc/BBJody3cyCffJqan05HyceEziZUa8FkiHhFlbAOEeBlZQ
 WFWBvJaswaM/A9eRWW8SaKiEwvYfnCQo0Y/JAthLSFSDdnuCJlWOPUyu8Ozzt1Emm+M3
 82xw==
X-Gm-Message-State: AOJu0YyZhIR+GVSUaLVWwCE2ANS9nhz64k8PQM+VDBgg1SIEZicqZDYl
 eKYnkmciE+k7frZkDWi4eQeNZIPUdZafETbMr5BlCtfXxvS30R11n7MOs6rvAWI=
X-Gm-Gg: ASbGncupr+S7LuAIJLcoWDvTaXSw5IBByCxx/RnVBdxGyFe2Pa7xVRdiDORVf2XI8TZ
 bsW+AJGq4lmuvRjIsQsyaTScl2j3K+AN9/RRu3VgXP6iECHJDsiVN6lyUYFyZwYPgGlP3qSHGZ3
 LSoWd54ugWpRrE/9vthQ3PR6x2pc7g/FpVs41Ab+yBnxPpGcsH3KZfQVP8GttbTApuT4T4xQb7Q
 riGob0Oi3rdHKQrXdWYkuca58tn/w3EBuB/VuoN0abRfGFewaIwlS2yyeg+6AYmfxmfZHtWvAqN
 3Aca4HxSWPaxR0SLwvWRKuUxdwLjdh0=
X-Google-Smtp-Source: AGHT+IEVr0ear3ygCC9vezB9VGdPVtdtGhV9+8q3UHgCx5RHauMxz5c1n8btW4JryzjLOLOhjptIGw==
X-Received: by 2002:a92:cdab:0:b0:3a7:c5b1:a55c with SMTP id
 e9e14a558f8ab-3ce3a8936efmr78857285ab.0.1736518639750; 
 Fri, 10 Jan 2025 06:17:19 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b745ca3sm915032173.126.2025.01.10.06.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 06:17:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 10 Jan 2025 07:17:17 -0700
Message-Id: <20250110141717.2434937-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736518640; x=1737123440; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J+E3rK+pAV9i1034E0K8Ki9dbv0lNOGogaxvdRXm+Aw=;
 b=Lc+mKpqu4SKQyF9gfA7f07rr710HUc05XwngonrWfdXo7pMC+FuymvxenEmDUllv0v
 2pTlqxIXOLA8Khlo8z4+A5oYDhSfwPneQt5s06hkmomZKwyBwshErY2nBG/7K1VGwEwy
 MqFaTEkxUtJatbe/f3/VFVGXHKXZuTM1mgiewdoT3tD4lVEXWo1KvnNIGkfm/aPBKMu6
 6eSqadYdBqCm3RuZ76njSlChSMu5WP7f3axk24TdXU5i4TlvNE2vn0RGncM9XA4sclKz
 +o7Va+oaGM683AeBi/ywZj/54/Z9Hupf6RAwWBDCiIyuA4dUspsruQ397azgIrsNGHLJ
 braQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Lc+mKpqu
Subject: [Buildroot] [PATCH v2 1/1] package/python-jc: bump to version 1.25.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - don't add new dependencies which are not actually required
---
 package/python-jc/python-jc.hash | 4 ++--
 package/python-jc/python-jc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jc/python-jc.hash b/package/python-jc/python-jc.hash
index 75d64da7bf..d8ee918ac7 100644
--- a/package/python-jc/python-jc.hash
+++ b/package/python-jc/python-jc.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jc/json
-md5  7e9454e01eafa7c8c6e415fddc7d2638  jc-1.25.3.tar.gz
-sha256  fa3140ceda6cba1210d1362f363cd79a0514741e8a1dd6167db2b2e2d5f24f7b  jc-1.25.3.tar.gz
+md5  77e798f2c3fbe89c0dbf7b31dc35fc69  jc-1.25.4.tar.gz
+sha256  a32eaf029c56b582dadae48895f20784d0f84f2fa28a8e2b32f377a8bffa8b39  jc-1.25.4.tar.gz
 # Locally computed sha256 checksums
 sha256  6493f2db400f4166ca0956cf192a41aa092bd1396ff463e7fdaf51f257c10497  LICENSE.md
diff --git a/package/python-jc/python-jc.mk b/package/python-jc/python-jc.mk
index 202884f3dc..9a3754a0fa 100644
--- a/package/python-jc/python-jc.mk
+++ b/package/python-jc/python-jc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JC_VERSION = 1.25.3
+PYTHON_JC_VERSION = 1.25.4
 PYTHON_JC_SOURCE = jc-$(PYTHON_JC_VERSION).tar.gz
-PYTHON_JC_SITE = https://files.pythonhosted.org/packages/a5/82/bfb1ec7d9667bc2f922254bc62e12fd460a5de3b711518f5089df0a17180
+PYTHON_JC_SITE = https://files.pythonhosted.org/packages/5b/82/146ef4c94297ef87c6a732c92dd57761bea2c2179e1b8ca8a6b9b8dd6ff7
 PYTHON_JC_SETUP_TYPE = setuptools
 PYTHON_JC_LICENSE = MIT, BSD-3-Clause (bundled pbPlist)
 PYTHON_JC_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
