Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF8CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Dec 2021 08:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFA7040374;
	Sun, 19 Dec 2021 08:44:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R3ebvUBwO4rM; Sun, 19 Dec 2021 08:44:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A5BF4016C;
	Sun, 19 Dec 2021 08:44:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C6EDD1BF574
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 08:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5B07421CC
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 08:44:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O0kHvfwxGmBa for <buildroot@lists.busybox.net>;
 Sun, 19 Dec 2021 08:44:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8BA0421AA
 for <buildroot@buildroot.org>; Sun, 19 Dec 2021 08:44:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 72D8F8129A; Sun, 19 Dec 2021 08:38:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 19 Dec 2021 09:28:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe48de513636941b4b3a7fb80a27953736080f30
X-Git-Newrev: 38f6b42d310e389245a6772ae20b8bce73e1c61c
X-Patchwork-Hint: ignore
Message-Id: <20211219083848.72D8F8129A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/imagemagick: fix dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=38f6b42d310e389245a6772ae20b8bce73e1c61c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS dependency was wrongly added to
BR2_PACKAGE_HOST_IMAGEMAGICK by commit
df20e4546384d1c249a6a0541183590671e83d77, indeed host-librsvg is only
needed by BR2_PACKAGE_HOST_IMAGEMAGICK_SVG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/imagemagick/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/imagemagick/Config.in.host b/package/imagemagick/Config.in.host
index e12d82939a..671b0995dc 100644
--- a/package/imagemagick/Config.in.host
+++ b/package/imagemagick/Config.in.host
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_HOST_IMAGEMAGICK
 	bool "host imagemagick"
-	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # host-librsvg
 	help
 	  ImageMagick(R) is a software suite to create, edit, and
 	  compose bitmap images. It can read, convert and write images
@@ -17,6 +16,7 @@ if BR2_PACKAGE_HOST_IMAGEMAGICK
 
 config BR2_PACKAGE_HOST_IMAGEMAGICK_SVG
 	bool "SVG support"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # host-librsvg
 	help
 	  Say 'y' here is you need ImageMagick tools (like convert)
 	  to support SVG.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
