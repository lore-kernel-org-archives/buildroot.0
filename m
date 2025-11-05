Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9955BCCF9F8
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 21:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EBC94020A;
	Wed,  5 Nov 2025 21:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x0KO_3njxE-I; Wed,  5 Nov 2025 21:36:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 273A64021D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 273A64021D;
	Wed,  5 Nov 2025 21:36:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B074462
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 21:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50FA64020A
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 21:36:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tDmkxsPoQBFS for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 21:36:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 901BD401FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 901BD401FE
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 21:36:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F83F81F7D; Wed,  5 Nov 2025 21:36:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Nov 2025 22:34:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 885f452df12bc0a0c3671ecf4016fb7f6e10606e
X-Git-Newrev: f94ba69770e5c5dc1342bf52657b3565b1a56e6d
X-Patchwork-Hint: ignore
Message-Id: <20251105213626.7F83F81F7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uboot-tools: add dependency to
 gnutls for mkeficapsule
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

commit: https://git.buildroot.net/buildroot/commit/?id=f94ba69770e5c5dc1342bf52657b3565b1a56e6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit 14a0169714cd5c35be40faadc066412f144bc1a6 added gnutls
as dependency to BR2_PACKAGE_UBOOT_TOOLS_MKEFICAPSULE in uboot-tools.mk
without adding the dependency and its reverse dependencies to the
Config.in causing a build error:

Makefile:578: *** gnutls is in the dependency chain of uboot-tools that
 has added it to its _DEPENDENCIES variable without selecting it or
 depending on it from Config.in.  Stop.

Fixes:
https://autobuild.buildroot.net/results/39d/39db5ae9aad95e4976c3d8a40aca95b26568f8ea/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: remove "https" in comment]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/uboot-tools/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
index e8bbf3a16e..4ccef30973 100644
--- a/package/uboot-tools/Config.in
+++ b/package/uboot-tools/Config.in
@@ -68,12 +68,17 @@ config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE
 
 config BR2_PACKAGE_UBOOT_TOOLS_MKEFICAPSULE
 	bool "mkeficapsule"
+	depends on !BR2_STATIC_LIBS # gnutls
+	depends on BR2_USE_WCHAR # gnutls
 	help
 	  Install the mkeficapsule tool on the target system
 
 	  The mkeficapsule tool from Das U-Boot bootloader, which allows
 	  generation of UEFI capsule binaries.
 
+comment "mkeficapsule support needs a toolchain w/ wchar, dynamic library"
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
+
 config BR2_PACKAGE_UBOOT_TOOLS_MKENVIMAGE
 	bool "mkenvimage"
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
