Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C335E94623
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 00:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B3A16067C;
	Tue, 10 Feb 2026 00:08:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZMxXkyUymiX2; Tue, 10 Feb 2026 00:08:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E4A7606C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770682114;
	bh=afEy2CXCaC2mOxTqppk9qUudTlAOJS6KjOkC4v1VVlA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=dHxWhqhbss9ljLiuFT4gEkDzlYC5OKUIjvUlgGw5HqVI0bEhN1icCvgl7m1t8kYf6
	 aYRouzvNVDiXu+8kLe+d6xEVuKY60CjArgBNiXaySm0qW3e04H4DRPJxpZrumlxyxF
	 VjqYNVLPwPvlV9h8QMU6oeTeVC5IpovlNKjyK0T4dpQGqTBZH2yLH0SoAoqNhpXE/8
	 wB3YEVhjTIjHpSFHybrIgDd89Mng7TWuKn0Yf7UU4GX9h7H3kXl+gus+lhGqFMqMA3
	 OXF4Yk7YIGQZKuYCZy48CgPlnKLQb78FVV7SDluwi/yrsxNp5s4AOB+XZQGmwDW2f6
	 +9LG1I5B09hDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E4A7606C2;
	Tue, 10 Feb 2026 00:08:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AF30C219
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90B3360B05
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:08:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PMXR-MkWt12O for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 00:08:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.42;
 helo=smtpcmd0642.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6AB256067C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AB256067C
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6AB256067C
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:08:30 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id pbIqvaeTtdarQpbIqvRnYl; Tue, 10 Feb 2026 01:08:28 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Feb 2026 01:08:24 +0100
Message-ID: <20260210000827.3811338-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMcwNX5Gf/CCv+QxRB+Tle+cdNffnqwl4L5cf5P9affn56rMZ7MEB29E6QYSJnL+6iJ2kHGBk1zCseJAufq3UaWK+NanGRaAVIlK5dxtKBhqs9OQjJ4s
 7wZJPOjheYoON1fyydmM7p06Jq6pws4qsJNl2JQ4wjeigpbf++eWLEjqPrWkDNtJCTEzGX4RhsupSrhXrCDyQCRXmHdVx5gqi3ah5iX5qEf1wajau1C+dAvF
 lEGY0Yt/J25TCLzBXd06Pu8sva6cU4Qi5Dr9nO/6RT99RdIK3fz8dNwzmwoz+Ju3iHR2YA4XpSvvR4vh2xjbjtK+tPrSLyK3KwQcjnPfm74w5JY8W7Y5Q8WJ
 DFRLsyTnX36TCPDj7Hvh1VUtpprK4ITorUfE1w4Bt5rNPjjoN+M9aGUBD12CvbKBbCdTS7AYYiTeveupt4S5el8+0iOXy4r8FxLUe4/WEskgLkJ7srXUDrE4
 uO/b5CNRZW35TFHgJ05gPQd1ygZ/lT4x0SKpNaWnMeu1+zpy4vrbIKg4V/MPHRTWVzkNySYiiL0/Ef2wicM3WIsoVap/TXBx0oBc8Y3plGVlz0XyIqnNCZQQ
 Mh4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1770682108; bh=1SFjIZfXkQLNdH3w+6nzwlYlWukNTfAdCxKi5xijqZM=;
 h=From:To:Subject:Date:MIME-Version;
 b=M6ZR6rI1jEZt3GeqnAClOTjY0Ip/TmuJL/Kb9+pqOOfmQ6Sj+MI7onBfRT2b8/ke7
 ys/Dpiraevi1cEOn/VhlqN/bgHOzd1RUo7qKGlNN0HjzVR+B2vVjxnlF2pBiJj3Z7E
 2L8ztzt9SL2M7A+PCguwsPdCprKvHPKQLh52o4wKxVND57KiptjIz4yi7n/usfPQbP
 qg25KPDFTReRWO/E2zWJbYmPiUxyDpqJZVhapkdicsqW/fnKB9ih+w77zQO5Hm74VK
 2HbHqo9xp7HmLgMa3Db6rY3AcNuGvEZqoRsBJXH3ELOwvuWqz6p0eDCicjuVJpjKRI
 HfzkT1CXOiWSg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=M6ZR6rI1
Subject: [Buildroot] [PATCH v2 10/13] board/olimex/a20_olinuxino: move
 rootfs_overlay to rootfs_overlay_mali
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

Differentiate for the upcoming patch.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../boot/extlinux/extlinux.conf                                 | 0
 configs/olimex_a20_olinuxino_lime2_defconfig                    | 2 +-
 configs/olimex_a20_olinuxino_lime_defconfig                     | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename board/olimex/a20_olinuxino/{rootfs_overlay => rootfs_overlay_mali}/boot/extlinux/extlinux.conf (100%)

diff --git a/board/olimex/a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf b/board/olimex/a20_olinuxino/rootfs_overlay_mali/boot/extlinux/extlinux.conf
similarity index 100%
rename from board/olimex/a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
rename to board/olimex/a20_olinuxino/rootfs_overlay_mali/boot/extlinux/extlinux.conf
diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index 671aa19687..116daed624 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -9,7 +9,7 @@ BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_SYSTEM_DHCP="eth0"
-BR2_ROOTFS_OVERLAY="board/olimex/a20_olinuxino/rootfs_overlay"
+BR2_ROOTFS_OVERLAY="board/olimex/a20_olinuxino/rootfs_overlay_mali"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 2df63b9ab0..437a6113c9 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -9,7 +9,7 @@ BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_SYSTEM_DHCP="eth0"
-BR2_ROOTFS_OVERLAY="board/olimex/a20_olinuxino/rootfs_overlay"
+BR2_ROOTFS_OVERLAY="board/olimex/a20_olinuxino/rootfs_overlay_mali"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
