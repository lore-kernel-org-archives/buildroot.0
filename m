Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDACC433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 18:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9029540955;
	Tue,  4 Jan 2022 18:10:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Di71I8f8f1m1; Tue,  4 Jan 2022 18:10:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5B3B4093A;
	Tue,  4 Jan 2022 18:10:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 29ADE1BF5DB
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B172824DF
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:09:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hs7A5iYpDnmQ for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 18:09:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E196981D4F
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 18:09:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5622482BA6; Tue,  4 Jan 2022 18:02:57 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 4 Jan 2022 18:49:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ba47c2d4e8c84b57d52d12b60c9efa983eca98a
X-Git-Newrev: 48f790099399e3f74e4487148de437881fee990c
X-Patchwork-Hint: ignore
Message-Id: <20220104180257.5622482BA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zchunk: needs MMU
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

commit: https://git.buildroot.net/buildroot/commit/?id=48f790099399e3f74e4487148de437881fee990c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the package
in commit c618da772df32679fdd338b99f44133655c9113f:

/home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: src/zck_gen_zdict.p/zck_gen_zdict.c.o: in function `main':
zck_gen_zdict.c:(.text.startup+0x254): undefined reference to `fork'

Fixes:
 - http://autobuild.buildroot.org/results/582b994372435b8c35a56345c15bd0ffc722af79

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/zchunk/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zchunk/Config.in b/package/zchunk/Config.in
index 2c8db434ce..2d2a78a210 100644
--- a/package/zchunk/Config.in
+++ b/package/zchunk/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ZCHUNK
 	bool "zchunk"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_LIBCURL
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
