Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22FAFA3755
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 23:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF98D81E5C;
	Fri,  2 Jan 2026 23:04:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a8BPmCcwLwpf; Fri,  2 Jan 2026 23:04:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE9AA81E98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767395074;
	bh=DqjiYqIQdL09Z6kWuhdANaY6eAe7SHkDuvD0DNCT2Os=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dvFrhZGLBtQ31ovLHfjOj73KIjAQbSwR2cM4ZZ0pbWHMqfNVa1t9sFaEySUFgtAEr
	 P4Xgww0kz/VGC29KsHIjJ8SojvbEh8XQyqGEzczM9QYhXDeRzVcIBRrrCcyWEzTB6l
	 wkt1mXCdNe6GzVHRbbsj7OmBBJecXaCydLhYrC0bKyKSg8FqFYP9DRdAV/QQ6ydAx5
	 MUNqXtaJao9EcpDRmxbasQCfg4W37yzPDI8KTTDVFVjoGBHxM7YsaNTx5JFxTC1fe8
	 H3mPpevYTpO0A27GLn1cx/btQHsJhGJR+kSP6kcgW4aqMb8cjmfW/jNfZKXs/7WUcm
	 ERkLRROgDSVAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE9AA81E98;
	Fri,  2 Jan 2026 23:04:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 344AE440
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 23:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B23781E98
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 23:04:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 32C-zVJ3mLB4 for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 23:04:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::236; helo=mail-oi1-x236.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2A23E81E5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A23E81E5C
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A23E81E5C
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 23:04:32 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-44ffed84cccso2468975b6e.0
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 15:04:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767395071; x=1767999871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oclW6ov/bDQpA2YN1dRLfwOjIvMTzUYi0d26/iNKhbM=;
 b=hVGBxFaLq9/SSgr5SjDHx/Jr9x0jDc6VDCHL3rUBqgFhOkth/mfp1S2cjmQfj9LXXH
 2dG+TW1My+73rvDYhBKOF9t28xC+QUbcFhVKPGmNpLoYAAZIp+syHRFU6KvUltc9u8ag
 DxzZLGxqx8rOA/7E7EaHJOcwdZOtRY+BZPb/SaW7q4GJmomyZ0Svpui/BXvM0hAIzuc+
 UsCO0hDq31Fh2Y4jQLVpj/UbEo+1I0uUY/qykNGeYCxqhwDhvHyvqsAxfkThqIkZykoL
 yY+OVyDVK1uvCE6tyKH29tw1eZY9KUCh1k+ajLEFdKDF5l3bdLY90XdWtWJCkmAAA1TD
 XBAw==
X-Gm-Message-State: AOJu0YyhetAyV9t6oK4i+mcDTP38sPO5SDuZhFMfOYUqfzQtoBLnJFGb
 wHMcyS/h5TmhbdzFBvMJfTFKDp1HJJPClh/PA1w/kj0VS7a89LLgHYL3+SjLvyhbvD8=
X-Gm-Gg: AY/fxX58/sd1r5dVpvb1ZRw3XC706mLGXvqo/xUN+3Yif9GdWygitnTAfc8J/opCSTd
 EuxBQKGns/DqZyoH8jnEdBeO3SrcxUSkirZgDDbm81XCjT9MGJZ2RVoTMw1bzpWuHxZW8L1CDnS
 nw7boqi2uEpuGHGxFTPhQHgzPR3W8XwFkx+HOgK+1ZSlv9fjAMTbvuwDNbM2rYR3ObAl0sqSLGX
 r09zxWF+DdgjHTLP2qvL+rYyzpk2kGfi+wYisenrG+OpcEymFWHz17ScQafxofrTL855oZd36e7
 0E0iCaDcV4zq/OEmGkoVFeNfiTZ6t02UM/3d/hOFoAtGS9rk2O77YhrqiRTDJxsJ0MGa6BjahgF
 M+gO/UtQanMw0c/4RsjvuESGoFV1zWulO9SKyw2uncHFEjCXy3883StFIWJaGq9lRQI8aVThGxU
 4f+ecUXFjKeHVEws3bGP+axefxtQmcP6mIXSprXPmh6ihMevcJbyymjZsl2+nvWC17bPIgGMHbo
 gQUxVt1N+Zx7jjMEfRIv2JydfafBgUtxomlrt2c8x8WEegTXMmJHh4=
