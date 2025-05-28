Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E18C5AE59
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 19:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9681B81B72;
	Wed, 28 May 2025 19:53:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 81A452q4IxmL; Wed, 28 May 2025 19:53:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D592181BA9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D592181BA9;
	Wed, 28 May 2025 19:53:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C2B3B66
 for <buildroot@buildroot.org>; Wed, 28 May 2025 19:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D07AE40895
 for <buildroot@buildroot.org>; Wed, 28 May 2025 19:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z09-t7JwgyX0 for <buildroot@buildroot.org>;
 Wed, 28 May 2025 19:52:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F75340A9B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F75340A9B
 for <buildroot@buildroot.org>; Wed, 28 May 2025 19:52:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3039285D1A; Wed, 28 May 2025 19:52:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 May 2025 21:52:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9bfc39660b1e56b5fcba64f0563b0e607dcabb7
X-Git-Newrev: b6b96b7bdca6f989f26b4c3aea0c15d064bd3120
X-Patchwork-Hint: ignore
Message-Id: <20250528195252.3039285D1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: fix systemd-boot
 installation
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

commit: https://git.buildroot.net/buildroot/commit/?id=b6b96b7bdca6f989f26b4c3aea0c15d064bd3120
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the meson build directory was changed to buildroot-build in
4e95062f820a64ecd2402115ee552dbcf2874f02 we forgot to update the
install path for the systemd-boot efi binary.

Fixes:
/usr/bin/install: cannot stat '/home/buildroot/buildroot/output/build/systemd-256.7/build/src/boot/efi/systemd-bootx64.efi': No such file or directory

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 337d52b1f2..71fe0de550 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -646,7 +646,7 @@ SYSTEMD_CONF_OPTS += -Dbootloader=enabled
 
 SYSTEMD_BOOT_EFI_ARCH = $(call qstrip,$(BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH))
 define SYSTEMD_INSTALL_BOOT_FILES
-	$(INSTALL) -D -m 0644 $(@D)/build/src/boot/efi/systemd-boot$(SYSTEMD_BOOT_EFI_ARCH).efi \
+	$(INSTALL) -D -m 0644 $(@D)/buildroot-build/src/boot/efi/systemd-boot$(SYSTEMD_BOOT_EFI_ARCH).efi \
 		$(BINARIES_DIR)/efi-part/EFI/BOOT/boot$(SYSTEMD_BOOT_EFI_ARCH).efi
 	$(INSTALL) -D -m 0644 $(SYSTEMD_PKGDIR)/boot-files/loader.conf \
 		$(BINARIES_DIR)/efi-part/loader/loader.conf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
