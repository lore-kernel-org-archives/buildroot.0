Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508A9C36005
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 21:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1742260D5A;
	Mon, 24 Mar 2025 21:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YqP9BlBiVN3Y; Mon, 24 Mar 2025 21:39:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40F9360D54
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40F9360D54;
	Mon, 24 Mar 2025 21:39:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 695B2E0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 21:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50065400C1
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 21:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zhruVXvpk9b8 for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 21:39:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7CB7401FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7CB7401FE
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 21:39:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A08CC828DE; Mon, 24 Mar 2025 21:39:31 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 24 Mar 2025 22:35:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4576a8d0961b3e27ffcffaaf31babfffd73c0cf8
X-Git-Newrev: bfb490799e72406cc4831e440f5536da3620850d
X-Patchwork-Hint: ignore
Message-Id: <20250324213931.A08CC828DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: make time setting portable
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
Content-Type: multipart/mixed; boundary="===============1983068860780719804=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1983068860780719804==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=bfb490799e72406cc4831e440f5536da3620850d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
 

--===============1983068860780719804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1983068860780719804==--
