Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D70C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 14:50:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 103626023D
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 14:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 103626023D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D08734040D;
	Mon,  6 Sep 2021 14:50:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3A-yVxE-TPQc; Mon,  6 Sep 2021 14:50:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A7D44028E;
	Mon,  6 Sep 2021 14:50:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0CA1A1BF983
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 14:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF71D401C3
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 14:50:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u6XcJWHoEXUp for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 14:50:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C6C7400FC
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 14:50:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9838488697; Mon,  6 Sep 2021 14:49:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Sep 2021 14:25:52 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: d35b87a605f2c10ef596b34e33547beda1226510
X-Git-Newrev: 1d5b7869119058b31480956c93054f3928141381
X-Patchwork-Hint: ignore
Message-Id: <20210906144903.9838488697@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/eigen: override
 Fortran path
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

commit: https://git.buildroot.net/buildroot/commit/?id=1d5b7869119058b31480956c93054f3928141381
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The language detection is falling back to the host system
Fortran compiler. An example of this is in RHEL7.9
(gcc4.8.5 20150623 (Red Hat 4.8.5-44)).

This patch bypasses detection and points to the location
where the compiler would be installed (if present). In the
cases where it doesn't exist, the detection falls through
and leaves Fortran disabled.

Fixes:
http://autobuild.buildroot.net/results/8354da225d1e5e337aa7ea62a7e6524fb5f1135f/

Signed-off-by: Matthew Weber <matthew.weber@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9f591542452f2af2bb333dc24b34e85f6921ece4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/eigen/eigen.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
index c9998da357..98e6c61e38 100644
--- a/package/eigen/eigen.mk
+++ b/package/eigen/eigen.mk
@@ -15,6 +15,7 @@ EIGEN_SUPPORTS_IN_SOURCE_BUILD = NO
 
 # Default Eigen CMake installs .pc file in /usr/share/pkgconfig
 # change it to /usr/lib/pkgconfig, to be consistent with other packages.
-EIGEN_CONF_OPTS = -DPKGCONFIG_INSTALL_DIR=/usr/lib/pkgconfig
+EIGEN_CONF_OPTS = -DPKGCONFIG_INSTALL_DIR=/usr/lib/pkgconfig \
+	-DCMAKE_Fortran_COMPILER=$(TARGET_FC)
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
