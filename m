Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CBEC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 22:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE7F8401F8;
	Mon, 22 Jul 2024 22:39:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xf_yKVMTtSxa; Mon, 22 Jul 2024 22:39:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 763C8401F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 763C8401F6;
	Mon, 22 Jul 2024 22:39:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7834C1BF31E
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 22:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 663FA6063C
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 22:39:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sHS-mrRdy41i for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 22:39:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E4F8D605F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4F8D605F4
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E4F8D605F4
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 22:39:45 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6D540B00539;
 Tue, 23 Jul 2024 00:39:42 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 00:39:22 +0200
Message-ID: <20240722223923.278333-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1721687983;
 bh=6oplmXOqjq+9saPjw6JJNh9tDtuHe27k2E13uQTKoO0=;
 h=From:To:Cc:Subject:Date:From;
 b=QvlovCqf9tHcFpgMMnuDEOk5kziE/3zBDYcvdV2ga5mKKIGihSzzTfSBv1PWa/sRB
 BVDxRcETuJqrbfbFBmglNQqQMKhz3/UwbwUGhwLbjo5S729eXr7RrqBaeglldDMFlZ
 Pa9vIWLT4fEhV012xgD0rH/24DMFxeWtXxXZtknizWN5g2Lqleapbr1twNSoi2v1eD
 a9tXvVpfqCNcKTNeEy7HuNrj8Ms0EZ4D7otdvNMB172cqpuXQkBcpvvUM24CM4SyzW
 U6W0X0325mycA41nUq7BhAAAGhEq9F4W9ImjJd0af0fU97uTM+XqfDxO/W9eYeBefS
 WCMYdVqqcaROg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=QvlovCqf
Subject: [Buildroot] [PATCH 1/1] support/testing: package: gpsd: fix gpsfake
 command line
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

The gpsfake command line has a typo (a missing space), which makes the
next gpsctl command to always fail.

This commit fixes the issue by adding the missing space.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/7391792948

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_gpsd.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_gpsd.py b/support/testing/tests/package/test_gpsd.py
index deed586c17..7ca5973981 100644
--- a/support/testing/tests/package/test_gpsd.py
+++ b/support/testing/tests/package/test_gpsd.py
@@ -33,7 +33,7 @@ class TestGpsd(infra.basetest.BRTest):
         # We start the "gpsfake" GPS emulator instead.
         cmd = "gpsfake"
         cmd += " --slow --cycle 0.1 --quiet"
-        cmd += "/root/udp-nmea.log &> /dev/null &"
+        cmd += " /root/udp-nmea.log &> /dev/null &"
         self.assertRunOk(cmd)
 
         # Wait a bit, to let the gpsfake and gpsd to settle...
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
