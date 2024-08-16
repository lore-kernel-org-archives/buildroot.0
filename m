Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E043C3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 16 Aug 2024 13:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3189484367;
	Fri, 16 Aug 2024 13:26:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BHNFj9GuhjZW; Fri, 16 Aug 2024 13:26:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF19584371
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF19584371;
	Fri, 16 Aug 2024 13:26:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0667C1BF360
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 13:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F145C40E13
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 13:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0VTifY7NOwVk for <buildroot@lists.busybox.net>;
 Fri, 16 Aug 2024 13:26:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3912B40485
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3912B40485
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3912B40485
 for <buildroot@buildroot.org>; Fri, 16 Aug 2024 13:26:44 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sewyX-0017k6-7i; Fri, 16 Aug 2024 15:26:40 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 93bf644c;
 Fri, 16 Aug 2024 13:26:39 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Fri, 16 Aug 2024 16:26:37 +0300
Message-ID: <20240816132639.3844618-1-aperez@igalia.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DqGGNtYqozTmuvEAf8RkrVqIkfgFmu3Rf+vXUKiz83w=; b=SY658Ol69QWEVn7dWcsyDKjWKW
 QKgDUrBe3ALcNIt0122CeIRELlsN0ciJW7rMFm6eT57ibHCYfFsM/4bEKs/BZPNNTJNEpNuP/4PPz
 HOx89C8hGkwmCYhJOzLocsfG8PEpjqj84yoV8cQ01csSPGpkMNz0jYuZfdjGvMSjHb+Ig9rlVteK/
 7I0hOA2KOfU4ERgKV5HEqiQ3RxDbbrHfznRXHGxo19BtBMhmcL9BvOJR7mC12mVww4O1kuHDQIaoZ
 uZWLNeMkzKIOOLJtkw5ZhdczSRYPoVGZ3eDMZuVgMt9XdIhMRtJUpbyBFLiz9nvMVGRMxTN0ODYeT
 9SinuU9Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=SY658Ol6
Subject: [Buildroot] [PATCH] package/bubblewrap: bump to version 0.10.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version adds new --[ro-]bind-fd option, which other programs can
use to avoid TOCTOU attacks. Release notes:

  https://github.com/containers/bubblewrap/releases/tag/v0.10.0

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/bubblewrap/bubblewrap.hash | 5 +++--
 package/bubblewrap/bubblewrap.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/bubblewrap/bubblewrap.hash b/package/bubblewrap/bubblewrap.hash
index f61aca34f9..37276046b8 100644
--- a/package/bubblewrap/bubblewrap.hash
+++ b/package/bubblewrap/bubblewrap.hash
@@ -1,5 +1,6 @@
-# From https://github.com/containers/bubblewrap/releases/tag/v0.9.0
-sha256  c6347eaced49ac0141996f46bba3b089e5e6ea4408bc1c43bab9f2d05dd094e1  bubblewrap-0.9.0.tar.xz
+# Locally generated after checking GPG signature from
+# https://github.com/containers/bubblewrap/releases/tag/v0.10.0
+sha256  65d92cf44a63a51e1b7771f70c05013dce5bd6b0b2841c4b4be54b0c45565471  bubblewrap-0.10.0.tar.xz
 
 # Hash for license files:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
index 9dd711ce47..94ae72d4d2 100644
--- a/package/bubblewrap/bubblewrap.mk
+++ b/package/bubblewrap/bubblewrap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUBBLEWRAP_VERSION = 0.9.0
+BUBBLEWRAP_VERSION = 0.10.0
 BUBBLEWRAP_SITE = https://github.com/containers/bubblewrap/releases/download/v$(BUBBLEWRAP_VERSION)
 BUBBLEWRAP_SOURCE = bubblewrap-$(BUBBLEWRAP_VERSION).tar.xz
 BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
