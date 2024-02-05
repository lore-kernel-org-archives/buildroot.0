Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22EDC48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 13:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4605F60EF8;
	Mon,  5 Feb 2024 13:22:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4605F60EF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 73-CdPU8J_QN; Mon,  5 Feb 2024 13:22:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A15DB60F83;
	Mon,  5 Feb 2024 13:22:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A15DB60F83
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 718391BF40D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A6EB60E50
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:22:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A6EB60E50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xBCiAeMXZl-5 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 13:22:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D93060E43
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:22:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D93060E43
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6521F86C15; Mon,  5 Feb 2024 13:22:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 14:22:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eef5c297e765bb1414d6d6c629ce8e690c6370d4
X-Git-Newrev: ead797bef768a7f3da7a76dd8510eef48181bb6a
X-Patchwork-Hint: ignore
Message-Id: <20240205132229.6521F86C15@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libzenoh-pico: disable on or1k
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ead797bef768a7f3da7a76dd8510eef48181bb6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The upstream libzenoh-pico code uses asm("nop"), which is completely
bogus, and actually breaks build on or1k as the instruction does not
exist.

In upstream commit
https://github.com/eclipse-zenoh/zenoh-pico/commit/7d79a14addcea972e801709413f5c9a5226e3ad3
they made the asm("nop") thing "configurable" with ZP_ASM_NOP, but
still that requires some special handling for or1k. The whole thing is
a complete mess, and upstream should have to use any of that. Rather
than stacking piles of bogus stuff on more bogus stuff, let's simply
disable this package for or1k for now.

Thanks a lot to Fabrice for all the investigation, and interaction
with upstream. See
https://patchwork.ozlabs.org/project/buildroot/patch/20240110215515.1263859-1-fontaine.fabrice@gmail.com/
for example.

Fixes:
 - http://autobuild.buildroot.org/results/fd0b2c666a1dc1537162d15b27743abd270243ed

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libzenoh-pico/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libzenoh-pico/Config.in b/package/libzenoh-pico/Config.in
index 5f7e91c9f6..9dbb260c52 100644
--- a/package/libzenoh-pico/Config.in
+++ b/package/libzenoh-pico/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_LIBZENOH_PICO
 	bool "libzenoh-pico"
+	# upstream hardcodes using asm("nop"), which is bogus and
+	# doesn't work on or1k
+	depends on !BR2_or1k
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  zenoh-pico is the Eclipse zenoh implementation that targets
@@ -11,4 +14,5 @@ config BR2_PACKAGE_LIBZENOH_PICO
 	  https://github.com/eclipse-zenoh/zenoh-pico
 
 comment "libzenoh-pico needs a toolchain w/ threads"
+	depends on !BR2_or1k
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
