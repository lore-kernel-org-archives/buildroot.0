Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BB9C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB6B042757;
	Mon, 19 May 2025 10:44:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QmilE98Hdwjk; Mon, 19 May 2025 10:44:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3B2A41E4E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3B2A41E4E;
	Mon, 19 May 2025 10:44:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 157C6D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5102C410E5
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KLMCbUJbfRx6 for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:39:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 002D540C40
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 002D540C40
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF72684A21; Mon, 19 May 2025 10:39:44 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 24 Mar 2025 22:35:13 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4576a8d0961b3e27ffcffaaf31babfffd73c0cf8
X-Git-Newrev: bfb490799e72406cc4831e440f5536da3620850d
X-Patchwork-Hint: ignore
Message-Id: <20250519103944.EF72684A21@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing: make time
 setting portable
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4144717877357748545=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4144717877357748545==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=bfb490799e72406cc4831e440f5536da3620850d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The busybox date applet accepts the following:

  date @1234567

but this confuses the coreutils version which doesn't implicitly set
time. As some tests might need coreutils binaries we should ensure the
emulator login will work with both. Fix this by passing the -s (set)
option to the command.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/infra/emulator.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 9be1143944..3702ee2d48 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -153,7 +153,7 @@ class Emulator(object):
 
         self.connect_shell()
 
-        output, exit_code = self.run(f"date @{int(time.time())}")
+        output, exit_code = self.run(f"date -s @{int(time.time())}")
         if exit_code:
             raise SystemError("Cannot set date in virtual machine")
 

--===============4144717877357748545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4144717877357748545==--
