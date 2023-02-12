Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D540FC636D3
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 20:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7539581403;
	Sun, 12 Feb 2023 20:47:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7539581403
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SH6Jza4Jkz_h; Sun, 12 Feb 2023 20:47:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC4BF813FC;
	Sun, 12 Feb 2023 20:47:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC4BF813FC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12E8C1BF30E
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDA8440903
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:47:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDA8440903
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id huO8WZkWG_Ay for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 20:47:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDDE54071E
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 20:47:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDDE54071E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B784885AD9; Sun, 12 Feb 2023 20:47:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 21:46:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 895686180fa73a23f2e4e9ee374618fa259a79ce
X-Git-Newrev: a0c933adab99e1767bb673610b69de5eedf42c5a
X-Patchwork-Hint: ignore
Message-Id: <20230212204700.B784885AD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/python-magic-wormhole-mailbox-server: add missing reverse
 dependency on host-rustc
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

commit: https://git.buildroot.net/buildroot/commit/?id=a0c933adab99e1767bb673610b69de5eedf42c5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by Yann in [1], Kconfig warns about an unmet dependency.

The issue can be reproduced on master branch at commit 451672e,
with the command:

    KCONFIG_SEED=0x1D15B9D4 make randconfig

The patch adds the missing dependency.

Fixes:

    WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_AUTOBAHN
      Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=n]
      Selected by [y]:
      - BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER [=y] && BR2_PACKAGE_PYTHON3 [=y]

[1] https://lists.buildroot.org/pipermail/buildroot/2023-February/661898.html

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-magic-wormhole-mailbox-server/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-magic-wormhole-mailbox-server/Config.in b/package/python-magic-wormhole-mailbox-server/Config.in
index db20d3e7b6..a0721e866f 100644
--- a/package/python-magic-wormhole-mailbox-server/Config.in
+++ b/package/python-magic-wormhole-mailbox-server/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER
 	bool "python-magic-wormhole-mailbox-server"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-autobahn -> python-cryptography
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_AUTOBAHN # runtime
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
