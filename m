Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E722AC433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 15:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 934D3408F3;
	Tue, 14 Jun 2022 15:44:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vzJONPUX6366; Tue, 14 Jun 2022 15:44:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EB97408DF;
	Tue, 14 Jun 2022 15:44:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5324D1BF9B6
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 15:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F3AA405C7
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 15:44:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cazLxqrOcw2w for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 15:44:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 790D04010E
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 15:44:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B10ED86FFC; Tue, 14 Jun 2022 15:32:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 16:49:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f55b660f9b4803c46ba50cdb755a5e07ee786552
X-Git-Newrev: f2be0bb278f5ab2bb052d4a2420c00cbe7f27ff2
X-Patchwork-Hint: ignore
Message-Id: <20220614153200.B10ED86FFC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/gen-bootlin-toolchains:
 improve dependencies of ARM toolchains
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

commit: https://git.buildroot.net/buildroot/commit/?id=f2be0bb278f5ab2bb052d4a2420c00cbe7f27ff2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current description of the Bootlin ARM toolchains allows them to
be selected for ARM big endian configurations, which obviously doesn't
work as these Bootlin ARM toolchains are little endian only.

We fix this by adding BR2_arm in the list of conditions for those
toolchains.

Will allow to fix:

  http://autobuild.buildroot.net/results/7befbb686bb972016ba4e742976dcdb3fed1be11/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/gen-bootlin-toolchains | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index 16773cd9cb..df1c000f9b 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -41,22 +41,22 @@ arches = {
         'prefix': 'arc',
     },
     'armv5-eabi': {
-        'conditions': ['BR2_ARM_CPU_ARMV5', 'BR2_ARM_EABI'],
+        'conditions': ['BR2_arm', 'BR2_ARM_CPU_ARMV5', 'BR2_ARM_EABI'],
         'test_options': ['BR2_arm', 'BR2_arm926t', 'BR2_ARM_EABI'],
         'prefix': 'arm',
     },
     'armv6-eabihf': {
-        'conditions': ['BR2_ARM_CPU_ARMV6', 'BR2_ARM_EABIHF'],
+        'conditions': ['BR2_arm', 'BR2_ARM_CPU_ARMV6', 'BR2_ARM_EABIHF'],
         'test_options': ['BR2_arm', 'BR2_arm1176jzf_s', 'BR2_ARM_EABIHF'],
         'prefix': 'arm',
     },
     'armv7-eabihf': {
-        'conditions': ['BR2_ARM_CPU_ARMV7A', 'BR2_ARM_EABIHF'],
+        'conditions': ['BR2_arm', 'BR2_ARM_CPU_ARMV7A', 'BR2_ARM_EABIHF'],
         'test_options': ['BR2_arm', 'BR2_cortex_a8', 'BR2_ARM_EABIHF'],
         'prefix': 'arm',
     },
     'armv7m': {
-        'conditions': ['BR2_ARM_CPU_ARMV7M'],
+        'conditions': ['BR2_arm', 'BR2_ARM_CPU_ARMV7M'],
         'test_options': ['BR2_arm', 'BR2_cortex_m4'],
         'prefix': 'arm',
     },
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
