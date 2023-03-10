Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1BBC6FD19
	for <buildroot@archiver.kernel.org>; Fri, 10 Mar 2023 20:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B52764172A;
	Fri, 10 Mar 2023 20:57:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B52764172A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id olngKpx5G45e; Fri, 10 Mar 2023 20:57:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F196741726;
	Fri, 10 Mar 2023 20:57:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F196741726
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 843B31BF390
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 20:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EC9B82323
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 20:56:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EC9B82323
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FL6LoKOufl_o for <buildroot@lists.busybox.net>;
 Fri, 10 Mar 2023 20:56:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C5698232C
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 20:56:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C5698232C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A4AF86E1F; Fri, 10 Mar 2023 20:56:53 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 10 Mar 2023 21:56:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ff3e631419ef59dd2c8f163cf1a3e534e118079
X-Git-Newrev: 70d9f17c48f8aaf02e6cd4c17093c00d07eb56c8
X-Patchwork-Hint: ignore
Message-Id: <20230310205653.8A4AF86E1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pcre2: drop JIT sparc
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

commit: https://git.buildroot.net/buildroot/commit/?id=70d9f17c48f8aaf02e6cd4c17093c00d07eb56c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

JIT sparc support has been dropped since version 10.41 and
https://github.com/PCRE2Project/pcre2/commit/b67d5682019fd192a615a1d5ed254b564f54126b
resulting in the following build failure since bump to version 10.42 in
commit 64a03682cc1a90a311b2331224deac62f8c8940f:

src/pcre2_jit_compile.c:82:2: error: #error Unsupported architecture
   82 | #error Unsupported architecture
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/d8246c9e3e54547cdb7d94dcdbf376d292dfd787

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pcre2/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pcre2/Config.in b/package/pcre2/Config.in
index f06f1914f3..ba4719dd3d 100644
--- a/package/pcre2/Config.in
+++ b/package/pcre2/Config.in
@@ -29,7 +29,6 @@ config BR2_PACKAGE_PCRE2_JIT_ARCH_SUPPORTS
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default y if BR2_powerpc
-	default y if BR2_sparc
 
 config BR2_PACKAGE_PCRE2_JIT
 	bool "enable JIT support"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
