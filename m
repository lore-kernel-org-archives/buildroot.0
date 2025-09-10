Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCEACA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 20:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6474D418AB;
	Wed, 10 Sep 2025 20:21:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UbAcbYZStx69; Wed, 10 Sep 2025 20:21:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD635418A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD635418A4;
	Wed, 10 Sep 2025 20:21:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A8C7D234
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 20:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F1D44186B
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 20:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eeL-dR7nfo0s for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 20:21:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ABF53413DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABF53413DC
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABF53413DC
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 20:21:55 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-329a41dc2ebso5419012a91.3
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 13:21:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757535715; x=1758140515;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PXVQ9V38zvE8bKBmi7IbCPSP1uxl1bqkXB9+K4sdtlI=;
 b=CmqRKSOfvDipUrSYkoa6eeMx3LXeEoD6yfUd039ASUIdPZ02+5dnwYyyeYQl059yES
 4Spt7mq1fokswkWJHn1aXp0vnuujNXfv2w8He1qtFvpKoDsaP/v9ZkYnsPvq1KSIxPcq
 JHdZT36Zmtp6kagUzg6KCFGgteSb9IKZnOk1tMHzwRl7LC/gKQF6UXGI/i2N3eWbW4fy
 RSc1Ks+xYXBF8/c7GgPh6jzJwdzmDLDQPdrlF34AJprWUyE2AUBoxZucJIq8c4ujkQ3B
 aQ2ugEU4ju1dV8d3sPm5Cl52CZemv+PeX+lL/ahaAUzA96ASmTlockEOLwJWzw9m8/3q
 28Cw==
X-Gm-Message-State: AOJu0YwB/5oiI7IXWXV/0vFO12ZmnNTtdXxo51iLPV77irwOzlHqqH8X
 +UaSBovtw9H2haCrvFjpJEn2pcSg5iPtlZt9iofK4kyKRqmMzdRNLrF1oBsgTx6xgtbjlhAZtmI
 it4nftFTyeA==
X-Gm-Gg: ASbGncsBaClW7GMTPeB/5YFhwlpm2IBrNn+Mg1cB+4QcuSJ6No+6jTZohkOpNMwu11L
 YC62dJMIh3SKWt+zGf0PJ55qtu3KT5wmuQ0MhbAEsskUvIcPZ7fDLW9O3YPy5qiZhriu3JWI9zi
 wq3NEpyBbIOPRrTf2Ig+4XPPg1tsul28jYpC/AkcP1JtSrs4BABZtJDeM+E2bchRjvcn3soWZeW
 z8krfsaTwYPT5bNCXEWE9WsOof3w3U+7o/fUqVMzl/Teqkbw5v75GpppBORc/d2qPYzmqoCZqXK
 CORy8fcQcvIrX2shWb9OrFxL7yTDE8xFNI51HiN5VYiFxu0QDgLQhWlzPlOitk6iSugcHGtx8cN
 JcL1bUl7YAKLExt7zrrVibz29gXikgJGS2UBsDux6PYQKpj7GAW78/RPKLvbFKZMfV3qTYQ==
X-Google-Smtp-Source: AGHT+IHs91jRs0GXdmZ63PYq9pEt420XFZiwjEQ/cFIZZ3ieIH+K53Ak08dz09C1UMG8ga3UmIbkxw==
X-Received: by 2002:a17:90a:e7c1:b0:32b:5f76:9e29 with SMTP id
 98e67ed59e1d1-32d43f9a56dmr21177198a91.32.1757535714542; 
 Wed, 10 Sep 2025 13:21:54 -0700 (PDT)
