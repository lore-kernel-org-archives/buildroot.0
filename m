Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9715CCD4F54
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 08:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 639A241FE9;
	Wed, 27 May 2026 08:24:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GQjAqVYaD78C; Wed, 27 May 2026 08:24:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30D4541FD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779870276;
	bh=h+9e8M9v/xXmerQdX9s+SJBMwjL54pfmLjwLu+OSMpk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LaasBHgr4ODAMVsqx96CPAdr7wfs8L47NltmP7PLimU4O4E0q8JznMrKVQUDybB/F
	 cxGlPgVFTLQZP29Y3MncrF9yoSrXq5kfTX6OwGo04R830RLjJkPStGWkazqBbSTLWd
	 VOul+BHP26/GBSoT2Cia/JiwwawmIMJA/Ep6+6md1AtyrF9HG9pHKiquLfQo6M9TXS
	 cyBuybQ5KLaIxVQ4NZPQYhFeNv7qiBjSKZodpi+k+b1ZGr5FER/tjZDTTXWC0Yrcd+
	 B0KkQM1+T+kNeRc+UyW9uYy8caz5QsKlw9pazlcOUoRCEFh4OoAx8PWBAeyg3O7/Yj
	 zzbXIwXkH0dAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30D4541FD4;
	Wed, 27 May 2026 08:24:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DA59D21F
 for <buildroot@buildroot.org>; Wed, 27 May 2026 08:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A73280993
 for <buildroot@buildroot.org>; Wed, 27 May 2026 08:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pQp92xxeSEQP for <buildroot@buildroot.org>;
 Wed, 27 May 2026 08:24:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 96E0380893
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96E0380893
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96E0380893
 for <buildroot@buildroot.org>; Wed, 27 May 2026 08:24:24 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-49056b9f04aso50581715e9.0
 for <buildroot@buildroot.org>; Wed, 27 May 2026 01:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779870262; x=1780475062;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tGoxf5CqqBauu2x2M4PRupAAsYeCCyn42xsNeQYTPDo=;
 b=K0Oixu6hcE2vygghMFISU4ua4NMF9wMy/oHk8hODXVVVfkuzqRno2XezDY+wuo84c8
 lzoyvaHJdLQ9Mu7VWO/5Zb4ST/YlB8WLGmVTjjfR73f/OKFw54bSJXlaVfoWYjgoVhde
 Zm12HTA1BF7v6zTGz4CH8FJ3CSDwS19khdDWtLp2U63cP/e53qd07EN0Y62jsE3uQwaS
 Jz4vrhaMQn4tQ4WOy51z4ZuF6iNtloSsAhvHnJtGbdUsq/JbPPQ4OvoX3JDW6icwfXPx
 7pch3r/Km5n+PkwTzgZkVa+nzCoBW3SVQ6hQPmqudE97AOdU4+lzEsIRoh18iLsisptc
 fahA==
X-Gm-Message-State: AOJu0YzdxOyih0sDXG8f7tPU1Ptyb3UArg21VdLQKMY5HRklWE9qF+Mf
 oAIG9LbmWF7DAn9J8wPUzj1pcLjLmxe8//M3j/4ULaPWEFKpixrRA8M2SvCSS1j8Zh6sSlVfvdU
 qm6dQ
X-Gm-Gg: Acq92OF3HxKaS+/pgKZh9dACrjCUbMVFuRDLrJLvjfKaZ7NuE9+oojLy2IJn6m+fdgc
 93CbTzVkY7InQFVPGFXftjBTO/LCis+nhy7aT4OGLMVG10bJP/3Y8y02HViDQtrO0U742MQVg1N
 jqJzr4OxcJS6KaKIrgK/6WJz/a7ocsk/3W3BONWIzLBXM2tNpKj3Y4urp7mhnIrVWX+k/zXAvj2
 fd3yE0U0VM6yfgSoiNoGNxBhTefPF3Lu8SSHkFk7fKk4b3oj4WN+zoznk8i0fH2S6PxUk8a14Mv
 lxEHi59gQ0FuPqZKTSCiNpPkXj8QyfW4ScomfX4k3LfHwzTrUC/sfmpEhpoA4LhNtZwimG4BKgm
 Sjpz2p6Q2yowS4HkilzCHZsztFUPYyiA0WcqM7TsJ2ZTf7oBNoV4z5cji0Kc84u2dKFf+BP1vnb
 PguM2rDfZyrlyfdVFIOgLG1YTB5lTLTayL3EiHfKgmCTF2sW6T+ez30L+QiA==
X-Received: by 2002:a05:600d:6451:10b0:48f:d5e8:758c with SMTP id
 5b1f17b1804b1-490426d1a78mr270286085e9.16.1779870262551; 
 Wed, 27 May 2026 01:24:22 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4904561a160sm437803495e9.9.2026.05.27.01.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 01:24:22 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Date: Wed, 27 May 2026 10:24:17 +0200
