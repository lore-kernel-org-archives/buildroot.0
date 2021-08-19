Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D648C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:30:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C69060FD9
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:30:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C69060FD9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2332540790;
	Thu, 26 Aug 2021 22:30:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4XEfwIZzn02x; Thu, 26 Aug 2021 22:29:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86B2040799;
	Thu, 26 Aug 2021 22:29:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 174E91BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8E90407A7
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ioB7HSZXPEq for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27B5340772
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8698C8DC52; Thu, 26 Aug 2021 22:01:31 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 22:38:38 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 605287c045a0fd184a1278d9f06a0e5a4eaaf2c6
X-Git-Newrev: 9f591542452f2af2bb333dc24b34e85f6921ece4
X-Patchwork-Hint: ignore
Message-Id: <20210826220131.8698C8DC52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/eigen: override
 Fortran path
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
