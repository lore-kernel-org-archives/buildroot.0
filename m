Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C8AEB64DB
	for <buildroot@archiver.kernel.org>; Mon, 19 Jun 2023 19:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A03A64154E;
	Mon, 19 Jun 2023 19:37:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A03A64154E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oMUqnrV2L24T; Mon, 19 Jun 2023 19:37:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC3FB401F3;
	Mon, 19 Jun 2023 19:37:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC3FB401F3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 20B2D1BF2E4
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 19:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07625401F3
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 19:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07625401F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jAY6u3THHW0l for <buildroot@lists.busybox.net>;
 Mon, 19 Jun 2023 19:37:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14BD640022
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 19:37:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14BD640022
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00F58842BA; Mon, 19 Jun 2023 19:37:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Jun 2023 21:36:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4a96ee46e3656b95151ab8e27d3fd3407e4633a
X-Git-Newrev: 6dfc789f4f21367bc5f4b5454db0922821a765bc
X-Patchwork-Hint: ignore
Message-Id: <20230619193706.00F58842BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/check: switch to cmake
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6dfc789f4f21367bc5f4b5454db0922821a765bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
