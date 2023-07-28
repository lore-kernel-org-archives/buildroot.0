Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3F2C0015E
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 20:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B41C420F9;
	Fri, 28 Jul 2023 20:09:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B41C420F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5vvoaSuGwx-q; Fri, 28 Jul 2023 20:09:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FDD441907;
	Fri, 28 Jul 2023 20:09:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FDD441907
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13D1B1BF995
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52833418BA
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52833418BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WZBP0DHfpytM for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 20:08:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72A5E417CC
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 20:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72A5E417CC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6250283946; Fri, 28 Jul 2023 20:08:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 22:04:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eeeee3d7b4f6e53c7f25ad3ef903b0ba70c362b6
X-Git-Newrev: 01849e8ddb86ec2c4b8259b8cfa8dfc6eedb4d92
X-Patchwork-Hint: ignore
Message-Id: <20230728200820.6250283946@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/sparc: disable internal toolchain
 backend for sparc
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

commit: https://git.buildroot.net/buildroot/commit/?id=01849e8ddb86ec2c4b8259b8cfa8dfc6eedb4d92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since gcc 11 [1] the sparc architecture is disabled since
it produce a non working image. Buildroot now provide gcc
13.x, 12.x and 11.x and we are going to remove gcc 10
that was the last working release (thanks to a local patch).

We have to disable the internal toolchain backend for sparc
before removing gcc 10. While at it, remove !BR2_sparc
dependency for gcc 11.x, 12.x and 13.x.

[1] 2ab88dac293aed5adf2504e8b182f9d8a306b935

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in             |  5 +++++
 package/gcc/Config.in.host | 12 ------------
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index db0d839c79..e37f4dab1d 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -216,6 +216,11 @@ config BR2_sh
 config BR2_sparc
 	bool "SPARC"
 	select BR2_USE_MMU
+	# uClibc-ng broken on sparc due to recent gcc changes
+	# that need to be reverted since gcc 8.4, 9.3 and 10.1.
+	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
+	# gcc <= 10.x has been removed from Buildroot.
+	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
 	help
 	  SPARC (from Scalable Processor Architecture) is a RISC
 	  instruction set architecture (ISA) developed by Sun
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index bf2ecbde65..e84ab84f23 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -38,10 +38,6 @@ config BR2_GCC_VERSION_11_X
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_powerpc_SPE
-	# uClibc-ng broken on sparc due to recent gcc changes
-	# that need to be reverted since gcc 8.4, 9.3 and 10.1.
-	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
-	depends on !BR2_sparc
 	# ARC HS48 rel 31 only supported by gcc arc fork.
 	depends on !BR2_archs4x_rel31
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
@@ -52,10 +48,6 @@ config BR2_GCC_VERSION_12_X
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_powerpc_SPE
-	# uClibc-ng broken on sparc due to recent gcc changes
-	# that need to be reverted since gcc 8.4, 9.3 and 10.1.
-	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
-	depends on !BR2_sparc
 	# ARC HS48 rel 31 only supported by gcc arc fork.
 	depends on !BR2_archs4x_rel31
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
@@ -65,10 +57,6 @@ config BR2_GCC_VERSION_13_X
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_powerpc_SPE
-	# uClibc-ng broken on sparc due to recent gcc changes
-	# that need to be reverted since gcc 8.4, 9.3 and 10.1.
-	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
-	depends on !BR2_sparc
 	# ARC HS48 rel 31 only supported by gcc arc fork.
 	depends on !BR2_archs4x_rel31
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
