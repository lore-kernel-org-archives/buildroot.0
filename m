Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281A2C3ABBC
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 19:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C060F404A7;
	Tue,  6 May 2025 19:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QLCWfuQpxPiN; Tue,  6 May 2025 19:42:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4F31404A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4F31404A2;
	Tue,  6 May 2025 19:42:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 22A201A3
 for <buildroot@buildroot.org>; Tue,  6 May 2025 19:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FD306082F
 for <buildroot@buildroot.org>; Tue,  6 May 2025 19:42:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ckJIAymHFk3x for <buildroot@buildroot.org>;
 Tue,  6 May 2025 19:42:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E829760A83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E829760A83
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E829760A83
 for <buildroot@buildroot.org>; Tue,  6 May 2025 19:42:02 +0000 (UTC)
Received: from home.juju.sh (unknown [86.210.113.106])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0A81BB0065A;
 Tue,  6 May 2025 21:41:56 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Date: Tue,  6 May 2025 21:41:48 +0200
Message-ID: <20250506194148.2957434-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746560519;
 bh=ZwIVlLaM4CVIoKe8Tbq05SxJW4RXFRZsZ/sjodVQWVA=;
 h=From:To:Cc:Subject:Date:From;
 b=mG0IQvAzEuaeZHZulcD0xecUj43n+RozxfpgktZTk182uDL/X4kD+vZ8XKvZvAdiJ
 pVmNR43M7j1KABX3QpjLid9i2G0lgtXoCLX5DiPS9ryVn15288Sk7pkT/MvITAqIcd
 JHxPCYTkYaIWcyyoVUSqYoY2dy/zT4/UavxmFxcmC7ydKm5Bowxg8ue24YRJoBACrS
 UC8a6GSMwj94icTuY34ND6pzZORRtONeHGtC5x9Jrwd9jLPgk8W/07dhkl1iJwRwiF
 IO2C3uWNaCacUqeb1CpoV8+L1FIXhoP7qRt2nd822fi2qxaxeq1bEcoUeJdRYbk9z5
 aJu15Ima7PTMw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mG0IQvAz
Subject: [Buildroot] [PATCH 1/1] configs/friendlyarm_nanopi_r3s: fix host
 linux headers custom version
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

Since its introduction in commit [1], the
friendlyarm_nanopi_r3s_defconfig is failing to build with error:

    Incorrect selection of kernel headers: expected 6.12.x, got 6.13.x

The error happens because the defconfig has:
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
and
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.13.4"

This commit fixes the issue by setting instead:
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_13=y

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/9887216429

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/41734e00c0cc36f4df2f492e72b535a0716d4048

Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/9947235741
---
 configs/friendlyarm_nanopi_r3s_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/friendlyarm_nanopi_r3s_defconfig b/configs/friendlyarm_nanopi_r3s_defconfig
index 39e21c74fd..4219147033 100644
--- a/configs/friendlyarm_nanopi_r3s_defconfig
+++ b/configs/friendlyarm_nanopi_r3s_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_cortex_a55=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_13=y
 BR2_GLOBAL_PATCH_DIR="board/friendlyarm/nanopi-r3s/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="nanopi r3s"
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
