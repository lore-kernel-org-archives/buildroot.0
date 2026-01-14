Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C702D39014
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 19:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FEB981304;
	Wed, 14 Jan 2026 19:56:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zT4DrpLQeeyN; Wed, 14 Jan 2026 19:56:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE28381180
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768420561;
	bh=uym80cQuxSObtgdKDFYqi79o1wJCpwqZRBPKsFG0Cgc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=XLF3HOdEcUm6ELZcnPqjTUr9w6C2xGVfDVIE0K0rH7xEvf2+1R1VwnB7hASgFLsN9
	 fvCvzVGA8acsGQGHvNMy7WSpaVVuKr8mD+n6Dq2P0kfOXfDwGqLdX9svGUTM8IIQLi
	 vcG2ec6jmNpNavvnoh5V+npO3+s/G/pYaNN8NNpOzxvmTRsnGC/zAS6vT9cM2IOJn9
	 E9URXukEbOBMa1vEAhguIBGITMPM4X5/0tUpmMIJjEyBis0g5r/+uGYyCN4yTk1LU3
	 MzN3/U9fOsD2wwu1d5qQE74cEoe5cUKFqbG3oMlJcZzIIWa/UbJBB0y1egg+l8paVp
	 Fevic53H3slMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE28381180;
	Wed, 14 Jan 2026 19:56:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D1F4232
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E8E460C00
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jjObIj6enH6b for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 19:55:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.148;
 helo=smtpdh19-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0733760BCB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0733760BCB
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0733760BCB
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:55:57 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id g6yBvKnf2clBZg6yBv3IP5; Wed, 14 Jan 2026 20:55:55 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jan 2026 20:55:49 +0100
Message-ID: <20260114195554.3979278-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJOuAd9WbN6kqm0LuKJang8NF+Q6NjGieQY9zFtyvRC4hfiVAFpOZLqGNQaTcgVbhDHJi22HnpdFF08KjeQ80pYXhpgNCqiop13KH95li8E3X74Q5jKp
 B4i6U4EHowHb9tI3Bkk8lc+nZuMfIWtUbK2t5clneQK02svcstqbnom7oMy/yOo05KiOX0f2B7ji3X8xBcVY4+JQXjng/8iYQjHa5ZqxmzHjKRqlJI1OMjNx
 okn0yxx5XsB5+0Kzw/HPKbKhpTw4o4x+zcSzhudWdboyfuqblAikr4gqNyNVG6ICMdV6eBeH66sBdH1i3rZP/O/oHaoebj+qcM/2UO0K2bj6OePb4/4cRA8+
 H6a2Fpy98Ob9fXQ6nE7hsTSBU1gjgUOg0e/PnxIFBO2en1aKqbh6L2MbSeHN+GuCor7Tlz8fmRffvcZdfckZgA6gdtdEIu8UhkmXGvNWxv3UPDUuO4gEXIv7
 3R1h3jMf8aaMeToVJHCXZj8I93fGbWDSGtwYZNejB0mAOslMaBbrCLq7YbytP33s+VV2B87z9iS/3fd8
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1768420555; bh=9G0EmtBzEESOU5P+JAAGt9aWHskGlM51weCYK8+bv8M=;
 h=From:To:Subject:Date:MIME-Version;
 b=d1g+wWdm3j1R/oCl6LaSCFWBPO/60WN0uR08b0s712kOk0Pb2qW7yt6PTIf31z9YV
 KT8+fgX2Klhwo8U2ttbHIRPnUrdujl5f8wVxdSHkTA98wSZPcD0jOu59YA7QkiXa9n
 2iqV9cKB4NppNWC18OY6PFkrGsKlRx8YAXIFuctdV4+2IxnnVmQgA9ccwKUXuMeU7T
 MwyA7PeQWtckWa6y2O4sH1cSPxErf9QFQjibDkgWr568pyK8VSfHGfHADA3enRd4SF
 wwWpW9W6//b9cjWLJRrefd3d0HvZ60Pen5TJxQpgdZRigfH9Mj1Y/vPvSz7WnNpFhJ
 LayLYoWahK+hA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=d1g+wWdm
Subject: [Buildroot] [PATCH 13/17] configs/olimex_a20_lime: switch to
 axx-common
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
Cc: Leon Anavi <leon.anavi@konsulko.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch global patch dir and genimage.cfg to axx-common.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/olimex_a20_olinuxino_lime_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 2df63b9ab0..035f4da6e5 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -3,7 +3,7 @@ BR2_cortex_a7=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
-BR2_GLOBAL_PATCH_DIR="board/olimex/a20_olinuxino/patches"
+BR2_GLOBAL_PATCH_DIR="board/olimex/axx-common/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
@@ -11,7 +11,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/olimex/a20_olinuxino/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/axx-common/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.3"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
