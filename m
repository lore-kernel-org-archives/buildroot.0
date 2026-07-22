Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFD3C44536
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 22:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A12B9608C2;
	Wed, 22 Jul 2026 22:00:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ywZUgXwTKUb3; Wed, 22 Jul 2026 22:00:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51E37608B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784757657;
	bh=5Dnr77pX8PGbKznydfSm+6FbFI2+3cEoZbLktpCsuoM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WnusExjccQw4MueTXhaVeqTDMCjsdETwxSl4hKnhmrTll5SISZP+tZz0F5xZr9sgh
	 kUZ2pbSjBAi14LRFZX+bpA370DcrMwFvDXMGBuob6FVpTPvGosffsWVKVKKP8ZVHy7
	 Vt6E2Fs/wwKEaj9S6hS1v0PuXo+RWEyjXO6Oj5tZsRbbOauaZK87Z5Vib/2/KrcAiX
	 9zPBP0jRtWWTlfcx/GDwsq774pzdO8DAZ/JWrjGGtoGbuFl9Ud1lWlE54mDsCmthP1
	 ovtVxNFi7bdV13wb3oevvXhKC8T3OCbNWyWmj+KRLpva5AP6MWSsl2UEocCRpZRgWX
	 gVFfUqU6YJwug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51E37608B7;
	Wed, 22 Jul 2026 22:00:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9746C3B0
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 22:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C1C2409EB
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 22:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 13bwm3WN9jFL for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 22:00:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B1812409E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1812409E9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1812409E9
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 22:00:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0aa1.dip0.t-ipconnect.de [91.58.10.161])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 22FECA4C0377
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 00:00:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60818)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wmezi-000000000Av-0wQv
 for buildroot@buildroot.org; Wed, 22 Jul 2026 22:00:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 23 Jul 2026 00:00:48 +0200
Message-ID: <20260722220049.3618182-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1784757650;
 bh=T7W17k2hJ6x5nyY7srcGfCshuYAsGDBl21dVlW5h3YA=;
 h=From:To:Subject:Date:From;
 b=l41xEcgq6dhtlsbfXmR0RU7lQ45U1fC75ipFlAzMJRPLKiCaMBA5ntTmeCZ+IcGjf
 C08aW3/3HH9PZ1Gqb95anYVBnzQ+mVxgEoMHBA5M3Z0QZclqi3A4HF0314DmQfv1m/
 ZJWQQ38BZqkKNhXNvfhPnuWfGf2MSR8K6S9b/KUoJRNj4aCIOy8xM32CjvC/t95B4T
 G67rIf2RYDuy3hOozAtMQvYJ/EJKIr6aZ7AGCE6Gz3FFD97pb4y5BNgt8znLhqcC3w
 37ZzdoJpzN2pklQDJ5r1mo1gK+x+KzG/TRRsrFfRtYktGy7ncWgYeszVPX4V0JqCQn
 Qgl3EOJOSnhqA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=l41xEcgq
Subject: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version to
 26.3.0
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

https://github.com/intel/media-driver/releases/tag/intel-media-26.3.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/bbc3d4fbe215d8c1b372591da5bd624d28cc1963

 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 99764cef98..e3e28b9917 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a23185fca05c8fa8bdec09ea9ee8a20361163c87035ec978de4e2bb048a55534  intel-media-26.2.4.tar.gz
+sha256  ceeb7a5914953bc03c93daa1251ab41f1e5706bfc272dac3d4d4443a20689002  intel-media-26.3.0.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 6c77ef83a7..aee7d1fd9a 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 26.2.4
+INTEL_MEDIADRIVER_VERSION = 26.3.0
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
