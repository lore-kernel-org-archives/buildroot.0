Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA745C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 10:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 849C7605E3;
	Sun, 18 Sep 2022 10:33:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 849C7605E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KcAIx0BvwQET; Sun, 18 Sep 2022 10:33:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C87660E36;
	Sun, 18 Sep 2022 10:33:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C87660E36
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1ACA41BF42D
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E846160E5E
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E846160E5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BMqdJu1nQpdD for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 10:33:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8BFD60E25
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 10:33:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8BFD60E25
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D58C184EDC; Sun, 18 Sep 2022 10:33:16 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 12:32:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 17e44d66039146ce1299e0cf5a646ddac900d440
X-Git-Newrev: fdb23693a4bff5e9e9472738a0278ae0b13411e0
X-Patchwork-Hint: ignore
Message-Id: <20220918103316.D58C184EDC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/powerpc: Enable powerpc64le only on
 CPUs that support it
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
Content-Type: multipart/mixed; boundary="===============3613940191605844744=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3613940191605844744==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fdb23693a4bff5e9e9472738a0278ae0b13411e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Invalid configurations lead to build failures, such as trying to enable
ppc64le for the ppc970:

  http://autobuild.buildroot.net/results/fda886768fce25ccd9b52b635ff5b13da7ba2d0c/

In order to run a ppc64le userspace a kernel that runs in this mode is
required. The only CPU supported in buildroot that can boot a ppc64le
kernel is Power8, so mark all of the other 64-bit capable CPUs as not
supporting ppc64le. For Power7, the situation is not so clear, but there
are anyway no commercially available CPUs for that architecture so it
doesn't matter much either way. Let's be safe and disable LE on that one
as well.

This drops the comment about libc, which is true but doesn't tell the
whole story.

Note that we use positive logic for the new conditions, while the rest
of the file uses negative logic. We'll fix that for the rest of the file
in a follow-up patch.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
[Arnout: don't remove 32-bit support for POWER5+]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 arch/Config.in.powerpc | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 9fa0be0d73..949995d037 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -67,11 +67,9 @@ config BR2_powerpc_604e
 	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_620
 	bool "620"
-	# No C library supports this variant on ppc64le
 	depends on !BR2_powerpc64le
 config BR2_powerpc_630
 	bool "630"
-	# No C library supports this variant on ppc64le
 	depends on !BR2_powerpc64le
 config BR2_powerpc_740
 	bool "740"
@@ -98,6 +96,7 @@ config BR2_powerpc_860
 	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_970
 	bool "970"
+	depends on BR2_powerpc || BR2_powerpc64
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
 config BR2_powerpc_8540
 	bool "8540 / e500v1"
@@ -125,17 +124,17 @@ config BR2_powerpc_e6500
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
 config BR2_powerpc_power4
 	bool "power4"
-	# No C library supports this variant on ppc64le
 	depends on !BR2_powerpc64le
 config BR2_powerpc_power5
 	bool "power5"
-	# No C library supports this variant on ppc64le
 	depends on !BR2_powerpc64le
 config BR2_powerpc_power6
 	bool "power6"
+	depends on BR2_powerpc || BR2_powerpc64
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
 config BR2_powerpc_power7
 	bool "power7"
+	depends on BR2_powerpc || BR2_powerpc64
 	select BR2_POWERPC_CPU_HAS_VSX
 config BR2_powerpc_power8
 	bool "power8"

--===============3613940191605844744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3613940191605844744==--
