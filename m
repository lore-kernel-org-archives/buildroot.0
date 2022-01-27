Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A329EC433EF
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 07:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E03D606F5;
	Thu, 27 Jan 2022 07:13:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1GiEuo-SWN02; Thu, 27 Jan 2022 07:13:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7539A61094;
	Thu, 27 Jan 2022 07:13:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A3DEC1BF470
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 07:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9305041C5F
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 07:12:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ELH3826YjMj for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 07:12:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC9BB41C5D
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 07:12:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 82A7C82862; Thu, 27 Jan 2022 07:05:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 08:10:28 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: e9651f61bbc2d92598f852eba8d00753fa7ed010
X-Git-Newrev: 2b326de0f793b6202a873aaf1fef5a3353f8d18d
X-Patchwork-Hint: ignore
Message-Id: <20220127070548.82A7C82862@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/sofia-sip: don't
 set 'NDEBUG' explicitly
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b326de0f793b6202a873aaf1fef5a3353f8d18d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

BR2_ENABLE_DEBUG should just steer the availability of debug symbols and
should have no negative effect on performance.

Introduction of 'assert' statements, 'debug'-type builds with additional
logging, etc. should be steered by BR2_ENABLE_RUNTIME_DEBUG instead.

The sofia-sip package was setting '--enable-ndebug' conditionally based on
BR2_ENABLE_DEBUG, and this would have to be updated to be based on
BR2_ENABLE_RUNTIME_DEBUG.

However, the sofia-sip option '--enable-ndebug' only sets the 'NDEBUG'
preprocessor macro, and the core package infrastructure already sets this
macro correctly based on BR2_ENABLE_RUNTIME_DEBUG.

This means that the explicit '--enable-ndebug' flag can be removed.

Suggested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0993954814e8f54c7fea5dcb6dff1cc2c3d3e780)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sofia-sip/sofia-sip.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
index 274c72fce8..fb565637eb 100644
--- a/package/sofia-sip/sofia-sip.mk
+++ b/package/sofia-sip/sofia-sip.mk
@@ -30,8 +30,4 @@ SOFIA_SIP_CONF_OPTS += \
 	--without-openssl
 endif
 
-ifeq ($(BR2_ENABLE_DEBUG),)
-SOFIA_SIP_CONF_OPTS += --enable-ndebug
-endif
-
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
