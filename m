Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BD1C433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Apr 2022 19:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 068B48416B;
	Thu,  7 Apr 2022 19:05:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SVnckMiURhko; Thu,  7 Apr 2022 19:05:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 102D484164;
	Thu,  7 Apr 2022 19:05:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AC9B61BF282
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 19:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9775A41982
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 19:05:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yyET_OX1BP9E for <buildroot@lists.busybox.net>;
 Thu,  7 Apr 2022 19:05:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2C1B4175F
 for <buildroot@buildroot.org>; Thu,  7 Apr 2022 19:05:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8544E836EA; Thu,  7 Apr 2022 18:56:04 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 7 Apr 2022 20:49:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e2eb6ed72c54ae88028add934d19d9139ce0ed1e
X-Git-Newrev: 8f3cfe41961d83a9c01630f241bf045e3aa59b40
X-Patchwork-Hint: ignore
Message-Id: <20220407185604.8544E836EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_xtensa_lx60_nommu: use
 busybox minimal config
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
Content-Type: multipart/mixed; boundary="===============2967276642167285345=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2967276642167285345==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8f3cfe41961d83a9c01630f241bf045e3aa59b40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the qemu_xtensa_lx60_nommu_defconfig to use the
busybox-minimal.config.

After commit 3de486f8b052 ("package/busybox: fix udhcpc options in minimal
config"), this has the benefit of fixing the following network
initialization failure:

  udhcpc: invalid option -- b

With the full busybox config, the -b option would still be passed and
udhcpc would fail to start for the reason above.

Note that on NOMMU, udhcpc backgrounds unconditionally (unless the -f
option is given), so it still behaves properly. The -b option in fact
only backgrounds after the lease is obtained; on NOMMU, backgrounding is
done before the lease is even requested. So the behaviour is more or
less the same, except that on MMU systems, networking can be considered
either up or not available after S20network, but on NOMMU there is no
such guarantee.

Signed-off-by: Vincent Stehlé <vincent.stehle@laposte.net>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Gerome Burlats <gerome.burlats@smile.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 configs/qemu_xtensa_lx60_nommu_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index c4473fb32a..44fb81bd74 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -7,6 +7,9 @@ BR2_XTENSA_OVERLAY_FILE="https://github.com/jcmvbkbc/xtensa-toolchain-build/raw/
 BR2_PACKAGE_HOST_ELF2FLT=y
 # BR2_USE_MMU is not set
 
+# Use minimal busybox with hush and networking tools
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+
 # System
 BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"

--===============2967276642167285345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2967276642167285345==--
