Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1383C433F5
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 21:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88E9D61115;
	Mon, 16 May 2022 21:47:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id krv3Bt8cOSp6; Mon, 16 May 2022 21:47:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD5D5610F1;
	Mon, 16 May 2022 21:47:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EBF681BF35A
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 21:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8901610F1
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 21:47:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HEEOZAmCodeq for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 21:47:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DCA261098
 for <buildroot@buildroot.org>; Mon, 16 May 2022 21:47:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 45F6F85EE9; Mon, 16 May 2022 21:36:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 May 2022 23:46:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d11d2d474605a62988fb7e61e59a08bbf72cf800
X-Git-Newrev: 13bb9642ade57c3818c68ce6271cb2b1b53a69eb
X-Patchwork-Hint: ignore
Message-Id: <20220516213613.45F6F85EE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibc: can't be built without
 optimization
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

commit: https://git.buildroot.net/buildroot/commit/?id=13bb9642ade57c3818c68ce6271cb2b1b53a69eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure:

In file included from <command-line>:
./../include/libc-symbols.h:75:3: error: #error "glibc cannot be compiled without optimization"
   75 | # error "glibc cannot be compiled without optimization"
      |   ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/1ba20982d5ec0edc751a11a2d5639f5f6477b9bc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/glibc/glibc.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 45155fdc28..5772c3355b 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -118,6 +118,11 @@ ifeq ($(BR2_nios2),y)
 GLIBC_CFLAGS += -O2
 endif
 
+# glibc can't be built without optimization
+ifeq ($(BR2_OPTIMIZE_0),y)
+GLIBC_CFLAGS += -O1
+endif
+
 # glibc can't be built with Optimize for fast
 ifeq ($(BR2_OPTIMIZE_FAST),y)
 GLIBC_CFLAGS += -O2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
