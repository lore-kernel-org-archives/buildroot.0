Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06CF2C6377C
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 20:21:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B127561244
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 20:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B127561244
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D62A40136;
	Wed, 21 Jul 2021 20:21:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1SL2qGCTnEJd; Wed, 21 Jul 2021 20:21:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E65C400E1;
	Wed, 21 Jul 2021 20:21:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 641A71BF5F5
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 20:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5431682BC0
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 20:21:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y8NOZNB9LfMF for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 20:21:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBFE5828C5
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 20:21:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DDB6D88775; Wed, 21 Jul 2021 19:47:28 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 22:20:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e85bde9cc672fc228eeb079e23ef302468ae3826
X-Git-Newrev: 531b2a10cda6bae78ecc141c9fe48f2024f71dbc
X-Patchwork-Hint: ignore
Message-Id: <20210721194728.DDB6D88775@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: restrict gcc 8.x to PowerPC
 SPE
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=531b2a10cda6bae78ecc141c9fe48f2024f71dbc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gcc 11.1 is around, gcc 10.2 is the default version, so drop
8.4 in order to reduce the gcc choice.

For PowerPC SPE, introduce BR2_GCC_VERSION_POWERPC_SPE
to avoid removing defconfigs arcturus_ucp1020_defconfig,
freescale_p1025twr_defconfig and qemu_ppc_mpc8544ds_defconfig
that are still used by some users [1].
BR2_GCC_VERSION_POWERPC_SPE use the same gcc version (8.4), no
change expected.

[1] 96e80ad214ced86c802d561946fa7da88c1595eb

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Oleksandr Zhadan <oleks@arcturusnetworks.com>
Cc: Michael Durrant <mdurrant@ArcturusNetworks.com>
Cc: Matthew Weber <matthew.weber@collins.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy           |  9 +++++++++
 package/gcc/Config.in.host | 13 +++++++------
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 56b018a30c..1beaa664d7 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -161,6 +161,15 @@ config BR2_PACKAGE_PHP_EXT_XMLRPC
 	  The XMLRPC php extension was removed.
 	  See: https://wiki.php.net/rfc/unbundle_xmlprc
 
+comment "Legacy options removed in 2021.08"
+
+config BR2_GCC_VERSION_8_X
+	bool "gcc 8.x support removed"
+	select BR2_LEGACY
+	help
+	  Support for gcc version 8.x has been removed. The current
+	  default version (10.x or later) has been selected instead.
+
 comment "Legacy options removed in 2021.05"
 
 config BR2_PACKAGE_UDISKS_LVM2
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 2b3c296463..ae2051d2aa 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -4,6 +4,7 @@ choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_ARC if BR2_arc
 	default BR2_GCC_VERSION_CSKY if BR2_csky
+	default BR2_GCC_VERSION_POWERPC_SPE if BR2_powerpc_SPE
 	default BR2_GCC_VERSION_10_X
 	help
 	  Select the version of gcc you wish to use.
@@ -20,11 +21,11 @@ config BR2_GCC_VERSION_CSKY
 	depends on BR2_csky
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
-config BR2_GCC_VERSION_8_X
-	bool "gcc 8.x"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_9
-	# Broken or unsupported architectures
-	depends on !BR2_or1k
+config BR2_GCC_VERSION_POWERPC_SPE
+	bool "gcc powerpc spe"
+	# powerpc spe support has been deprecated since gcc 8.x.
+	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
+	depends on BR2_powerpc_SPE
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_GCC_VERSION_9_X
@@ -88,7 +89,7 @@ config BR2_GCC_SUPPORTS_DLANG
 
 config BR2_GCC_VERSION
 	string
-	default "8.4.0"     if BR2_GCC_VERSION_8_X
+	default "8.4.0"     if BR2_GCC_VERSION_POWERPC_SPE
 	default "9.4.0"     if BR2_GCC_VERSION_9_X
 	default "10.3.0"    if BR2_GCC_VERSION_10_X
 	default "11.1.0"    if BR2_GCC_VERSION_11_X
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
