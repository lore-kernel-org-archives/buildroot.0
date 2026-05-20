Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA7FCD4F3D
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 17:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CCCC41497;
	Wed, 20 May 2026 17:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NzZW1lokSI3E; Wed, 20 May 2026 17:01:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68E464149E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779296469;
	bh=mHnYr0VoLwE0BNPmmYdY61LsARsu7lugrYSP5fvQxbo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RHloby2V4tHjbLvzo3pOiLv4zyEWR10dyu/5OCY6wXUys4LCfACesOTDZ/NjkAo1f
	 ilWRfIb5rG2nUkYrxME1eEiBcvCMrKBWTOCKh/HMgQbJW8vD6v49hgybrRxMcbGF4A
	 v9o0ZS56J0+0ym386Cdl3uQj4J4rtxLK+HJXrRciJreP3sI2TYmQ6fVjpSvj+3fPS3
	 c3KlWJbmJLTyHFIsJgF/61RIZ11oIT92XiwDXfRCy/SJpvGWP6gc96sW6hbCGFo3Tk
	 kt5+RxLPr+r4mnKs/4Pw8maC3+Nvf//I7ssoBvclfPYJoB5SzTlPGLPu3fWsv4Vrhm
	 lYqjoVAsSnzSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68E464149E;
	Wed, 20 May 2026 17:01:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D1D41B2
 for <buildroot@buildroot.org>; Wed, 20 May 2026 17:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F1DB4149E
 for <buildroot@buildroot.org>; Wed, 20 May 2026 17:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G0RqB7exykOS for <buildroot@buildroot.org>;
 Wed, 20 May 2026 17:01:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3708241497
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3708241497
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3708241497
 for <buildroot@buildroot.org>; Wed, 20 May 2026 17:01:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ef6.dip0.t-ipconnect.de [91.58.14.246])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 888BFA4C34C2;
 Wed, 20 May 2026 19:00:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49630)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wPkHr-0000000020e-1KtN;
 Wed, 20 May 2026 17:00:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 20 May 2026 19:00:50 +0200
Message-ID: <20260520170051.1119985-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779296451;
 bh=CQe8jrrZXExhc4gA30aeGHI8IKugoevWekQJ0DcUfAc=;
 h=From:To:Cc:Subject:Date:From;
 b=DfSRfd2vdxrdojZkL2+wX+oNCLI302wK1BStMQY0c9rjICIgwJQYNGe2kmHTu8m5F
 3krSJHb37dncLPT0ZL0v+0CmfWxHJL8kIl89kx+V6WIIiwSpWRW8hOf3Ftf0PidbId
 Tq8hxaYMUQ4G8R3vsynF+YAB87YDJcxmX3vrsJXIhXCYz07VvPxzcC1klPznKdFTRZ
 eYomNrAEKnGXx/QYwFZhP9xUPLo6WbNpl/8o+toJPVZdDkmVu4t4W1t9bgM2TI4xm0
 G83RNl2iPcgq1wFzihwHSeS05LlF93O1DNF19sQ7TpDx5l9xPuH5J5X7fPSnx7pPzj
 V+yjHCwFzHQjA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=DfSRfd2v
Subject: [Buildroot] [PATCH/next 1/2] package/linux-firmware: bump version
 to 20260519
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

Updating the hash of the WHENCE file, due to firmware additions and
firmware changes, but no changes to the redistribution/licensing
conditions.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/linux-firmware/linux-firmware.hash | 4 ++--
 package/linux-firmware/linux-firmware.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index ede4d7fa67..e707583e7e 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256  b7812ed6d59f6b09ecceddaa0be842a7e82a79cc0e46ca60478a4ebf02f1e178  linux-firmware-20260410.tar.xz
+sha256  b14e7197a290a7e5569f5ef790cde289bddc47e32126f2eb262a8e677fc39727  linux-firmware-20260519.tar.xz
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
@@ -50,7 +50,7 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
-sha256  c282239a5a2d849677e9304e6f361e475e1b6e71e7c771c03f8986f71b309527  WHENCE
+sha256  93a059ebbd333245a587778663c17d3df09421da30ae6b3e2d18ac2741f506c0  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
 sha256  26b3c946f1f378ff25bb3bb7c365d108a2bc0bf08619e5e08bc0e4f9aaa6ee1e  LICENSE.xe
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 8187d1feaf..c076def399 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20260410
+LINUX_FIRMWARE_VERSION = 20260519
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
