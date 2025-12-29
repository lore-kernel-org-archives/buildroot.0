Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274EAE784BE
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 00:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5C4960AAE;
	Mon, 29 Dec 2025 00:03:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jutEg_3mphpc; Mon, 29 Dec 2025 00:03:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11C6660A99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766966615;
	bh=/tXEtLMJ/Lfet2YFPRx0t34oqXyDx1LhDgnzoFufexs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=sex/sYLBYCECLPmWJlRmBJAjjVBmApc5CbC52pSBcA/MrvnaWFji2ivRblHyPS5l4
	 xY7RhpfoO7jojQQLkNjP/cI4bpb21i1N4cwu764v4OgGNqVUKoELIHW7MS4So+aUCH
	 MhW0KgiXygrGqoaNAGtgH+hYOA4W51UsVNC4jXwkKjcJ66CepzA5LRAsADBZOqsAgi
	 cRz8Lu7Z0CpEcs0QHMOATsKtgZlCQMPMHOPvruLOZS4O3N6Fj2bAFrdeS6vcekLrpA
	 dQQ731pb/zJFLFwYEBgYMGFZ6AeGckygCsPRejmh0tmlfW2lsiiPdstk1k8PJR9WPw
	 HzcZ4BrKDn04Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11C6660A99;
	Mon, 29 Dec 2025 00:03:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A07C1E1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 00:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B92781518
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 00:03:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CktqMzDhYd_R for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 00:03:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::330; helo=mail-ot1-x330.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6C27D81514
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C27D81514
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C27D81514
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 00:03:29 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-7c7545310b8so4302150a34.1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 16:03:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766966608; x=1767571408;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dJOZcve5abEbeOTS06KYEqQw/YmT/Gt1ITgEfr8PU6w=;
 b=HufU7/W3sUYSnRBzTT52F4vMPgwMGKe4+SFq96/NxmSsC+cji28+VKaAP4fiwY3wMe
 PYLlQaxrIPGsW1HNqDUCl9I6O8lzKnbo1OLKyc9Y79KfcOk5Q/NxwPNHsIQuO+2/tTaN
 r6cam55NrUnZLTEWxzjAv2uKtccrUT4UyEm+Svbt80w2vmTIDR6Cn0olni4xqGOWcDUP
 OKgkOIlrABurr5w0chXji5oqmY9eFkCIz3IYqZu+jRphew/5iclgLbEHt04ORegnsQE8
 Sc7ESUfieEXJVHr1TJ+JL2WWzZ+I1u+nS4LXlgFAssOv8otc/IEhe5muf/X2lLRq0t6R
 PR6w==
X-Gm-Message-State: AOJu0YzRg4DpTxra0ek6lziytcOJ32VEcjcQZ25L1T6pD34m7efDnxXl
 K27FECUTeDa7ksjs81OVr+ne7YkS9rwrnAZLIhYT9Li7nxD2M1VQ2RdHF2m848UiwuA=
X-Gm-Gg: AY/fxX4WrgyKbG7YxJ/ecSJ9TmKNeN2irlcLtBBat7rnSG84wLd7DHY8gb58XvIZJql
 a8wv1wtf5RFqinYM/KIcusHu4ymdvrKuPi9ZeT3N+PdAnR/j4GaN6dEpLIIF9XmdjagqVRmyRJ5
 QpsenT7HCZCl1qt9gFafaGVw+9BtCrneNUw8GgJ7YXrT7TmJK99WnWzF2vCpEC85L9HvFZzrXdx
 ZIO+vr1jWNqLIF0oLywDBRJGu4/MXFRwL3uxcj7QFNhuuDgiG9irELYlk44yY0EruCpL9hWCDV4
 5bjzp3tq4aYX7joQxXxWRgpfjoIwl8UqXyMQrsMHbm2+h1maFNB3gdkMdYRQFelAAIGxkKo0WfX
 iHvBR14qL7bOyIhvR1mVmxYS9RKgibv/VaLbHOoLj5h+q3fzf6m3fDVI/SuGpjqAYvY4JIm5eJ5
 RcFW8zjTj5P8Aji6rOn+dmpERl9baqvm/QRBF5E+BOMgDosvEiV4P4Z4bu3a5sinlMgNBuftMXU
 Ec6dt5vw6IGviNsIEETOhAdoKeRNNWMDYFtP12MKDwygsfF9a8bnRw=
