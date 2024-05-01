Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FC0C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 19:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14CE1606C4;
	Wed,  1 May 2024 19:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GvuoiLhGkcAZ; Wed,  1 May 2024 19:07:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19D2E60BBA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19D2E60BBA;
	Wed,  1 May 2024 19:07:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4501A1BF578
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3EDE8820B6
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:07:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bchDCxpFoymx for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 19:07:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AB3C820AB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AB3C820AB
 for <buildroot@buildroot.org>; Wed,  1 May 2024 19:07:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 612B7863D6; Wed,  1 May 2024 19:07:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 21:05:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 119cfd836ed11c2fcdf9d7de32ad5803402b79b1
X-Git-Newrev: 16e9f514905a12caab1d1b308dd95f8b79977828
X-Patchwork-Hint: ignore
Message-Id: <20240501190715.612B7863D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/pc_x86_64_{bios,
 efi}_defconfig: add wireless regdb
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=16e9f514905a12caab1d1b308dd95f8b79977828
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Wireless regulatory database lists the allowed radio frequencies for
each local jurisdiction. Since linux-4.15 the kernel supports loading
the files regulatory.db/regulatory.db.p7s directly from the
/lib/firmware directory. Currently this package is not enabled and
kernel complains with the following message on every boot:
"""
platform regulatory.0: Direct firmware load for regulatory.db failed
with error -2
cfg80211: failed to load regulatory.db
"""
Add wireless regulatory database package to fix the issue.

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/pc_x86_64_bios_defconfig | 1 +
 configs/pc_x86_64_efi_defconfig  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/pc_x86_64_bios_defconfig b/configs/pc_x86_64_bios_defconfig
index 6032544d2d..cba92ad93d 100644
--- a/configs/pc_x86_64_bios_defconfig
+++ b/configs/pc_x86_64_bios_defconfig
@@ -62,3 +62,4 @@ BR2_PACKAGE_ACPID=y
 BR2_PACKAGE_CONNMAN=y
 BR2_PACKAGE_CONNMAN_CLIENT=y
 BR2_PACKAGE_CONNMAN_WIFI=y
+BR2_PACKAGE_WIRELESS_REGDB=y
diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
index afb652f3fc..fe6686b4a2 100644
--- a/configs/pc_x86_64_efi_defconfig
+++ b/configs/pc_x86_64_efi_defconfig
@@ -63,3 +63,4 @@ BR2_PACKAGE_ACPID=y
 BR2_PACKAGE_CONNMAN=y
 BR2_PACKAGE_CONNMAN_CLIENT=y
 BR2_PACKAGE_CONNMAN_WIFI=y
+BR2_PACKAGE_WIRELESS_REGDB=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