Received: from localhost.localdomain ([185.81.124.170])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32dbb5efe7asm3538296a91.17.2025.09.10.13.21.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 10 Sep 2025 13:21:54 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 10 Sep 2025 13:21:38 -0700
Message-ID: <20250910202138.13648-3-christian@aperture.us>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910202138.13648-1-christian@aperture.us>
References: <20250910202138.13648-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1757535715; x=1758140515; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PXVQ9V38zvE8bKBmi7IbCPSP1uxl1bqkXB9+K4sdtlI=;
 b=pTI6IBD7v6WXTk4A1isYry05/5Yk2VrPyHMk+2mS7cZgSUaL3/C0N5HMcqPjsnr0Ju
 FNxq3Bffr8ZpTaP0FbzdrZe1ncLquhY8owhwnQDl0xBSEYjVQIc8hjkiBPX96FTJMJGB
 fT8wLgpwEgViLWQTnlIp7w8BzaeciIuCNyUe0V4eNKZw/MLwUslqUeWJ4U9hl5FBTFi0
 YrP4n/BisAFAQGGiN/HImpcTt0/U71jBChuCv6fy7Vpt5C6cYBRE4ebJfIXaCmAbZ1GG
 8pw2ZEOWavXDyMbGcTwQw76sHg9mp4IPSC3TjeB1d6BhQrSvfQ4ih8d+5fraLxz7Sbrg
 K2MQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=pTI6IBD7
Subject: [Buildroot] [PATCH v1 3/3] package/go: bump to version 1.25.1
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The latest Go release, version 1.25, arrives in August 2025, six months after Go
1.24. Most of its changes are in the implementation of the toolchain, runtime,
and libraries. As always, the release maintains the Go 1 promise of
compatibility.

go1.25.1 (released 2025-09-03) includes security fixes to the net/http package,
as well as bug fixes to the go command, and the net, os, os/exec, and
testing/synctest packages.

https://go.dev/doc/devel/release#go1.25.0

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 8b61824d0d..60d61433fc 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  2a8f50db0f88803607c50d7ea8834dcb7bd483c6b428a91e360fdf8624b46464  go1.24.7.src.tar.gz
-sha256  1bdf0441ff9c50cceef289a72efecbb6bd60aea545aa9412ef85d8b12199c741  go1.24.7.linux-386.tar.gz
-sha256  da18191ddb7db8a9339816f3e2b54bdded8047cdc2a5d67059478f8d1595c43f  go1.24.7.linux-amd64.tar.gz
-sha256  fd2bccce882e29369f56c86487663bb78ba7ea9e02188a5b0269303a0c3d33ab  go1.24.7.linux-arm64.tar.gz
-sha256  eaff4aace921075da371b91a5911f0c0fbcb6f712a527a25113f971944b78c36  go1.24.7.linux-armv6l.tar.gz
-sha256  e50462c5ad6ae7600eed24414729d0e0ab63d166ff6e5da550afc3010dfa084c  go1.24.7.linux-ppc64le.tar.gz
-sha256  48caa1c5011f625bada49adea12a9693ffe9813196451e2d2b9120b3add50784  go1.24.7.linux-s390x.tar.gz
+sha256  d010c109cee94d80efe681eab46bdea491ac906bf46583c32e9f0dbb0bd1a594  go1.25.1.src.tar.gz
+sha256  d03cdcbc9bd8baf5cf028de390478e9e2b3e4d0afe5a6582dedc19bfe6a263b2  go1.25.1.linux-386.tar.gz
+sha256  7716a0d940a0f6ae8e1f3b3f4f36299dc53e31b16840dbd171254312c41ca12e  go1.25.1.linux-amd64.tar.gz
+sha256  65a3e34fb2126f55b34e1edfc709121660e1be2dee6bdf405fc399a63a95a87d  go1.25.1.linux-arm64.tar.gz
+sha256  eb949be683e82a99e9861dafd7057e31ea40b161eae6c4cd18fdc0e8c4ae6225  go1.25.1.linux-armv6l.tar.gz
+sha256  8b0c8d3ee5b1b5c28b6bd63dc4438792012e01d03b4bf7a61d985c87edab7d1f  go1.25.1.linux-ppc64le.tar.gz
+sha256  9cfe517ba423f59f3738ca5c3d907c103253cffbbcc2987142f79c5de8c1bf93  go1.25.1.linux-s390x.tar.gz
 sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index ad4ae35f06..535787c92a 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.24.7
+GO_VERSION = 1.25.1
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
