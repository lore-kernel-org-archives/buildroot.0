Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B45C02181
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 16:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 911D18413D;
	Mon, 20 Jan 2025 16:28:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4mA_lAkNaS9E; Mon, 20 Jan 2025 16:28:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2A2D84177
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2A2D84177;
	Mon, 20 Jan 2025 16:28:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1ACEF69
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 16:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFB5284177
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 16:28:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OS2C7q-98gme for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 16:28:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=5.39.71.79;
 helo=mail.arturia.com; envelope-from=victor.krawiec@arturia.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2496E8413D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2496E8413D
Received: from mail.arturia.com (mail.arturia.com [5.39.71.79])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2496E8413D
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 16:28:23 +0000 (UTC)
Received: from vkrawiec.arturia.team (226.142.197.77.rev.sfr.net
 [77.197.142.226]) (Authenticated sender: victor.krawiec@arturia.com)
 by mail.arturia.com (Postfix) with ESMTPSA id EB45247C0F41;
 Mon, 20 Jan 2025 17:28:21 +0100 (CET)
From: vkrawiec <victor.krawiec@arturia.com>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>,
 vkrawiec <victor.krawiec@arturia.com>
Date: Mon, 20 Jan 2025 17:28:08 +0100
Message-ID: <20250120162808.1219036-1-victor.krawiec@arturia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=arturia.com; s=privdkim; t=1737390502;
 bh=PasaBz7y//jjGpo2emUMP2A0BIK2Jv/qrJOBa/+VnYA=;
 h=From:To:Cc:Subject:Date:From;
 b=55geu+MzQVvAbaSltqb+hO9OGCNuRejZNgDyafGmciXXlszXH+XXvrjZbj8I+M/oK
 k1/TkuqtNPdhx1jQzBvRVsGfgGDld/Owc7VGGYLRc1UCaqDKvTwRWNjPQTNMA1L0q3
 HEOQRswW7+UnVNy3IImAiPyMAvvcQ+or+jddEpfHtsrpPPeMsB5BWSVIWrvMZOXbOV
 MzTRRzNu8fRGwep9l86SfmYdb+rvDQpk80IU0xk3sEPe2d9TxrFRlr4iraD9sZubP3
 LM/owwIhv7285jNx4N8g/4STXMl/POpS8hxytlLSRjOwSarTRdjmeHtrMI3hiNxqQ9
 xRmDfwEFzvmiA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arturia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=arturia.com header.i=@arturia.com header.a=rsa-sha256
 header.s=privdkim header.b=55geu+Mz
Subject: [Buildroot] [PATCH 1/1] package/llvm-project/lld: fix broken
 symlink in SDK
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

The symlink bin/lld -> $(GNU_TARGET_NAME)/bin/lld is broken inside a SDK containing host-lld package
The symlink still points to the location of lld inside the build's host folder instead of the location of lld inside the SDK
In consequence GCC is not able to find lld linker
Changing the symlink to be relative during host-lld installation fixes the problem

Signed-off-by: vkrawiec <victor.krawiec@arturia.com>
---
 package/llvm-project/lld/lld.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/llvm-project/lld/lld.mk b/package/llvm-project/lld/lld.mk
index 539dd0bd71..0c1fce4860 100644
--- a/package/llvm-project/lld/lld.mk
+++ b/package/llvm-project/lld/lld.mk
@@ -18,8 +18,8 @@ HOST_LLD_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
 # GCC looks for tools in a different path from LLD's default installation path
 define HOST_LLD_CREATE_SYMLINKS
 	mkdir -p $(HOST_DIR)/$(GNU_TARGET_NAME)/bin
-	ln -sf $(HOST_DIR)/bin/lld $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/lld
-	ln -sf $(HOST_DIR)/bin/lld $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/ld.lld
+	ln -sfr $(HOST_DIR)/bin/lld $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/lld
+	ln -sfr $(HOST_DIR)/bin/lld $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/ld.lld
 endef
 
 HOST_LLD_POST_INSTALL_HOOKS += HOST_LLD_CREATE_SYMLINKS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
