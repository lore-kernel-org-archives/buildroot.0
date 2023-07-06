Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C68EB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 17:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86FEF40003;
	Thu,  6 Jul 2023 17:18:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86FEF40003
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zEm5og9Ynwsh; Thu,  6 Jul 2023 17:18:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A27DD4023D;
	Thu,  6 Jul 2023 17:18:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A27DD4023D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CBDD81BF2AB
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 17:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1B0740AAB
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 17:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1B0740AAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JJN1sxiu0Oxj for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 17:18:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35A6B40A98
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 35A6B40A98
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 17:18:37 +0000 (UTC)
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
 by mail.xes-mad.com (Postfix) with ESMTP id 72C5021701;
 Thu,  6 Jul 2023 12:18:36 -0500 (CDT)
From: Vincent Fazio <vfazio@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  6 Jul 2023 12:18:33 -0500
Message-Id: <20230706171834.1065129-2-vfazio@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230706171834.1065129-1-vfazio@gmail.com>
References: <20230706171834.1065129-1-vfazio@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] toolchain/helper: perform reverse support
 checks
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

Previously, it was possible for external toolchains to be used that had
support for languages or libraries that Buildroot was not aware of.

If Buildroot is not made aware of this support, it will not know to copy
the requisite libraries into the filesystem.

This is problematic as packages may perform their own checks [0] to find
out what the toolchain supports and builds will link against libraries
from the toolchain but will be missing dependencies in the filesystem.

Now, the support helpers alert the user when a toolchain supports a
language or library that has not been set in the Buildroot configuration.

Also, while we're here, add `-ffree-form` to the Fortran check to
suppress a meaningless warning.

[0]: https://bugs.busybox.net/show_bug.cgi?id=15634

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 toolchain/helpers.mk | 51 ++++++++++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 21 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 24c482923a..030ddfda70 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -343,11 +343,14 @@ check_arm_abi = \
 #
 check_cplusplus = \
 	__CROSS_CXX=$(strip $1) ; \
-	$${__CROSS_CXX} -v > /dev/null 2>&1 ; \
-	if test $$? -ne 0 ; then \
+	__HAS_CXX=`$${__CROSS_CXX} -v > /dev/null 2>&1 && echo y`; \
+	if [ "$${__HAS_CXX}" != "y" -a "$(BR2_INSTALL_LIBSTDCPP)" = y ] ; then \
 		echo "C++ support is selected but is not available in external toolchain" ; \
 		exit 1 ; \
-	fi
+	elif [ "$${__HAS_CXX}" = "y" -a "$(BR2_INSTALL_LIBSTDCPP)" != y ] ; then \
+		echo "C++ support is not selected but is available in external toolchain" ; \
+		exit 1 ; \
+	fi \
 
 #
 #
@@ -358,14 +361,16 @@ check_cplusplus = \
 check_dlang = \
 	__CROSS_GDC=$(strip $1) ; \
 	__o=$(BUILD_DIR)/.br-toolchain-test-dlang.tmp ; \
-	printf 'import std.stdio;\nvoid main() { writeln("Hello World!"); }\n' | \
-	$${__CROSS_GDC} -x d -o $${__o} - ; \
-	if test $$? -ne 0 ; then \
-		rm -f $${__o}* ; \
+	__HAS_DLANG=`printf 'import std.stdio;\nvoid main() { writeln("Hello World!"); }\n' | \
+		$${__CROSS_GDC} -x d -o $${__o} - >/dev/null 2>&1 && echo y`; \
+	rm -f $${__o}* ; \
+	if [ "$${__HAS_DLANG}" != "y" -a "$(BR2_TOOLCHAIN_HAS_DLANG)" = y ] ; then \
 		echo "D language support is selected but is not available in external toolchain" ; \
 		exit 1 ; \
-	fi ; \
-	rm -f $${__o}* \
+	elif [ "$${__HAS_DLANG}" = "y" -a "$(BR2_TOOLCHAIN_HAS_DLANG)" != y ] ; then \
+		echo "D language support is not selected but is available in external toolchain" ; \
+		exit 1 ; \
+	fi \
 
 #
 #
@@ -376,14 +381,16 @@ check_dlang = \
 check_fortran = \
 	__CROSS_FC=$(strip $1) ; \
 	__o=$(BUILD_DIR)/.br-toolchain-test-fortran.tmp ; \
-	printf 'program hello\n\tprint *, "Hello Fortran!\\n"\nend program hello\n' | \
-	$${__CROSS_FC} -x f95 -o $${__o} - ; \
-	if test $$? -ne 0 ; then \
-		rm -f $${__o}* ; \
+	__HAS_FORTRAN=`printf 'program hello\n\tprint *, "Hello Fortran!\\\n"\nend program hello\n' | \
+		$${__CROSS_FC} -x f95 -ffree-form -o $${__o} - && echo y`; \
+	rm -f $${__o}* ; \
+	if [ "$${__HAS_FORTRAN}" != "y" -a "$(BR2_TOOLCHAIN_HAS_FORTRAN)" = y ] ; then \
 		echo "Fortran support is selected but is not available in external toolchain" ; \
 		exit 1 ; \
-	fi ; \
-	rm -f $${__o}* \
+	elif [ "$${__HAS_FORTRAN}" = "y" -a "$(BR2_TOOLCHAIN_HAS_FORTRAN)" != y ] ; then \
+		echo "Fortran support is not selected but is available in external toolchain" ; \
+		exit 1 ; \
+	fi \
 
 #
 #
@@ -394,14 +401,16 @@ check_fortran = \
 check_openmp = \
 	__CROSS_CC=$(strip $1) ; \
 	__o=$(BUILD_DIR)/.br-toolchain-test-openmp.tmp ; \
-	printf '\#include <omp.h>\nint main(void) { return omp_get_thread_num(); }' | \
-	$${__CROSS_CC} -fopenmp -x c -o $${__o} - ; \
-	if test $$? -ne 0 ; then \
-		rm -f $${__o}* ; \
+	__HAS_OPENMP=`printf '\#include <omp.h>\nint main(void) { return omp_get_thread_num(); }' | \
+		$${__CROSS_CC} -fopenmp -x c -o $${__o} - >/dev/null 2>&1 && echo y` ; \
+	rm -f $${__o}* ; \
+	if [ "$${__HAS_OPENMP}" != "y" -a "$(BR2_TOOLCHAIN_HAS_OPENMP)" = y ] ; then \
 		echo "OpenMP support is selected but is not available in external toolchain"; \
 		exit 1 ; \
-	fi ; \
-	rm -f $${__o}* \
+	elif [ "$${__HAS_OPENMP}" = "y" -a "$(BR2_TOOLCHAIN_HAS_OPENMP)" != y ] ; then \
+		echo "OpenMP support is not selected but is available in external toolchain"; \
+		exit 1 ; \
+	fi \
 
 #
 # Check that the cross-compiler given in the configuration exists
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
