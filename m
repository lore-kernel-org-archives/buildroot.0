Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FB0E77188
	for <buildroot@archiver.kernel.org>; Tue, 31 Dec 2024 18:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1545E60665;
	Tue, 31 Dec 2024 18:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 262nPpTLbqGz; Tue, 31 Dec 2024 18:54:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90C3160641
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90C3160641;
	Tue, 31 Dec 2024 18:54:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C2BBF972
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 18:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BFD780EFC
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 18:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mj1-gM-OT4gz for <buildroot@buildroot.org>;
 Tue, 31 Dec 2024 18:53:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 64E0880EFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64E0880EFB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64E0880EFB
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 18:53:58 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id AD12BB0053D;
 Tue, 31 Dec 2024 19:53:53 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Vincent Jardin <vjardin@free.fr>,
	Julien Olivain <ju.o@free.fr>
Date: Tue, 31 Dec 2024 19:53:46 +0100
Message-ID: <20241231185346.180096-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735671236;
 bh=yiXD4Vk3TTwjz7tH358TvBe5URS+HV7nIWyZ6dgxI98=;
 h=From:To:Cc:Subject:Date:From;
 b=uJUoqfLEwAS9VEWRik/cv2ybWa46mqyFPuX2UrKw+UWHUWr74hi13rTwNWS//f6fP
 vr2jgKy3zczPRRHLzqn1N2VPahIOKwy6xB4yklO28CAQ4e//eQvQT8JT4qzDfkzd+f
 W8ZJ5FVaI2hMZYu6m6qLjSZizk4vo6iH1FPkjow0qPg6d5eP9XtTO8mT8SMlL1Ybu5
 QzOCtsxabI9UfXHozhX9SeZmZumiH4rQ/zx0S+9klreQCjeG8IrZfA9/rSzsz4mkb9
 5Jd1RgdcmP94DzdMH1tSGwzGGVzG5sLkhv68TLDWvAITRn4WZjefPVwxHkM5RAPhiS
 DFafEJNodKl0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=uJUoqfLE
Subject: [Buildroot] [PATCH 1/1] configs/nvidia_bf3: set BR2_cortex_a78
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

The nvidia BlueField-3 DPU includes Arm Cortex-A78 Hercules
processors. See [1].

The Cortex-A78 support was added in Buildroot in commit [2].

This commit adds BR2_cortex_a78=y in nvidia_bf3_defconfig to enable
optimisations for this processor.

[1] https://www.nvidia.com/en-us/networking/products/data-processing-unit/
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/f4690c2bfd7d51c614d09ff470e725c795bab980

Cc: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested (compilation only) in:
https://gitlab.com/jolivain/buildroot/-/jobs/8748400651

Vincent: if you have access to this board, could you do an actual
runtime test and add a "Tested-by:", please?
---
 configs/nvidia_bf3_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/nvidia_bf3_defconfig b/configs/nvidia_bf3_defconfig
index 3f958c0062..e44bb55a3a 100644
--- a/configs/nvidia_bf3_defconfig
+++ b/configs/nvidia_bf3_defconfig
@@ -1,4 +1,5 @@
 BR2_aarch64=y
+BR2_cortex_a78=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
 BR2_GLOBAL_PATCH_DIR="board/nvidia/bf3/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
