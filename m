Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11112C433EF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 19:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD2C183F75;
	Sun, 23 Jan 2022 19:13:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0VP8lweYjzXc; Sun, 23 Jan 2022 19:13:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B2A483F6E;
	Sun, 23 Jan 2022 19:13:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 92E1B1BF406
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F92E81987
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:10:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fvp5_FycFqKe for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 19:10:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B14BB83F63
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 19:10:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 287E582B29; Sun, 23 Jan 2022 19:04:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 20:03:40 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: bda3b9e6c9b6fb19cd25a7b9fe56d776927bf59f
X-Git-Newrev: 535541bd4c674c717921be6bc9330134c504c1e8
X-Patchwork-Hint: ignore
Message-Id: <20220123190408.287E582B29@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/imagemagick: fix
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=535541bd4c674c717921be6bc9330134c504c1e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS dependency was wrongly added to
BR2_PACKAGE_HOST_IMAGEMAGICK by commit
df20e4546384d1c249a6a0541183590671e83d77, indeed host-librsvg is only
needed by BR2_PACKAGE_HOST_IMAGEMAGICK_SVG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 38f6b42d310e389245a6772ae20b8bce73e1c61c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
