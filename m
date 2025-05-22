Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02BEAC54E90
	for <buildroot@archiver.kernel.org>; Thu, 22 May 2025 19:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A63406134B;
	Thu, 22 May 2025 19:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vlKNFndnjx9K; Thu, 22 May 2025 19:53:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B651760AEC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B651760AEC;
	Thu, 22 May 2025 19:53:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 91BEF237
 for <buildroot@buildroot.org>; Thu, 22 May 2025 19:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7822A60AEC
 for <buildroot@buildroot.org>; Thu, 22 May 2025 19:53:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8zPzurecEwvh for <buildroot@buildroot.org>;
 Thu, 22 May 2025 19:53:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 826FC6084E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 826FC6084E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 826FC6084E
 for <buildroot@buildroot.org>; Thu, 22 May 2025 19:53:45 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0FB59B0054E;
 Thu, 22 May 2025 21:53:42 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Thu, 22 May 2025 21:53:30 +0200
Message-ID: <20250522195330.622072-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747943623;
 bh=OC9/OSpRS2JVfagoG00Am+ljJfWnkidphAPxYmiCgbU=;
 h=From:To:Cc:Subject:Date:From;
 b=pQ9pwpt00RCSN89OFooAa2mZbRhVuFChRMmPtxVPHTviWlLfrgun99RhAC6fzrzQo
 gjeCZxi+cH5+5BqNe8RDwhhXptkJa36EpVaWqfGtL6gBxicMCt/1epjMTEKo573AIp
 W9zfDYQwgolgt2RQw7C2L+Kl5B5nsNb379OoKYi8a+0T9dLG7dyE/EZS+Gi77RsWZM
 pIl/2WbyE047daeNnchJ7mUzcqAos3RICj0tw+peScFei5aIpqmnthBFMVZkZp1nib
 0SS7IE+Ef1/5N2D0UmYe7Ej3X/f8G5mpsDZPintqFVJbZtgHxzw9nJpgpML86NIdxE
 RjlHh6roi3LoA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pQ9pwpt0
Subject: [Buildroot] [PATCH 1/1] support/testing: test_timezone: fix test by
 setting a fixed time
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

Since Buildroot commit [1], the runtime test emulator infra is setting
the emulated system date to the host date.

While this is desired in general, this behaviour is introducing a
variability in the test execution. Depending if the test is executed
during winter or summer time, the output of the command "date +%Z"
will produce a different output.

This commit fixes the issue by setting a fixed date and time on the
emulated system. The date is fixed to Unix Epoch plus one hour. This
is because Linux cannot set the system date to a value less than the
system uptime. So we cannot set the time back to Unix Epoch with the
command "date -s @0" (this would result to a EINVAL Invalid argument).

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/9922589073
https://gitlab.com/buildroot.org/buildroot/-/jobs/9922589081

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/cf8641b73e7f1577637bfef0ece78dd519b25d19

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/pipelines/1832009356
---
 support/testing/tests/core/test_timezone.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/support/testing/tests/core/test_timezone.py b/support/testing/tests/core/test_timezone.py
index bf4a47fcde..bfb9604f66 100644
--- a/support/testing/tests/core/test_timezone.py
+++ b/support/testing/tests/core/test_timezone.py
@@ -9,6 +9,24 @@ def boot_armv5_cpio(emulator, builddir):
                   options=["-initrd", img])
     emulator.login()
 
+    # emulator.login() sets the emulated system date to the host
+    # date. In general, this is desirable (for correct SSL certificate
+    # behaviors, for example).
+    #
+    # This timezone runtime test checks that a Buildroot configuration
+    # is reflected in the generated system at runtime, using the
+    # standard "date" command. To make sure this test is stable in
+    # time (i.e. output is independent to the date/time the test is
+    # executed due to daylight saving time changes), we reset the
+    # system date to a constant value.
+    #
+    # We cannot set the system date to a value less than the system
+    # uptime. So we cannot set the time back to Unix Epoch with the
+    # command "date -s @0" (this would result to a EINVAL Invalid
+    # argument). Instead, we set the time at 1 hour after Epoch. This
+    # is sufficient as the emulated system takes few seconds to start.
+    emulator.run("date -s @3600")
+
 
 class TestNoTimezone(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
