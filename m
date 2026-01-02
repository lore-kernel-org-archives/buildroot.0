Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B2EFA3750
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 21:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DF4981E27;
	Fri,  2 Jan 2026 21:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H09eEAoahkOw; Fri,  2 Jan 2026 21:33:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FA8981E28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767389592;
	bh=vgvtUd/ijAV4pTcnzqdoyIrR4h2FxrBOpU7BZnYe838=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=q0FbTOiI24GE/YC8Dbj5PmeRxbQg8N8DQF0NO2PsapwFq7LErAQMNe+QWNRwc5mSb
	 zpU7iT5HLJGr6+Fpef6FiArZ5LoPrPNZ7HAa98M3/x/MiGRzcJULcHJJezmJMBa8Yc
	 LYZpkx6tvvTAmPdFM25v5pczieTpUVDflGiNeTQwD036Lk8a3Jtkv9NcoVsIyoJ3WQ
	 mg7e+kaUHCrU8yo6yxZZWFgM42NUtvCN+sClO2L7upHsDdjM83NNsaIurGQR/hxlRE
	 PTtsOKr+mZIOhY9UAYuxlB5SUn9cGZ+3sIYSV07BKKT27p98v3rU6nEMw0B8LqCrZW
	 XC0FAr9e/8TnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FA8981E28;
	Fri,  2 Jan 2026 21:33:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 444F819D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2594D81E28
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:33:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jSY4nNI9phZj for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 21:33:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2a; helo=mail-oa1-x2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4CE6381E27
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CE6381E27
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CE6381E27
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:33:07 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-3f9ebb269c3so4533401fac.3
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 13:33:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767389586; x=1767994386;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XDA0K7rnGYGFt/BzFeoQekZeOZsqwjYXWNBPf285xiQ=;
 b=hj9XSy4o8fAmcNTu5Az8MEFjS7isSh/xb39tvG2ZFXDGxg9OhsffA2PWG45EF67qJ1
 2bEflYtX6RJ01AmN4YHzG7kYpAuEQOd9+HW9aWxdjFC9Y50e0+V2l68hcMvifx3rn5Rr
 riBf2I0NfiXsKKmwXBYirypPVdcNr9pTPnrC57Ug7xLKb26OTikzNVvm2k1DLdzHxJnn
 JSYSfoL/wAFCWwghkUA38apGPzczPZF+3sSLXws4iq9CvtgPM6jFcG/LDnYI2Vo0nJxv
 ov1qXVjcD9iqbhfRmlRC92TPa5A19pMfxcSrRaREpPoT3kPruQSZ/N23A+NUjOvbB/oQ
 f07g==
X-Gm-Message-State: AOJu0YzOyOl22nnRD61/DvkEkHk3/00gVyIg7Am1GHmA9hVqCv2E9mfR
 bHGNj100AuGySZ7a9oYYogYqCFUKvMF59ZNH98Ix/FFeSTYlO++H+tcq5yvAze6Mdk0=
X-Gm-Gg: AY/fxX7W9muBY4oYNO7nDy65+xS4LEfb030xkx6iNsIaFTawAiEBLryVp6cvZAWPpps
 bOf7hM8omG23u1FOTWPSxp3+L43qMpA5ViB/0ZLG4zKFpADV+q3YgDEwpKdgy75miPowtH+LHe8
 D0upvuNtqjeOP6woTnGyCBZ3CiCYL3mbG76SyasBPK5qiGdQDxLKpjVr0Vks1E5TMsmat+7MACd
 YRLd0ITPcOPMxcwXVU03SqyjBOGnkJSWKDKDCdnz3U70hy5Gf2+uLLRF6/KEm5Nq5qbtdCaeSB7
 ya+eEw0+VXgp9KzlvfmFXHHC6epc0hhJmGhir5XDS0QJ6z+CHj/Ysds1uDDSQpAUu1fl7U3MmO4
 pQZIJ3MXLizAJHTwiOX/wLrwAb8kpXl2WsrUGFsys+Rqj4u4jXOKBFznCMHXGs1FbXf4jaHE+Rx
 QsknkRGR5sq0KjXSrtxE8MyYFuxnx2dgQ3IfnWR16sMjJzSk+sU3Gya/kETG08OZAK9q03xn2JW
 It/MzsfVjLiFvq3VC2CgieOhR/3T3U5S0tQCmmQ1ALx5dOilT5WbOE=
