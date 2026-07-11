Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC323C43458
	for <buildroot@archiver.kernel.org>; Sat, 11 Jul 2026 11:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7760D608DA;
	Sat, 11 Jul 2026 11:29:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RSKNloed_lRU; Sat, 11 Jul 2026 11:29:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EB9560B55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783769347;
	bh=dFq96PHNVnDvJSAWdr2tkZlmfIG62DpLcqvaPPoZ5uA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PJgMW94kKCTa4CotkMRloHCGskwmqvGD5RjDbE+stCLzdAi7ujpX+b1hAOPRy/bmj
	 XmDWDAPWtZqaFwA5XQ95t8dWoxqYNiv6fWB+8fjBEwjKszM2AZqluVJwOrsVmBvRgI
	 cHdfYgFui2MAVbyYWvL3Y7vkAz3uz2EBYL8Vpi+iWkmFzslzy+soTfVbNoe899rVZT
	 8FUnDmyNqu48+GU7FIYqonNatvcgVb0zN6CYArgIoARy6StFg1Y8gCdSIxYn901ABr
	 JiZY/0NKaO5zqX8P+XkWHVRDQzqxPL4386MznaPSy3BwgriRsFGsKvDMbuHFqJnlxn
	 G95tT7QSIYWpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EB9560B55;
	Sat, 11 Jul 2026 11:29:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 46B9E2EE
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 11:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 267354023E
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 11:29:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b-wXaxRMumUS for <buildroot@buildroot.org>;
 Sat, 11 Jul 2026 11:29:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2AFF2400AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AFF2400AE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2AFF2400AE
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 11:29:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d51.dip0.t-ipconnect.de [91.58.13.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 378D6A4C0F25;
 Sat, 11 Jul 2026 13:29:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34356)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wiVtG-000000004Q2-3f36;
 Sat, 11 Jul 2026 11:29:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Alex Suykov <alex.suykov@gmail.com>
Date: Sat, 11 Jul 2026 13:29:02 +0200
Message-ID: <20260711112902.966095-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783769343;
 bh=whyIc05z9Qjs/dGT1tjMNIbvwFU6jMe58DmyhN82jYE=;
 h=From:To:Cc:Subject:Date:From;
 b=PavBclvLcW1LieP2nCEAogjH8TLgbNRyqmdK5A2VYXXETXUKWteJSNByW24kqfGj5
 1BP5EcQsPQI4ZHAyGXdJCkCr1k4COV3hxc8LlVULnwA8k3HBptc9GOKW51KChu91q6
 nUcnd7VcV7SsWwsBPiPSR5ztMSxdsJnxhM9k7Y+QhiD31npZb7eG+SPqAwWF5JeHD9
 NZmSYVRio/kfJ70ep5klmMhHRGfTPqgqNzk1BCBZWKcEuTm+XoxsNGkfNc8g6iQsUd
 EIvUtyLaS8SboCEGdcm15FLsryUgy3zFon+zXUY6SoonblNtLcGxCvcT8vFqwMjECt
 EkRL7zwHDYh/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=PavBclvL
Subject: [Buildroot] [PATCH 1/1] package/vboot-utils: bump version to git
 042312c6e7
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
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/47ca06c9daa289ea7e8fb999099ace3a4c2212d6

 package/vboot-utils/vboot-utils.hash | 2 +-
 package/vboot-utils/vboot-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vboot-utils/vboot-utils.hash b/package/vboot-utils/vboot-utils.hash
index 6f1de06d3f..a40dcdcac3 100644
--- a/package/vboot-utils/vboot-utils.hash
+++ b/package/vboot-utils/vboot-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b8bfffa49f9f4f82c68ad56de977eb2601d96dbff319a16945efb169d3c17278  vboot-utils-7dfa482d6a843e1e25b615d6b0200028cedce29f-git4.tar.gz
+sha256  da9ad5ccbd6873904fa52dd0134e4c0ab8cdbacfb6c3407add3b4da0c8b62c15  vboot-utils-042312c6e7fce9dd106b329be0ecb51a8a347337-git4.tar.gz
 sha256  cb9dc8e96aedf9120b6757a60387db10f3c1a8e3fd97bb9d0f11327be5a7ed4d  LICENSE
diff --git a/package/vboot-utils/vboot-utils.mk b/package/vboot-utils/vboot-utils.mk
index 72742266d7..dc0b1365b7 100644
--- a/package/vboot-utils/vboot-utils.mk
+++ b/package/vboot-utils/vboot-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VBOOT_UTILS_VERSION = 7dfa482d6a843e1e25b615d6b0200028cedce29f
+VBOOT_UTILS_VERSION = 042312c6e7fce9dd106b329be0ecb51a8a347337
 VBOOT_UTILS_SITE = https://chromium.googlesource.com/chromiumos/platform/vboot_reference
 VBOOT_UTILS_SITE_METHOD = git
 VBOOT_UTILS_LICENSE = BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
