Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4365D10706F2
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 18:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F401760655;
	Sat, 14 Mar 2026 18:35:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cGVM7tKs5mXH; Sat, 14 Mar 2026 18:35:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 419C860F0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773513305;
	bh=/XX9zCoXxouu+YOG+9Jnu9ToA4ismFUN1b0dm57XSUk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=offdcMr+2gSxG7MtYHj0xfd/RLv4vUIvbP+8HcdreHuafj7okLoX7SyTlQEio712J
	 BkL8Ql7foHSFfTahFY4SVrphugMSWoIktUY1N1XbMdrgDkw5X3lFR4o9wPuX2AzISo
	 JclF1A3rjRJwQr1RKgOSCyFvdEhWVsR/MAdV+Nz9T0sweFgtnq1qe/w96aJwpZJGbU
	 HzTqDKEm59keHLfYJ6WSDM596Qpg2/CnIbJQxHg7pGyySJmKCwtLWTIHnZxt+MNUxM
	 shtEq/5F2psY4yFpGpGPwg7RK+3l/5aE7DgRId9bZ5MrnUPvv4kqGbGMAHO2sHLlmJ
	 BYWxRVu2KPpQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 419C860F0C;
	Sat, 14 Mar 2026 18:35:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 57EA11B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 18:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D8664038E
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 18:35:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KxNBWwQCZYej for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 18:35:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 596F24019B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 596F24019B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 596F24019B
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 18:35:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 45CACA4C0615;
 Sat, 14 Mar 2026 19:35:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48286)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1TpE-000000001Yw-3vgH;
 Sat, 14 Mar 2026 18:35:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 14 Mar 2026 19:34:59 +0100
Message-ID: <20260314183500.3159948-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773513301;
 bh=4Ybg/DDrlnS8uelozRiMWO9ktnACyCgScd1+oQHZSW8=;
 h=From:To:Cc:Subject:Date:From;
 b=dFz3YBZhSZRUycGEqUkPoSUYVL8y7lgXMrsIEd9I3K276CaHqAuO5DMuUlpCBHH22
 NIjQwJaDWXtcUNsqOJHWXJ5aBuzkQhjxkst73zT9ekLbYXdN7muz1AwgZ0wOuawuOe
 baSSEMVpkrhJ1k2h9taY47lkrmvUiDcAgGkhhK7Pq6IfYRzA4sdS1V7dL/LiPxLuaI
 x83eu0toJuQKirY4Zo/H0EEt6tvKH+h4HkxujQEab1vk+V6VYBJwdC5pX3m6UG/rFP
 NKgViPiw7/yXkXp1L1UGcJ4KToz72Osrlar8B4z4cHbEhABqluVEalghCyaMqeG79o
 CzMaz+Sj4t2bQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=dFz3YBZh
Subject: [Buildroot] [PATCH 1/2] package/daq3: bump version to 3.0.25
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

https://github.com/snort3/libdaq/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/daq3/daq3.hash | 2 +-
 package/daq3/daq3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/daq3/daq3.hash b/package/daq3/daq3.hash
index 4a24f98173..524c0eb868 100644
--- a/package/daq3/daq3.hash
+++ b/package/daq3/daq3.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  c0e8535533720a6df05ab884b7c8f5fb4222f3aac12bdc11829e08c79716d338  daq3-3.0.9.tar.gz
+sha256  651e38a2737d179a224bcb01d8a06300667708ee614d19a8b411fdd212cc035d  daq3-3.0.25.tar.gz
 
 # Hash for license files:
 sha256  64601289158eddad72cb4de72652f9e64dc886942c910b38ddee93ba13b0db26  COPYING
diff --git a/package/daq3/daq3.mk b/package/daq3/daq3.mk
index bab957e052..ec3f4ba670 100644
--- a/package/daq3/daq3.mk
+++ b/package/daq3/daq3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAQ3_VERSION = 3.0.9
+DAQ3_VERSION = 3.0.25
 DAQ3_SITE = $(call github,snort3,libdaq,v$(DAQ3_VERSION))
 DAQ3_LICENSE = GPL-2.0
 DAQ3_LICENSE_FILES = COPYING LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