X-Google-Smtp-Source: AGHT+IETL/mEWvsTbOt9V2ZID/k30Phq9KDShW6oU85j7uxl2iMAOmCs865tGyQN3rr58nqg1L2nWg==
X-Received: by 2002:a9d:4501:0:b0:7cb:1309:5b76 with SMTP id
 46e09a7af769-7cc668ce78cmr10497191a34.9.1766966608074; 
 Sun, 28 Dec 2025 16:03:28 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc6673c32esm19840304a34.9.2025.12.28.16.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 16:03:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 17:03:25 -0700
Message-ID: <20251229000325.2949510-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766966608; x=1767571408; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dJOZcve5abEbeOTS06KYEqQw/YmT/Gt1ITgEfr8PU6w=;
 b=KY0KPy/JoR49cZFOrSGRPUQmE4SF88/WlOL2R7TeHmyvmumGoLdTI0EVeSWf+zKVdi
 ildjKPKK/+3cGQl+sg3mzY/rSI5hBQxbjcCCuuByNb5P2GL2DGLNEWrXeyhp1wR1FAkJ
 MmUWD0jTPaC7lqfFZ/WUeaaBrX1pDOhu76ytgeyfl3JHBH5kferiunfvZ1tC/HysadQv
 QE7kUWkpqXp5QtjEazZ0kJsQzJUMWI+taIRYSuLZKyvLltJrHdMayDQF26lAJoiXWn2A
 UEkaHKX0lrIdHsI8QUu/L2MHozzxNkGbXOgp6yMgm8ikfVgovBnzgQSG3w4eNwCFek5U
 FXhg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KY0KPy/J
Subject: [Buildroot] [PATCH 1/1] package/python-cryptography: bump to
 version 46.0.3
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

Drop PYTHON_CRYPTOGRAPHY_CARGO_MANIFEST_PATH as package now provides
manifest in default path.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cryptography/python-cryptography.hash | 2 +-
 package/python-cryptography/python-cryptography.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 02b2b891e2..1ca864d995 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  9c070a97c37b4cc487737fa7a1fec27c2d44ba54c39f1c2cc558b2b9878283f9  python-cryptography-45.0.7-cargo4.tar.gz
+sha256  983924b55a7bf04cca9e329ca46310602a42c0bbd0b9e77795f85c1b50691f97  python-cryptography-46.0.3-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  3e0c7c091a948b82533ba98fd7cbb40432d6f1a9acbf85f5922d2f99a93ae6bb  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index e60c5d848d..f2da36b08a 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,16 +4,15 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 45.0.7
+PYTHON_CRYPTOGRAPHY_VERSION = 46.0.3
 PYTHON_CRYPTOGRAPHY_SOURCE_PYPI = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/a7/35/c495bffc2056f2dadb32434f1feedd79abde2a7f8363e1974afa9c33c7e2
+PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/9f/33/c00162f49c0e2fe8064a62cb92b93e50c74a72bc370ab92f86112b33ff62
 PYTHON_CRYPTOGRAPHY_SITE = $(PYTHON_CRYPTOGRAPHY_SITE_PYPI)/$(PYTHON_CRYPTOGRAPHY_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = maturin
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
 PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography.io
 PYTHON_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
-PYTHON_CRYPTOGRAPHY_CARGO_MANIFEST_PATH = src/rust/Cargo.toml
 PYTHON_CRYPTOGRAPHY_DEPENDENCIES = \
 	host-pkgconf \
 	host-python-cffi \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
