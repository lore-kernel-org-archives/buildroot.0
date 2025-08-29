Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C179CA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 14:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E002C840CA;
	Fri, 29 Aug 2025 14:49:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dC3xzf6MsQwE; Fri, 29 Aug 2025 14:49:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1356840C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1356840C1;
	Fri, 29 Aug 2025 14:49:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 75B8569
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 14:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 678C440C7E
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 14:49:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eD7wy_We2ibh for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 14:49:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5EAC440097
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EAC440097
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5EAC440097
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 14:49:04 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-afeec747e60so264132966b.0
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 07:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756478942; x=1757083742;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GMe2YunQ/a+1SG67TcYK6+IPtfcDIMpIzHgLX2XSZO0=;
 b=oZXVNltijIcP1gIEJIf72+TVpqf654PokSjlpaP4ctHzrv+xKuQn3Oa8Eld3Q0Ng65
 Uta7c6k8y1fWz5iF0zIos5VBPLUD5ifX0uG2z7RYm1nOJcBZuT9oDPv4qSAS2h8aLMLJ
 w3sh7AYW6SXQbAz/jKgd3lqFYzRW8SgOwQop7UiF/s6QzdpCcjXZg7InbWeXyhmJacW8
 x3gHdg9/FT/rXuaQ9okko8Yjjkco7RCL2pMf18L6T7tcei1+q0L9iqMd86l+uD7TBXLK
 jGeB/6s0Xnw3C0hmGmUDyfpe/Vop4y1cY2fFzYrIpy6rQpByef01QXySttp1cbI9l3Qr
 4ZKQ==
X-Gm-Message-State: AOJu0Yzmrr+p5bb5zVwNdmzJd3Pos+ptEbASrjptL7yk3diTM3rNFd/x
 oUxYQSf2XtFdnmo0y3O3bjIGPEtQUQIT3NKrJrMGfe5aZcIt7fcADgw/oLrX9BTYwRpHwnLWYef
 DEbJ0RJM=
X-Gm-Gg: ASbGncu7PngBY3sKUF9zw1DAfPclLQ+feg6w8E2xTflpfJKueBedDeWHqf9s07Kfdn9
 5ZtBP4SFn2p7oBP8xpgBIIuctUxpon4+htPJQT+H4BFSMxKvx320IiUnGkMnNCA582QGRhYGngP
 LJbNXLbrc6feZ+pWPe43ENdk4WuyGqid8Q7tptdb6PgsownlWUP4scIEY81A+clTPrbUl/770HU
 IuFgeEaCb6VpKHoZjpBOaOm7FyKdfvCf1qd5shBsnDbChZ8XJeC9GjWMB71aO1abqnF/CMKOB5b
 KOINRekfSQt4MKmlXx5CvsRvlGtAP4PLuM5OlPfWbnNYRoNRfC0RjbHOGKUuMCP/vQ3CZ0M+2z6
 Mgv6dRUyvBlHmlffp91DEXswCyLtlglatXfwOf6EVgEnY/KyU1mcH44OCEH7FRA==
X-Google-Smtp-Source: AGHT+IE0as9fGpK80/c6caQJos93Hfy5zL0ltUCf9rPqVyliHknalqdk45uk+YsvRsRGO76nReOpJQ==
X-Received: by 2002:a17:907:6ea6:b0:afe:eb44:f90e with SMTP id
 a640c23a62f3a-afeeb44fec4mr648012566b.39.1756478941824; 
 Fri, 29 Aug 2025 07:49:01 -0700 (PDT)
Received: from mindpad (31-207-9-44.static.ef-service.nl. [31.207.9.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afefcc6631esm209810866b.95.2025.08.29.07.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 07:49:01 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Date: Fri, 29 Aug 2025 16:49:00 +0200
Message-ID: <20250829144900.234015-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756478942; x=1757083742; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GMe2YunQ/a+1SG67TcYK6+IPtfcDIMpIzHgLX2XSZO0=;
 b=TeoxF+lM457hsEYVxCFCSxfZalgEc0XKtHy8Lfap/OCEl4CqT9XPiiAt3wUip6Dn8O
 ZHfX//g7q9DsA0/79dGnrQGBLJ1F4/o374NoJJtAYDAWVSCyyUzYniD5PkCuTRBCWq0n
 t0rxPDUvxqyF6KtAqGmwFD8yGT5Hb1IbqvW+ftxLkW2XbT6YJ6q+fQp62wl9O9KDid9p
 8OFAZfIoHk3OZuh2qa0wBZoAZuIDgAObZgbsHFkfpSSfhLMRV5An7Oeh1n5/ZFXLVQWF
 Bys4ylrfG0Cs/NBagAgULQBL1LlfBVihvrxkKz9Rh9mH2Sr+5aB5w8EVDTU5kIO1zqvn
 1FlA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TeoxF+lM
Subject: [Buildroot] [PATCH 1/1] package/go: fix CPE id
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch fixes the CPE ID for both go-bin and go-src packages.

The go-src package did had a CPE ID because GO_SRC_CPE_ID_VENDOR is
defined but the generated CPE ID would be the following:

cpe:2.3:a:golang:go-src:*:*:*:*:*:*:*:*

The CPE product go-src doesn't match to anything and should be 'go'
instead.

For go-bin no CPE_ID variable were defined so no CPE ID would be
generated if using a pre-build toolchain.

This patch duplicate the definition of the CPE_ID variables, I didn't
put the definition in the 'package/go/go.mk' file to avoid generate a
CPE for the go virtual package.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/go/go-bin/go-bin.mk | 3 +++
 package/go/go-src/go-src.mk | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/package/go/go-bin/go-bin.mk b/package/go/go-bin/go-bin.mk
index a0f1e26e8f..ac42e4cbf3 100644
--- a/package/go/go-bin/go-bin.mk
+++ b/package/go/go-bin/go-bin.mk
@@ -4,12 +4,15 @@
 #
 ################################################################################
 
+GO_BIN_VERSION = $(GO_VERSION)
 GO_BIN_SITE = https://go.dev/dl
 GO_BIN_SOURCE = go$(GO_VERSION).linux-$(call qstrip, $(BR2_PACKAGE_HOST_GO_BIN_HOST_ARCH)).tar.gz
 GO_BIN_DL_SUBDIR = go
 HOST_GO_BIN_ACTUAL_SOURCE_TARBALL = go$(GO_VERSION).src.tar.gz
 GO_BIN_LICENSE = BSD-3-Clause
 GO_BIN_LICENSE_FILES = LICENSE
+GO_BIN_CPE_ID_VENDOR = golang
+GO_BIN_CPE_ID_PRODUCT = go
 
 HOST_GO_BIN_PROVIDES = host-go
 
diff --git a/package/go/go-src/go-src.mk b/package/go/go-src/go-src.mk
index 340aada94c..c1f11a2262 100644
--- a/package/go/go-src/go-src.mk
+++ b/package/go/go-src/go-src.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+GO_SRC_VERSION = $(GO_VERSION)
 GO_SRC_SITE = https://storage.googleapis.com/golang
 GO_SRC_SOURCE = go$(GO_VERSION).src.tar.gz
 GO_SRC_DL_SUBDIR = go
@@ -11,6 +12,7 @@ GO_SRC_DL_SUBDIR = go
 GO_SRC_LICENSE = BSD-3-Clause
 GO_SRC_LICENSE_FILES = LICENSE
 GO_SRC_CPE_ID_VENDOR = golang
+GO_SRC_CPE_ID_PRODUCT = go
 
 HOST_GO_SRC_PROVIDES = host-go
 HOST_GO_SRC_DEPENDENCIES = \
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
