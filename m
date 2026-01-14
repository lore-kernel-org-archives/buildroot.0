Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF89D39013
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 19:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A142E402E4;
	Wed, 14 Jan 2026 19:56:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R-oO-Qz0FVaT; Wed, 14 Jan 2026 19:56:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 208894001F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768420562;
	bh=1e1eccW8IES/dIcpOdN2/J4KoBJRqI+zSY5sw7cknFw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TKbPPwot/xbUMjB9h/0j9oQjzOCt749k9yHpwRGcPHXjRCW9WM9zZIAIpqIBTX0+e
	 iHtith7I4Gxvtru9PSBxwIxGkFmsMSCH/7il8Lkgx+C3AWImijvM7u080cAOthR6br
	 A0iF7z9/abXEI0s0nn3QKPu+d1hgENBMqzjnRiZdo6qa7vz8dV6CGLn8ARjGIK1is2
	 msBnkmRBXP5ek+zoluSw66zdMpg8oZ2zFIflwKU9YiPExZY8+64ShhqWzKX/JXmoaO
	 m3zu8DFdI7vLe4HqfJzsBxkucQcbeU4Tg/FTxZFpCLvdidB7/0b8KT7Z5rC/1uTLZv
	 fmcQ7CWMxHcjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 208894001F;
	Wed, 14 Jan 2026 19:56:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 62259232
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EB4340AF8
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y5gC1Gr2uqje for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 19:55:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.148;
 helo=smtpdh19-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0730140AEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0730140AEF
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0730140AEF
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:55:57 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id g6yBvKnf2clBZg6yBv3IPJ; Wed, 14 Jan 2026 20:55:55 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jan 2026 20:55:50 +0100
Message-ID: <20260114195554.3979278-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260114195554.3979278-1-giulio.benetti@benettiengineering.com>
References: <20260114195554.3979278-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJOuAd9WbN6kqm0LuKJang8NF+Q6NjGieQY9zFtyvRC4hfiVAFpOZLqGNQaTcgVbhDHJi22HnpdFF08KjeQ80pYXhpgNCqiop13KH95li8E3X74Q5jKp
 B4i6U4EHowHb9tI3Bkk8lc+nZuMfIWtUbK2t5clneQK02svcstqbnom7oMy/yOo05KiOX0f2B7ji3X8xBcVY4+JQXjng/8iYQjHa5ZqxmzHjKRqlJI1OMjNx
 okn0yxx5XsB5+0Kzw/HPKbKhpTw4o4x+zcSzhudWdboyfuqblAikr4gqNyNVG6ICMdV6eBeH66sBdH1i3rZP/O/oHaoebj+qcM/2UO0K2bj6OePb4/4cRA8+
 H6a2Fpy98Ob9fXQ6nE7hsTSBU1gjgUOg0e/PnxIFBO2en1aKqbh6L2MbSeHN+GuCor7Tlz8fmRffvcZdfckZgA6gdtdEIu8UhkmXGvNWxv3UPDUuO4gEXIv7
 3R1h3jMf8aaMeToVJHCXZj8I93fGbWDSGtwYZNejB0mAOslMaBbrCLq7YbytP33s+VV2B87z9iS/3fd8
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1768420555; bh=iRIfPf21iB2LkYdbf2qsl9ovEfXDITbZDtLQKiCkllE=;
 h=From:To:Subject:Date:MIME-Version;
 b=SD5mJArV/VGFKJmjb+f9P0g4TUAribBUUfbDTZ/ABc5M/DhnNY29zXIUA2FSZhZPG
 2heszBBxA2iZ5i2wn900m18Zsza2NQhAI9UOeDp6GjqPviPLFw5YxMKCvPnzyYRuqA
 JNTdQKTaHGM73ll82BAp19bIdX0JqShgu9QpfO+gQDvk3nRLZKRVXNhXThOFoDQoWb
 ofg6YyCDp+spMjSrpvpgvg98iozgk5nubGB9JTjxZ4EKHyccOmVvutfUIbLI8Xxm3G
 RmUJ/mOHQ+xlmo6BdJq9MtKto8lUtAzDKXgbFPXBDPb6O28SWZVJHl4Xtej5Tc3aWY
 BfMD4tt97+iAw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=SD5mJArV
Subject: [Buildroot] [PATCH 14/17] configs/olimex_a20_lime2: switch to
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
 configs/olimex_a20_olinuxino_lime2_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index 671aa19687..2f79e35abb 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
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
