Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2A4CD6E44
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 08:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1BD580893;
	Wed, 27 May 2026 08:24:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mvdn6s3p1vvt; Wed, 27 May 2026 08:24:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25A4680A95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779870275;
	bh=tqrscar9z1gW65jS5Oj0NeFCmwEy9d/7TuuF9MmbyK4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dpmpgAfii4gMcNGfDO8hSvp0NODe2T2dY68YUuhzwSIQYAmR/TQMtlJBLB9UnPtmS
	 VTfOrV2PkjADHvCDuYBZYNZ5wabAjdpp3/NrxSiimkbw9T5r1CE2pbT1ZIstycIS4J
	 5x0kecS8V6AhFwINelwaoXeWCp9WtcBK9rM5JMoVutF3tZP7ujBD3nq6Y/F8cOqLcI
	 AEpIVcapra3aUROXlYpQPb94xfaSgXjSsw4PjYGbgFL5CvzXoMfZNzlVWkL7cQWyaM
	 eesQY9DGJKRLtxFWpV9B+2OS+e2fsf7PpndQ1KdGbJzWgj9ytcpMlpk/fTewWvhs8U
	 ZHWJSU4L+KhEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25A4680A95;
	Wed, 27 May 2026 08:24:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DD5E35B
 for <buildroot@buildroot.org>; Wed, 27 May 2026 08:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B0A141E7F
 for <buildroot@buildroot.org>; Wed, 27 May 2026 08:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id grgSxI3IiN9P for <buildroot@buildroot.org>;
 Wed, 27 May 2026 08:24:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 029F841E74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 029F841E74
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 029F841E74
 for <buildroot@buildroot.org>; Wed, 27 May 2026 08:24:24 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4904c1ce4c1so51371755e9.3
 for <buildroot@buildroot.org>; Wed, 27 May 2026 01:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779870263; x=1780475063;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JDj+LlG++dEbVpQn4sAyB7Oku7sxCvFrpiym2x8jnPQ=;
 b=njJZJ4u7+mHCkLs4STGvnV5OkSyDujCwof1Q/X56Xyy0pP8puDP8bJOkCAX6UuIIOT
 7flJ7qpGYa4h+k/rji2mDjsxOLlQlwPbeepPYruknmlSgiPbIf4GAGe/Kie94AH4e2SI
 GzBayr3IdJzxpm6NeQxJnRyCww0hnLxOrLXvejLwNVc9eFmMioKBF4OWKUa3ZpPHNJuk
 lHSU5LzW24Lehi37wVM6KNcMultRqj5pc1HYSFtD5Pu+XJTDL2TNG4ZGOd2GCtFmx6yK
 RdgsLxAotyBV5h2w9uNdVf3IRZ85SI4N4Hv8+KVuCHGo2ZfruEytCc8ahBksQU/meIYF
 u0Iw==
X-Gm-Message-State: AOJu0Yz+kO/lZmWI3Lp8hQLdTaud2aPRXZ8VEXV27cDFb2uOO8XFO1IT
 dRuBSOWpEjZE9bHV1WyHw/GdN06dBCIEqPDrKI5FfKOk1Rjjs6JA6G4TC0Yf/JTVuZmF1PIXRsV
 Ewq/7
X-Gm-Gg: Acq92OFpBV3VnWeYQLFyXN7nbdxJhsHmRqydqgAC4qd4cTJDUYxTqE10hOw0917Uwcz
 4Y3Tulgya4QbgupTb6eQMIJNKlL4qBNT+FF7gL96XZEqhG6ivjG9oC1isgxULxMhhTqHJ+96Khs
 tPd7MHjwyBajxWaZkbsIFvupqOGDT7q6K4ZPdbkSkEBOmEr7UpBTj/BFtgfdlUu35/bLNiOOh2z
 zxnTaiqYL1v7O05UEgRjjZLe5aoQ6TvuPbx7XKS33vDZ1kiCJ6xsVnN6ISLDAuHLZw+jJlErUIm
 Tcm2UtSaKneM3QAR1FmdfdNQa3HfxRTdypeFYErdtQb2DHvybkEh9XkrL4NbLxIs2+30kHxc0rq
 PIYWplJHULYrP+mazmOfbZlbqCSc0OiH1OlGzdHUhcVXPahSAjp4j4KPMPsZA80SIYL8y/zpyTM
 A8KtTu3lLYR21EXVYzHWy26RIXxxvPrqRr6vXh84b/aoFN7OU=
