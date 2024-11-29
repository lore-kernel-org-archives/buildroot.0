Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE7CD6EC13
	for <buildroot@archiver.kernel.org>; Fri, 29 Nov 2024 14:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AACFF8453E;
	Fri, 29 Nov 2024 14:14:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T3oY3BwFYwYH; Fri, 29 Nov 2024 14:14:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8F0E84518
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8F0E84518;
	Fri, 29 Nov 2024 14:14:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7ECBA712
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 14:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CE3F40A48
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 14:13:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PMIwevXWFOMU for <buildroot@buildroot.org>;
 Fri, 29 Nov 2024 14:13:58 +0000 (UTC)
X-Greylist: delayed 796 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 29 Nov 2024 14:13:57 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3315F4012D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3315F4012D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3315F4012D
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 14:13:56 +0000 (UTC)
Received: from 91-153-34-109.elisa-laajakaista.fi ([91.153.34.109] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tH1kp-00ENTM-0E; Fri, 29 Nov 2024 15:13:55 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id d8ae2a7a;
 Fri, 29 Nov 2024 14:13:54 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 29 Nov 2024 16:13:52 +0200
Message-ID: <20241129141354.913694-1-aperez@igalia.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pEqWrae5npT+JaNbVTymULWn0S5MMYkRI/TNFA9rK7w=; b=H4XlJOm1m1VmRVwB6jtvY89N5H
 99qyB4I4zK25Ah2MgaWFSRJ/apzlZlfWiKgotn2EKDGsf25yEcF7/euYD/UVl8EAOp21nfl1gsDDH
 bhLjLNFYcuBrrZkQeYQGfMdDBCmMYolSHJtChKuGKiDz6TMlr2pY8F6c9wXdy1v3kxjrCCDwljVp0
 QTl/VmC8XX8PeKoiJepL4GFztxmh67m9+tp2jWl6uXh9QqV9eWcH7C8AdRMVOVbwTXoUVPTpphSgT
 GSYy9l/bCi6rs2BXS9AJ7C9i0jBRNN+cA4T96w7k9lzM2m1OV7G2A2cuJdswkMomUw1KargZFkzGo
 Y+yRXFMA==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=H4XlJOm1
Subject: [Buildroot] [PATCH 1/1] package/bubblewrap: bump to version 0.11.0
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

This version adds support for creating overlay mounts (which requires
running with user namespaces available), and fixesd to I/O operations
on sockets. Release notes:

  https://github.com/containers/bubblewrap/releases/tag/v0.11.0

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/bubblewrap/bubblewrap.hash | 6 +++---
 package/bubblewrap/bubblewrap.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/bubblewrap/bubblewrap.hash b/package/bubblewrap/bubblewrap.hash
index 37276046b8..b2b88ffe92 100644
--- a/package/bubblewrap/bubblewrap.hash
+++ b/package/bubblewrap/bubblewrap.hash
@@ -1,6 +1,6 @@
-# Locally generated after checking GPG signature from
-# https://github.com/containers/bubblewrap/releases/tag/v0.10.0
-sha256  65d92cf44a63a51e1b7771f70c05013dce5bd6b0b2841c4b4be54b0c45565471  bubblewrap-0.10.0.tar.xz
+# Also checked GPG signature from
+# https://github.com/containers/bubblewrap/releases/tag/v0.11.0
+sha256  988fd6b232dafa04b8b8198723efeaccdb3c6aa9c1c7936219d5791a8b7a8646  bubblewrap-0.11.0.tar.xz
 
 # Hash for license files:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
index 94ae72d4d2..ea46d7a127 100644
--- a/package/bubblewrap/bubblewrap.mk
+++ b/package/bubblewrap/bubblewrap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUBBLEWRAP_VERSION = 0.10.0
+BUBBLEWRAP_VERSION = 0.11.0
 BUBBLEWRAP_SITE = https://github.com/containers/bubblewrap/releases/download/v$(BUBBLEWRAP_VERSION)
 BUBBLEWRAP_SOURCE = bubblewrap-$(BUBBLEWRAP_VERSION).tar.xz
 BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
