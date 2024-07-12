Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3A8C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6928941370;
	Fri, 12 Jul 2024 20:31:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 46jxZNAUVRc2; Fri, 12 Jul 2024 20:31:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1604A413B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1604A413B8;
	Fri, 12 Jul 2024 20:31:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A09561BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E0F183F90
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:31:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TEgzD9r1Z8Jt for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:31:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C910283F8E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C910283F8E
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:31:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0E5E861D3; Fri, 12 Jul 2024 20:31:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 22:30:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 093aac9a2f0cf6b3ae97f68f4f774c0b5edd3df2
X-Git-Newrev: be5f14657a5540fdabb03ba8b5ff64c0da804e32
X-Patchwork-Hint: ignore
Message-Id: <20240712203128.C0E5E861D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: enable required oomd
 kernel options
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=be5f14657a5540fdabb03ba8b5ff64c0da804e32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order for systemd-oomd to run CONFIG_PSI and CONFIG_MEMCG must be
enabled in the kernel config.

See:
https://github.com/systemd/systemd/commit/e7b3f1a6c358dd3eaf0b50547bd52130ad4126ae
https://github.com/systemd/systemd/commit/aa329b89223a79793cde8288b1bc6e93db174938

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/systemd/systemd.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 6b3553723c..52fa344807 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -480,6 +480,10 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_OOMD),y)
 SYSTEMD_CONF_OPTS += -Doomd=true
 SYSTEMD_OOMD_USER = systemd-oom -1 systemd-oom -1 * - - - systemd Userspace OOM Killer
+define SYSTEMD_OOMD_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PSI)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MEMCG)
+endef
 else
 SYSTEMD_CONF_OPTS += -Doomd=false
 endif
@@ -804,6 +808,8 @@ define SYSTEMD_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_AUTOFS4_FS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_POSIX_ACL)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_XATTR)
+
+	$(SYSTEMD_OOMD_LINUX_CONFIG_FIXUPS)
 endef
 
 # We need a very minimal host variant, so we disable as much as possible.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
