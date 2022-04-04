Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D89BC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 19:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDB7582883;
	Mon,  4 Apr 2022 19:32:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id II0a0Mp3wVQV; Mon,  4 Apr 2022 19:32:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA54882835;
	Mon,  4 Apr 2022 19:32:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 500981BF27E
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D9A860FE1
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:32:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GmK8Wg5suE5c for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 19:32:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C96260BEF
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 19:32:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id F1927825B2; Mon,  4 Apr 2022 19:22:57 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 21:20:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b91bf2dbe6dc57ca85598730617b4eaccbe7433b
X-Git-Newrev: 7e147e778fc3397cd2a069c8127fa4d2cc6c0355
X-Patchwork-Hint: ignore
Message-Id: <20220404192257.F1927825B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cloop: fix build with gcc >= 9
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

commit: https://git.buildroot.net/buildroot/commit/?id=7e147e778fc3397cd2a069c8127fa4d2cc6c0355
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc >= 9 (and -std=c++17):

./file.h:70:43: error: ISO C++17 does not allow dynamic exception specifications
   70 | bool file_exists(const std::string& file) throw (error);
      |                                           ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/8320edd448cd1f7c14a65734f63a2df5d4b0d442

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/cloop/cloop.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cloop/cloop.mk b/package/cloop/cloop.mk
index f3c4954ead..6f6d5fe6a8 100644
--- a/package/cloop/cloop.mk
+++ b/package/cloop/cloop.mk
@@ -14,7 +14,7 @@ HOST_CLOOP_DEPENDENCIES = host-zlib
 
 define HOST_CLOOP_BUILD_CMDS
 	$(HOST_CONFIGURE_OPTS) $(MAKE1) -C $(@D) APPSONLY=yes \
-		CFLAGS="$(HOST_CFLAGS) -D_GNU_SOURCE"
+		CFLAGS="$(HOST_CFLAGS) -D_GNU_SOURCE" CPPFLAGS="-std=c++14"
 endef
 
 define HOST_CLOOP_INSTALL_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
