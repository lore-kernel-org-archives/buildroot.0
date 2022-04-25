Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499E9C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 19:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06D6660D95;
	Mon, 25 Apr 2022 19:08:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G7YS5K35Ns0O; Mon, 25 Apr 2022 19:08:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9E8D605E0;
	Mon, 25 Apr 2022 19:08:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 29FD81BF2CD
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5040B415A0
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:07:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PYiwiMLkXKGC for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 19:07:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56BD341621
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 19:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 370D98426A; Mon, 25 Apr 2022 18:56:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 20:25:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b1a58f9a68440fa87596f8ad7ba09b9afaf13f7
X-Git-Newrev: 9f0c67179e55d967ae54d000d8d58dbc52cb1de3
X-Patchwork-Hint: ignore
Message-Id: <20220425185654.370D98426A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/adwaita-icon-theme: needs host gcc
 >= 4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f0c67179e55d967ae54d000d8d58dbc52cb1de3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of harfbuzz to version
3.1.2 in commit 6861933d22006fbe8c961a41506beac826881f33:

In file included from ../src/hb.hh:473:0,
                 from ../src/hb-buffer-verify.cc:27:
../src/hb-vector.hh:206:20: error: 'is_trivially_copy_assignable' is not a member of 'std'
      hb_enable_if (std::is_trivially_copy_assignable<T>::value)>
                    ^

Fixes:
 - http://autobuild.buildroot.org/results/bbc48cb5232c617d4ff1d0bafd63bb3c9c72d556

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/adwaita-icon-theme/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/adwaita-icon-theme/Config.in b/package/adwaita-icon-theme/Config.in
index d200570e76..71b839d996 100644
--- a/package/adwaita-icon-theme/Config.in
+++ b/package/adwaita-icon-theme/Config.in
@@ -1,5 +1,10 @@
 config BR2_PACKAGE_ADWAITA_ICON_THEME
 	bool "adwaita icon theme"
 	depends on BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3
+	# host-libgtk3 -> host-librsvg -> host-pango -> host-harfbuzz
+	depends on BR2_HOST_GCC_AT_LEAST_4_9
 	help
 	  Adwaita icon theme
+
+comment "adwaita icon theme needs host gcc >= 4.9"
+	depends on !BR2_HOST_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
