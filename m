Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9674C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 19:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D6D3404FF;
	Mon, 25 Apr 2022 19:37:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ecqF6DS6BNcR; Mon, 25 Apr 2022 19:37:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FEE340578;
	Mon, 25 Apr 2022 19:37:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E3DD1BF2CD
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1B648129F
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:35:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kI9M37Db1r1V for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 19:35:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FCAF812C2
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 19:35:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 16C478437C; Mon, 25 Apr 2022 19:25:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 21:10:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 288353ec746d91dd84e6abe76bf424909db82d1b
X-Git-Newrev: e83eca44966a4fa3111407eea09273d71f20ac38
X-Patchwork-Hint: ignore
Message-Id: <20220425192518.16C478437C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/imagemagick: SVG support needs
 host gcc >= 4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=e83eca44966a4fa3111407eea09273d71f20ac38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SVG support needs host gcc >= 4.9 since bump of harfbuzz to version
3.1.2 in commit 6861933d22006fbe8c961a41506beac826881f33:

In file included from ../src/hb.hh:473:0,
                 from ../src/hb-buffer-serialize.cc:27:
../src/hb-vector.hh:206:20: error: 'is_trivially_copy_assignable' is not a member of 'std'
      hb_enable_if (std::is_trivially_copy_assignable<T>::value)>
                    ^

Fixes:
 - http://autobuild.buildroot.org/results/7b2430c5ae4eed51685ec12bf778c07a0a8b1701

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/imagemagick/Config.in.host | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/imagemagick/Config.in.host b/package/imagemagick/Config.in.host
index 671b0995dc..5055101e23 100644
--- a/package/imagemagick/Config.in.host
+++ b/package/imagemagick/Config.in.host
@@ -17,6 +17,7 @@ if BR2_PACKAGE_HOST_IMAGEMAGICK
 config BR2_PACKAGE_HOST_IMAGEMAGICK_SVG
 	bool "SVG support"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # host-librsvg
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-pango -> host-harfbuzz
 	help
 	  Say 'y' here is you need ImageMagick tools (like convert)
 	  to support SVG.
@@ -24,4 +25,8 @@ config BR2_PACKAGE_HOST_IMAGEMAGICK_SVG
 	  This is not enabled by default, as it brings quite a few
 	  extra dependencies, and thus extra build time.
 
+comment "SVG support needs host gcc >= 4.9"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
+	depends on !BR2_HOST_GCC_AT_LEAST_4_9
+
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
