Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC397C48BF6
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CDA341A78;
	Thu, 29 Feb 2024 15:53:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FJpj4VjTbq6s; Thu, 29 Feb 2024 15:53:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A49E41C24
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A49E41C24;
	Thu, 29 Feb 2024 15:53:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 454391BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A29EF8233D
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:32:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gXssdTvSrj6m for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:32:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E22CA827A5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E22CA827A5
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:31:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CECC987D42; Thu, 29 Feb 2024 15:31:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 16:19:58 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 5249686eb772a3db506c7540d33e1a075abb9e10
X-Git-Newrev: 610a82f7a079bfac19cc637166b05802e00c42d5
X-Patchwork-Hint: ignore
Message-Id: <20240229153159.CECC987D42@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/libzenoh-pico:
 disable on or1k
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

commit: https://git.buildroot.net/buildroot/commit/?id=610a82f7a079bfac19cc637166b05802e00c42d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
(cherry picked from commit ead797bef768a7f3da7a76dd8510eef48181bb6a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
