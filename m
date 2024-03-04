Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0559AC54E41
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 21:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9D4A60E08;
	Mon,  4 Mar 2024 21:52:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qzOVTIpCFOUC; Mon,  4 Mar 2024 21:52:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F2E360E0B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F2E360E0B;
	Mon,  4 Mar 2024 21:52:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A1AB1BF94D
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 21:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4BF481FF8
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 21:52:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uXnIsW4ycj63 for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 21:52:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AD648214C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AD648214C
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 21:52:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 81132880E6; Mon,  4 Mar 2024 21:52:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Mar 2024 22:48:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b146a0b944dedf45153348761ac313ca9062a7c0
X-Git-Newrev: a9ccdc11704de3ac7aac892080e2cd8561dc3482
X-Patchwork-Hint: ignore
Message-Id: <20240304215231.81132880E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tllist: fix build with gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9ccdc11704de3ac7aac892080e2cd8561dc3482
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc 4.8 raised since the addition
of the package in commit 996b786cfc03c3cf2ac631045650545c901e3075:

In file included from ../test.c:7:0:
../test.c: In function 'main':
../tllist.h:213:17: error: 'for' loop initial declarations are only allowed in C99 mode
                 for (int _i = 0; _i < __insize; _i++) {                 \
                 ^

Fixes: 996b786cfc03c3cf2ac631045650545c901e3075
 - http://autobuild.buildroot.org/results/e82fdf4f9ef199e1baa169d38a75872bddd4e6dd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tllist/tllist.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tllist/tllist.mk b/package/tllist/tllist.mk
index 88a28d2427..69a34a65ab 100644
--- a/package/tllist/tllist.mk
+++ b/package/tllist/tllist.mk
@@ -12,5 +12,6 @@ TLLIST_LICENSE_FILES = LICENSE
 # header only
 TLLIST_INSTALL_TARGET = NO
 TLLIST_INSTALL_STAGING = YES
+TLLIST_CFLAGS = $(TARGET_CFLAGS) -std=c99
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
