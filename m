Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96FBC7EE30
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 17:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 969FB812EE;
	Wed, 25 Jun 2025 17:01:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GOU15-R7rNrQ; Wed, 25 Jun 2025 17:01:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAC19810E2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAC19810E2;
	Wed, 25 Jun 2025 17:01:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AC4943F
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D1DD41C98
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:00:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Hfjs42Z54mj for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 17:00:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6544F41241
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6544F41241
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:00:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F80A8437A; Wed, 25 Jun 2025 17:00:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 25 Jun 2025 18:56:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 17399baa7c857aadeb52b849ec5e9f32b4f4221d
X-Git-Newrev: 79c964537d19d016961bf7d4de26823402a0dae3
X-Patchwork-Hint: ignore
Message-Id: <20250625170058.5F80A8437A@busybox.osuosl.org>
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=79c964537d19d016961bf7d4de26823402a0dae3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following the bump of systemd to 257.5 in commit
7d8d48cd2ba1396ea146e94020939f4dfe08c5cb, the installation of
systemd-boot fails with:

/usr/bin/install -D -m 0644 /home/thomas/projets/buildroot/outputs/3/build/systemd-257.5/buildroot-build/src/boot/efi/systemd-bootx64.efi /home/thomas/projets/buildroot/outputs/3/images/efi-part/EFI/BOOT/bootx64.efi
/usr/bin/install: cannot stat '/home/thomas/projets/buildroot/outputs/3/build/systemd-257.5/buildroot-build/src/boot/efi/systemd-bootx64.efi': No such file or directory

Indeed, the systemd-bootx64.efi binary is no longer produced in
buildroot-build/src/boot/efi/, but in buildroot-build/src/boot/.

No autobuilder failures have been found corresponding to this issue,
but it can be reproduced with:

 BR2_x86_64=y
 BR2_x86_corei7=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE=y
 BR2_INIT_SYSTEMD=y
 BR2_SYSTEM_BIN_SH_NONE=y
 BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
 # BR2_PACKAGE_BUSYBOX is not set
 BR2_PACKAGE_SYSTEMD_BOOT=y
 # BR2_TARGET_ROOTFS_TAR is not set

Most likely this was caused by upstream commit
97318131fd06a5bc35454da81dcbbc84f16d9940, even though we didn't check
if this commit was really the culprit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/systemd/systemd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index fa57894369..9d253fd16a 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -649,7 +649,7 @@ SYSTEMD_CONF_OPTS += -Dbootloader=enabled
 
 SYSTEMD_BOOT_EFI_ARCH = $(call qstrip,$(BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH))
 define SYSTEMD_INSTALL_BOOT_FILES
-	$(INSTALL) -D -m 0644 $(@D)/buildroot-build/src/boot/efi/systemd-boot$(SYSTEMD_BOOT_EFI_ARCH).efi \
+	$(INSTALL) -D -m 0644 $(@D)/buildroot-build/src/boot/systemd-boot$(SYSTEMD_BOOT_EFI_ARCH).efi \
 		$(BINARIES_DIR)/efi-part/EFI/BOOT/boot$(SYSTEMD_BOOT_EFI_ARCH).efi
 	$(INSTALL) -D -m 0644 $(SYSTEMD_PKGDIR)/boot-files/loader.conf \
 		$(BINARIES_DIR)/efi-part/loader/loader.conf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
