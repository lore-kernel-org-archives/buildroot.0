Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336AFC433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 07:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C9B94155B;
	Mon, 11 Apr 2022 07:16:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jl8K8an8CnsH; Mon, 11 Apr 2022 07:16:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15CBD41599;
	Mon, 11 Apr 2022 07:16:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 460F01BF2B9
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 07:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43EEB831F5
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 07:16:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YecOdEsC2M4M for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 07:16:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61A3F831F2
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 07:16:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 14DFB8377B; Mon, 11 Apr 2022 07:06:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Apr 2022 09:15:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d4a9308d7b16e4fd613a9070a97c9effa055b4b
X-Git-Newrev: c9bee083e0baea16eb91af117033d0ff3fd290b1
X-Patchwork-Hint: ignore
Message-Id: <20220411070652.14DFB8377B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/belr: fix BR2_SHARED_STATIC_LIBS
 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=c9bee083e0baea16eb91af117033d0ff3fd290b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with BR2_SHARED_STATIC_LIBS:

CMake Error at src/CMakeLists.txt:56 (add_library):
  add_library cannot create target "belr" because another target with the
  same name already exists.  The existing target is a static library created
  in source directory

Fixes:
 - http://autobuild.buildroot.org/results/d1ef96c8f370b5a522985c37f1681dd10bbc15bb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Peter: simplify/add comment explaining why]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/belr/belr.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/belr/belr.mk b/package/belr/belr.mk
index f243830a85..26b949734f 100644
--- a/package/belr/belr.mk
+++ b/package/belr/belr.mk
@@ -17,9 +17,8 @@ BELR_CONF_OPTS = \
 
 ifeq ($(BR2_STATIC_LIBS),y)
 BELR_CONF_OPTS += -DENABLE_SHARED=OFF -DENABLE_STATIC=ON
-else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-BELR_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=ON
-else ifeq ($(BR2_SHARED_LIBS),y)
+else
+# cannot build static and shared together
 BELR_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=OFF
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
