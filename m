Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EAA0CD1292
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 19:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 321DE40B66;
	Sun,  7 Apr 2024 19:39:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cupt47kMN51E; Sun,  7 Apr 2024 19:39:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A42240BD4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A42240BD4;
	Sun,  7 Apr 2024 19:39:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AA31F1BF473
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48A5A406FC
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:39:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C3JuRqX5G2_A for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 19:39:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4921440707
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4921440707
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 19:39:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD6ED85C1A; Sun,  7 Apr 2024 19:39:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 21:37:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ab6451ae660a5ec93afc212e224c92440c54dca7
X-Git-Newrev: b526b2aa1546c42384ba1af21afea1a0f08073d7
X-Patchwork-Hint: ignore
Message-Id: <20240407193903.AD6ED85C1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/clamav: fix CLAMAV_LIBS
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

commit: https://git.buildroot.net/buildroot/commit/?id=b526b2aa1546c42384ba1af21afea1a0f08073d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The LIBS environment variable is ignored since bump to version 1.0.1 and
switch to cmake build system in commit
203725a46bc6b61ed7e4fdb3d76f62327d3e47fa resulting in the following
build failure:

/home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-musleabihf/12.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: CMakeFiles/clamonacc.dir/inotif/hash.c.o: in function `onas_ht_add_hierarchy':
hash.c:(.text+0xa84): undefined reference to `fts_open'

Fixes: 203725a46bc6b61ed7e4fdb3d76f62327d3e47fa
 - http://autobuild.buildroot.org/results/fe71ab29d02caeed609f1a181fccbd46b6feff65

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/clamav/clamav.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 7c6dfce6f2..c548897c37 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -45,9 +45,8 @@ CLAMAV_DEPENDENCIES += musl-fts
 CLAMAV_LIBS += -lfts
 endif
 
-CLAMAV_CONF_ENV += LIBS="$(CLAMAV_LIBS)"
-
 CLAMAV_CONF_OPTS = \
+	-DCMAKE_EXE_LINKER_FLAGS="$(CLAMAV_LIBS)" \
 	-DCMAKE_SKIP_INSTALL_RPATH=ON \
 	-DENABLE_JSON_SHARED=ON \
 	-DENABLE_MAN_PAGES=OFF \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
