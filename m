Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F13CF884E
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 12:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DC65843CB;
	Thu, 20 Nov 2025 12:17:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l78Y3XeRQsZ3; Thu, 20 Nov 2025 12:17:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F62E843BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F62E843BB;
	Thu, 20 Nov 2025 12:17:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3ACA6158
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 12:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2116940F3A
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 12:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J6Wo-_4H9GUO for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 12:17:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 57B5440F31
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57B5440F31
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57B5440F31
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 12:17:43 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 0CB6C2C893FE;
 Thu, 20 Nov 2025 13:17:41 +0100 (CET)
From: Marcus Hoffmann <buildroot@bubu1.eu>
To: buildroot@buildroot.org
Cc: Marcus Hoffmann <bubu@bubu1.eu>
Date: Thu, 20 Nov 2025 13:17:38 +0100
Message-ID: <20251120121739.1365133-3-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251120121739.1365133-1-buildroot@bubu1.eu>
References: <20251120121739.1365133-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1763641061; bh=nCu1n8TLMeI37HUYbtv49Zbah3vS/uSSS0oYdB+LeCs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=qBWnShS2uVheQ1kTYksWec02GX5nWWNoGeMBLTkbIRKdi3QoJOymeZMkiOPjsG94C
 fVVDZ2uztceaOWWQUhL2v4taoH53V5VGN+1rVvemTXt7H5xLLFBmn/Rd7duqm8m86D
 wSZViFd5vdyYmrUO/Ssfd1arw1u74+ziXdOWRgt18gLyftQEpjd2FrU33kvj5wJIdN
 CL1uu6R0jJYgAjwX52xo7wMAOT4LOTdm6dDWqe+TO3DVNFYSvUE2kg32r1xiIzh6PE
 /k3u4IRkV3fenNVbCD0qi1bZwjuunDwav6R4g9lDhdPuMBAQGsJH1O5PvSzgywnMb9
 5SaoWm6m1DiyA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=qBWnShS2
Subject: [Buildroot] [PATCH 3/3] support/testing: fix
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The test currently fails because kbd fails to compile but this is
unrelated to the actual package being tested. We can work around this by
disabling systemd-vconsole which pulls in kbd.
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
