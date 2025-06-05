Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309DCC5AE59
	for <buildroot@archiver.kernel.org>; Thu,  5 Jun 2025 14:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C50A161046;
	Thu,  5 Jun 2025 14:41:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4AR1x6dGiS_m; Thu,  5 Jun 2025 14:41:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08F3D6104A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08F3D6104A;
	Thu,  5 Jun 2025 14:41:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 134521A6
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 14:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0574C40237
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 14:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GdkaNzamWevK for <buildroot@buildroot.org>;
 Thu,  5 Jun 2025 14:41:17 +0000 (UTC)
X-Greylist: delayed 432 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 05 Jun 2025 14:41:15 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 216D6401A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 216D6401A1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=93.104.207.81;
 helo=mx1.tq-group.com; envelope-from=matthias.schiffer@ew.tq-group.com;
 receiver=<UNKNOWN> 
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 216D6401A1
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 14:41:15 +0000 (UTC)
X-CSE-ConnectionGUID: RP1qEMRrRHCDtMm8gnH1Tg==
X-CSE-MsgGUID: 9VEvffRTS2KVENKLhlckOA==
X-IronPort-AV: E=Sophos;i="6.16,212,1744063200"; d="scan'208";a="44481691"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 05 Jun 2025 16:34:00 +0200
X-CheckPoint: {6841AAD8-24-BA2A3BBA-F71352A8}
X-MAIL-CPID: 69EB60AA8B70FCADE8EB121A37D1E0B1_5
X-Control-Analysis: str=0001.0A00639A.6841AAE4.000A, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1AE99164A8B; Thu,  5 Jun 2025 16:33:56 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: buildroot@buildroot.org
Cc: Vladimir Oltean <olteanv@gmail.com>, oss@ew.tq-group.com,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Date: Thu,  5 Jun 2025 16:32:40 +0200
Message-ID: <21834b48ff096e427bdb722be447f4ea8a770135.1749133483.git.matthias.schiffer@tq-group.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1749134476; x=1780670476;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RNDhOYmytVjAZUfRpCTNfZ1eIjQWC99pMNU2O1u3/EY=;
 b=NRdQium7VFqWufp1KJa/Euof/+hptNQ3h4PFgsPipNLLZkF7RvVM3faX
 mQgB4sYDl4zMuKg7TQlJ6YhHnvjlmEhT5nOYQVjj/Li4/Df8WVIv1CDI8
 4+s0ZO7Lw2sn292lYxJr78y0mRKY2l/IdIye5sXCVnjv2xNpxmQ/ILIbP
 6yB6JHS7rN1/qN20sMigTNXnyhNQd96pJRxMcVOUo4HZ5REwYu1kotk3+
 urUUP8JbkFeSELomHzRml8gnZHLL3kJAwI1G6VSSEbq9r1aObh78Oje1K
 rvj/V7zIIXXeEbrHT9ZfhPoiRzUjyCGy1S/9FU/WTzH6JVPIaDdO1LtJJ
 A==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ew.tq-group.com; s=dkim; t=1749134036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=RNDhOYmytVjAZUfRpCTNfZ1eIjQWC99pMNU2O1u3/EY=;
 b=piyHSi4wfIaMHf0gKCr0G4L+eooea38iARLDIaaye/CwIId2fGS0QfCganhKV/tdbY8B9U
 FJoLrdUtUx2xyY1P6r6xKwDv/QGLqe6LeNn/oOgz9Rgvp8dBNzf+QUdZgAAn/lxhZyu3zJ
 U9QD7SfDXQgcpLulylz6/AhP6h1TKacTbIq3qM0Qa7XLS39P/iT5TUhj8L8PmRcMoVsN2x
 TWjfw7Gv8M2SZFfmMphpjLi06dvB70Zp2rkwPCKebFYvXlCfjYJpbZVoG1dgFraXiNdr7w
 jIjkS4fa7EYIyswMQ/6ujJ5SOp8ibsD4SQZHeIRgwwZVRXdk84ts4TvPlUIP9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=ew.tq-group.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=tq-group.com
 header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=NRdQium7; 
 dkim=temperror header.d=ew.tq-group.com header.i=@ew.tq-group.com
 header.a=rsa-sha256 header.s=dkim header.b=piyHSi4w
Subject: [Buildroot] [PATCH 1/2] package/qoriq-mc-binary: fix target install
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

The check was referencing an incorrect variable name.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 package/qoriq-mc-binary/qoriq-mc-binary.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qoriq-mc-binary/qoriq-mc-binary.mk b/package/qoriq-mc-binary/qoriq-mc-binary.mk
index 68f00eda20..5ae2e48c65 100644
--- a/package/qoriq-mc-binary/qoriq-mc-binary.mk
+++ b/package/qoriq-mc-binary/qoriq-mc-binary.mk
@@ -15,7 +15,7 @@ QORIQ_MC_BINARY_SUBDIR = $(call qstrip,$(BR2_QORIQ_MC_BINARY_SUBDIR))
 QORIQ_MC_BINARY_BIN = mc_$(QORIQ_MC_BINARY_PLATFORM)_$(QORIQ_MC_BINARY_VERSION).itb
 QORIQ_MC_BINARY_INSTALL_PATH = $(call qstrip,$(BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_INSTALL_PATH))
 
-ifeq ($(QORIQ_MC_BINARY_TARGET_INSTALL_PATH),)
+ifeq ($(QORIQ_MC_BINARY_INSTALL_PATH),)
 QORIQ_MC_BINARY_INSTALL_TARGET = NO
 endif
 
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
