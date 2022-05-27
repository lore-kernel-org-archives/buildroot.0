Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB3D4C433F5
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 08:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7120361610;
	Fri, 27 May 2022 08:12:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KH_x9iCB7xgf; Fri, 27 May 2022 08:12:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D424615F8;
	Fri, 27 May 2022 08:12:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 27C001C116E
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 08:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2484861612
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 08:11:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hPClOSqD2kQk for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 08:11:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71B80615F8
 for <buildroot@buildroot.org>; Fri, 27 May 2022 08:11:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 95323865C0; Fri, 27 May 2022 08:00:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 10:05:04 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 544f03b0f8c771dc42202a8c09de995d19934c71
X-Git-Newrev: b4eef07babf7668d344bb185a662474cdefa97fb
X-Patchwork-Hint: ignore
Message-Id: <20220527080001.95323865C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/imagemagick: SVG
 support needs host gcc >= 4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=b4eef07babf7668d344bb185a662474cdefa97fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit e83eca44966a4fa3111407eea09273d71f20ac38)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
