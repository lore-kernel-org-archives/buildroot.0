Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B794CCF884C
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 12:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7ACB184427;
	Thu, 20 Nov 2025 12:37:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rgNpADJBXTA2; Thu, 20 Nov 2025 12:37:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A80B384422
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A80B384422;
	Thu, 20 Nov 2025 12:37:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 30E4F2A9
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 12:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 236F641B91
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 12:37:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kMEW3Vaj8wks for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 12:37:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0D3B541D56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D3B541D56
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D3B541D56
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 12:37:05 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id DFB412C893FB;
 Thu, 20 Nov 2025 13:37:03 +0100 (CET)
To: buildroot@buildroot.org
Cc: Marcus Hoffmann <bubu@bubu1.eu>
Date: Thu, 20 Nov 2025 13:37:01 +0100
Message-ID: <20251120123703.1371644-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251120123703.1371644-1-buildroot@bubu1.eu>
References: <20251120123703.1371644-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1763642224; bh=JLwHP7XObGg53AxqC96LrA35MHJsUPkcNc6OYoRb6Hw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=tMfat38Sng+SXa2AqmytKaYXAAH4Ne0fe5dd5shOuNnMS3wuA+z11UE5MCTF0Oohk
 7Pk++EiZ4PUiIKbrr45Y7lR8MEWQRgB2RMyWCKLNBrww7Q/51l2iOYNZn0Q1uTEptN
 IfR5aRL3vKcsDLZImCvct4aPsPZ7SjDsZWxA2EHlMmHs34E+M2bdwoOEpCGasH59lv
 dvsEroP0QE23zTJSOnwszjncm/uy+b+Uu9KjfM++A3GG4ioZddZ3UUGjXKzVtTw3gI
 vJS04u5fRrSX8z5qqu790tnjWELcklmdbNMePZ/kUbQUNUzaUml4cEeOPX51IMajU2
 cdt1VMgMNAD/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=tMfat38S
Subject: [Buildroot] [PATCH v2 2/3] support/testing: fix
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

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
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
