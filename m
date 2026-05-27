Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD875CD5BDE
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 08:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B40B41FCD;
	Wed, 27 May 2026 08:24:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N7UgqNT9x8XP; Wed, 27 May 2026 08:24:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CFA841FC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779870272;
	bh=sA4ux5TIduVbrj85CUWdhUrjPsCakcP513HnCA88HLw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=acGbEpM7PtQF1vDhOUvFMnP05AxU9nS3antgqmNtGuL3H4Y9GrsBsJ3jPqe5zVuxw
	 FbG4amTpUkQT+wY8RNOxurvbX5Tlnvvu6bAs1iaWH1XtN6MQfXbkOPCw8qZ6JD3kn3
	 P4vqHfsJlmFNy1sPwYCfiQrmeLgDsydxG/AWZjiaymIxfhgElRzhbKxtQFBQG4xzpp
	 ZChS/IC/H9VQOk1mM9ZxyVYhxOdeIVy7sdYld2j0FLRR7xH2oQWsH7K1gjNk77JsLa
	 S7zN9IGwQRFNG48h+aU4xuMTQaWmI7TCO5BiDdv3x+P6yz2ZN1VnmDStUSArxu/NbI
	 b8mFTeKqHHXAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CFA841FC0;
	Wed, 27 May 2026 08:24:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BBB6121F
 for <buildroot@buildroot.org>; Wed, 27 May 2026 08:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98CBB80899
 for <buildroot@buildroot.org>; Wed, 27 May 2026 08:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oUuMcmdoEfi4 for <buildroot@buildroot.org>;
 Wed, 27 May 2026 08:24:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 758AD80892
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 758AD80892
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 758AD80892
 for <buildroot@buildroot.org>; Wed, 27 May 2026 08:24:24 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4903f7a90d1so44527565e9.2
 for <buildroot@buildroot.org>; Wed, 27 May 2026 01:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779870262; x=1780475062;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mwQ8Kn8a7Mh8QfDiPAsKiFX1hN1z1t9KP0Rcb0uS094=;
 b=jMXlJRbhgjs2Rft2pfoiim6ZsZfl18u9TSulZpUNttKycZGZnyFX+zpgf+EbjO00mt
 8ncK4tAJak/eeZGJMBmqQj1YazjTVYMhdy2mSQh8lHiXGO3HrnnJvwFGA065hYgZgYDr
 XRqF4+ugou18ih6yDPdaRu+sxv0EL6cT7pZg+gpFH06Youi9ZLxWq79l2ttKiz28exJR
 atgb+CpoyNgQhI6taphqD8cn00M8Ib66xPELjemsFnGNpW8KSElCKqhocCSjfDZ9lxa6
 xIFn57mcUBaGdccbTl6v3saVz28L3AKHtfu8saCVVcO8+C6S+k57gopCbp3/udYDKGmN
 Iubg==
X-Gm-Message-State: AOJu0YwgBm/S0tuM2xrrBrt3unhceWRvIldmEOAHa6B9uHKhjTyL9/2c
 UTI+KlZQzxtghfhxrZbeNXvOz8s2as5Z64Z05hOpfU3RiEAE9Z+r5Py8luAC+Of50BfNz2trlnh
 u6/D9
X-Gm-Gg: Acq92OGSZb4pJ6ZR7RjISYl2f0aWXPgp6/9imHTF3mPQowIj7EaYY6a1JL3nSVEBIkE
 8sUKiIcc4/OoHylUPB5Vt1YGHTTz0GENNx5yQUjV4OpDSPwsV5JT4fqBrsGrPdxq+u4xXI09Hus
 851ti36UfGs1I7+1heByr895IFkVxIYIGmOV1OR+qUUOHgcl89v45TL3Y/DmaIrKZPzTNLRFD8M
 d+ipFcOldMXYmd2Is/BfFzQO5YPi3mJYyIPv1kmL2HPJHCPJqzul8AgJs1YSQN9fZfnLum2u7+9
 rAHFDcJxaeK8sLTOQNjpJp4nAamUjPKTazdYCJ1oCaQCJoMKr3EbW8jAErcA0aW2SQliDpgqxSR
 amZLsjq6b68LIVaScohm0Qj4MOsZDGfXshhxjEPZLwifwN5omwRElxVsi8fEfiuUSjMySkGQNwK
 +mBJyobPb75gJJLE5ccR9EWQg0VzG+OXhv80EFF9QFZLXDW3k=
X-Received: by 2002:a05:600c:5298:b0:48f:e230:1d12 with SMTP id
 5b1f17b1804b1-490428dd63emr384640085e9.31.1779870262152; 
 Wed, 27 May 2026 01:24:22 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4904561a160sm437803495e9.9.2026.05.27.01.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 01:24:21 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Date: Wed, 27 May 2026 10:24:16 +0200
