Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2E0C433FE
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 21:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C5FE40517;
	Mon,  2 May 2022 21:05:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S8WrMI1crH4h; Mon,  2 May 2022 21:05:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3235840151;
	Mon,  2 May 2022 21:05:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 463451BF2BC
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3495582784
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:05:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MBLtla5WDbh5 for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:05:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 194208277E
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:05:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E48D384EA7; Mon,  2 May 2022 20:54:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 2 May 2022 22:58:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b12336d1fad12fbb82b4d9144e6cb5636a12256
X-Git-Newrev: 985e9f733c02b01a5beb88dad383e9a1fc4f60ea
X-Patchwork-Hint: ignore
Message-Id: <20220502205437.E48D384EA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: add setting for systemd
 default.target
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
From: "Arnout Vandecappelle \(Essensium/Mind\) via buildroot"
 <buildroot@buildroot.org>
Reply-To: "Arnout Vandecappelle \(Essensium/Mind\)" <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=985e9f733c02b01a5beb88dad383e9a1fc4f60ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This adds the option to set systemd's default.target in
the System Configuration subheading if systemd is
specified as the init system.

The argument for default.target is specified pre-build
as opposed to overriding the hardcoded "multi-user.target"
symlink with post-build scripts or a rootfs overlay

Signed-off-by: Sen Hastings <sen@phobosdpl.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/systemd/systemd.mk |  2 +-
 system/Config.in           | 11 +++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 7a711319cf..b309507e12 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -571,7 +571,7 @@ SYSTEMD_CONF_OPTS += -Dfallback-hostname=$(SYSTEMD_FALLBACK_HOSTNAME)
 endif
 
 define SYSTEMD_INSTALL_INIT_HOOK
-	ln -fs multi-user.target \
+	ln -fs "$(call qstrip,$(BR2_PACKAGE_SYSTEMD_DEFAULT_TARGET))" \
 		$(TARGET_DIR)/usr/lib/systemd/system/default.target
 endef
 
diff --git a/system/Config.in b/system/Config.in
index a4ffbfa18c..888c24ce81 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -154,6 +154,17 @@ source "$BR2_BASE_DIR/.br2-external.in.init"
 
 endchoice
 
+config BR2_PACKAGE_SYSTEMD_DEFAULT_TARGET
+	string "The default unit systemd starts at bootup"
+	default "multi-user.target"
+	depends on BR2_INIT_SYSTEMD
+	help
+	  Specify the name of the unit configuration file to be started
+	  at bootup by systemd. Should end in ".target".
+	  ex: multi-user.target
+
+	  https://www.freedesktop.org/software/systemd/man/systemd.special.html#default.target
+
 choice
 	prompt "/dev management" if !BR2_INIT_SYSTEMD
 	default BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
