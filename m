Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3843EB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 11:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47F32417D0;
	Thu,  6 Jul 2023 11:34:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47F32417D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rNRnmF2Rpi-N; Thu,  6 Jul 2023 11:34:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE31B408A6;
	Thu,  6 Jul 2023 11:34:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE31B408A6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F7C61BF345
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4CB2812BD
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:34:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4CB2812BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qk6AmwL_3N-1 for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 11:34:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1479E81341
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 11:34:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1479E81341
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03CE786895; Thu,  6 Jul 2023 11:34:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 13:29:27 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 4c248eb4d85cbcf46b46e332e91b8586a2876709
X-Git-Newrev: 115f51407e48d981a2d4ff7a51cc2d7d413e7739
X-Patchwork-Hint: ignore
Message-Id: <20230706113428.03CE786895@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/check: switch to
 cmake
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

commit: https://git.buildroot.net/buildroot/commit/?id=115f51407e48d981a2d4ff7a51cc2d7d413e7739
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The autoconf-build system fails to properly detect vsnprintf

    checking for vsnprintf... yes
    checking whether vsnprintf is C99 compliant... no

which leads to a build error

    snprintf.c:495:1: error: inlining failed in call to 'always_inline'
     'rpl_vsnprintf.localalias': function not inlinable

Building with cmake fixes the problem:

-- Looking for vsnprintf
-- Looking for vsnprintf - found

The cmake build system has an option to disable checkmk, so we don't
need to remove it from target anymore.

Fixes:
http://autobuild.buildroot.net/results/e55/e5562513226de902dae642526165b1555a540144/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 6dfc789f4f21367bc5f4b5454db0922821a765bc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/check/check.mk | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/check/check.mk b/package/check/check.mk
index ccffd08ee3..d3977154df 100644
--- a/package/check/check.mk
+++ b/package/check/check.mk
@@ -10,12 +10,6 @@ CHECK_INSTALL_STAGING = YES
 CHECK_DEPENDENCIES = host-pkgconf
 CHECK_LICENSE = LGPL-2.1+
 CHECK_LICENSE_FILES = COPYING.LESSER
-CHECK_CONF_OPTS = --disable-build-docs
+CHECK_CONF_OPTS = -DBUILD_TESTING=OFF -DINSTALL_CHECKMK=OFF
 
-# Having checkmk in the target makes no sense
-define CHECK_REMOVE_CHECKMK
-	rm -f $(TARGET_DIR)/usr/bin/checkmk
-endef
-CHECK_POST_INSTALL_TARGET_HOOKS += CHECK_REMOVE_CHECKMK
-
-$(eval $(autotools-package))
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
