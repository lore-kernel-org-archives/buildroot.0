Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF01C433F5
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 13:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DFB7410E3;
	Tue, 24 May 2022 13:49:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9zwetnN2mCmD; Tue, 24 May 2022 13:49:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6E4841855;
	Tue, 24 May 2022 13:49:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DB20F1BF5B5
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 13:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B59F4416BA
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 13:49:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kE5A5vZyqefg for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 13:49:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D091E416AB
 for <buildroot@buildroot.org>; Tue, 24 May 2022 13:49:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 54C458643C; Tue, 24 May 2022 13:38:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 24 May 2022 15:48:31 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: ae9d3e6ca6f979313401af384f96ed04c2f3b6f4
X-Git-Newrev: d578253cdbb43857fc832a7dbfb2416a96e05fb8
X-Patchwork-Hint: ignore
Message-Id: <20220524133801.54C458643C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/pixman: fix mips
 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=d578253cdbb43857fc832a7dbfb2416a96e05fb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Disable Loongson MMI fast paths to fix the following mips build failure:

./loongson-mmintrin.h:407:2: error: impossible constraint in 'asm'
  407 |  asm("pinsrh_%3 %0, %1, %2\n\t"
      |  ^~~

Fixes:
 - http://autobuild.buildroot.org/results/75267aa5b5a631f091d4c8cb6ad9baeb5f72ee11
 - http://autobuild.buildroot.org/results/55b7431a50b85c24406131af1932d6f3f6853de6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 7e0fbf4dcd4cd0cf17cfe89ebf6808fdace8f01f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pixman/pixman.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 6fab539593..64302fa49a 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -19,7 +19,9 @@ HOST_PIXMAN_DEPENDENCIES = host-pkgconf
 PIXMAN_AUTORECONF = YES
 
 # don't build gtk based demos
-PIXMAN_CONF_OPTS = --disable-gtk
+PIXMAN_CONF_OPTS = \
+	--disable-gtk \
+	--disable-loongson-mmi
 
 # The ARM SIMD code from pixman requires a recent enough ARM core, but
 # there is a runtime CPU check that makes sure it doesn't get used if
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
