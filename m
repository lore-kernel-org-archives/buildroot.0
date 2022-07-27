Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57848C19F29
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 07:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3CE781A30;
	Wed, 27 Jul 2022 07:56:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3CE781A30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yWyB8YWXvkQ5; Wed, 27 Jul 2022 07:56:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD68381A23;
	Wed, 27 Jul 2022 07:56:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD68381A23
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0C2EF1BF9D1
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB8B960AB8
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:56:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB8B960AB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ym8BVMrTIovY for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 07:56:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F02F860AB1
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 07:56:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F02F860AB1
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5F90E8648B; Wed, 27 Jul 2022 07:42:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 09:56:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fda53f0791f5657d41735a40a29df3c8d0e8ae79
X-Git-Newrev: c05d10e8c1691e33118f0944319e0f22357b09c2
X-Patchwork-Hint: ignore
Message-Id: <20220727074256.5F90E8648B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in: move the binary format
 selection further down
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

commit: https://git.buildroot.net/buildroot/commit/?id=c05d10e8c1691e33118f0944319e0f22357b09c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Right now the "Target options" menu looks like this:

 Target architecture (....)
 ... options related to the binary format selection ...
 ... options related to the architecture variant selection ...

This doesn't make much sense: the architecture variant selection
should be just below the target architecture selection. With this
commit, things will now be presented this way:

 Target architecture (....)
 ... options related to the architecture variant selection ...
 ... options related to the binary format selection ...

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/Config.in | 100 ++++++++++++++++++++++++++++-----------------------------
 1 file changed, 50 insertions(+), 50 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 9135df9def..095036f1aa 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -371,56 +371,6 @@ config BR2_BINFMT_SUPPORTS_SHARED
 config BR2_READELF_ARCH_NAME
 	string
 
-# Set up target binary format
-choice
-	prompt "Target Binary Format"
-	default BR2_BINFMT_ELF if BR2_USE_MMU
-	default BR2_BINFMT_FLAT
-
-config BR2_BINFMT_ELF
-	bool "ELF"
-	depends on BR2_USE_MMU
-	select BR2_BINFMT_SUPPORTS_SHARED
-	help
-	  ELF (Executable and Linkable Format) is a format for libraries
-	  and executables used across different architectures and
-	  operating systems.
-
-config BR2_BINFMT_FLAT
-	bool "FLAT"
-	depends on !BR2_USE_MMU
-	help
-	  FLAT binary is a relatively simple and lightweight executable
-	  format based on the original a.out format. It is widely used
-	  in environment where no MMU is available.
-
-endchoice
-
-# Set up flat binary type
-choice
-	prompt "FLAT Binary type"
-	default BR2_BINFMT_FLAT_ONE
-	depends on BR2_BINFMT_FLAT
-
-config BR2_BINFMT_FLAT_ONE
-	bool "One memory region"
-	help
-	  All segments are linked into one memory region.
-
-config BR2_BINFMT_FLAT_SHARED
-	bool "Shared binary"
-	depends on BR2_m68k
-	# Even though this really generates shared binaries, there is no libdl
-	# and dlopen() cannot be used. So packages that require shared
-	# libraries cannot be built. Therefore, we don't select
-	# BR2_BINFMT_SUPPORTS_SHARED and therefore force BR2_STATIC_LIBS.
-	# Although this adds -static to the compilation, that's not a problem
-	# because the -mid-shared-library option overrides it.
-	help
-	  Allow to load and link indiviual FLAT binaries at run time.
-
-endchoice
-
 if BR2_arcle || BR2_arceb
 source "arch/Config.in.arc"
 endif
@@ -481,4 +431,54 @@ if BR2_xtensa
 source "arch/Config.in.xtensa"
 endif
 
+# Set up target binary format
+choice
+	prompt "Target Binary Format"
+	default BR2_BINFMT_ELF if BR2_USE_MMU
+	default BR2_BINFMT_FLAT
+
+config BR2_BINFMT_ELF
+	bool "ELF"
+	depends on BR2_USE_MMU
+	select BR2_BINFMT_SUPPORTS_SHARED
+	help
+	  ELF (Executable and Linkable Format) is a format for libraries
+	  and executables used across different architectures and
+	  operating systems.
+
+config BR2_BINFMT_FLAT
+	bool "FLAT"
+	depends on !BR2_USE_MMU
+	help
+	  FLAT binary is a relatively simple and lightweight executable
+	  format based on the original a.out format. It is widely used
+	  in environment where no MMU is available.
+
+endchoice
+
+# Set up flat binary type
+choice
+	prompt "FLAT Binary type"
+	default BR2_BINFMT_FLAT_ONE
+	depends on BR2_BINFMT_FLAT
+
+config BR2_BINFMT_FLAT_ONE
+	bool "One memory region"
+	help
+	  All segments are linked into one memory region.
+
+config BR2_BINFMT_FLAT_SHARED
+	bool "Shared binary"
+	depends on BR2_m68k
+	# Even though this really generates shared binaries, there is no libdl
+	# and dlopen() cannot be used. So packages that require shared
+	# libraries cannot be built. Therefore, we don't select
+	# BR2_BINFMT_SUPPORTS_SHARED and therefore force BR2_STATIC_LIBS.
+	# Although this adds -static to the compilation, that's not a problem
+	# because the -mid-shared-library option overrides it.
+	help
+	  Allow to load and link indiviual FLAT binaries at run time.
+
+endchoice
+
 endmenu # Target options
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
