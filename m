Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81E7D4A5F4
	for <buildroot@archiver.kernel.org>; Sun, 18 Jan 2026 15:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48D5842D38;
	Sun, 18 Jan 2026 15:23:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gavcf4aiLRSL; Sun, 18 Jan 2026 15:23:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 669FA42D39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768749780;
	bh=/mGr9kiVlIqBrjGI9CIwspgzEkdayKIcxmgeOU5GK4U=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=qypsNjavhAZhQBpg6dxRcOvu1Tt04e6XN1pDvzPXw6+jnqUVZM3KhWD6NC+GXT/x6
	 3N8bS+7auzrc7esIejP2p8uZda3wD99xvA7Nr/DmGZ1w/fs2YooI+91FiXwm7U2xzI
	 t5YPzqmqx6D+wchS1kne6dYQaEJI/cPIxbzNqbp1S6WWcmI3RSv88rym2/mYcMEoln
	 3vHRdXLKnvJIp1H2oIGJ8T44xlxqU2WuwBzTgy6perEQaivo+WYvJvIRUZ9UTV/eFi
	 4TmsxyXHp8jBd7J017sfSyKBlWpCMdB4Sd64pTEWre55tmXWA1vB78QP3KN4PjLcC5
	 Mkqbfv15E7KiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 669FA42D39;
	Sun, 18 Jan 2026 15:23:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E06FC2A8
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 15:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC78E61161
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 15:22:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hAxOSfvHgIC2 for <buildroot@buildroot.org>;
 Sun, 18 Jan 2026 15:22:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D87A96F65C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D87A96F65C
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D87A96F65C
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 15:22:58 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 8F51B19F576;
 Sun, 18 Jan 2026 16:22:55 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun, 18 Jan 2026 16:22:50 +0100
Message-ID: <20260118152251.248976-1-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768749776;
 bh=VDNnNT0LLWZimKpxNrOXp9EOO4LgN9Aht9n6a6Znmlk=;
 h=From:To:Cc:Subject:Date:From;
 b=pIhLbdwygVdLxnugcNjccyg2arqLtlrpCxX8YuXBYLLNv1FTT3A1CVacosyqwEWeA
 IXEcHpryAPuRAth6dfQz06JTK+wHM2dmm4YOofV6fulxckkowisl2tlbVT/fUS0k9Z
 54tTIcDL2hYd/mTy1PGgmM8uQbqOG9VjEOFq5xSybcivgN/XXZMqEs+gx9INddj8dV
 /VGfhcjo+5ST8IWNKmmSoEZKxJ8x32ZVvecsUn9fbGfuNAg57EcwqCYe6PddGxqW0k
 RsdK/sM72w6Ukm7/ay+z5nzz88zWlyoSImTAHJGx3Kh0SpMQVVNgDGFBONKvzxJY4z
 uijZmZc47Mhgg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pIhLbdwy
Subject: [Buildroot] [PATCH 1/1] support/testing: test_python.py: disable
 interpreter colors
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Python 3.14 (not yet in Buildroot) introduced colors, enabled by
default, when the output is a terminal. This behavior can make the
pexpect pattern matching more difficult in some cases. See:
https://docs.python.org/3.14/using/cmdline.html#controlling-color

This commit globally disables the Python interpreter colors in the base
runtime Python test, by setting the NO_COLOR=1 environment variable.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
For example, the python varlink runtime test fails when updating
Python to 3.14 for that reason.
https://gitlab.com/buildroot.org/buildroot/-/blob/master/support/testing/tests/package/test_python_varlink.py#L30

This patch might be useful, before updating to Python 3.14,
proposed in:
https://patchwork.ozlabs.org/project/buildroot/list/?series=486958
---
 support/testing/tests/package/test_python.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/testing/tests/package/test_python.py b/support/testing/tests/package/test_python.py
index c9ecf9acda..e815376d21 100644
--- a/support/testing/tests/package/test_python.py
+++ b/support/testing/tests/package/test_python.py
@@ -17,6 +17,9 @@ class TestPythonBase(infra.basetest.BRTest):
                            kernel="builtin",
                            options=["-initrd", cpio_file])
         self.emulator.login()
+        # Disable Python colors for all Python tests, to make pexpect
+        # pattern matching easier.
+        self.assertRunOk("export NO_COLOR=1")
 
     def version_test(self, version, timeout=-1):
         cmd = self.interpreter + " --version 2>&1 | grep '^{}'".format(version)
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
