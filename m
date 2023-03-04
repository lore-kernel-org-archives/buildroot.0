Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D0FC678D5
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 22:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F4A960BFB;
	Sat,  4 Mar 2023 22:11:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F4A960BFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kW8bMptg6C_2; Sat,  4 Mar 2023 22:11:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5BA960F7B;
	Sat,  4 Mar 2023 22:11:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5BA960F7B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D7EB21BF591
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 22:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF34381E93
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 22:11:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF34381E93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jb_qn6MEOmPX for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 22:11:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C69E80ED1
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C69E80ED1
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 22:11:51 +0000 (UTC)
Received: from 91-153-34-99.elisa-laajakaista.fi ([91.153.34.99] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1pYa6W-0053ve-51; Sat, 04 Mar 2023 23:11:48 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 201e915b;
 Sat, 4 Mar 2023 22:11:45 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Sun,  5 Mar 2023 00:11:45 +0200
Message-Id: <20230304221145.3222530-1-aperez@igalia.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=snXYh6bKekScov7Wldv5zOK/105HAr69WMO2cBF8WMM=; b=PInPuOvuDDWxfSTm2p7HestKrW
 gmTnVSfRz0Tw8tyEQEJdRERpLSuNhT9PanNEOrzNpPrF/NTAxNXvV/owBDWCVQgyCGkdU7BJrXsCj
 9/7GtHCWo6PklQQfq/ewDalJDRctKYtPLw+6YAnWpegmSyEu/bzIHzAZNbprdNvTMEZVZggu9qMtq
 GPEhvtheMUPx0vXQLyq/U/zbbBuZh5CqeF43MB8zMdGODPo3b4LMKZFrCg46F615J09uEKTzbVoLk
 IckRIa8OEGpMbIY7Mcnv/8yd3CBSf++o5g8Xe3qpOV8wBXaegnLCG6cIJCulW1pfHsw/hR/HHNDy8
 FXucPKbA==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=PInPuOvu
Subject: [Buildroot] [PATCH] package/wpebackend-fdo: bump to version 1.14.1
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

This is a bugfix release which includes important fixes which solve a
memory leak and hitting a situation where the output no longer gets
updated. Release notes:

  https://wpewebkit.org/release/wpebackend-fdo-1.14.1.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpebackend-fdo/wpebackend-fdo.hash | 8 ++++----
 package/wpebackend-fdo/wpebackend-fdo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash b/package/wpebackend-fdo/wpebackend-fdo.hash
index e2f2c6c89f..d1a344a664 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.hash
+++ b/package/wpebackend-fdo/wpebackend-fdo.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpebackend-fdo-1.14.0.tar.xz.sums
-md5  ea62dfa9ecb366598a837d7446ed48ac  wpebackend-fdo-1.14.0.tar.xz
-sha1  1500be9212381a404f4a46b22b90a9880ba11c01  wpebackend-fdo-1.14.0.tar.xz
-sha256  e75b0cb2c7145448416e8696013d8883f675c66c11ed750e06865efec5809155  wpebackend-fdo-1.14.0.tar.xz
+# From https://wpewebkit.org/releases/wpebackend-fdo-1.14.1.tar.xz.sums
+md5  2b49218cdd16075b028bbaf5a4f57890  wpebackend-fdo-1.14.1.tar.xz
+sha1  a68db2480d29d53d7fa24c69888bacbab6efea11  wpebackend-fdo-1.14.1.tar.xz
+sha256  01938dd93c62b3a47b18dd13c70d50490a8b8a6caec23c8550a3dbdbcc6bbb50  wpebackend-fdo-1.14.1.tar.xz
 
 # Hashes for license files:
 sha256  c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825  COPYING
diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
index afe37b086e..c1e4e05796 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.mk
+++ b/package/wpebackend-fdo/wpebackend-fdo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEBACKEND_FDO_VERSION = 1.14.0
+WPEBACKEND_FDO_VERSION = 1.14.1
 WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
 WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
 WPEBACKEND_FDO_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
