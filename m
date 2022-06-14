Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964D7C43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 15:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58ACB83281;
	Tue, 14 Jun 2022 15:45:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J-yJ7Hwx08Ne; Tue, 14 Jun 2022 15:45:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFD5D83022;
	Tue, 14 Jun 2022 15:45:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DFF3B1BF4D7
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 15:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2C6A83312
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 15:44:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xcXhekYcGPhu for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 15:44:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D82782FF9
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 15:44:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C742786FFB; Tue, 14 Jun 2022 15:32:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 16:49:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b079f584c0cc33c57b1b1a12b8b8eb1fe47d0b98
X-Git-Newrev: 26dee54e428679920336f0fcbece826f8cbf23ec
X-Patchwork-Hint: ignore
Message-Id: <20220614153200.C742786FFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/gen-bootlin-toolchains:
 adjust dependencies of i686 toolchains
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=26dee54e428679920336f0fcbece826f8cbf23ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Bootlin i686 toolchain was already made available only on BR2_i386
with !BR2_x86_i486 && !BR2_x86_i586 && !BR2_x86_1000. However, this
was not sufficient as a few other architecture variants of BR2_i386
are "lower" than i686, and they need to be excluded as well.

Allows to fix:

  http://autobuild.buildroot.net/results/56ac1a8fa5b34a9ca10eef98ae9fb090b8c762c4/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/gen-bootlin-toolchains | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index df1c000f9b..c96a388f84 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -257,7 +257,12 @@ arches = {
         'conditions': ['BR2_i386',
                        '!BR2_x86_i486',
                        '!BR2_x86_i586',
-                       '!BR2_x86_x1000'],
+                       '!BR2_x86_x1000',
+                       '!BR2_x86_pentium_mmx',
+                       '!BR2_x86_geode',
+                       '!BR2_x86_c3',
+                       '!BR2_x86_winchip_c6',
+                       '!BR2_x86_winchip2'],
         'test_options': ['BR2_i386',
                          'BR2_x86_i686'],
         'prefix': 'i686',
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
