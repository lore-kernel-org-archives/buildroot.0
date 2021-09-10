Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26664C433FE
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 10:02:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB3B861153
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 10:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB3B861153
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93AAD40688;
	Fri, 10 Sep 2021 10:02:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HTnizbAQywwz; Fri, 10 Sep 2021 10:02:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D68CC40678;
	Fri, 10 Sep 2021 10:02:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0467A1BF2F5
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 10:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0148240531
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 10:01:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zcSmWKlLGuEg for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 10:01:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51C2C40513
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 10:01:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E9DF0889AB; Fri, 10 Sep 2021 10:00:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 11:58:44 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 8e2f0c90ba89468875d142cbb0cf25c0f8051c12
X-Git-Newrev: 65a2eecab60fd09f9ce27df2384b3f4507320c15
X-Patchwork-Hint: ignore
Message-Id: <20210910100013.E9DF0889AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/openmpi: fix
 fortran build
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=65a2eecab60fd09f9ce27df2384b3f4507320c15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix the following build failure with fortran raised since bump to
version 4.0.0 in commit 366e7f1ecb4343ef8b18aef2a11c49055cc89abe and
https://github.com/open-mpi/ompi/commit/99730f798b7aef4c87d282aa24b98916fea45bb6:

checking size of Fortran type(test_mpi_handle)... (cached) 4
checking alignment of Fortran type(test_mpi_handle)... configure: error: Can not determine alignment of type(test_mpi_handle) when cross-compiling

Fixes:
 - http://autobuild.buildroot.org/results/86ffde2f67ffc0bfaeebe72fe742a5c241bc580b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fc7eaf3bee861a0e211f7382487e36466c6f6550)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openmpi/openmpi-mips32-fortran.cache | 1 +
 package/openmpi/openmpi-mips64-fortran.cache | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/openmpi/openmpi-mips32-fortran.cache b/package/openmpi/openmpi-mips32-fortran.cache
index 473f73a22e..36f9f02bb8 100644
--- a/package/openmpi/openmpi-mips32-fortran.cache
+++ b/package/openmpi/openmpi-mips32-fortran.cache
@@ -49,3 +49,4 @@ ompi_cv_fortran_kind_value_C_DOUBLE=8
 ompi_cv_fortran_kind_value_C_DOUBLE_COMPLEX=8
 ompi_cv_fortran_true_value=1
 ompi_cv_fortran_sizeof_type_test_mpi_handle_=4
+ompi_cv_fortran_alignment_type_test_mpi_handle_=4
diff --git a/package/openmpi/openmpi-mips64-fortran.cache b/package/openmpi/openmpi-mips64-fortran.cache
index 7f0209971a..dea2ce9cda 100644
--- a/package/openmpi/openmpi-mips64-fortran.cache
+++ b/package/openmpi/openmpi-mips64-fortran.cache
@@ -58,3 +58,4 @@ ompi_cv_fortran_kind_value_0=0
 ompi_cv_real16_c_equiv=yes
 ompi_cv_fortran_true_value=1
 ompi_cv_fortran_sizeof_type_test_mpi_handle_=4
+ompi_cv_fortran_alignment_type_test_mpi_handle_=4
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