X-Received: by 2002:a05:600c:c4a1:b0:48f:d835:e0ff with SMTP id
 5b1f17b1804b1-490426d06cbmr374212175e9.17.1779870262923; 
 Wed, 27 May 2026 01:24:22 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4904561a160sm437803495e9.9.2026.05.27.01.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 01:24:22 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Date: Wed, 27 May 2026 10:24:18 +0200
Message-ID: <20260527082418.151980-10-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527082418.151980-1-thomas.perale@mind.be>
References: <20260527082418.151980-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1779870263; x=1780475063; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JDj+LlG++dEbVpQn4sAyB7Oku7sxCvFrpiym2x8jnPQ=;
 b=dbGA7MGe4IBESJhBpY+754izBIksedV6uCKcRcOHuEp7Lu92EWSc3jd+oVkT/2HzjM
 u0GxOj6y57f18uGD31QOD0Clo6mnlWAsu/gZwrvSEUX2uE787JPsAsc/H2Jso5iJRqz4
 cmIQbPTM/sZB5jXlJcNgki9e4aC/gqaeKQ+5mkq6jVbITCgbPglFytdp3PnbIDCGZ2mf
 rLUSig/6ksFUF6z7zGth0WUmSsOVy4KZwq4ZDbKVHwdDoUJwTAeSwSYKkjx4YyLJFGlA
 IUi4/OL1RGdcb8yP+x6K8EaRSixbT0AM3EaDj0la392ScLR6aY65XPMiSOgfCjDvx3Eq
 HvqA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dbGA7MGe
Subject: [Buildroot] [PATCH 2025.02.x 9/9] package/go-bootstrap-stage5:
 security bump to version 1.25.10
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

go1.25.10 (released 2026-05-07) includes security fixes to the go command,
the pack tool, and the html/template, net, net/http, net/http/httputil,
net/mail, and syscall packages, as well as bug fixes to the go command, the
compiler, the linker, the runtime, and the crypto/fips140, go/types, and os
packages.

https://go.dev/doc/devel/release#go1.25.10

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c19e6d80fbcff18465a6839676195a91db18ace5)
Signed-off-by: Thomas Perale <perale.thomas@gmail.com>
---
 package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash | 2 +-
 package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash b/package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash
index 5e40ba7e6e..58391471d9 100644
--- a/package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash
+++ b/package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  e988d4a2446ac7fe3f6daa089a58e9936a52a381355adec1c8983230a8d6c59e  go1.25.8.src.tar.gz
+sha256  20cf04a92e5af99748e341bc8996fa28090c9ac98765fa115ec5ddf41d7af41d  go1.25.10.src.tar.gz
 sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk b/package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk
index 9006e5bf44..85468414a2 100644
--- a/package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk
+++ b/package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk
@@ -6,7 +6,7 @@
 
 # Use last Go version that go-bootstrap-stage4 can build: v1.25.x
 # See https://go.dev/doc/go1.26#bootstrap
-GO_BOOTSTRAP_STAGE5_VERSION = 1.25.8
+GO_BOOTSTRAP_STAGE5_VERSION = 1.25.10
 GO_BOOTSTRAP_STAGE5_SITE = https://go.dev/dl
 GO_BOOTSTRAP_STAGE5_SOURCE = go$(GO_BOOTSTRAP_STAGE5_VERSION).src.tar.gz
 
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
