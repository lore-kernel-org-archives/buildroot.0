Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56F3C433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 17:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98371405FB;
	Sun, 10 Apr 2022 17:02:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 29s-fKjB5oGo; Sun, 10 Apr 2022 17:02:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5135405FA;
	Sun, 10 Apr 2022 17:02:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7BA751BF2C7
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 17:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B1AF83F47
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 17:02:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AHeOVindBRLN for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 17:02:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADACD83F46
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 17:02:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B415983897; Sun, 10 Apr 2022 16:52:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 19:00:13 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 389fc65931fb296c2779cf7486e4a3000ba53cb9
X-Git-Newrev: e0819662eab8db5f2fdc4999011945d840df7081
X-Patchwork-Hint: ignore
Message-Id: <20220410165242.B415983897@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 configs/qemu_xtensa_lx60_nommu: use busybox minimal config
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
Content-Type: multipart/mixed; boundary="===============1966270276154402847=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1966270276154402847==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e0819662eab8db5f2fdc4999011945d840df7081
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit 8f3cfe41961d83a9c01630f241bf045e3aa59b40)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

--===============1966270276154402847==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1966270276154402847==--
