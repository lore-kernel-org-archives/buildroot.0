Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47E4C28B30
	for <buildroot@archiver.kernel.org>; Sun, 16 Mar 2025 20:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37F7F81E8C;
	Sun, 16 Mar 2025 20:26:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eg4gnC2aKD5l; Sun, 16 Mar 2025 20:26:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4910481E85
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4910481E85;
	Sun, 16 Mar 2025 20:26:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 30D301A4
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 20:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F8F240BF4
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 20:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SyDBY5gz0UZq for <buildroot@buildroot.org>;
 Sun, 16 Mar 2025 20:26:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3270040C04
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3270040C04
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 20:26:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C8BA88056; Sun, 16 Mar 2025 20:26:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Mar 2025 20:57:14 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: ac7632af83d2bb58d9875166e053ae3213d0447b
X-Git-Newrev: 5746e5aa3cdd14c08fdd3f34dae3e2df1aba8b14
X-Patchwork-Hint: ignore
Message-Id: <20250316202646.1C8BA88056@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/systemd: enable
 tmpfs kernel option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=5746e5aa3cdd14c08fdd3f34dae3e2df1aba8b14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

systemd automatically creates tmpfs mounts for /tmp, /run, /dev/shm, and
others. If tmpfs is not enabled in the kernel, systemd crashes with an
unknown filesystem error on boot. This hasn't manifested itself during
tests with defconfigs such as pc_x86_64_efi_defconfig for a few reasons:

  - No defconfig uses systemd as the init system by default
  - Even if a user does use pc_x86_64_efi_defconfig and changes to systemd,
    the board/pc/linux.config file enables CONFIG_PCI, which selects
    CONFIG_TMPFS.
  - The systemd init tests use a prebuilt kernel with tmpfs enabled.

Enable tmpfs unconditionally to ensure that systemd always boots, even with
a minimal kernel built.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b19976abc90c9712e807726f207ad3d447d876dd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index bf70a3d187..8c1c87d435 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -852,6 +852,7 @@ SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
 SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
 
 define SYSTEMD_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
