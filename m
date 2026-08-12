Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AE9C5B572
	for <buildroot@archiver.kernel.org>; Wed, 12 Aug 2026 19:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90DC640944;
	Wed, 12 Aug 2026 19:12:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id docSpVnK4n2P; Wed, 12 Aug 2026 19:12:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2850A40940
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786561971;
	bh=wJEu5rttWc+xRjW2cIGlk5RJkW4ljI1x9JSxiDq4a6E=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K4PkyMpX0SZJnALAP702u07hoIkMumnli6YVJvomH4+1O2qdvGXTPCXb/BJIfFupf
	 ixe2+1jIEDHnXHI52+iR06jDpAopo0DxObsA8a1REyqOTYKnFuq7I4DI+fdB+hMqZo
	 P6FMK3tqyA98cGi6kMfMl0B+RwD0RXixOYyi71mHxVJaG+JATrFxN0jcjT/yMygLZ1
	 IlgyYaGA5kgYAu4RxC+zAOyf8NX5Y/WZSmLMZuRJxjOiWnl+Qf1lp9uRYttdIDTk/a
	 YKmycu74lY9OgSORH0zC8p7VIPDzlu3TqC44qftxdX66MCZW1cHLdiHg9y/A0Iy1ZS
	 9FenytDcK96cw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2850A40940;
	Wed, 12 Aug 2026 19:12:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BDB25270
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 19:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF86440092
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 19:12:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FJ1aeeZ8XiVD for <buildroot@buildroot.org>;
 Wed, 12 Aug 2026 19:12:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 197A640073
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 197A640073
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 197A640073
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 19:12:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0529.dip0.t-ipconnect.de [91.58.5.41])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2E7FDA4C4876;
 Wed, 12 Aug 2026 21:12:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46978)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wuENX-000000004hQ-1slC;
 Wed, 12 Aug 2026 19:12:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Wed, 12 Aug 2026 21:12:43 +0200
Message-ID: <20260812191243.3735751-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1786561964;
 bh=vV1pTLOW0zUAQq3sKAkppGau2t5yhjGcxw56aTlPtMA=;
 h=From:To:Cc:Subject:Date:From;
 b=AifAprZA6Ur/lEZZwm+FUJ0+kt+2qMdD6kvmrIvPhp0Tm6PxoeIIeebRdsltvNzEo
 wRguPk0gd99YM8Pjf4QqE+Lx03WB2U4vOZJj0UFPpM/cW3AZlK4GlrWEapU3F1suSO
 n8Zvo5WHurgpjbqWgx7vhMjWnvAvpxZIl7q8xt0VBEPrIloanfJ4KhEzfKZZJt9DOe
 0e4PCMyJJJW3p3DqeGgZyPJcNtTKSVo/0TCN9nBIVBaMGY7TKA2N+ZkvTVJTQ7Zipx
 tDCUtX4Vn3X4NBt7uVxSK8iDiRxbU0MbY0kuM5azni0octeWyyJl988bt9hEmki7o7
 MnhtAMAXZS3PQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=AifAprZA
Subject: [Buildroot] [PATCH 1/1] package/libarchive: security bump version
 to 3.8.9
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

https://github.com/libarchive/libarchive/releases/tag/v3.8.9
"Libarchive 3.8.9 is a security, bugfix and minor feature release."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/8de0b7f45016e10e439c7b6e2bab875c02fdeae0

 package/libarchive/libarchive.hash | 6 +++---
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index dccb2cc4a7..acd4b9ef22 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,6 +1,6 @@
-# From https://github.com/libarchive/libarchive/releases/tag/v3.8.8
+# From https://github.com/libarchive/libarchive/releases/tag/v3.8.9
 # After verifying the pgp signature from:
-# https://www.libarchive.de/downloads/libarchive-3.8.8.tar.xz.asc
-sha256  3873a88801da067d0528a989af06877710529d50ee8fe6f3970cbb4302efb918  libarchive-3.8.8.tar.xz
+# https://www.libarchive.de/downloads/libarchive-3.8.9.tar.xz.asc
+sha256  888c934f9d95648ecb9163dc8e23ab80a476ecb81a8f1154704a227b5b676dde  libarchive-3.8.9.tar.xz
 # Locally computed:
 sha256  30e556b3959e3985d66efefec5eaac51d4995053caa1d3cffe6eb916f146f229  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 23cb82f7b5..5b6aea3407 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.8.8
+LIBARCHIVE_VERSION = 3.8.9
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
