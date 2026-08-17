Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC523C5B572
	for <buildroot@archiver.kernel.org>; Mon, 17 Aug 2026 16:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FD5D40765;
	Mon, 17 Aug 2026 16:30:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bbw4TLlLHBr9; Mon, 17 Aug 2026 16:30:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 831054076F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786984240;
	bh=nyjjOrmcpYQkHHQPY8GKCxZMf729b9C/mOk295HHbfg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sSGCkFDPef2VHaUIjbOsMNNRePzXNaXT3+DlyxpyEkRshTTWn3y+UO7KoH0sXV+t/
	 IofQxXpDp4J9xc4MHMu4+gUhoZc6ER/dJ1LLtlp8/PsZYJIit9MmCgMHKCeyVrNMVV
	 i3DtaGYPKa05QkhZh1vst0ucNl1lvsOL6bQ9ieRDQV6FKzsbvSu1AHonSl4uVQ1Mpt
	 z0yTv/m6DO8mtHGTCZ6SjwOvPiew5M73zLRBcOGqlfdSPzYfTw+Ep3fq5dNxAY5Wjd
	 d8foFzqJ2iZw5nu9KZSGuXVFF3jcxUnOksksXUlFsN6nOYmbUwUFPLF0KvbskVlULf
	 eqIArD3gbD3ew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 831054076F;
	Mon, 17 Aug 2026 16:30:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E41482EF
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 16:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D57DE4076F
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 16:30:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id un6PZ_oGpuGH for <buildroot@buildroot.org>;
 Mon, 17 Aug 2026 16:30:38 +0000 (UTC)
X-Greylist: delayed 1229 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 17 Aug 2026 16:30:36 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2E23A40765
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=igalia.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E23A40765
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=UJYTADxV
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E23A40765
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 16:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=edxqNuDQWtiw0ngksWTkIhMvHK6gvl+32nQtJouY5WY=; b=
 UJYTADxVwG+T1+EnAFAqzELZnd4a2IqCcz3nMebgbXTblCRtDRPBtr38bEPeMX/rghR2gFdBTgIEH
 bt3bRZozWLGi6NCRIuYfHDZs2fVA0bCZFl+RsOHdy1Cbv/dioDbtdy5MQnMmrfpasG1PC6uwdOzfP
 QdqOqwKbC6nvHhHn78e+XGYwerr1UpnZvVirbGEEtsUjMjgGmfYO1xgZAvDrvKnAoDaBYyyD3ba5Q
 d/KBtxCjktVyzBlRIIuHLPt2ZQwsUKKxsCUnT/WT6K1TQtOu4412f//JERYVuW6R2smutwTTcNvDb
 tSgx15JFcJ9QDWyZ5/dY0rxcbZaT4wFMRg==;
Received: from 68.171.94.90.dynamic.jazztel.es ([90.94.171.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wvzuW-004jv8-E3; Mon, 17 Aug 2026 18:10:04 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 4b36812d;
 Mon, 17 Aug 2026 16:10:04 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 17 Aug 2026 18:10:02 +0200
Message-ID: <20260817161004.932094-1-aperez@igalia.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libpsl: bump to version 0.23.3
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

The most relevant change is included in 0.23.0, which fixed handling
of trailing dots (so e.g. "co.uk" and "co.uk." are treated as the same
suffix). Otherwise, it's mostly cleanups and support for non-Linux
platforms:

  https://github.com/rockdaboot/libpsl/releases/tag/0.22.0
  https://github.com/rockdaboot/libpsl/releases/tag/0.23.0
  https://github.com/rockdaboot/libpsl/releases/tag/0.23.2
  https://github.com/rockdaboot/libpsl/releases/tag/0.23.3

The changed hash for the COPYING file does not imply a license change:
it is unchanged, but the copyright year was removed in favor of a note
telling to check the Git history.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/libpsl/libpsl.hash | 4 ++--
 package/libpsl/libpsl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpsl/libpsl.hash b/package/libpsl/libpsl.hash
index caf760c496..4d9e796395 100644
--- a/package/libpsl/libpsl.hash
+++ b/package/libpsl/libpsl.hash
@@ -1,6 +1,6 @@
 # Locally generated
-sha256  1dcc9ceae8b128f3c0b3f654decd0e1e891afc6ff81098f227ef260449dae208  libpsl-0.21.5.tar.gz
+sha256  93941f85a1e7bd593fa94f299233cb5dfc91cd144fd9a78a6ceb75001c5b03be  libpsl-0.23.3.tar.gz
 
 # Hashes for license files:
-sha256  322392e6001b2b3b0fca705dc9f11f26e12441188ecde50eb1d22909980b2925  COPYING
+sha256  e7c9f0d8498d28a360a7e8293ea70fd7bd952955b636938322c13d60a03b5a45  COPYING
 sha256  1d7f52747a9169751cdf2641a8299c0098e9ecdf9429296ffd55bdb14c9ed5b3  src/LICENSE.chromium
diff --git a/package/libpsl/libpsl.mk b/package/libpsl/libpsl.mk
index d1a12f864c..6e7300529e 100644
--- a/package/libpsl/libpsl.mk
+++ b/package/libpsl/libpsl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPSL_VERSION = 0.21.5
+LIBPSL_VERSION = 0.23.3
 LIBPSL_SITE = https://github.com/rockdaboot/libpsl/releases/download/$(LIBPSL_VERSION)
 LIBPSL_LICENSE = MIT, BSD-3-Clause
 LIBPSL_LICENSE_FILES = COPYING src/LICENSE.chromium
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