X-Google-Smtp-Source: AGHT+IE3B2MS6XXXrU9kYSFPNi1KYxa2wEBsiMlvHqOCnr9qUXxZ2PIaAw7nbtFcqhqDfI+eMSTthg==
X-Received: by 2002:a05:6820:169f:b0:659:872e:7664 with SMTP id
 006d021491bc7-65d0e9212b6mr21227940eaf.7.1767389585678; 
 Fri, 02 Jan 2026 13:33:05 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-65d0f6f0e78sm25283539eaf.15.2026.01.02.13.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 13:33:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 14:33:03 -0700
Message-ID: <20260102213303.101526-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767389586; x=1767994386; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XDA0K7rnGYGFt/BzFeoQekZeOZsqwjYXWNBPf285xiQ=;
 b=aGzUO0FZwCfz5scuxpyN+OcA2oFXECTY/hPwxmbBxuM7os18k+sCSyRuFCwAccEMsj
 qTVh2Wbi2Oczt9FATlRFDHqFzR65e9xNL+vu4JQ4nqq+1cUBHImwzvBr+JR2ipMcVc5G
 kWhu5R6cJnqN8dwGiJFLlyGSHdswd4geXJ3YHa50Re2zwg+Anq7//1pdkf/oR94d4I+j
 /1Wieabt5GIdkxP9fKHWvdNpkSK5wIAgjBgPy7aZb/+QA1zUOCpmP4dolfqDWNVpo0oh
 GbdAvz2+LxdC6hSLAmtQ2Uqve/1VTDCH+CAy5yizvCBmDanJlW+CY///W0uawEP+dshE
 CHzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aGzUO0FZ
Subject: [Buildroot] [PATCH 1/1] package/python-logbook: bump to version
 1.9.2
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

Migrate from setuptools cython based build to setuptools-rust.

Add new python-typing-extensions runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-logbook/Config.in           |  2 ++
 package/python-logbook/python-logbook.hash |  5 ++---
 package/python-logbook/python-logbook.mk   | 10 +++++-----
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/python-logbook/Config.in b/package/python-logbook/Config.in
index 99996b6517..8950ee234a 100644
--- a/package/python-logbook/Config.in
+++ b/package/python-logbook/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_PYTHON_LOGBOOK
 	bool "python-logbook"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	select BR2_PACKAGE_PYTHON3_ZLIB
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  A logging replacement for Python.
 
diff --git a/package/python-logbook/python-logbook.hash b/package/python-logbook/python-logbook.hash
index 361ea9921e..de75a97e72 100644
--- a/package/python-logbook/python-logbook.hash
+++ b/package/python-logbook/python-logbook.hash
@@ -1,5 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/logbook/json
-md5  d15918a5745349eefab327661454527d  logbook-1.8.0.tar.gz
-sha256  487fa41539787bfa21a51fabd7f3ae8ae7f9e6679bb3e241d0f5f18a2fc37e9c  logbook-1.8.0.tar.gz
+# Locally calculated after vendoring
+sha256  1533f03ef76a4d646b14dd00e9982d6ef5d5dc86f134c9bbc1cd98b55fbf566f  python-logbook-1.9.2-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  2ca266337cc6947578654ab0dd6438de4d01fa78b2e6eb554b09757df1178f98  LICENSE
diff --git a/package/python-logbook/python-logbook.mk b/package/python-logbook/python-logbook.mk
index f6ccc1aac6..2bcd48bc2f 100644
--- a/package/python-logbook/python-logbook.mk
+++ b/package/python-logbook/python-logbook.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_LOGBOOK_VERSION = 1.8.0
-PYTHON_LOGBOOK_SOURCE = logbook-$(PYTHON_LOGBOOK_VERSION).tar.gz
-PYTHON_LOGBOOK_SITE = https://files.pythonhosted.org/packages/c3/a2/fafcc4ce7bad34093150e14f9ed179aa53e3e60a5c46e840547bdae26674
-PYTHON_LOGBOOK_SETUP_TYPE = setuptools
+PYTHON_LOGBOOK_VERSION = 1.9.2
+PYTHON_LOGBOOK_SOURCE_PYPI = logbook-$(PYTHON_LOGBOOK_VERSION).tar.gz
+PYTHON_LOGBOOK_SITE_PYPI = https://files.pythonhosted.org/packages/f2/cf/e39c249003caaa7f84e2b00c11c7423892d525f8136ff349f9914914a744
+PYTHON_LOGBOOK_SITE = $(PYTHON_LOGBOOK_SITE_PYPI)/$(PYTHON_LOGBOOK_SOURCE_PYPI)?buildroot-path=filename
+PYTHON_LOGBOOK_SETUP_TYPE = setuptools-rust
 PYTHON_LOGBOOK_LICENSE = BSD-3-Clause
 PYTHON_LOGBOOK_LICENSE_FILES = LICENSE
-PYTHON_LOGBOOK_DEPENDENCIES = host-python-cython
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
