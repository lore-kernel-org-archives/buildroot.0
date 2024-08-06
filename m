Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FA0C52D6F
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 21:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C490C6086C;
	Tue,  6 Aug 2024 21:29:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SeD6CrrvSftL; Tue,  6 Aug 2024 21:29:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E11306085A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E11306085A;
	Tue,  6 Aug 2024 21:29:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D0B861BF30B
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 21:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE89240507
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 21:29:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 95MKArzTQsHg for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 21:29:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4502740506
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4502740506
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4502740506
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 21:29:02 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 3A47BB0053D;
 Tue,  6 Aug 2024 23:28:58 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue,  6 Aug 2024 23:28:50 +0200
Message-ID: <20240806212850.467698-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1722979739;
 bh=1Kk0WlvRV0AevHtAq8dKZkpq5OhSJM0ftOvp0Boz/5s=;
 h=From:To:Cc:Subject:Date:From;
 b=u/8n3qbfm88F05eArEM13KtZ61oyggpywS4WCP48Ko6czOqShLq6BAHsRCGNRtPmj
 00L6Ph7zUjr2mEAOCg8igZEgh/aNQkAWhAC+sZag3+yGhTo+DtDGdX5u66n9ocF8SK
 ABa/qFmoMWFpsWdAD4baIG735jOweRY3irjV1Tb7qST+hdShMV0B/JGCNmXhlf8kWg
 uemMfOTQDcH4sNsRk2EdoVNDrjZ4/GtHob7nvqdE4Jn7TZCsp/jeWbR1XdHBY9kKJ9
 lo1P4I/Ksrs78cGmlwGoQDe48NLccGAKNgwOLFvuwqErpwJeZXWnomUhvZlWhZkeW+
 prjFGAx4FiOsA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=u/8n3qbf
Subject: [Buildroot] [PATCH 1/1] support/testing: package: gpsd: fix test by
 enabling python support
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

Commit 9696d27756 "package/gpsd: condition python stuff to the proper
kconfig option" changed the condition in which the gpsd python scripts
are installed. After that change, the "gpsfake" command (which is a
python script) is no longer found and the runtime test is failing.

This commit fixes the issue by reflecting the change in the runtime
test Buildroot configuration.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch testing in:
https://gitlab.com/jolivain/buildroot/-/jobs/7520716177
---
 support/testing/tests/package/test_gpsd.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_gpsd.py b/support/testing/tests/package/test_gpsd.py
index 7ca5973981..2c44e25cec 100644
--- a/support/testing/tests/package/test_gpsd.py
+++ b/support/testing/tests/package/test_gpsd.py
@@ -11,7 +11,7 @@ class TestGpsd(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         f"""
         BR2_PACKAGE_GPSD=y
-        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_GPSD_PYTHON=y
         BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
