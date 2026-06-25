Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3C3CDB466
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 08:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5888D60FD3;
	Thu, 25 Jun 2026 08:45:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ui0ODMraje1b; Thu, 25 Jun 2026 08:45:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2EBA60FCA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782377104;
	bh=Nigf1zQEDInbN1CWA9Wi1tKQF5725pOaky21vIWhG+U=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=anHOycKhyUO6240wBRLyufVd0CT9erTtlhffXkpoHw44vaYS+h612njO6iSpgQVTq
	 Sl9yISNpKRtwcbSR6i6I/QM1csDPqAJPQh8kKIbasC5ModhifdzEweZq1Wl5+/7+aE
	 DD/AU+WDwvSloQDiyIt/rkM2Ew7DxQyIZqx73ymLmlVyhBs5v4Ha4C9/OqGZUrXU7U
	 HeYesGdzVGincQR1twkkwSokPkSb3OdpGPz+KqH1iuUMesALfk0hqdOzRvysZDxm9w
	 GdIjWaznCIh9lXmqeQkMm9RWGX/RDAKimDLORJW9h2rIQlYyqnJinXRRTt3HuDZKqW
	 qK728qT83r9VA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2EBA60FCA;
	Thu, 25 Jun 2026 08:45:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D728254
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 08:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EAD44106D
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 08:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ok-nykDs1iqU for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 08:45:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 396DB4106B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 396DB4106B
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 396DB4106B
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 08:45:01 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbRk3-1x9nb30smH-00jZLS; Thu, 25
 Jun 2026 10:45:00 +0200
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@smile.fr>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Thu, 25 Jun 2026 10:44:39 +0200
Message-ID: <20260625084439.133977-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:XN8je8IRFD9IEU5r78QJH9gMxD1CJiEN3R7tQ+TrnOSZ3jh9edp
 iJ32pBvJsZ0uAUR3aAf/2XE4UMvUz3u3cL1MjOJIzXirb86YH2Ix/pdW/P1C4ZNdqDYUafx
 j9kUeBbbTbnGxYr+h/G4LxO0sIYYZ0o6gajrrcKQuOZTIG37yWDIq9cb/ojm0XgBSesQyoG
 kcYan8dqQLHEQYP6JVtpA==
UI-OutboundReport: notjunk:1;M01:P0:I3ho9Aw/l9U=;Tlee19Yed5V6bKAJ33rgY2HVH2n
 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
 i5TieW7tZXA6UWtaTTP9C8FK2wRnWxLCT8fwS+O
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1782377100; x=1782981900; i=fiona.klute@gmx.de;
 bh=sueDT6t8pfG5deDv/obt0xxmePBL+QSjYZOK9/Ig4Rs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=gPQhr+NajvpBZLPivG2qH905THTecTq3wVeYglHdcWHIBc4OqWBD0eiW9Pcjts17
 LZulaZLEWCaCH7pYmVt+5xV1doCBkIlNLPPyDrRTOBIdThAr+JBc9yYnMilSDF9OV
 e52+7avujdJSeTAa8XFkQABGWzSCN86ZS+QGxIMmNBFOSfmVsnfSQYHtgQR3QWmnb
 inL6T42caxNybtC0bBdLHNf1uDUMpl9TRJAu+lkNXdsA13KHVnWaff6e7ib+Anh3U
 0VBX2KVFPtfwCDe+fL1hDzP/gr4x6uDk23/Zdvsz58fsOYVaT7pQAEoZCTZytvsgW
 bSBoU4xQXdSgi7wLsg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=gPQhr+Na
Subject: [Buildroot] [PATCH 1/1] support/testing: TestIptablesNft: add test
 for iptables with nftables backend
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The new test inherits from TestIptables, with only minimal changes to
use the nftables backend instead.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 support/testing/tests/package/test_iptables.py | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_iptables.py b/support/testing/tests/package/test_iptables.py
index 918fa4fb29..c37c615e06 100644
--- a/support/testing/tests/package/test_iptables.py
+++ b/support/testing/tests/package/test_iptables.py
@@ -24,6 +24,7 @@ class TestIptables(infra.basetest.BRTest):
         BR2_TARGET_ROOTFS_CPIO_GZIP=y
         # BR2_TARGET_ROOTFS_TAR is not set
         """
+    iptables_backend = "(legacy)"
 
     def test_run(self):
         img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
@@ -41,7 +42,7 @@ class TestIptables(infra.basetest.BRTest):
         cmd = "iptables --version"
         output, exit_code = self.emulator.run(cmd)
         self.assertEqual(exit_code, 0)
-        self.assertTrue(output[0].endswith("(legacy)"))
+        self.assertTrue(output[0].endswith(self.iptables_backend))
 
         # We delete all rules in all chains. We also set default
         # policies to ACCEPT for INPUT and OUTPUT chains. This should
@@ -95,3 +96,14 @@ class TestIptables(infra.basetest.BRTest):
         # Since we deleted the rule, the ping test command which was
         # supposed to fail earlier is now supposed to succeed.
         self.assertRunOk(ping_test_cmd)
+
+
+class TestIptablesNft(TestIptables):
+    # Build iptables with nftables backend, and run the same test
+    # procedure as above
+    config = TestIptables.config + \
+        """
+        BR2_PACKAGE_IPTABLES_NFTABLES=y
+        BR2_PACKAGE_IPTABLES_NFTABLES_DEFAULT=y
+        """
+    iptables_backend = "(nf_tables)"
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
