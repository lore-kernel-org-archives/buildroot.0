Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D53CCD193
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 19:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7855240F39;
	Sat, 18 Oct 2025 19:43:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CTvn9rV4BJHE; Sat, 18 Oct 2025 19:43:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E47D40FA0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E47D40FA0;
	Sat, 18 Oct 2025 19:43:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3292DD8
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18F4F80D61
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:43:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xHvnof3hNrpT for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 19:43:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 233DE80AB5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 233DE80AB5
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 233DE80AB5
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:43:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 39A83C09A1F
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:43:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9F66E6069D
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:43:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E1364102F2392; 
 Sat, 18 Oct 2025 21:43:43 +0200 (CEST)
To: Buildroot List <buildroot@buildroot.org>
Cc: romain.gantois@bootlin.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Oct 2025 21:43:02 +0200
Message-ID: <20251018194314.114284-5-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251018194314.114284-1-thomas.petazzoni@bootlin.com>
References: <20251018194314.114284-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1760816624; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=3nDRJcLiPIRKZ0+1ud0vR6bgqd8At/droes6OtEr8gM=;
 b=fdeOEzt4iQw1Bi4GR5RBAT573HsrYaZHsFB20eGvR1o9iCqgmvDiqBxLOekjZkoc6ePey7
 NHkC/mPOHHQyL10I48MJvjJDGtM87fxegk9Qy9pf8rYcjEksZyh+ORvrp0nbmP/BsWRvPD
 BIuDO5Wx8gZDPZnLOuEKg0yxQ31EEYoGkqcLjEL0n0XHpS03hHZWagpvI8Zsza3dpIt017
 9XfZOAtOXAyI71VjOZ9zy8gsWPeiTdwZ/URXdG0MDrI8oDY6AnlJmKs5/PLnC5dJuCi/PY
 uy8sTOXh/v2JFHL9Cv5Lu4DgkDddiBczMTujt9t3wIdBVdewTSJx0g3z6kMTwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=fdeOEzt4
Subject: [Buildroot] [PATCH 04/11]
 support/testing/tests/package/test_python_serial.py: new test case
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This quickly tests that the host-python-serial package at least
minimally works.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                          |  1 +
 support/testing/tests/package/test_python_serial.py | 12 ++++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 support/testing/tests/package/test_python_serial.py

diff --git a/DEVELOPERS b/DEVELOPERS
index ec52defef8..6b525538d7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3285,6 +3285,7 @@ F:	support/testing/tests/package/test_python_crccheck.py
 F:	support/testing/tests/package/test_python_flask.py
 F:	support/testing/tests/package/test_python_flask_expects_json.py
 F:	support/testing/tests/package/test_python_git.py
+F:	support/testing/tests/package/test_python_serial.py
 F:	support/testing/tests/package/test_python_unittest_xml_reporting.py
 F:	support/testing/tests/toolchain/test_external_arm.py
 F:	toolchain/
diff --git a/support/testing/tests/package/test_python_serial.py b/support/testing/tests/package/test_python_serial.py
new file mode 100644
index 0000000000..c4b05a10fb
--- /dev/null
+++ b/support/testing/tests/package/test_python_serial.py
@@ -0,0 +1,12 @@
+import infra.basetest
+
+
+class TestHostPythonSerial(infra.basetest.BRHostPkgTest):
+    hostpkgs = ["host-python-serial"]
+
+    def test_run(self):
+        cmd = ["host/bin/python3", "-c", "import serial"]
+        infra.run_cmd_on_host(self.builddir, cmd)
+
+        cmd = ["host/bin/python3", "-m", "serial.tools.list_ports"]
+        infra.run_cmd_on_host(self.builddir, cmd)
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
