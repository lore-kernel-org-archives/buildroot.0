Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AEBEB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 11:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7C424069B;
	Thu,  6 Jul 2023 11:33:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7C424069B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8sUlTo5tmrDu; Thu,  6 Jul 2023 11:33:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A41E5417D3;
	Thu,  6 Jul 2023 11:33:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A41E5417D3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C7E0B1BF97D
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE11740422
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE11740422
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jJEjfg09iW1N for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 11:33:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B110D40247
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 11:33:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B110D40247
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95B8386872; Thu,  6 Jul 2023 11:33:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 13:29:14 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 6e537234e4a2a4c2d3c69c19d221e6f628f5558b
X-Git-Newrev: b6e0520b7ae9d9a4ecca906240ae21f0f92a77d1
X-Patchwork-Hint: ignore
Message-Id: <20230706113316.95B8386872@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/check: switch to
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

commit: https://git.buildroot.net/buildroot/commit/?id=b6e0520b7ae9d9a4ecca906240ae21f0f92a77d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
