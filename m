Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AFACF884C
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 12:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D88F0843DC;
	Thu, 20 Nov 2025 12:17:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dfTyr-3Qw4zA; Thu, 20 Nov 2025 12:17:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0080843CD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0080843CD;
	Thu, 20 Nov 2025 12:17:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 12E6C37D
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 12:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F122E4037E
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 12:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hwt4zrClvKQo for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 12:17:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ABC0740DAF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABC0740DAF
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABC0740DAF
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 12:17:42 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 67F672C893FB;
 Thu, 20 Nov 2025 13:17:40 +0100 (CET)
To: buildroot@buildroot.org
Cc: Marcus Hoffmann <bubu@bubu1.eu>
Date: Thu, 20 Nov 2025 13:17:37 +0100
Message-ID: <20251120121739.1365133-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251120121739.1365133-1-buildroot@bubu1.eu>
References: <20251120121739.1365133-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1763641060; bh=S1Mhadc155qUp/lxWIYuzY/2bAwz46+icBn3CSyK28c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=MPTT8H6k2PcxmWPUp6GvnNkOLJ2Ar/qGnem0Q6xHTWmL56uvgAc+o5j6COz8L/SAR
 /RhkLDolX4LKRN8yTiRlOh21osCE4rR+PYKK+0gv0HUTEOIysa6PmSBXWN1X8pA2wB
 4q3fb/ucQNl4Cq5fes2CjWJNpuizVx3lsJw3/9M2m1RMX3CDGCq5RUrVW6fXIxygS3
 SuaB6j77phh8+Ex+XKHjB42Ivx9vMnmQr0Gd2tI220gQBXYHP62Pu/cI42Ckh/vd6s
 rlMLStFT1MSeNOtlrIVGUa8Weiqd4ktlPZtTTj3ARVJ9LZHfbpYQO0MJXYAclivHLZ
 kT72ta+cpggGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=MPTT8H6k
Subject: [Buildroot] [PATCH 2/3] support/testing: fix
 SdbusModemmanager/SdbusNetworkmanager duplicate test name
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 support/testing/tests/package/test_python_sdbus_modemmanager.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_python_sdbus_modemmanager.py b/support/testing/tests/package/test_python_sdbus_modemmanager.py
index 34ab66e3bf..58e02f99ef 100644
--- a/support/testing/tests/package/test_python_sdbus_modemmanager.py
+++ b/support/testing/tests/package/test_python_sdbus_modemmanager.py
@@ -1,7 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonPy3SdbusNetworkmanager(TestPythonPackageBase):
+class TestPythonPy3SdbusModemmanager(TestPythonPackageBase):
     __test__ = True
     config = (
         TestPythonPackageBase.config
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
