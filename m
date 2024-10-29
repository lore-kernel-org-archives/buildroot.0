Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE51BD74943
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 22:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68E9C606F6;
	Tue, 29 Oct 2024 22:09:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9PpleHFzQY2R; Tue, 29 Oct 2024 22:09:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A56B606A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A56B606A9;
	Tue, 29 Oct 2024 22:09:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B0A96494E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 22:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F8ED4042E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 22:09:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L2cj4mxR-Ugt for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 22:09:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D2CF403D0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D2CF403D0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 22:09:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72A4284BD8; Tue, 29 Oct 2024 22:09:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 29 Oct 2024 23:09:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 489e38fd2c16f9de2a187a4774df29f8c929bc30
X-Git-Newrev: dd35dd09caf441b273773426ead029ab9eaceabe
X-Patchwork-Hint: ignore
Message-Id: <20241029220927.72A4284BD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: add separate EFI support
 option
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dd35dd09caf441b273773426ead029ab9eaceabe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the current systemd package, EFI support is tied to enabling
systemd-boot, but there are some use cases where EFI support is
desired, independently of systemd-boot, for example to mount
automatically efivarfs in /sys/firmware/efi/efivars.

This commit therefore adds a separate option to enable EFI support.

Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/Config.in  |  4 ++++
 package/systemd/systemd.mk | 10 ++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index d9545e9db0..9a5386c7dc 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -113,6 +113,7 @@ config BR2_PACKAGE_SYSTEMD_BOOT
 	bool "systemd-boot"
 	depends on BR2_i386 || BR2_x86_64
 	select BR2_PACKAGE_GNU_EFI
+	select BR2_PACKAGE_SYSTEMD_EFI
 	help
 	  systemd-boot is a simple UEFI boot manager which executes
 	  configured EFI images. The default entry is selected by a
@@ -161,6 +162,9 @@ config BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH
 	default "x64"   if BR2_x86_64
 	depends on BR2_PACKAGE_SYSTEMD_BOOT
 
+config BR2_PACKAGE_SYSTEMD_EFI
+	bool "enable EFI support"
+
 config BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE
 	bool "enable journal remote tools"
 	select BR2_PACKAGE_LIBCURL
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 5dca8681bc..e2d0bba96e 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -647,7 +647,7 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_BOOT),y)
 SYSTEMD_INSTALL_IMAGES = YES
 SYSTEMD_DEPENDENCIES += gnu-efi host-python-pyelftools
-SYSTEMD_CONF_OPTS += -Defi=true -Dbootloader=enabled
+SYSTEMD_CONF_OPTS += -Dbootloader=enabled
 
 SYSTEMD_BOOT_EFI_ARCH = $(call qstrip,$(BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH))
 define SYSTEMD_INSTALL_BOOT_FILES
@@ -660,9 +660,15 @@ define SYSTEMD_INSTALL_BOOT_FILES
 endef
 
 else
-SYSTEMD_CONF_OPTS += -Defi=false -Dbootloader=disabled
+SYSTEMD_CONF_OPTS += -Dbootloader=disabled
 endif # BR2_PACKAGE_SYSTEMD_BOOT == y
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_EFI),y)
+SYSTEMD_CONF_OPTS += -Defi=true
+else
+SYSTEMD_CONF_OPTS += -Defi=false
+endif
+
 SYSTEMD_FALLBACK_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
 ifneq ($(SYSTEMD_FALLBACK_HOSTNAME),)
 SYSTEMD_CONF_OPTS += -Dfallback-hostname=$(SYSTEMD_FALLBACK_HOSTNAME)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
