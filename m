Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E047C71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 16:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D75A61083;
	Thu, 12 Jun 2025 16:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C3a2Z7juiB92; Thu, 12 Jun 2025 16:59:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5805D60BC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5805D60BC1;
	Thu, 12 Jun 2025 16:59:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F21AF1BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 16:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D79BA4088E
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 16:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sbnVqItwemlC for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 16:59:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0A2B9408CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A2B9408CD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A2B9408CD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 16:59:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c09e.dip0.t-ipconnect.de [79.214.192.158])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D9AFAA4C2941
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 18:58:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59452)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uPlGF-000000003th-2TDu
 for buildroot@buildroot.org; Thu, 12 Jun 2025 16:58:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 12 Jun 2025 18:58:41 +0200
Message-Id: <20250612165842.3473916-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1749747523;
 bh=a7VyxG6E4rFlq0ULnKVLF9MpMv3uJ6qAcA+NADXtLVU=;
 h=From:To:Subject:Date:From;
 b=gugKAkL8UTREm8YUqQJU57MMPye9AmjI88c0g5hXgS3Wkxei7B5BeeyGgj5glw5K9
 9uf9HNh7VdHh64lAEaL8HziVXaOHqgSIuJ5NKA4F9pElPmZqRYsZHNg2FNpygdgX7S
 2DdBDeQgno2ennaVmDuVcCj3M61C/2X7Q5TGrHGr+GigD9ppsBrf6MweuyrcYzavTo
 4cXKRmPBXBgraatPeYoTUe+Cv1gdna5SvplLEflzA0TqtuZ+7yZg+jbUADCgpp7hud
 mWBFbmUzcYLdBdB2zBsXaxStwIo035HC+1DiZivLriximi8pwmrBFekRli+WpRrwtn
 CBYpJCxwbG+lw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=gugKAkL8
Subject: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version to
 25.2.4
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 9409e11a0d..6b510d9c7b 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fc7ffad0ef83979247ae641b0382816129387a0dc29822dd4a78f5bc990c1b1f  intel-media-25.2.1.tar.gz
+sha256  ae36411645c01b17ec4a0997f3e7eccc54087391c3307f291c2edfa4a0511c2d  intel-media-25.2.4.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 8dd6d0e5ef..141a8a66dd 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 25.2.1
+INTEL_MEDIADRIVER_VERSION = 25.2.4
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