Message-ID: <20260527082418.151980-8-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527082418.151980-1-thomas.perale@mind.be>
References: <20260527082418.151980-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1779870262; x=1780475062; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mwQ8Kn8a7Mh8QfDiPAsKiFX1hN1z1t9KP0Rcb0uS094=;
 b=SaHsOPNKj+QOSm/uNxjceqKWtVL0vTjI54tmva8sCo13V9P1VwFDXtjtYY/mpgFcXR
 YZ/4tvfr2/kguNPJbrOuTf3EkwJbuuEWyJtMm8iZRX3Dkd/TVMFFToHNKt5FeGOJdUMn
 HMNledVGUFIPmt+5rXoIe6M0NoJL8FDooFXanqbADM69CHd6PC4kgvb/8spCFq+rjBaE
 NfE5Gmcrmfju38PSeTTWV76NDlbltLe+Qxlba2gMm5JLkoEh7QrQmCguFSe024HePJbo
 uD1KVyBGqqqieVf6ii/NJ49DDjO7Pj7yWoZXG2gbO6xB+3BQ1bfuTP5Wc1f8J0LOAGvs
 ifFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SaHsOPNK
Subject: [Buildroot] [PATCH 2025.02.x 7/9] package/go: security bump to
 version 1.26.2
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

From: Christian Stewart <christian@aperture.us>

go1.26.2 (released 2026-04-07) includes security fixes to the go command, the
compiler, and the archive/tar, crypto/tls, crypto/x509, html/template, and os
packages, as well as bug fixes to the go command, the go fix command, the
compiler, the linker, the runtime, and the net, net/http, and net/url packages.

CVE-2026-32289: html/template: JS template literal context incorrectly tracked
CVE-2026-33810: crypto/x509: excluded DNS constraints not properly applied to wildcard domains
CVE-2026-27144: cmd/compile: no-op interface conversion bypasses overlap checking
CVE-2026-27143: cmd/compile: possible memory corruption after bound check elimination
CVE-2026-32288: archive/tar: unbounded allocation when parsing old format GNU sparse map
CVE-2026-32283: crypto/tls: multiple key update handshake messages can cause connection to deadlock
CVE-2026-27140: cmd/go: trust layer bypass when using cgo and SWIG
CVE-2026-32280: crypto/x509: unexpected work during chain building
CVE-2026-32281: crypto/x509: inefficient policy validation

https://go.dev/doc/devel/release#go1.26.2
https://github.com/golang/go/issues?q=milestone%3AGo1.26.2+label%3ACherryPickApproved

Signed-off-by: Christian Stewart <christian@aperture.us>
[Julien: add "security" in commit log title]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 82518f8cb41f1377b7a65abc659adc96ffcbe05b)
Signed-off-by: Thomas Perale <perale.thomas@gmail.com>
---
 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index bae223882a..77be843c83 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  3172293d04b209dc1144698e7ba13f0477f6ba8c5ffd0be66c20fdbc9785dfbb  go1.26.1.src.tar.gz
-sha256  da75d696c6b9440fe9fb6418429f29eaeee947707ee8c6ddb567c558051a1cc2  go1.26.1.linux-386.tar.gz
-sha256  031f088e5d955bab8657ede27ad4e3bc5b7c1ba281f05f245bcc304f327c987a  go1.26.1.linux-amd64.tar.gz
-sha256  a290581cfe4fe28ddd737dde3095f3dbeb7f2e4065cab4eae44dfc53b760c2f7  go1.26.1.linux-arm64.tar.gz
-sha256  c9937198994dc173b87630a94a0d323442bef81bf7589b1170d55a8ebf759bda  go1.26.1.linux-armv6l.tar.gz
-sha256  f56eed002998f5f51fa07fd4ed0c5de5e02d51cec7a4007f771c7576620d9d45  go1.26.1.linux-ppc64le.tar.gz
-sha256  60fe623ef63e6338c055ec0e0e3f4fa85c97a056de2d2f6ee38591e2bfa9cdde  go1.26.1.linux-s390x.tar.gz
+sha256  2e91ebb6947a96e9436fb2b3926a8802efe63a6d375dffec4f82aa9dbd6fd43b  go1.26.2.src.tar.gz
+sha256  89835cdc4dfebde7fe28c9c6dc080bb3753f6b0354301966ff9f62d14991bd7d  go1.26.2.linux-386.tar.gz
+sha256  990e6b4bbba816dc3ee129eaeaf4b42f17c2800b88a2166c265ac1a200262282  go1.26.2.linux-amd64.tar.gz
+sha256  c958a1fe1b361391db163a485e21f5f228142d6f8b584f6bef89b26f66dc5b23  go1.26.2.linux-arm64.tar.gz
+sha256  0000e45577827b0a8868588c543cbe4232853def1d3d7a344ad6e60ce2b015c8  go1.26.2.linux-armv6l.tar.gz
+sha256  62b7645dd2404052535617c59e91cf03c7aa28e332dbaddbe4c0d7de7bcc6736  go1.26.2.linux-ppc64le.tar.gz
+sha256  410726ed10a0ea6745c2ea8da4f0e769fd3ce819cd4a41a67ad08b094d5dfc31  go1.26.2.linux-s390x.tar.gz
 sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 6c57be0ad7..67948dc405 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.26.1
+GO_VERSION = 1.26.2
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
