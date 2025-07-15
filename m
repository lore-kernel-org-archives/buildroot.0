Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28D4C83F27
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 22:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 770DB810CD;
	Tue, 15 Jul 2025 22:28:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lAwPsb3Cd2eK; Tue, 15 Jul 2025 22:28:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97A32831D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97A32831D5;
	Tue, 15 Jul 2025 22:28:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C0219DCA
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 22:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD2366124A
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 22:28:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6dpO1Rvhttwv for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 22:28:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C47896123F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C47896123F
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C47896123F
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 22:28:35 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3e05bb6efe0so51367785ab.3
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 15:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752618514; x=1753223314;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DzJM+3CGgN7yeNJsOL84pvHmzglIDfvY8qA8ADtgREs=;
 b=pL3WqCQs2x5X77m0hHzZawwI1qt5KXuLWiPNwHWaitf37uekrttCAfY6lUPvmQRgk2
 +CI9N2QgoZdFCugaSX01yaHUxgom9TzrUWaQTrpcH28ZQ2wnYrjLscaozzjuCABk3SCp
 fnGy6NoPJa13+pP/KRf6SavOwoWZREfh/5m6pYsi4O3gYRctE6BTp52gQa87aocC0C8c
 fkz7t2hIkdROUnugELZJmpwPFhbPjdWkM4c+9RFuSJV2Iy1KCyj6I3y20ZFxNlLZqAzk
 HN9eTj5gvV7om6tvBvXmOozSrWIvNT7BrZkpNDcj5KquSrHu3AJ7SOMk1CU2N4Gz7E6y
 ImLA==
X-Gm-Message-State: AOJu0YyN5mXspE5c1+elOnXjpUbRw5VsajQ9Qe6sH0ogPAbWvK0yJ24b
 ZgEATtRAjpshcBzkN+2u6VzjyA5xE5sbEI2jor3Vm8I9ByFOsf8xXayAZTq3sJRceOE=
X-Gm-Gg: ASbGncsgHEwvfVMIBg+jjsMHI9Or0DIQpPOufjsKb0kFMiHXiKOaxjnFeOnBpEg7+1y
 sgCNr7Z3tAjeKWLgGEwPdzKsC2PdM4gD9HAmw80Axtedh/ElmMUHNrkPE5LCPLCyMELnwZX3Hx4
 T7LhwBlVcc3HYRZvsKhW8W8BJY4t7yhE6syUqp5fIJNDbS9sh6pvFM0Qwi24RvH4bDYrgR+xu8z
 eph1k3CMqVBkguBdLDKahd6L3Urse07a9MS14laCgSJWH4UuUh08f2zYtzpWQr59IKW7xVmmfBi
 7VmbV4PnkJRImdsDOcjHHFA0tqN+gkntmOZxMjGT7F4Ljr+zjxZ7xb6n6NtMSfT3UUUDeSIBOwo
 8ENEWGbbrbjnZ9c+zy5jQog5S13fLZbL9gG0ytHHXTskUr3ujBGDUAzwqN+IP+FF25OSW8ff/Z1
 tEeybrYNKc07duM1/2GA==
X-Google-Smtp-Source: AGHT+IHk/EGvNza1+neibOsdxNAegptAIm36Nq1dieFi3lNP9tVFrwO6UZ5aytrc6cxjCMs4SKe1oA==
X-Received: by 2002:a05:6e02:2505:b0:3e0:4f66:3106 with SMTP id
 e9e14a558f8ab-3e2822fd090mr10092805ab.2.1752618514260; 
 Tue, 15 Jul 2025 15:28:34 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-236-108.hlrn.qwest.net.
 [71.218.236.108]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3e24622a045sm40437755ab.49.2025.07.15.15.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 15:28:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 16:28:32 -0600
Message-Id: <20250715222832.741431-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752618514; x=1753223314; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DzJM+3CGgN7yeNJsOL84pvHmzglIDfvY8qA8ADtgREs=;
 b=M7lBAtl+I3Jq3zB/m2vZpL2YoelPoiBnH1oT+WY/LnjalO1pGYYhsrKujmctgS3VOl
 7PX98T5MBdb/uFWLtdO3rKoXbUqcZ6BeO2mSnQuV0BkvTed6ZcC1XwTQJl89/+Qf9pI6
 z5H6y4m+DflVXPSYlR4usSMGaqHWTwaQqCrhE/qcMFfOfPPKo7gpitAmyK9eeSisSkUq
 1pAYgXqzQUj00fE9L7cUCK9g5y+JPIFfrBoissR4U4gdPhUwCjdhYxZMqG6DLScbSEbN
 dxWdj9EZ49JbF4Ht4FLtM1/HIRD0Vf7ZuUKxT84kJnrnbReHFJgxOEsNQnAKPU2kqOxs
 V5OQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=M7lBAtl+
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools-rust: bump to
 version 1.11.1
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-setuptools-rust/python-setuptools-rust.hash | 4 ++--
 package/python-setuptools-rust/python-setuptools-rust.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools-rust/python-setuptools-rust.hash b/package/python-setuptools-rust/python-setuptools-rust.hash
index 2b7c7b9387..daba4fb28e 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.hash
+++ b/package/python-setuptools-rust/python-setuptools-rust.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-rust/json
-md5  09bd134c06a3083ed65a6ca01314dbe7  setuptools_rust-1.11.0.tar.gz
-sha256  f765d66f3def6fdc85e1e6d889c6a812aea1430c8dadcf1c7b6779b45f874fb2  setuptools_rust-1.11.0.tar.gz
+md5  cc5c2cf6828af473951295d9f33bcf33  setuptools_rust-1.11.1.tar.gz
+sha256  7dabc4392252ced314b8050d63276e05fdc5d32398fc7d3cce1f6a6ac35b76c0  setuptools_rust-1.11.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b20668c1590582b3882854050ccfbdb7aee1f71a1ffe9eacc4c5aeb08a14161b  LICENSE
diff --git a/package/python-setuptools-rust/python-setuptools-rust.mk b/package/python-setuptools-rust/python-setuptools-rust.mk
index ef61da549a..01cd04867a 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.mk
+++ b/package/python-setuptools-rust/python-setuptools-rust.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_RUST_VERSION = 1.11.0
+PYTHON_SETUPTOOLS_RUST_VERSION = 1.11.1
 PYTHON_SETUPTOOLS_RUST_SOURCE = setuptools_rust-$(PYTHON_SETUPTOOLS_RUST_VERSION).tar.gz
-PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/e0/0c/db5a68b4e95229db38a1793d58561870bd68b92b95fed183c6cd48910c9f
+PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/e0/92/bf8589b1a2b6107cf9ec8daa9954c0b7620643fe1f37d31d75e572d995f5
 PYTHON_SETUPTOOLS_RUST_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_RUST_LICENSE = MIT
 PYTHON_SETUPTOOLS_RUST_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
