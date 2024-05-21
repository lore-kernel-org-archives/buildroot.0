Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D6FC25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 19:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DEB1400C5;
	Tue, 21 May 2024 19:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gzqsS9yp7bLi; Tue, 21 May 2024 19:44:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E63940294
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E63940294;
	Tue, 21 May 2024 19:44:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 32F4F1C54E3
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 19:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EF09400C5
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 19:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8E7Xq8yFoWNW for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 19:44:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 956BB40294
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 956BB40294
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 956BB40294
 for <buildroot@buildroot.org>; Tue, 21 May 2024 19:44:55 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 35F5DB00539;
 Tue, 21 May 2024 21:44:51 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 21 May 2024 21:44:41 +0200
Message-ID: <20240521194441.102448-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1716320692;
 bh=FgDhcItGWFiNohUPd0BKUJkdeMwEW7VEdb/SAxImV8o=;
 h=From:To:Cc:Subject:Date:From;
 b=QGVqOMr73oAfLRe3Sde1rTappnOqdwswEqqaQXIc4uYfnLQnr+d459JJylafL/P1A
 +x0Ln9mOdTqWl56baf+6G8A19bHrKWDiY6KTFOvMVoIlx+CO/j0jiELmgqkhxnIWVl
 hjURgQbjLuwRU5k9tOnxZh37HvBvtVHFHmjlBnkudA1HvYerXg31J5NtkIVrLhwwNK
 rfuR6OTFTW3z70EI/R10ftOXwIXjn+uKsGz1jXg9rfJEB830EUgZX70H8l0ptvzqem
 f5CkGBahtc5QH/W4sTPvuwfahLR34NZf5Eu2su8xReY+BcbYbW1+q4gGlDnBkmMvyM
 8wFZz1nZH0RbA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=QGVqOMr7
Subject: [Buildroot] [PATCH 1/1] support/testing: improve
 python-magic-wormhole test reliability
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

The python-magic-wormhole runtime test can randomly fail on slow
runners, see [1].

The issue is that the sending command is started first in background
_without_ redirecting its output to /dev/null. The receiving command
is started after, expecting the message to be printed on the first
standard output line. On slower systems, the sending command still
print messages while the test controller expect output from the
receiving command. The expected string finally appear, but not on the
first line. This makes the test fail.

This commit fixes the issue by redirecting all outputs (stdout, stderr)
of the sending command to /dev/null. To help even more, the sleep time
is moved from the emulator to the test controller. The sleep time is
also multiplied by the timeout_multiplier.

Fixes: [1]

[1] https://gitlab.com/buildroot.org/buildroot/-/jobs/6888691508

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../tests/package/test_python_magic_wormhole.py        | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/package/test_python_magic_wormhole.py b/support/testing/tests/package/test_python_magic_wormhole.py
index 5a0f0277b05..180cff2e4a4 100644
--- a/support/testing/tests/package/test_python_magic_wormhole.py
+++ b/support/testing/tests/package/test_python_magic_wormhole.py
@@ -1,4 +1,5 @@
 import os
+import time
 
 from tests.package.test_python import TestPythonPackageBase
 
@@ -46,9 +47,12 @@ class TestPythonPy3MagicWormhole(TestPythonPackageBase):
         wormhole_cmd = "wormhole --relay-url={} --transit-helper={}".format(
             relay_url, transit_helper)
 
-        cmd = wormhole_cmd + " send --code={} --text=\"{}\" & ".format(code, text)
-        cmd += "sleep 25"
-        self.assertRunOk(cmd, timeout=30)
+        cmd = wormhole_cmd
+        cmd += f" send --code={code} --text=\"{text}\""
+        cmd += " &> /dev/null &"
+        self.assertRunOk(cmd)
+
+        time.sleep(30 * self.timeout_multiplier)
 
         wormhole_env = "_MAGIC_WORMHOLE_TEST_KEY_TIMER=100 "
         wormhole_env += "_MAGIC_WORMHOLE_TEST_VERIFY_TIMER=100 "
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
