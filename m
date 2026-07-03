Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450C7C43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 19:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E860F40C12;
	Fri,  3 Jul 2026 19:03:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5rLTEZFU_XrK; Fri,  3 Jul 2026 19:03:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 171E240C1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783105399;
	bh=P6Ab5sG+jrlBP9gy7+/GJLU39jhYJt5A0tiZGg7Zxn0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ijo6duPrtoAnf0jShO4Lyz6yngNnThMlyPYtvs5Ak4vnim+30aRv4MpBrCWzlZueY
	 QisWb0+xrF6mQOtPbNf02dXe3GYkKxmq19KZdc3CyU5I+ntX2JKznDObN8I1Xfws/l
	 ChjOFxN6l0jOi5J2OBgvAtqT6PikMu7LnJUS/Ufz2yV8aT55bZxkf9LyHi/+LjZktg
	 ztJQETxw57aeU2zMcN/dWDNH+I5hQ6DwRppZb3ILBxpofMguvL2EK4YFpvdiYG0Lht
	 1T6XfawqeuD/bhOt7CUFn2t7cnlpTYDj8OTf4POo8Rc2+vU00pk3rP/hlI+jCxzgV2
	 t9bSM0KBWr3AQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 171E240C1D;
	Fri,  3 Jul 2026 19:03:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 52503316
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 19:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33D8540C1D
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 19:03:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RuPgEKYywK9e for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 19:03:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4A83F40C12
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A83F40C12
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A83F40C12
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 19:03:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0df2.dip0.t-ipconnect.de [91.58.13.242])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EA75FA4C025C
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 21:03:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36226)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wfjAQ-0000000040i-2fPo
 for buildroot@buildroot.org; Fri, 03 Jul 2026 19:03:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  3 Jul 2026 21:03:14 +0200
Message-ID: <20260703190314.3687595-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783105394;
 bh=+8Is24W1kpbaFAUs3WgJtTpBQ74GmJ3DogqCVw3ARZQ=;
 h=From:To:Subject:Date:From;
 b=CY8HfEkSAf5Cldd9CltqAeIVytQ5H84ZnnIjBRfIcR1sOCcrMOhYuD9AM+x0qFer/
 lLjzMUC4CoEODkKpuKf1fjvq1Sl4FDxhJRZuuawvckxFhAM3zmDK58kA5NDzLCBMKJ
 v0h8l+/YsxLLnZHGg6+9aCPRlGV/kEHRqGSd2awRlB0O1AZdyCyOV/rjifhduMqWpx
 3MEd5c4uiMRC0Zmkg9C7rUh5UpIiio7J2wC06byocf/Xe+aUQ4FGIPB2eYY/SfDp2G
 Orbmqjzed6fJZ/lDTsb4hXvXH9Gv1aL3WqwJozQU9koS6Ccb1pSIIsusL0A/ipsx4+
 VcwDrXDd1mFKg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=CY8HfEkS
Subject: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.53.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://sqlite.org/releaselog/3_53_3.html
https://sqlite.org/src/timeline?from=version-3.53.2&to=version-3.53.3&to2=branch-3.53&y=ci

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/c4ff21eedc8f001621acf8860b29456c861d71e4

 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 948a603d4d..1b81bef6e8 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  588ad51949419a56ebe81fe56193d510c559eb94c9a57748387860b5d3069316  sqlite-autoconf-3530200.tar.gz
+sha256  c917d7db16648ec95f714974ace5e5dcf46b7dc70e26600a0a102a3141125db0  sqlite-autoconf-3530300.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index aa2e24e8b5..b27abef9e9 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.53.2
-SQLITE_TAR_VERSION = 3530200
+SQLITE_VERSION = 3.53.3
+SQLITE_TAR_VERSION = 3530300
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2026
 SQLITE_LICENSE = blessing
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
