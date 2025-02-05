Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0C9C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8959270BFB;
	Fri, 28 Feb 2025 17:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WiQAMGDvX_85; Fri, 28 Feb 2025 17:15:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95ADA70BF7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95ADA70BF7;
	Fri, 28 Feb 2025 17:15:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3543A711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B53A742FCA
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CGyA1v26r3yC for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FA10424A5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FA10424A5
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B9FF85E25; Fri, 28 Feb 2025 16:30:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 13:05:22 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 868f2dd1832bd601556108def162c089e19cd5f7
X-Git-Newrev: b0ff88423fdf9235cbb7dfda0f3340878a4fecb1
X-Patchwork-Hint: ignore
Message-Id: <20250228163034.6B9FF85E25@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing: fix test_atf
 by bumping atf to 2.11
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b0ff88423fdf9235cbb7dfda0f3340878a4fecb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since commit [1], test_atf is failing. See [2].

Passing -no-pie to ld does not produce the bl31.elf file (and does not
generate an error). TF-A 2.11 reworked its makefiles and switched to
gcc to link files. This commit fixes this failing test by updating to
this newer TF-A version.

Fixes: [2].

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/248c2d045e780b23e6ed19fec1f242460ac464e3
[2] https://gitlab.com/buildroot.org/buildroot/-/jobs/8609307891

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/boot/test_atf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index b0e7696e86..6142dd36c1 100644
--- a/support/testing/tests/boot/test_atf.py
+++ b/support/testing/tests/boot/test_atf.py
@@ -9,7 +9,7 @@ class TestATFAllwinner(infra.basetest.BRTest):
         BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.11"
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
         # BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP is not set
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
