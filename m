Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05F8C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 18:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 549C240A13;
	Thu, 21 Apr 2022 18:01:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lX7S7_Lt0MOC; Thu, 21 Apr 2022 18:01:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FFB240A07;
	Thu, 21 Apr 2022 18:01:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 214EB1C11A5
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 18:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EA8C409EC
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 18:01:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P3d0AkF-vlvk for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 18:01:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B9F64046B
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 18:01:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6647D83FC0; Thu, 21 Apr 2022 17:50:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 19:31:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c2f829a71a728b689f8571187e1ff5b81f48a754
X-Git-Newrev: 090a6ab0fcd24a20fd51882d8b4ce11c184d29aa
X-Patchwork-Hint: ignore
Message-Id: <20220421175056.6647D83FC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libudfread: needs __sync_*_4 or
 threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=090a6ab0fcd24a20fd51882d8b4ce11c184d29aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libudfread needs __sync_*_4 or threads since its addition in commit
c477885e3f3c31d3922af1fc0e47e6f5f35b1645 and
https://code.videolan.org/videolan/libudfread/-/commit/06c3cb9223a3cb5ab048e42ab353958f422a8f57
to avoid the following build failure:

src/udfread.c:108:3: error: #error no atomic operation support
  108 | # error no atomic operation support
      |   ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/f76d475f49d525095ac0054224b50b9e612691d6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libudfread/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libudfread/Config.in b/package/libudfread/Config.in
index 8d42570500..c1f3f23af9 100644
--- a/package/libudfread/Config.in
+++ b/package/libudfread/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_LIBUDFREAD
 	bool "libudfread"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  UDF reader
 
 	  https://code.videolan.org/videolan/libudfread
+
+comment "libudfread needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_SYNC_4 && !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
