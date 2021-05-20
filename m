Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8C9C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:21:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77EB260F01
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77EB260F01
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 549A940635;
	Tue,  3 Aug 2021 22:21:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b73wZKh8kiIO; Tue,  3 Aug 2021 22:21:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB4274061D;
	Tue,  3 Aug 2021 22:21:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3C19D1BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5523240590
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CAa4M8Vnv4eB for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C773D404DF
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1820185F62; Tue,  3 Aug 2021 21:09:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 20 May 2021 20:24:21 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 085d20e5e684a83736897332a7ec9d3363ea3e51
X-Git-Newrev: 783fadbc1fe922339512a9389cb432dfd543e5dd
X-Patchwork-Hint: ignore
Message-Id: <20210803210942.1820185F62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gd: fix addition of
 -liconv in gdlib.pc.in
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=783fadbc1fe922339512a9389cb432dfd543e5dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Static build of gnuplot with gd and libiconv is broken since bump to
version 2.3.1 in commit 970b2ca3cc3f927f679c871eeadb22ec110b0ed5:

/home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/9.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: /home/giuliobenetti/autobuild/run/instance-3/output-1/host/bin/../powerpc-buildroot-linux-uclibc/sysroot/usr/lib/libgd.a(gdkanji.o): in function `do_convert':
gdkanji.c:(.text+0x148): undefined reference to `libiconv_open'
/home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/9.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: gdkanji.c:(.text+0x1d0): undefined reference to `libiconv'

This build failure is raised because LIBS has been replaced by
LIBS_PRIVATES in gdlib.pc.in since
https://github.com/libgd/libgd/commit/28ecfe77c817aff8ce56422d3e4e8533a281bc76

Fixes:
 - http://autobuild.buildroot.org/results/5ab5f4744adfd8d8be483204a9c7f59e34ce26c6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gd/gd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index 97a1a143ec..2df81e6d37 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -36,7 +36,7 @@ endif
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 GD_DEPENDENCIES += libiconv
 # not strictly needed for gd, but ensures -liconv ends up in gdlib.pc
-GD_CONF_ENV += LIBS="-liconv"
+GD_CONF_ENV += LIBS_PRIVATES="-liconv"
 endif
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
