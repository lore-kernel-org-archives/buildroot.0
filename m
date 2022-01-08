Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C7FC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 14:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 708A6410C3;
	Sat,  8 Jan 2022 14:15:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NiULAoRcawJ3; Sat,  8 Jan 2022 14:15:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEF3B408A0;
	Sat,  8 Jan 2022 14:15:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2709B1BF2FA
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 14:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1459C81763
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 14:15:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z8YHoITWHONo for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 14:15:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A0FD81757
 for <buildroot@busybox.net>; Sat,  8 Jan 2022 14:15:11 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id l10so16921112wrh.7
 for <buildroot@busybox.net>; Sat, 08 Jan 2022 06:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8AQPXmUeI62hjZ9sVEaNeMiQeLQmMhFMn7KeSqJx5ZA=;
 b=fYdobdBSJPFWSDrJ2HaoyvWISL16OBCSVCJvikhHUiVBADHVIgFqe8m8/DfT5bFgRD
 CBTUf0hpkBKdy+V0OziKDB0uitfxTmd1tQoE8K6jQZY/Yu4wGzI0A/wBZXCrhc0S877E
 feYaEaMmLt1jdkg8plAvSJBp8omo4dEX40tYMhGn6HFex16p5XPUBeLAe4kDivY/j+zg
 KPLkRELwRs6IxsqmGEPtjVqvdgJIUFbF4EFjAYJKZi/S7aGVYVhwc36OaADNVZGj0IDG
 UGOI7W5p32u7bbTrIw1r089fsnzYcWqkMdaHxvzPzrfzyYH1/xhBuAsVE3iFY98BfOTr
 YQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8AQPXmUeI62hjZ9sVEaNeMiQeLQmMhFMn7KeSqJx5ZA=;
 b=Bj8nkALSw5yYo0ofgKDJYUTAGhUh/ll6d8urPyXeLZduO7NJJp9CS00NBHx4IpOeI1
 MLwlx2UAZLdBgdc3GSgdXV3xmwNynUZ5CCaW3/A46Um/bywPenCjUA7qaTrI9MeGVcqa
 Ok8c0QmREp64ei4LNMXuHa1a8r1VvGASqNxzt2LEHWJeBkJt7507zLxeRJncc+P2n9uS
 +2KjOEoCaSAHQu3j4Zpv8hCnI679jOk+wxWsvwQryaLsa45TDcxiW4kHbz9xg53ap6aY
 CArx8ncCKTF5+gezdfdYx9HFIdkXOiMQFHtDNdGpJN4ZR/297F34xcbPR9koXgzEEHN2
 9R2A==
X-Gm-Message-State: AOAM533tT7zOk39BX93awPGFKAHKEFVQnrpmPkhVK7scoTvRj394zjW/
 +2QryGbJ5TfavBft5QAq/Nk7efmTjUU=
X-Google-Smtp-Source: ABdhPJyiGiMjZUwKNFELHCus4R2oMfKf4Hne9GWLj3miKc+K/xRgzKkXADXh2nHBUeBICqEYokcahQ==
X-Received: by 2002:a05:6000:1aca:: with SMTP id
 i10mr57441022wry.453.1641651309343; 
 Sat, 08 Jan 2022 06:15:09 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id l13sm1908312wrs.73.2022.01.08.06.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 06:15:09 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat,  8 Jan 2022 15:14:59 +0100
Message-Id: <20220108141459.2972-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/olimex_stmp157: bump U-Boot version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 configs/olimex_stmp157_olinuxino_lime_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/olimex_stmp157_olinuxino_lime_defconfig b/configs/olimex_stmp157_olinuxino_lime_defconfig
index f54d899b3..74e7f9ba6 100644
--- a/configs/olimex_stmp157_olinuxino_lime_defconfig
+++ b/configs/olimex_stmp157_olinuxino_lime_defconfig
@@ -34,8 +34,8 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/OLIMEX/u-boot-olinuxino.git"
-# release-20210821, based on 2021.04
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="acda542100fa83e4bc82634e4668f8106af37a61"
+# release-20211130, based on 2021.04
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="1c29714bc643c299e2ed4ba870be8d4538124144"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="STM32-OLinuXino-LIME"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
