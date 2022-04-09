Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44444C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Apr 2022 14:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E975460A8D;
	Sat,  9 Apr 2022 14:03:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QsmPtACdEHLS; Sat,  9 Apr 2022 14:03:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11419607F4;
	Sat,  9 Apr 2022 14:03:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 575FF1BF592
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 14:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C7CA605B1
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 14:03:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id thK6F96v1-Yb for <buildroot@lists.busybox.net>;
 Sat,  9 Apr 2022 14:03:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 878AD60595
 for <buildroot@buildroot.org>; Sat,  9 Apr 2022 14:03:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 20A6D83695; Sat,  9 Apr 2022 13:53:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Apr 2022 12:49:24 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a591dafceaba29d1bd1771e50ed7dfa9265ad73d
X-Git-Newrev: 3ae9a618b8634b0093890e12a1326910e7bef941
X-Patchwork-Hint: ignore
Message-Id: <20220409135355.20A6D83695@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/cloop: fix build
 with gcc >= 9
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ae9a618b8634b0093890e12a1326910e7bef941
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure with gcc >= 9 (and -std=c++17):

./file.h:70:43: error: ISO C++17 does not allow dynamic exception specifications
   70 | bool file_exists(const std::string& file) throw (error);
      |                                           ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/8320edd448cd1f7c14a65734f63a2df5d4b0d442

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 7e147e778fc3397cd2a069c8127fa4d2cc6c0355)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
