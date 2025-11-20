Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E337FCF884B
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 12:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAA3F41CB5;
	Thu, 20 Nov 2025 12:37:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7_IPHFaV3xmw; Thu, 20 Nov 2025 12:37:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1E23411CF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1E23411CF;
	Thu, 20 Nov 2025 12:37:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DF312A9
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 12:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AEFCC41C29
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 12:37:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eFvCp2-lRSrj for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 12:37:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3B1A741C78
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B1A741C78
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B1A741C78
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 12:37:07 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 7910D2C893FE;
 Thu, 20 Nov 2025 13:37:04 +0100 (CET)
To: buildroot@buildroot.org
Cc: Marcus Hoffmann <bubu@bubu1.eu>
Date: Thu, 20 Nov 2025 13:37:02 +0100
Message-ID: <20251120123703.1371644-3-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251120123703.1371644-1-buildroot@bubu1.eu>
References: <20251120123703.1371644-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1763642224; bh=2SPh/ejVIHoZpPWozNJzaEH/vRHw7leFYT4eLIq8ETg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ljKPqMg7RnAVpiJyNkcFAQCH2Htr1wSSvsUsJY3KTX5OnxzN1argqvEVTwEqZDmcu
 ziD0OvFuqk8oQQ9nMjvK8HwzRLogugc5rEhosU6Z6V6QWTW4IxAL7NuZl50xlND7Xu
 otB31p/zKffdHu0XeLorjF0SGqe8WDdiyZx4oNsu4Tugen885CD0cX5IIW9elimooX
 axdrDGOHPhu9oRpBCqArbJBpkvYn2GG0X5GAHrNgg/UZDHHva0UKg/FRCLP+9NugBp
 RPiG4dEpcY79nCvFBxxNu5sm2pTP/MEgCDla5HFDX86cWl4MmG6HP5ychscxbVzfY0
 7U3h5bMRakurA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=ljKPqMg7
Subject: [Buildroot] [PATCH v2 3/3] support/testing: fix
 test_python_sdbus_modemmanager
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

The test currently fails because kbd fails to compile but this is
unrelated to the actual package being tested. We can work around this by
disabling systemd-vconsole which pulls in kbd.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 support/testing/tests/package/test_python_sdbus_modemmanager.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/package/test_python_sdbus_modemmanager.py b/support/testing/tests/package/test_python_sdbus_modemmanager.py
index 58e02f99ef..736c34b724 100644
--- a/support/testing/tests/package/test_python_sdbus_modemmanager.py
+++ b/support/testing/tests/package/test_python_sdbus_modemmanager.py
@@ -8,6 +8,7 @@ class TestPythonPy3SdbusModemmanager(TestPythonPackageBase):
         + """
         BR2_PACKAGE_PYTHON3=y
         BR2_INIT_SYSTEMD=y
+        # BR2_PACKAGE_SYSTEMD_VCONSOLE is not set
         BR2_PACKAGE_MODEM_MANAGER=y
         BR2_PACKAGE_PYTHON_SDBUS_MODEMMANAGER=y
         """
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
