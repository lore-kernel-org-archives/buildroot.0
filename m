Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67794C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 18:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F3D181756;
	Sat,  8 Jan 2022 18:05:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QFOThFYeeTeZ; Sat,  8 Jan 2022 18:05:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A77E881758;
	Sat,  8 Jan 2022 18:05:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7259E1BF593
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F74840127
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:04:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ZSJWFBF9vaQ for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 18:04:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B6154012A
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 18:04:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A6FB782BA3; Sat,  8 Jan 2022 17:58:45 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 19:04:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f8b6d3931ffdb83833590ba596d595e661b0156c
X-Git-Newrev: 1f19ea10137e204d2478a7221053122b4e12e54b
X-Patchwork-Hint: ignore
Message-Id: <20220108175845.A6FB782BA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ti-sgx-um: do not depend on the
 kernel driver, select it
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

commit: https://git.buildroot.net/buildroot/commit/?id=1f19ea10137e204d2478a7221053122b4e12e54b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Depending on the kernel driver is annoying because it means you can't
build ti-sgx-um without enabling a kernel. This prevents easy testing
of ti-sgx-um, and it also means ti-sgx-um is never built by the
autobuilders.

So instead, we select the kernel driver if a kernel is built by
Buildroot. This requires propagating the BR2_arm dependency from
ti-sgx-km to ti-sgx-um.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ti-sgx-um/Config.in | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/ti-sgx-um/Config.in b/package/ti-sgx-um/Config.in
index 2dea104b58..13c7cc8856 100644
--- a/package/ti-sgx-um/Config.in
+++ b/package/ti-sgx-um/Config.in
@@ -1,17 +1,15 @@
-comment "ti-sgx-um needs the ti-sgx-km driver"
-	depends on !BR2_PACKAGE_TI_SGX_KM
-
 comment "ti-sgx-um needs udev and a glibc toolchain w/ threads"
+	depends on BR2_arm
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_USES_GLIBC \
 		|| !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_TI_SGX_UM
 	bool "ti-sgx-um"
-	depends on BR2_PACKAGE_TI_SGX_KM
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
 	depends on BR2_PACKAGE_HAS_UDEV
 	# pre-built binaries
 	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_arm
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBDRM_OMAP
 	select BR2_PACKAGE_HAS_LIBEGL
@@ -21,6 +19,7 @@ config BR2_PACKAGE_TI_SGX_UM
 	select BR2_PACKAGE_HAS_POWERVR
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_TI_SGX_KM if BR2_LINUX_KERNEL
 	help
 	  Graphics libraries for TI CPUs with SGX5xx GPU.
 	  This package supports AM335x, AM437x, AM4430 and AM5430.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
