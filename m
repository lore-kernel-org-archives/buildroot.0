Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD86BECAAD3
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 19:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44DE360BBE;
	Sun, 11 Sep 2022 19:25:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44DE360BBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a1ZCTSGQdeGr; Sun, 11 Sep 2022 19:24:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 693E860B72;
	Sun, 11 Sep 2022 19:24:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 693E860B72
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2ECBE1BF591
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 19:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 043B98429F
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 19:24:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 043B98429F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JLx-jKc7gZak for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 19:24:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DE3B84298
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 19:24:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DE3B84298
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1AF4C836E6; Sun, 11 Sep 2022 19:24:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Sep 2022 21:21:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd8a8cfa9a584934bb2707c197c43073d6c03436
X-Git-Newrev: a9d35fd78cf44c1764b21e396bd383bd8e65a5ac
X-Patchwork-Hint: ignore
Message-Id: <20220911192455.1AF4C836E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/Config.in: update gcc bug 90620
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9d35fd78cf44c1764b21e396bd383bd8e65a5ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Gcc bug 90620 reappeared with gcc 11.x so let's update
BR2_TOOLCHAIN_HAS_GCC_BUG_90620 conditions.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[yann.morin.1998@free.fr:
  - don't switch arch and gcc-version between select and depends-on
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 toolchain/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index fbc2f28553..b48c69dc41 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -168,11 +168,12 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_85862
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90620
 # ICE: in do_output_reload, at reload1.c:7978 on microblaze.
-# This bug no longer exists in gcc 10.x
+# This bug no longer exists in gcc 10.x but reappeared in gcc 11.x
 config BR2_TOOLCHAIN_HAS_GCC_BUG_90620
 	bool
 	default y if BR2_microblaze
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
+		|| BR2_TOOLCHAIN_GCC_AT_LEAST_11
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93847
 # ICE: compiler error: Segmentation fault on Nios II. This bug
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
