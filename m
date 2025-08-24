Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99B3CA0EEB
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 10:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC1068249C;
	Sun, 24 Aug 2025 10:54:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qi62gFemJPdg; Sun, 24 Aug 2025 10:54:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5AB2822D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5AB2822D7;
	Sun, 24 Aug 2025 10:54:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 46E2A1D9
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 10:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D57E81E82
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 10:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZaY0PyzTOjPt for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 10:54:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72BC981C6F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72BC981C6F
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 10:54:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60F54879DA; Sun, 24 Aug 2025 10:54:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Aug 2025 12:29:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b410a5fd88c96a9fef97d9bdaaa7124eb9f7bad
X-Git-Newrev: 1838d8e5ea7e5c3497cefc16980da330c38e7967
X-Patchwork-Hint: ignore
Message-Id: <20250824105425.60F54879DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/Config.in: add
 BR2_TOOLCHAIN_HAS_GCC_BUG_121567
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0549877632270320021=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0549877632270320021==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1838d8e5ea7e5c3497cefc16980da330c38e7967
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will be needed to work around a GCC bug affecting python3. The
bug is reported at
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=121567.

This bug affects GCC at least since 6.x, but we couldn't test earlier
versions, so we simply assume all GCC versions are affected. Even GCC
15.x is still affected, as reported to upstream GCC.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 toolchain/Config.in | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 8f91b23562..30ccbcee7a 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -243,6 +243,16 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_111001
 		   BR2_OPTIMIZE_2 || \
 		   BR2_OPTIMIZE_3
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=121567
+# error: unable to find a register to spill in class ‘R0_REGS’
+# The bug exists at least since gcc 6.x, so we are assuming it affects
+# all GCC versions.
+config BR2_TOOLCHAIN_HAS_GCC_BUG_121567
+	bool
+	default y if BR2_sh
+	depends on BR2_OPTIMIZE_2 || \
+		   BR2_OPTIMIZE_3
+
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 

--===============0549877632270320021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0549877632270320021==--
