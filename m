Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D6CC88E73
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 21:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8375605F7;
	Mon, 14 Sep 2026 21:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uocmIlJZXCdk; Mon, 14 Sep 2026 21:39:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 944166062A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789421983;
	b=NfBgia6qUW0tnlhHV3s46oDRaOvcINy5DDMAKFMVYY++qsHx0hMHSZe9+EGtLbvttWez
	 SJpjh55obLToR9B5oP2z69CgE/haxi1vcHaZUvQ3wsHdR5r6nTQTVyvJrZSr8BLXh9wiu
	 sB4uolaj74YxloznJCboaIX4KyYWuiKe9GiWTku+OHeaQO/j5/Bdtzkm+9+SxeAFuxii9
	 AthLnEA85Xy2rPsDNyDSsblz40iMiyznRYwOM1kkL0I3grG3Iz59P4R8f+v99/JWtS163
	 T2XzYANY5Uws6Cseky3KGz438fOuOedFfENcGPKCM1oeRP3vy0mP1zBuYey+orEbBJg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789421983;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=M3CRmrpU4HUaeOqfIMQY0LYwWTk82MZ3ctKSrUwBK/w=;
	b=gi6RKtWrGE6C08AUgQTbYfhWJQvmmCZ2oEjFmNK/GtgRXlN0wN27cP4Fn92/DMnGoz3F
	 nRnZ361LPlg3Ug6+yFlEV3ZtUPCxRo4DtDWK7JKfhShWV7qJesL83374Zx15pRzM1zpZW
	 h0f8PZ79V5FLm0zkraRl+DYrjUKXakQoFbE+81HbWZ4bKVYnOELT3mBdcExBX+IplDWg1
	 RfmJmbctxrUkqdIiJg8KmhypwS04Fsu10Qy1mQJ+1MFd5464KOd/58hTpfHC6IcSdlXuG
	 4h0xcnfB44/XIahNySKwD3rTSLeD/JaaPCfIfnHbMpFx2GgLp4cjeiyOR8aqr0NmlHw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=KfJilsHT;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789421983;
	bh=M3CRmrpU4HUaeOqfIMQY0LYwWTk82MZ3ctKSrUwBK/w=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oWbDWQhNXTvzHpMWaAEh/LfIgH0eG7mGLAqI62wPMp2MfeVAxrbpxTBB4nIdz6iZb
	 nMiwFyZFigk70bgVldM44ZclLKT5ha/eVJWzB98su8tHyuxy9gevdPoqPHVjODzEDE
	 fcUu+6pMp97nLtyew8fwOCEuoAFGTO+lmZa662anVvZnqwaaEduOS1OU4QowtO+Nky
	 e+FWtN05Uok9g/okfa3X6pstk5qi0R2mwzqqI/bu/cnEQrY8FTzA1fIlnYe4mCxyhR
	 HQXNksa1qVmOZi80tTcCERiQBtM1JEhpNLaRwDN5H9VAPJzxjUvyOJPe+9LIZOIzIf
	 ui2D6KLhaZnTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 944166062A;
	Mon, 14 Sep 2026 21:39:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AD3F4362
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 21:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAB7A6062A
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 21:39:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oik0xhSpnTHp for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 21:39:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7B39D605F7
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789421980;
 b=UCqJvywu4SZSeamPEJapb3PmxOk1J7O36POVW3/FqPcVc0rHxyA/O1G1rxCsJTwA6gaF
 8UvbGgzQ9/C0nUAaQMNjMH+ZpIro2rSIYREJ3oQuYEZt74NTSkRN26O/rwdMmSMqcXt8b
 m2OFsAsDHs/0G8iI4ITH1+twaHsyflnNpykQNS3GaTJyCyhQ3I8B2dML4FcitQkGODhYS
 i/r2CGkAwW+ZKhpnYXrDJ7JG5dKSB16zAQT5kcBlbvTun8rQn96GaGLW+g6rNByAxtut8
 Ox+WpHULkGnj9u891Sq6IquLQeb/wLHAwzhDcHzaqdgJ5JOfXg8/1WhVbVbDWKtsQvA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789421980;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=HbOYZWNIL5fYsD9upgoTnCJKTpCmrviEB0JOZp10l0o=;
 b=l5yUfKnbZ4rDjJdw9Rxxr5MZo2T/uJg+r5mjOgrh4TpOQDvaYfcnfiwy3cDr2ek/+uQv
 0R6PN0LUaU5RgEFFiWqU/eWEJ6wDCx33Muni1Kl2zLQBX8QB97PFLC/RAwnRKRrWc2rNF
 nnxS791YE/WGHdj/J2ZlT8kycBy7i0ntbEgBXO5ivXGeP2r1PG9+6W2y0JJUmmvLD06MY
 ellG2GHfLVMGoGnMFZy9dWquq3rlL0sbxU/usH08ILRACXrW9p4ldHfoBWqELqtv0MEO+
 yONgk7lHcOVRsAI9YVSXcCYd91YACnanXn7QVsRnlD/sBLleFB6WnS60c2MSA5U+aDA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=KfJilsHT; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=KfJilsHT
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B39D605F7
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 21:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789421976;
 bh=HbOYZWNIL5fYsD9upgoTnCJKTpCmrviEB0JOZp10l0o=;
 h=From:To:Cc:Subject:Date:From;
 b=KfJilsHT3s7h9QKYs28KJpDzcQDJ1IjiVqvDBAnWCgNHlDxqOBsXsdfIIGhwecv/5
 trI1XSGob7XG8H55ggHX6uB3S6/Qs453fgjMiqie8RCsHpZAr55gdqMuIjVplWAGvI
 8bOBvZUpepOtAn7aeWzNHCTm2fpAqHJcRVnO2tRT92Gc1vcFcnV8fE74SYniJ3lRbf
 x/E8NCXb7WU88bDMqlGAFDRtyvG1Ct+ta1G0iAcnVLwVNa59tjiLf9109wKEAK05v6
 boxUZCawzJ7wca/vuvg2NcfsL9DQJ0IP8Px1rt0Wev3ZF2/PC7HEbnLJcC+s0xwm8N
 QGdvc6cR/QCRQ==
