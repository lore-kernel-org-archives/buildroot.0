Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1A8EB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 17:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FBF14023D;
	Thu,  6 Jul 2023 17:18:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FBF14023D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JdJm-gvsPVNo; Thu,  6 Jul 2023 17:18:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76BB041596;
	Thu,  6 Jul 2023 17:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76BB041596
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D6DBF1BF97D
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 17:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0D696111F
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 17:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0D696111F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PV4oYXR7b9Oo for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 17:18:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9107060FAB
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9107060FAB
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 17:18:37 +0000 (UTC)
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
 by mail.xes-mad.com (Postfix) with ESMTP id D276121D66;
 Thu,  6 Jul 2023 12:18:36 -0500 (CDT)
From: Vincent Fazio <vfazio@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  6 Jul 2023 12:18:34 -0500
Message-Id: <20230706171834.1065129-3-vfazio@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230706171834.1065129-1-vfazio@gmail.com>
References: <20230706171834.1065129-1-vfazio@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] toolchain/toolchain-external: always call
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Call these unconditionally to make sure proper support is flagged so
proper dependencies are included in the resultant filesystem.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 .../toolchain-external/pkg-toolchain-external.mk | 16 ++++------------
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
