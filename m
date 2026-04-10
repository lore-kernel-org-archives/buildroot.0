Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533D6F36BAA
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 04:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF6DE60B9B;
	Fri, 10 Apr 2026 04:33:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8oDAiTEFPLYd; Fri, 10 Apr 2026 04:33:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09D3E60B89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775795595;
	bh=pSSEXqtQal3CkoCkF/nyd1ec/eHZ5U+nDp7nQcUNdaw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=CPETy4t7e6G51WABWTe/p/UWv+wrz+I62lWoCrdeX2/G+hGNbAU6x5XyP2/H5TOEr
	 rfukxSXWzBdxbw8e5Wk4Zl/hm6XgUgmkCRFXOmKbOP6C91uK9LK0CCDMTEqUB+8IrG
	 uGoTYG8l8Ed9kJNhMlGKMrONWu1bDuj3XQvyhYDck6ccTnYx+QB5CidGgs/HkYyUTk
	 zLOOl/F/9QI1EFc3AMW+7drYQcZbMOV46MKiq+ayDr5w9szI8E1MS1WeCnvTgL8NpD
	 ah7h6PoC1vC2n0M/X0E/aX9AbEQ7X63MNaZ+2pAX7BtIkXgoI/8nq8z35G249gjIsA
	 f/Vdk/TvgiL5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09D3E60B89;
	Fri, 10 Apr 2026 04:33:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 75B98237
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 04:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B7E34028D
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 04:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsSKRyFt5Anf for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 04:33:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5C1A540070
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C1A540070
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C1A540070
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 04:33:12 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-82a655cfab5so1561671b3a.1
 for <buildroot@buildroot.org>; Thu, 09 Apr 2026 21:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775795591; x=1776400391;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=llfvTQLqfbH73uwGt0K/igVhEntScSMcGyvfq5nGG5M=;
 b=rl5Dln4qlM7KJVqFsLhSKvFH64/mvdCc2jxEaBERP9oY/Vik3D9e9RupwgspoUwYGk
 XbB/BEWlshJInJIS5o7V/ff1xiNPQtbjz+dlcJvmyGWWl7HtN0Uv1PpxrWu9tbj3hjVu
 FyrvvPfN97eEqtnMCwqtEp4LhPFyN8mJnE2J0IN4LvZx/dUdoDHHfqZ0udxgwWwEETnp
 DCrNr9XZR3+m5yMkJHSNck6wg30LONQHIClG0Ic05w2YApNLIvOT6jz5wmnPFhSXvcGH
 HsgOAFRLY5ayxA9xOJtPZmPnnlYV6XmVIzJT+M+rs3QMUfPbvztVlZiv9FhQn5CLkM3e
 LS1Q==
X-Gm-Message-State: AOJu0YwErnXWe+vY9z3bSmxB5CWkGma05r9LFksEQMOIFOi/kLCs+BkD
 uYdD8AMvA0mXn1blnkgupFHUqQ2VlaOmkQ+LeKjGwLBTEHwcZjwXkgBdPf1WVxyv074TBp8uvhe
 Fu3F9+BYBfw==
X-Gm-Gg: AeBDieuJQZFO0xqqEQMF6F1dpca6pFWeLf8awYlnBPIAa6+9P6961bH0f9Aa8TeklY7
 OqcCXkZS6IeUB2cpQou5uOcF18eIDuu7X/w9kZPSB6QS2Cwfhs1oYWfL2wSOV2EdWli1laMk6JP
 3w+6RhRy4i2E/QZZeD0tQYJgM19V6EywwE3beX+BinFfuZIcSqWfPUkPXW82DabgzM8C5rqKptl
 n56myqw79GqkgFQK2r9tykgTtBcrA9WWDdJP40ZHG+cdia3aQhfaI3wPY+c+IovNbPdm2rRv0CK
 nCuGG7THgN/cUO+BZsMXj1g36uNQsherQzFE8q22a0miltbO97JuS251yg0WN0rDO5MyDa/qVED
 HAtZ+9+j9WRJqp+0fiqdUzmk4YfXnhIo0wqHqryUZQvnoCi8890wc7Rd3X//h9E8qDDEeIVpGl9
 A4PAbmqiznlV/xD7gFGQK06a22Nc7WhlEzGDSAvHu7WofqbVh0
X-Received: by 2002:a05:6a00:2388:b0:82c:e46d:df54 with SMTP id
 d2e1a72fcca58-82f0c2f295cmr1994858b3a.54.1775795591345; 
 Thu, 09 Apr 2026 21:33:11 -0700 (PDT)
Received: from localhost.localdomain ([94.156.149.190])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82f0c311a06sm1323702b3a.10.2026.04.09.21.33.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 09 Apr 2026 21:33:10 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu,  9 Apr 2026 21:33:08 -0700
Message-ID: <20260410043308.42434-1-christian@aperture.us>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1775795591; x=1776400391; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=llfvTQLqfbH73uwGt0K/igVhEntScSMcGyvfq5nGG5M=;
 b=IGBPzfHb+mf596ilcGJz1XkOMo6WBJBPWcgqUKFQdYFl4CN1zNlXJ2fgxuk1HwvY4Q
 geyHgXLMWwHT7pSAIs6N0evZj+M9qdk6cjpf0UuROstQ00yp/YWdq/FKcvjZMjx6yHRG
 hNaRyevRP6blvkGZM6SVpnNP2p3bULgpa7bncMcUcd0yrgVWKmFZE16854X4gXUvn1yi
 iAvAjhkG3AbKJRW+vHnQgEUpC2hD0AJ2TK4ebgB68Ez6CdYSyD6YA4Pc1adCJur84Tmq
 D+bbZq6etEpmBMpIvBxf6xGfRrhtsEhP3qCpwVMNernTyYYfbjGPJyAa4+Ll436jg7nv
 xGfg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=IGBPzfHb
Subject: [Buildroot] [PATCH v1 1/1] package/go: bump to version 1.26.2
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