Message-ID: <20260527082418.151980-9-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527082418.151980-1-thomas.perale@mind.be>
References: <20260527082418.151980-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1779870262; x=1780475062; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tGoxf5CqqBauu2x2M4PRupAAsYeCCyn42xsNeQYTPDo=;
 b=ABWPMtIOwiCNrRi3ohN2btFK9I8qTasVhYZpE2lpWz/tZtd+TZd9XGwefE5k0iS/tf
 oTxhJKT+7TGCBCMwGh4WmZZTnbh2PWzRN9zy/afMhQeE+N7G8DKMzYaAIHtJXxKc4D5r
 v+KRJ3i/32EktTAl4corB+dWzH/5Z+jgf4rE6v7FXB2rlGnVdfhAXHI0uz/LW2/U2yLQ
 xG1sjL4r4ZGRwamxvlNdVbZLE/bfvJ6Z+pU/91Jkz2GRCR9PIfy+ntzXxzBOwfQDIEvL
 wFhE+7LEIJBq4fr801477hPOwsz7kG6yoScNKUDIbtZx5gFPLO3PgVzKAhUGIobI+oV9
 ndZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ABWPMtIO
Subject: [Buildroot] [PATCH 2025.02.x 8/9] package/go: security bump to
 version 1.26.3
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

From: Peter Korsgaard <peter@korsgaard.com>

Fixes the following security issues:

CVE-2026-33811: net: crash when handling long CNAME response
CVE-2026-33814: net/http: infinite loop in HTTP/2 transport when given bad
                SETTINGS_MAX_FRAME_SIZE
CVE-2026-39817: cmd/go: "go tool pack" does not sanitize output paths
CVE-2026-39819: md/go: "go bug" follows symlinks in predictable temporary
                filenames
CVE-2026-39820: net/mail: quadratic string concatenation in consumeComment
CVE-2026-39823: html/template: bypass of meta content URL escaping causes
                XSS
CVE-2026-39825: net/http/httputil: ReverseProxy forwards queries with more
                than urlmaxqueryparams parameters
CVE-2026-39826: html/template: escaper bypass leads to XSS
CVE-2026-39836: net: panic in Dial and LookupPort when handling NUL byte on
                Windows
CVE-2026-42499: net/mail: quadratic string concatenation in consumePhrase
CVE-2026-42501: cmd/go: malicious module proxy can bypass checksum database

go1.26.3 (released 2026-05-07) includes security fixes to the go command,
the pack tool, and the html/template, net, net/http, net/http/httputil,
net/mail, and syscall packages, as well as bug fixes to the go command, the
go fix command, the compiler, the linker, the runtime, and the
crypto/fips140, crypto/tls, go/types, and os packages.

https://go.dev/doc/devel/release#go1.26.3

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c465f0d8eb676cd10ef48a864766abde43ffb239)
Signed-off-by: Thomas Perale <perale.thomas@gmail.com>
---
 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 77be843c83..69f2a3139c 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  2e91ebb6947a96e9436fb2b3926a8802efe63a6d375dffec4f82aa9dbd6fd43b  go1.26.2.src.tar.gz
-sha256  89835cdc4dfebde7fe28c9c6dc080bb3753f6b0354301966ff9f62d14991bd7d  go1.26.2.linux-386.tar.gz
-sha256  990e6b4bbba816dc3ee129eaeaf4b42f17c2800b88a2166c265ac1a200262282  go1.26.2.linux-amd64.tar.gz
-sha256  c958a1fe1b361391db163a485e21f5f228142d6f8b584f6bef89b26f66dc5b23  go1.26.2.linux-arm64.tar.gz
-sha256  0000e45577827b0a8868588c543cbe4232853def1d3d7a344ad6e60ce2b015c8  go1.26.2.linux-armv6l.tar.gz
-sha256  62b7645dd2404052535617c59e91cf03c7aa28e332dbaddbe4c0d7de7bcc6736  go1.26.2.linux-ppc64le.tar.gz
-sha256  410726ed10a0ea6745c2ea8da4f0e769fd3ce819cd4a41a67ad08b094d5dfc31  go1.26.2.linux-s390x.tar.gz
+sha256  1c646875d0aa8799133184ed57cf79ff24bdefe8c8820470602a9d3d6d9192b8  go1.26.3.src.tar.gz
+sha256  0ef3626a149b5811c813838c62b7d6618d03ea36047b32c90b0e4851cc42b1fa  go1.26.3.linux-386.tar.gz
+sha256  2b2cfc7148493da5e73981bffbf3353af381d5f93e789c82c79aff64962eb556  go1.26.3.linux-amd64.tar.gz
+sha256  9d89a3ea57d141c2b22d70083f2c8459ba3890f2d9e818e7e933b75614936565  go1.26.3.linux-arm64.tar.gz
+sha256  d44133d4c66b1451a1e247da26db7716f76a081c0169a75e6c84e1871e394320  go1.26.3.linux-armv6l.tar.gz
+sha256  dbd82b50530ead2beb1fd72215117380df3cb16332b51467116dc35b3691dd75  go1.26.3.linux-ppc64le.tar.gz
+sha256  5c0605b7175449f1c8e8cb02efaba2695caab914fad4dcedc764c2f4c6dfe6ca  go1.26.3.linux-s390x.tar.gz
 sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 67948dc405..ebd0d418ef 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.26.2
+GO_VERSION = 1.26.3
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
