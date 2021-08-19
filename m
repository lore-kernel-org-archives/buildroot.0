Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E42D7C4320A
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:39:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA37361075
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA37361075
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82DE8401B3;
	Thu, 19 Aug 2021 20:39:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JiF4PZL2n5Zy; Thu, 19 Aug 2021 20:39:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBBFA40292;
	Thu, 19 Aug 2021 20:39:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 184161BF297
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0573140292
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:38:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E5JlwpFLJkTu for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 20:38:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AE2B401B3
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 20:38:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4DF578D545; Thu, 19 Aug 2021 20:38:02 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 22:38:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 605287c045a0fd184a1278d9f06a0e5a4eaaf2c6
X-Git-Newrev: 9f591542452f2af2bb333dc24b34e85f6921ece4
X-Patchwork-Hint: ignore
Message-Id: <20210819203802.4DF578D545@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/eigen: override Fortran path
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f591542452f2af2bb333dc24b34e85f6921ece4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
