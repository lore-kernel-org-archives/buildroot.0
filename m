Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0EEC433F5
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 21:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99F4941904;
	Mon, 16 May 2022 21:47:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JdwwTr7ORqHj; Mon, 16 May 2022 21:47:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 538FA4183E;
	Mon, 16 May 2022 21:47:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 049871BF97F
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 21:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E793581439
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 21:47:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qF0V7Qfw8C3P for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 21:47:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 440CF81438
 for <buildroot@buildroot.org>; Mon, 16 May 2022 21:47:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 382E485EE7; Mon, 16 May 2022 21:36:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 May 2022 23:46:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e0a3b5f57064c1dbaaa334bc5ca45b8de6f8a8a1
X-Git-Newrev: d11d2d474605a62988fb7e61e59a08bbf72cf800
X-Patchwork-Hint: ignore
Message-Id: <20220516213613.382E485EE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibc: can't be built with
 Optimize for fast
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

commit: https://git.buildroot.net/buildroot/commit/?id=d11d2d474605a62988fb7e61e59a08bbf72cf800
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure:

In file included from <command-line>:
./../include/libc-symbols.h:82:3: error: #error "glibc must not be compiled with -ffast-math"
   82 | # error "glibc must not be compiled with -ffast-math"
      |   ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/3d91f3685ae6c3e1f765d419ea2c0da4cb0eb3be

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/glibc/glibc.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 7b46ad42c3..45155fdc28 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -118,6 +118,11 @@ ifeq ($(BR2_nios2),y)
 GLIBC_CFLAGS += -O2
 endif
 
+# glibc can't be built with Optimize for fast
+ifeq ($(BR2_OPTIMIZE_FAST),y)
+GLIBC_CFLAGS += -O2
+endif
+
 define GLIBC_CONFIGURE_CMDS
 	mkdir -p $(@D)/build
 	# Do the configuration
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
