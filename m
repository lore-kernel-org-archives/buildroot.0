Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CF2C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 15:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9467C80AEB;
	Sun, 18 Sep 2022 15:11:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9467C80AEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XddOU7z2Wmy1; Sun, 18 Sep 2022 15:11:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C016A8329D;
	Sun, 18 Sep 2022 15:11:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C016A8329D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E426B1BF301
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 15:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB22F41A38
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 15:11:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB22F41A38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QU_l8zbsb0tZ for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 15:11:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0C0D40230
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 15:11:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0C0D40230
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6A2C8527D; Sun, 18 Sep 2022 15:11:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 17:09:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f204766b8fd86e04ba0c1d42296ddd95a48bf147
X-Git-Newrev: fa538315dc02ad011edf6a2a9e25f8589100f15f
X-Patchwork-Hint: ignore
Message-Id: <20220918151142.B6A2C8527D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: fix flake8
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

commit: https://git.buildroot.net/buildroot/commit/?id=fa538315dc02ad011edf6a2a9e25f8589100f15f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit af494d92d3d0 (utils/genrandconfig: disable libopenssl without
atomics) intorduced a code-style issue that flake8 does not like:

    $ make check-flake8
    utils/genrandconfig:253:8: E713 test for membership should be 'not in'
    1     E713 test for membership should be 'not in'

Fixes: af494d92d3d0
    https://gitlab.com/buildroot.org/buildroot/-/jobs/3045260108

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/genrandconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index efa73e938d..e43452d5b7 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -250,7 +250,7 @@ def fixup_config(sysinfo, configfile):
     # libopenssl needs atomic, but propagating this dependency in
     # Buildroot is really too much work, so we handle this here.
     if 'BR2_PACKAGE_LIBOPENSSL=y\n' in configlines and \
-       not 'BR2_TOOLCHAIN_HAS_ATOMIC=y\n' in configlines:
+       'BR2_TOOLCHAIN_HAS_ATOMIC=y\n' not in configlines:
         return False
     if 'BR2_PACKAGE_SUNXI_BOARDS=y\n' in configlines:
         configlines.remove('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE=""\n')
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
