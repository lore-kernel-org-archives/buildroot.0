Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AF7C54E67
	for <buildroot@archiver.kernel.org>; Sun, 17 Mar 2024 19:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6939260688;
	Sun, 17 Mar 2024 19:45:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DmnUomZXA5XH; Sun, 17 Mar 2024 19:45:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5A1760758
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5A1760758;
	Sun, 17 Mar 2024 19:45:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E4EA21BF868
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 19:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF9FB81779
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 19:45:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oWICCqnNPdcH for <buildroot@lists.busybox.net>;
 Sun, 17 Mar 2024 19:45:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28E7181776
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28E7181776
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 19:45:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14E378282A; Sun, 17 Mar 2024 19:45:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 17 Mar 2024 20:43:42 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: e4b5ead4d21171d2cdb1fc79090b40d492848f6a
X-Git-Newrev: af51fd9617a9f139bd8ca85175d4eeecad920522
X-Patchwork-Hint: ignore
Message-Id: <20240317194549.14E378282A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/redis-plus-plus:
 needs threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=af51fd9617a9f139bd8ca85175d4eeecad920522
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

redis-plus-plus unconditonally uses mutex and so needs threads since its
addition in commit c46df9de21e718a9ed6a2df2bb945c386695d3bf and
https://github.com/sewenew/redis-plus-plus/commit/1fa8f6bbfb24c8f328aa23ee1dd3c3f99c1b4caf:

In file included from /home/autobuild/autobuild/instance-5/output-1/build/redis-plus-plus-1.3.10/src/sw/redis++/connection_pool.h:27,
                 from /home/autobuild/autobuild/instance-5/output-1/build/redis-plus-plus-1.3.10/src/sw/redis++/connection_pool.cpp:17:
/home/autobuild/autobuild/instance-5/output-1/build/redis-plus-plus-1.3.10/src/sw/redis++/sentinel.h:95:10: error: 'mutex' in namespace 'std' does not name a type
   95 |     std::mutex _mutex;
      |          ^~~~~

Fixes: c46df9de21e718a9ed6a2df2bb945c386695d3bf
 - http://autobuild.buildroot.org/results/cc4c54134e8a522b4c028aab4266f47cf862e2a9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 044752f5631a6fdb330ad57b8c8a5827c6b2bc86)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis-plus-plus/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/redis-plus-plus/Config.in b/package/redis-plus-plus/Config.in
index 6a21aee2b3..64a84102d4 100644
--- a/package/redis-plus-plus/Config.in
+++ b/package/redis-plus-plus/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_REDIS_PLUS_PLUS
 	bool "redis-plus-plus"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_HIREDIS
 	help
 	  Redis client written in C++
@@ -11,5 +12,5 @@ config BR2_PACKAGE_REDIS_PLUS_PLUS
 
 	  https://github.com/sewenew/redis-plus-plus
 
-comment "redis-plus-plus needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "redis-plus-plus needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
