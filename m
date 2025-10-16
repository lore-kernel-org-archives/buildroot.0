Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6971ACCD199
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 18:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CCC94055C;
	Thu, 16 Oct 2025 18:25:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WSThOZsuxLUQ; Thu, 16 Oct 2025 18:25:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5541B40552
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5541B40552;
	Thu, 16 Oct 2025 18:25:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BD44D8
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 18:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62A8440215
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 18:25:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6yaxykIu0qTf for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 18:25:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0B98E4021B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B98E4021B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B98E4021B
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 18:25:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0643.dip0.t-ipconnect.de [91.58.6.67])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E9131A4C5136
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 20:25:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60326)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v9SfI-000000001AO-2Zzy
 for buildroot@buildroot.org; Thu, 16 Oct 2025 18:25:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 16 Oct 2025 20:25:27 +0200
Message-ID: <20251016182528.3396891-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760639128;
 bh=khSRK0AMmanMA6yJAfTA0dbliBK3CbScv1XhQHtUqMg=;
 h=From:To:Subject:Date:From;
 b=WEFcJ4WPcN7X2aQ+pZW9R3ZT4Hd2kXrItoshmrkKTLLzguizwDW4+xIJVPdYVC0Jt
 jx3l7sB836hHl5eb+d1vNJqaHsAdSQVwZk9+Bp0eKVyYWfSqNDcRUoNW8Wg7BQgH9U
 PFtt63NqSpBpP/jEybB5ZkqvooJNBIEDM5HgUGkEAuhJiRUcVAR1pj+B5Q6KeBl0Mk
 LQjeSc2DOKpyFxSaWZVHLV4swDuzh3CGzo3EB8Zod+Ec35TD5UqDcAZ6qSpdvgLJmU
 rTCXeckmYRsgk2luUXRQN5Ml8VF3B5ZY8XGxY9STFy0N41qlSiJO8JeoJ4kR2Qh7Ap
 T8J6w/ymXJmXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=WEFcJ4WP
Subject: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version to
 25.4.1
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
index dab780f42c..e574293fdd 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2821cab73a9f40ed3f835836f68102a63943170dbd7b2c34484f28d357ae9392  intel-media-25.4.0.tar.gz
+sha256  b81afbeea7ee94115ecdae9b687aaacda2f8adf9de48f4ed4c1237d910954bf3  intel-media-25.4.1.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 27bd686efb..2e855994bf 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 25.4.0
+INTEL_MEDIADRIVER_VERSION = 25.4.1
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
