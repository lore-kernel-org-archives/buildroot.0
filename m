Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB45CD98F3
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 12:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1944413E1;
	Thu, 18 Jun 2026 12:50:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 86BGpucsJiz3; Thu, 18 Jun 2026 12:50:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E10A8413D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781787004;
	bh=vKIPNjjjgsHXzHzvPo3Xd95a3bU4hieo8NSJx+CE2Tk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TZwJz3nM//deZm3s09kKrY/dJ2BPuaeYyXIKbWWIUeE7ydrKSM+4xde8Y8ya0XGNl
	 I3OqjOkkPjf3oqrzLjFRl8JgenTfjiLayybpt4rPKYbCnVfuogW0gChbXWHvtc3CdP
	 UeF15ToYobnUHD9PgUm17j3xV+MamLuUkVIPAuOQaDOWSlsuSz/SuhA0X2Xecyps8I
	 vQVAyO//XYTINSVEKKdsLcDb3540S+p6uPIN4jDWBldff0YWAbcEUdXTZxy3HhOmCK
	 QcFIwLw7YZoxrCpKvg7kJL49i5vF+unEE3NRdLL1zi8WhP9qdDFmfKZ2gnj0TFG31N
	 Q+TuOuIw4YIIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E10A8413D3;
	Thu, 18 Jun 2026 12:50:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D5FD1F3
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F9A260A97
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NTCtu4uXjzRB for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 12:49:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 881E4610D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 881E4610D3
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 881E4610D3
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:49:58 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1494357557; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 12:49:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1waCBk-0000000CJtW-0g4S;
 Thu, 18 Jun 2026 14:49:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:47:53 +0200
Message-ID: <20260618124835.2935850-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260618124835.2935850-1-peter@korsgaard.com>
References: <20260618124835.2935850-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=PFLAR0AsHPb1WkNwW+12om6GYjrzTnipKxnF6EB8Kg9fjiTV4Gh09KMcWOhUmY5vg7TcsWq3ER22ROYkTKSua+RKSX7gSIBsiH+xDURUdJWbFtkWQi1dCPlnwxnSy7r+m5QLbMK6I+tVgUf/YacpY6ff/CZfoiwyb7LVMGEqOZLXAZdJ614mHWcBizGQEgzw9wk3/R9ZzTngd8Tz3PT1+e+vD/OpBMrWApj8m+6AEf9WWNYuWFxwHVt0SlEDBKEgEmJdDVfFWEGsxzJVkibsP3RumfyEEI5kNN4KwuH41VncmK8Pz77q+pwxPWj0gkolE2HFukXodRjmlMHh1Mdv6A==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=MdTEXed8ah+KVDHb+WhN4Ia/3boTw8FC29vV+vpt5zo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=PFLAR0As
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 02/29] support/testing: test_systemd.py: use
 assertRun{, Not}Ok()
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

Use the helpers to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/init/test_systemd.py | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index 472a65db57..60b9c3d032 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -340,19 +340,16 @@ class InitSystemSystemdBaseOverlayfs():
 
         # /var/foo/bar is from the pre-populated /var, so it should
         # not be present in the upper of the overlay
-        _, exit_code = self.emulator.run("test -e /run/buildroot/mounts/var/upper/foo/bar")
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk("test -e /run/buildroot/mounts/var/upper/foo/bar")
 
         # We can write in /var/foo/bar
-        _, exit_code = self.emulator.run("echo barfoo >/var/foo/bar")
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk("echo barfoo >/var/foo/bar")
         # ... and it contains the new content
         out, exit_code = self.emulator.run("cat /var/foo/bar")
         self.assertEqual(exit_code, 0)
         self.assertEqual(out[0], "barfoo")
         # ... and it to appears in the upper
-        _, exit_code = self.emulator.run("test -e /run/buildroot/mounts/var/upper/foo/bar")
-        self.assertEqual(exit_code, 0)
+        self.assertRunOk("test -e /run/buildroot/mounts/var/upper/foo/bar")
         # ... with the new content
         out, exit_code = self.emulator.run("cat /run/buildroot/mounts/var/upper/foo/bar")
         self.assertEqual(exit_code, 0)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
