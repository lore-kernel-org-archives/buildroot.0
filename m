Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59266C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Apr 2022 10:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05F3E404BF;
	Sat,  9 Apr 2022 10:32:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gkrZgS_-OTBu; Sat,  9 Apr 2022 10:32:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2053340183;
	Sat,  9 Apr 2022 10:32:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C9DA1BF97D
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 10:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A6CD41DFB
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 10:32:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yaKdplYiAHyi for <buildroot@lists.busybox.net>;
 Sat,  9 Apr 2022 10:32:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C7E641DFE
 for <buildroot@buildroot.org>; Sat,  9 Apr 2022 10:32:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 210B083515; Sat,  9 Apr 2022 10:22:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Apr 2022 12:29:14 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 12e33273561b27543c0c3d5d06d28c001dae3c15
X-Git-Newrev: 422d263a71d943944f469db3c2ae8827337cd0bf
X-Patchwork-Hint: ignore
Message-Id: <20220409102239.210B083515@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/ipmiutil: drop
 dead code
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

commit: https://git.buildroot.net/buildroot/commit/?id=422d263a71d943944f469db3c2ae8827337cd0bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

ipmiutil depends on dynamic library since commit
670095b4739c898a8f270b003ee19294206d91f6 so test on BR2_STATIC_LIBS
added by commit 9f31cd14d01e306e6475b750c30554043c57491a is not needed
anymore

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit cdc2a52a0fd619ee9762656c2ff8f84418a85ea1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ipmiutil/ipmiutil.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
index 4c9de26583..97a644e314 100644
--- a/package/ipmiutil/ipmiutil.mk
+++ b/package/ipmiutil/ipmiutil.mk
@@ -17,8 +17,7 @@ define IPMIUTIL_TOUCH_CONFIG_H_IN
 endef
 IPMIUTIL_PRE_CONFIGURE_HOOKS += IPMIUTIL_TOUCH_CONFIG_H_IN
 
-# forgets to link against libcrypto dependencies breaking static link
-ifeq ($(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yx)
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
 # tests against distro libcrypto so it might get a false positive when
 # the openssl version is old, so force it off
 # SKIP_MD2 can be used only if ALLOW_GNU is defined.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