Received: from fli4l.lan.fli4l (p54a1b732.dip0.t-ipconnect.de [84.161.183.50])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 63C0EA4C334C;
 Mon, 14 Sep 2026 23:39:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34306)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x6EOm-000000003e8-1TnV;
 Mon, 14 Sep 2026 21:39:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 14 Sep 2026 23:39:35 +0200
Message-ID: <20260914213936.1167526-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: bump version to
 20260910
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

Updated the hash of the WHENCE file, due to firmware additions and
firmware changes, but no changes to the redistribution/licensing
conditions.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/linux-firmware/linux-firmware.hash | 4 ++--
 package/linux-firmware/linux-firmware.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 103f4ecf7b..c9cb054689 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256  ac17c34fe73756926a961fbafadf8d8f07a3bd2dd2f4ea31a0fb5d50c714a49a  linux-firmware-20260810.tar.xz
+sha256  f3937ca282ba256242e2b6dbe523df8a80007d29ffd61f56d270190865492ea8  linux-firmware-20260910.tar.xz
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENSES/LICENCE.Abilis
@@ -50,7 +50,7 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSES/LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSES/LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSES/LICENSE.sdma_firmware
-sha256  7b828cc147af7a6cd397a9cd33c23eb95f7725b6bf96fa428261198eb93bbd75  WHENCE
+sha256  8bc466434be59e1c044cb3821b30b7328859ca250a451bb6c799ffb21ae47f2e  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  LICENSES/NOTICE.qcom
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENSES/LICENCE.e100
 sha256  26b3c946f1f378ff25bb3bb7c365d108a2bc0bf08619e5e08bc0e4f9aaa6ee1e  LICENSES/LICENSE.xe
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 6025436c84..c5749513c5 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20260810
+LINUX_FIRMWARE_VERSION = 20260910
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