X-Google-Smtp-Source: AGHT+IHEa1oGJ/lzx6JrDAegpTm4jkCxCcTjsJD9Tz/kp60AN0GP8NpgdVcBxc1RZ/SZPR6C8hvLqw==
X-Received: by 2002:a05:6808:1241:b0:442:522:41a3 with SMTP id
 5614622812f47-457b228736emr20569385b6e.60.1767395070666; 
 Fri, 02 Jan 2026 15:04:30 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3fdaa8d44fdsm25628666fac.3.2026.01.02.15.04.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 15:04:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 16:04:26 -0700
Message-ID: <20260102230426.531850-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260102230426.531850-1-james.hilliard1@gmail.com>
References: <20260102230426.531850-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767395071; x=1767999871; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oclW6ov/bDQpA2YN1dRLfwOjIvMTzUYi0d26/iNKhbM=;
 b=fbtcTKJuI/H0I7P7z60FwOHJe7Ue1CtCIcAG9g1MlDwBpAiGwyap9O0lrptRvjrlP6
 QqV2TQQMcg+T6MVoIpcyLA1V3mEU+fFyJlyks5QZ+0ntv2nN6vsbWAeJ0hSMNmGRRv/K
 GlxWAWeCo3uK++x58Xtup6tXtFgDNDQSZMgJdLOlg90d8slNOF1zXfTokv8KrXss5vbT
 PpTekwSRj9sjoIwCKfGM/tRewv+vtezq+T6tehp2qbSHcIHsAMsTa2HuahyP6yT3kRWM
 PqVUrXw2Cl1vT2P+w2tvIwbnbvsat6ZBO60CNBKxytWhyUbDvOXbJWb9dt5Lc/bXO5dP
 zrJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fbtcTKJu
Subject: [Buildroot] [PATCH 2/2] package/python-ipython: bump to version
 9.8.0
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
 Philippe Proulx <eeppeliteloop@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new python-ipython-pygments-lexers runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-ipython/Config.in           | 3 ++-
 package/python-ipython/python-ipython.hash | 4 ++--
 package/python-ipython/python-ipython.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-ipython/Config.in b/package/python-ipython/Config.in
index 8ab5516910..32c1f9a64e 100644
--- a/package/python-ipython/Config.in
+++ b/package/python-ipython/Config.in
@@ -2,11 +2,12 @@ config BR2_PACKAGE_PYTHON_IPYTHON
 	bool "python-ipython"
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
 	select BR2_PACKAGE_PYTHON_DECORATOR # runtime
+	select BR2_PACKAGE_PYTHON_IPYTHON_PYGMENTS_LEXERS # runtime
 	select BR2_PACKAGE_PYTHON_JEDI # runtime
 	select BR2_PACKAGE_PYTHON_MATPLOTLIB_INLINE # runtime
+	select BR2_PACKAGE_PYTHON_PEXPECT # runtime
 	select BR2_PACKAGE_PYTHON_PROMPT_TOOLKIT # runtime
 	select BR2_PACKAGE_PYTHON_PYGMENTS  # runtime
-	select BR2_PACKAGE_PYTHON_PEXPECT # runtime
 	select BR2_PACKAGE_PYTHON_STACK_DATA # runtime
 	select BR2_PACKAGE_PYTHON_TRAITLETS  # runtime
 	help
diff --git a/package/python-ipython/python-ipython.hash b/package/python-ipython/python-ipython.hash
index 8186b5c09d..022975d976 100644
--- a/package/python-ipython/python-ipython.hash
+++ b/package/python-ipython/python-ipython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/ipython/json
-md5  5c629ec6cc81a8d5eecea3956e670d54  ipython-8.31.0.tar.gz
-sha256  b6a2274606bec6166405ff05e54932ed6e5cfecaca1fc05f2cacde7bb074d70b  ipython-8.31.0.tar.gz
+md5  777fdd0c2ec7b2fd1062071056cda377  ipython-9.8.0.tar.gz
+sha256  8e4ce129a627eb9dd221c41b1d2cdaed4ef7c9da8c17c63f6f578fe231141f83  ipython-9.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  341afcbd729887b7046fe7b98fc4f4edff3aed8d38f06eefd9b30670f043df17  COPYING.rst
 sha256  e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427c75c5e51268fb  LICENSE
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index 2bc4b54ef7..8af5b3c312 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPYTHON_VERSION = 8.31.0
+PYTHON_IPYTHON_VERSION = 9.8.0
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/01/35/6f90fdddff7a08b7b715fccbd2427b5212c9525cd043d26fdc45bee0708d
+PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/12/51/a703c030f4928646d390b4971af4938a1b10c9dfce694f0d99a0bb073cb2
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst LICENSE
 PYTHON_IPYTHON_CPE_ID_VENDOR = ipython
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
