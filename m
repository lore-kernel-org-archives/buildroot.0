Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E15C001B0
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 07:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4364F60B8F;
	Sun, 23 Jul 2023 07:44:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4364F60B8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id efc_8egi5dEc; Sun, 23 Jul 2023 07:44:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FF9B60B1D;
	Sun, 23 Jul 2023 07:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FF9B60B1D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1851E1BF3DA
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 07:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E60B660B1D
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 07:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E60B660B1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rkpbAksBfsj6 for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 07:44:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 215266059B
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 07:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 215266059B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F5F9825BA; Sun, 23 Jul 2023 07:44:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 23 Jul 2023 09:44:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bdccc57816a6ba043945096202ff676faed929d9
X-Git-Newrev: c7f641cbaae933bb24376ce93a48bed6dba78c28
X-Patchwork-Hint: ignore
Message-Id: <20230723074434.0F5F9825BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/toolchain-external: always call
 checks with dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=c7f641cbaae933bb24376ce93a48bed6dba78c28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Call these unconditionally to make sure proper support is flagged so
proper dependencies are included in the resultant filesystem.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index c37f3500d9..ddf1d70ab4 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -576,18 +576,10 @@ define $(2)_CONFIGURE_CMDS
 		$$(call check_arm_abi,\
 			"$$(TOOLCHAIN_EXTERNAL_CC) $$(TOOLCHAIN_EXTERNAL_CFLAGS)") ; \
 	fi ; \
-	if test "$$(BR2_INSTALL_LIBSTDCPP)" = "y" ; then \
-		$$(call check_cplusplus,$$(TOOLCHAIN_EXTERNAL_CXX)) ; \
-	fi ; \
-	if test "$$(BR2_TOOLCHAIN_HAS_DLANG)" = "y" ; then \
-		$$(call check_dlang,$$(TOOLCHAIN_EXTERNAL_GDC)) ; \
-	fi ; \
-	if test "$$(BR2_TOOLCHAIN_HAS_FORTRAN)" = "y" ; then \
-		$$(call check_fortran,$$(TOOLCHAIN_EXTERNAL_FC)) ; \
-	fi ; \
-	if test "$$(BR2_TOOLCHAIN_HAS_OPENMP)" = "y" ; then \
-		$$(call check_openmp,$$(TOOLCHAIN_EXTERNAL_CC)) ; \
-	fi ; \
+	$$(call check_cplusplus,$$(TOOLCHAIN_EXTERNAL_CXX)) ; \
+	$$(call check_dlang,$$(TOOLCHAIN_EXTERNAL_GDC)) ; \
+	$$(call check_fortran,$$(TOOLCHAIN_EXTERNAL_FC)) ; \
+	$$(call check_openmp,$$(TOOLCHAIN_EXTERNAL_CC)) ; \
 	if test "$$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)" = "y" ; then \
 		$$(call check_uclibc,$$$${SYSROOT_DIR}) ; \
 	elif test "$$(BR2_TOOLCHAIN_EXTERNAL_MUSL)" = "y" ; then \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
