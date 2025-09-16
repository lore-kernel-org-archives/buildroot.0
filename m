Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C2BCAC597
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 00:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96813814DD;
	Tue, 16 Sep 2025 00:33:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 76uavXU2oRjn; Tue, 16 Sep 2025 00:33:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE75E81393
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE75E81393;
	Tue, 16 Sep 2025 00:33:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 01D14199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDB894031C
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:33:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HyfNjEiWrLQ5 for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 00:33:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 27E0440124
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27E0440124
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 27E0440124
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:33:21 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-4240784860bso6653915ab.1
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 17:33:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757982801; x=1758587601;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZIL9SXcnEdnZ3eTPPkAnIUIQ4z7QSQwvNQJECCnp/sQ=;
 b=Mvl5++/AilKxmvuBc1JbWa1hc/GfJg3LoGxZwOV/8SkqWgiZ7uisOpBqtmkeuBEIvH
 OBKLbhfmVu8cDDY2cVGiOK5pKL9d3FhWXrMThbnZNIuLqDI5vIdlqi0ZZN+IuY6ECovY
 INyN/eUKtghhzGcjfoOtD7M9aElXi7xQI/Lyin/TuwBM0iLUWmYGpG0lSAxFvcf8fY1s
 fstghx1H10WPl4agCaSy9gcltEoAkNE45uNo6UIcSixeN4K3g3HoYn0oCfgV8Dl6ihCE
 eBVfYBbC2AfyAkt/SfdWvo56RwDKc6o2oWxfAUwL6G0pbBSPoNLcQW/nSm7qe4KsspX8
 9fEQ==
X-Gm-Message-State: AOJu0YxNkWRRHxido5P5gvWmS6wDIMHg/WAtYJDTWQrjnQsVstOdg9vb
 Nhwu3IW0nceMmr7bYCkPRrY/Wgt9S33dIYfxmylY+CmVfVBhQsy7tv9BshNuQA==
X-Gm-Gg: ASbGnctz0crh6w/aCGetcj9TH+WLmIMHlNSN1Y2T6kbt97v0ij1NtWMMQuzny25DI9v
 2ZUPLKte+Nnnm90KVgJXsupAKgnPTU9BMwlX6s+Cd4oDpWpMRyNBtex27ExH0S0vWFwVbG6EaUg
 MPVpkRbyM0BBLFliHjYbzN5lYSriuiPuSKr4vlFzA/+1Yg43+ysYjBYCZoqPUS1C7/ImtapFE40
 OPIhqjRIC+vuVACCBfqyvGF7pdCEUkIa6cB15aLzFcG06pTStsUwVSTPMmWuM3UnsJzJpl2zCqq
 LnR8Hv5qkTBu1dHDTAS05gLIdCm/Yk8ESStjwuB/k6mkTLa3VbVaX3C9xXThpPLdw2O+jA3E75a
 fpIz6drcnffP24RmfFi4wtUPhjQ7wsV9FC3a9oZi2+RvGa7CAe88OzI4jBxqlaDSlbYrzFNMvAN
 e+a2QtRwJVZoA=
X-Google-Smtp-Source: AGHT+IGVlfRHwHDXcEr5W3NAta3XfAHWqzD6r5PhGmatyfQbgmupEGZ4zKAcliqVWOw3G+nJCFJYHg==
X-Received: by 2002:a05:6e02:19ce:b0:40c:6b06:be8b with SMTP id
 e9e14a558f8ab-420a3027132mr143563815ab.17.1757982800550; 
 Mon, 15 Sep 2025 17:33:20 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-511f2f39863sm5287295173.22.2025.09.15.17.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 17:33:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 18:33:19 -0600
Message-ID: <20250916003319.2510050-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757982801; x=1758587601; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZIL9SXcnEdnZ3eTPPkAnIUIQ4z7QSQwvNQJECCnp/sQ=;
 b=ZlEXo6F8zPcr3Q0aEvmclaGnVvwcuhs1O0oP2zmaul6w1hzPiZLeLKqO1LjefIIQYQ
 wZOLbjk+rcq7jjqcrACRhttC7VdN/LKxR8C0sta6UveUrMEWW0RGzgPowfLMWSzzXhI4
 6lHK9mkxN5k4vpXxlPmP/HY/+WqBmfTyCeqyNebcUb21gZkuIcgzYrqxMTa65yF1vOQd
 Vi4bjlFrX7ZG9j/e9kT/TjpRznLMaQdZVAWB9ouEAH7Bl/rylHRT6FlPVeLuNSLk3O0G
 GT63heGAcMtb9gmh98ql3TIPicccll3MXEhCUShPJq8Qi4BCh0ozqz7zcilg9UfxbVbL
 JB6Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZlEXo6F8
Subject: [Buildroot] [PATCH 1/1] package/python-pydantic: bump to version
 2.11.9
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
 package/python-pydantic/python-pydantic.hash | 4 ++--
 package/python-pydantic/python-pydantic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index 8ec2a7789d..ae1a479991 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5  0d1c309b8fdead08922e1ed9d86517b0  pydantic-2.11.7.tar.gz
-sha256  d989c3c6cb79469287b1569f7447a17848c998458d49ebe294e975b9baf0f0db  pydantic-2.11.7.tar.gz
+md5  40710323d4273536c49c73ca0fa6b1fc  pydantic-2.11.9.tar.gz
+sha256  6b8ffda597a14812a7975c90b82a8a2e777d9257aba3453f973acd3c032a18e2  pydantic-2.11.9.tar.gz
 # Locally computed sha256 checksums
 sha256  a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index e614df6f07..fae4822a56 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 2.11.7
+PYTHON_PYDANTIC_VERSION = 2.11.9
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/00/dd/4325abf92c39ba8623b5af936ddb36ffcfe0beae70405d456ab1fb2f5b8c
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/ff/5d/09a551ba512d7ca404d785072700d3f6727a02f6f3c24ecfd081c7cf0aa8
 PYTHON_PYDANTIC_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
