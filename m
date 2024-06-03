Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBD9C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 10:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 556DE605C8;
	Mon,  3 Jun 2024 10:23:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CahPsirvYUqG; Mon,  3 Jun 2024 10:23:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E37D3605E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E37D3605E4;
	Mon,  3 Jun 2024 10:23:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3EC921BF31A
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 10:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B3C7401EF
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 10:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lb2oF2GXv6In for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 10:23:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29F4A401CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29F4A401CB
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 10:23:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A40287987; Mon,  3 Jun 2024 10:23:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 3 Jun 2024 12:18:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9703351e3f7c089975369bfa8995041d6565542e
X-Git-Newrev: 2cdd3d1ccfbf36a921b737749367a70ad29e87a5
X-Patchwork-Hint: ignore
Message-Id: <20240603102339.0A40287987@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tpm2-tss: create tss user and
 group for tpm /dev nodes
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

commit: https://git.buildroot.net/buildroot/commit/?id=2cdd3d1ccfbf36a921b737749367a70ad29e87a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When systemd and tpm2-tss with fapi support are enabled, the fakeroot
script fail with:

    <stdin>:35: Failed to resolve user 'tss': No such process.

When fapi support is enabled, tpm2-tss package install additional
configuration files that are expecting tss user and group exist [1].

  /etc/sysusers.d/tpm2-tss.conf
  /etc/tmpfiles.d/tpm2-tss-fapi.conf

The build fail in the fakeroot environment while handling tmpfiles
installed by tpm2-tss with fapi by host-systemd.

tss user and group is currently created by the tpm2-abrmd package but
tpm2-tss package also provide a udev rule file tpm-udev.rules [2] that
set the ownership of dev nodes /dev/tpmX and /dev/tpmrmX to tss
user/group. So tpm2-tss package must define TPM2_TSS_USERS to create
tss user and group, not tpm2-abrmd package.

So, move TPM2_ABRMD_USERS to TPM2_TSS_USERS.

Note: tpm2-abrmd is nowadays deprecated since the in-kernel Resource
      Manager (available since kernel 4.12) is preferred [3].

[1] https://github.com/tpm2-software/tpm2-tss/blob/4.1.3/INSTALL.md?plain=1#L184
[2] https://github.com/tpm2-software/tpm2-tss/blob/4.1.3/dist/tpm-udev.rules
[3] https://github.com/tpm2-software/tpm2-abrmd/blob/3.0.0/README.md?plain=1#L39

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-abrmd/tpm2-abrmd.mk | 4 ----
 package/tpm2-tss/tpm2-tss.mk     | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/tpm2-abrmd/tpm2-abrmd.mk b/package/tpm2-abrmd/tpm2-abrmd.mk
index 8de233008e..0e62cb176a 100644
--- a/package/tpm2-abrmd/tpm2-abrmd.mk
+++ b/package/tpm2-abrmd/tpm2-abrmd.mk
@@ -29,8 +29,4 @@ define TPM2_ABRMD_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S80tpm2-abrmd
 endef
 
-define TPM2_ABRMD_USERS
-	tss -1 tss -1 * - - - TPM2 Access Broker & Resource Management daemon
-endef
-
 $(eval $(autotools-package))
diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index 10d605fc65..b76d16e71e 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -42,4 +42,8 @@ else
 TPM2_TSS_CONF_OPTS += --disable-fapi
 endif
 
+define TPM2_TSS_USERS
+	tss -1 tss -1 * - - - tss user for tpm2
+endef
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
