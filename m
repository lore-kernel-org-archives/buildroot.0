Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8944FCD4F5B
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 12:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 450978127D;
	Tue, 19 May 2026 12:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B0bkdV18w99P; Tue, 19 May 2026 12:26:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 182EE8124B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779193575;
	bh=g+wtCBCeFUnPaIoN/nif3rYfbXklD3n+Dnr2s24qtJs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aL0iFFlAugqJS7YCZd2eDSYQLlYPb15CxJgt1lSl/wwz8xnDSa/5F0GOZOd5mkoKi
	 Ummt0Hk9SKrkVPLdqvqe4FHD0Gay5TPCciO5HIALDqloBFapJQXtQUXFi2QK2bi4bG
	 R35jZQC/Qc63MJGmIXzlzMImSV3E3kElGeVDFwKp50blvdqLmiS/sRsIRtq/BYegsI
	 DcZO7nMG9zj72nbevQMG2QdQb+V+Dmypx7GcHII1HSBUHFJPs6l+zPqlrByXGAsIuq
	 csWmds/qIC0pUYwuZPsL8m6zsVvRkMtAoCQudn+ao/9A7Yn3ZJAG/wF70Da2kJyjTD
	 H5nlACzymz+1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 182EE8124B;
	Tue, 19 May 2026 12:26:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 17F8B282
 for <buildroot@buildroot.org>; Tue, 19 May 2026 12:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09EA0608FA
 for <buildroot@buildroot.org>; Tue, 19 May 2026 12:26:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bNY3_qmB4IOZ for <buildroot@buildroot.org>;
 Tue, 19 May 2026 12:26:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.250.0.168;
 helo=mx.adeep.su; envelope-from=v@baodeep.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A334460903
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A334460903
Received: from mx.adeep.su (mx.adeep.su [185.250.0.168])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A334460903
 for <buildroot@buildroot.org>; Tue, 19 May 2026 12:26:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C90CBAA030; Tue, 19 May 2026 15:19:30 +0300 (MSK)
To: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 May 2026 15:19:05 +0300
Message-ID: <20260519121911.69065-1-v@baodeep.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baodeep.com; s=dkim; 
 t=1779193171; h=from:subject:date:message-id:to:mime-version:
 content-transfer-encoding; bh=ff4H7lwyUCpyndSX0E0ZKxhGmxM6wlIZSBPZYiRxoCw=;
 b=IZIYHWdVh5H6aAm1CeV1nhA1G6MCy/EVaVEeqH4MDrqUSey2Gu20+JCcDrq+bTWmiR38tQ
 Ul9krXcIJHfGiRVg7PIlkZX00pJiwdVi39xwDZjoqjsAVMXYlLnyeKSfHZK75Oi1UCzsXw
 RB/FHZ4yglBSNoRm+fpM4FRaKH+1iXQC3wrPs7PS2XNg8AfyBtYFLdgsrw8FIW6E4v3kSr
 w7KAmzVKip07IktMDvbpLtNUajr7McnHul65popkOfC4QVhlbwjxO0ftlioW9bO+SWlP/d
 8gwz44ddFP9NLab4OsJnzvzu818D64KjJpb/hRLZJc5dO0dbjKC/8IZ7bRAxVQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=baodeep.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=baodeep.com header.i=@baodeep.com header.a=rsa-sha256
 header.s=dkim header.b=IZIYHWdV
Subject: [Buildroot] [PATCH] package/amlogic-boot-fip: bump version
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
From: Viacheslav Bocharov via buildroot <buildroot@buildroot.org>
Reply-To: Viacheslav Bocharov <v@baodeep.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump amlogic-boot-fip to the latest commit on the LibreELEC/amlogic-boot-fip
master branch.

Signed-off-by: Viacheslav Bocharov <v@baodeep.com>
---
 package/amlogic-boot-fip/amlogic-boot-fip.hash | 2 +-
 package/amlogic-boot-fip/amlogic-boot-fip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/amlogic-boot-fip/amlogic-boot-fip.hash b/package/amlogic-boot-fip/amlogic-boot-fip.hash
index 1a08341532..f9f0e8b018 100644
--- a/package/amlogic-boot-fip/amlogic-boot-fip.hash
+++ b/package/amlogic-boot-fip/amlogic-boot-fip.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2cc06bc7d5647fd8c0025181fa42c4a8ef0ed16b918a1fa2060ea83c22e47b20  amlogic-boot-fip-e96b6a694380ff07d5a9e4be644ffe254bd18512.tar.gz
+sha256  dede20dd7666a33b33442252b994f4033cfafe3fb6d11c86019dc3ae61d55227  amlogic-boot-fip-42d372123631066fb77fbcbb612dc3eb41a3f6f9.tar.gz
 sha256  4255537f71b1cd0d487de0fa2b8eddf1eb96ed96d119507336dde8b3782b86e6  LICENSE
diff --git a/package/amlogic-boot-fip/amlogic-boot-fip.mk b/package/amlogic-boot-fip/amlogic-boot-fip.mk
index f98887cfcd..552e785066 100644
--- a/package/amlogic-boot-fip/amlogic-boot-fip.mk
+++ b/package/amlogic-boot-fip/amlogic-boot-fip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AMLOGIC_BOOT_FIP_VERSION = e96b6a694380ff07d5a9e4be644ffe254bd18512
+AMLOGIC_BOOT_FIP_VERSION = 42d372123631066fb77fbcbb612dc3eb41a3f6f9
 AMLOGIC_BOOT_FIP_SITE = $(call github,LibreELEC,amlogic-boot-fip,$(AMLOGIC_BOOT_FIP_VERSION))
 AMLOGIC_BOOT_FIP_LICENSE = PROPRIETARY
 AMLOGIC_BOOT_FIP_LICENSE_FILES = LICENSE
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
