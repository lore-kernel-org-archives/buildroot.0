Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DEDC48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 13:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49FC34144E;
	Tue, 13 Feb 2024 13:05:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r4yROTjDLtu8; Tue, 13 Feb 2024 13:05:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0983440395
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0983440395;
	Tue, 13 Feb 2024 13:05:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 575861BF406
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 13:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4410A40395
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 13:05:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O1vg6e2TDaDB for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 13:05:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0820C40189
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0820C40189
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0820C40189
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 13:05:07 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2FAC713F8BA;
 Tue, 13 Feb 2024 14:05:00 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org,
 =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>,
 Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Feb 2024 14:04:44 +0100
Message-ID: <20240213130444.12586-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707829503;
 bh=vDnOGBbNrk31L/i+Rlwz8q7bKco2yqu+WkxNtffxlgQ=;
 h=From:To:Cc:Subject:Date:From;
 b=cG88Ea1j3QJGNeMRFSumM3fSRlQJnNRzOwOXzW6GjXpkhVBI3EfeUSASWsfzOcHbJ
 8rRd/7jJT842PCh4bgbESKbl0OUkS56o495WrwDJFULv3drf/8YdidxhHIrnJyhSbt
 EsJy51Pupt9GGJt1D3Pevx4AR9Y+Lco/TL3VUCfQUNkK9xZyL2oNmRRWuCCs2RucUT
 1zO9TFxLkEERBnAWhlAcT1p2alddfDj4WBUbUl8wDWqQ8VSg98iMFPU4hUY7zLOBCX
 82pMRqhLp9HNZcH5NCOVYNh+SD+vt4eMtOIcN8jZgizeXeybounBsj6tpSq1B4RcpO
 ERql6208b4uNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cG88Ea1j
Subject: [Buildroot] [PATCH 1/1] board/freescale:
 imx9-bootloader-prepare.sh: fix script
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit c05f27c "configs/freescale_imx93evk: new defconfig", when
applied, added few ShellCheck fixups on top of the orginial
submission. During those changes, one extra backslash was added,
making the imx9-bootloader-prepare.sh fail.

This commit fixes the issue by removing this extra backslash.

Fixes:

    dd: failed to open '/buildroot/output/images/u-boot-atf-container.img': No such file or directory
    make: *** [Makefile:820: target-post-image] Error 1

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/freescale/common/imx/imx9-bootloader-prepare.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/freescale/common/imx/imx9-bootloader-prepare.sh b/board/freescale/common/imx/imx9-bootloader-prepare.sh
index a9611a81bd..8ab5a241b0 100755
--- a/board/freescale/common/imx/imx9-bootloader-prepare.sh
+++ b/board/freescale/common/imx/imx9-bootloader-prepare.sh
@@ -21,7 +21,7 @@ main ()
 			-ap "${BINARIES_DIR}/bl31.bin" a35 ${ATF_LOAD_ADDR} \
 			-ap "${BINARIES_DIR}/u-boot-hash.bin" a35 0x80200000 \
 			-ap "${BINARIES_DIR}/tee.bin" a35 0x96000000 \
-			-out "${BINARIES_DIR}/u-boot-atf-container.img" \
+			-out "${BINARIES_DIR}/u-boot-atf-container.img"
 	else
 		"${HOST_DIR}/bin/mkimage_imx8" -soc IMX9 -c \
 			-ap "${BINARIES_DIR}/bl31.bin" a35 ${ATF_LOAD_ADDR} \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
