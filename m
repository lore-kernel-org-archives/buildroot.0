Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B50C54E76
	for <buildroot@archiver.kernel.org>; Fri,  6 Jan 2023 07:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52BF382194;
	Fri,  6 Jan 2023 07:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52BF382194
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id on_TRoMyJTaZ; Fri,  6 Jan 2023 07:40:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CA5581E5F;
	Fri,  6 Jan 2023 07:40:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CA5581E5F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 75F011BF976
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 07:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50B1441946
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 07:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50B1441946
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dqn6g2ScEhD2 for <buildroot@lists.busybox.net>;
 Fri,  6 Jan 2023 07:40:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 419C54188F
 for <buildroot@buildroot.org>; Fri,  6 Jan 2023 07:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 419C54188F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2CDE08768F; Fri,  6 Jan 2023 07:40:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Jan 2023 08:36:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ff5f7ff0a5ffb8de98d132740fe2fbe4fb71b5a
X-Git-Newrev: 84e52a60b4044d3c54d6d4be5729a6d30aaf5aee
X-Patchwork-Hint: ignore
Message-Id: <20230106074006.2CDE08768F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tiff: fix host package
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

commit: https://git.buildroot.net/buildroot/commit/?id=84e52a60b4044d3c54d6d4be5729a6d30aaf5aee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable webp and zstd on host package to avoid the following build
failure with host-gdk-pixbuf raised since bump to version 4.5.0 in
commit 5b62ea01369b11f5a4320bb2c909168b21c2642c:

Run-time dependency libtiff-4 found: NO (tried cmake)

../output-1/build/host-gdk-pixbuf-2.42.10/meson.build:330:2: ERROR: Dependency lookup for libtiff-4 with method 'pkgconfig' failed: Could not generate cargs for libtiff-4:
Package libwebp was not found in the pkg-config search path.
Perhaps you should add the directory containing `libwebp.pc'
to the PKG_CONFIG_PATH environment variable
Package 'libwebp', required by 'libtiff-4', not found

[...]

Run-time dependency libtiff-4 found: NO (tried cmake)

../output-1/build/host-gdk-pixbuf-2.42.10/meson.build:330:2: ERROR: Dependency lookup for libtiff-4 with method 'pkgconfig' failed: Could not generate cargs for libtiff-4:
Package libzstd was not found in the pkg-config search path.
Perhaps you should add the directory containing `libzstd.pc'
to the PKG_CONFIG_PATH environment variable
Package 'libzstd', required by 'libtiff-4', not found

While at it, also disable libdeflate even if no build failures are
raised by autobuilders

Fixes:
 - http://autobuild.buildroot.org/results/320083dfec4d126043b036cbaec7c7b85069a50a
 - http://autobuild.buildroot.org/results/8ff1cfa254920749a43e235c4084b8524d0edf6f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tiff/tiff.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index d3ab50b79e..e7de51ea1e 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -26,9 +26,12 @@ HOST_TIFF_CONF_OPTS = \
 	--disable-cxx \
 	--without-x \
 	--disable-zlib \
+	--disable-libdeflate \
 	--disable-lzma \
 	--disable-jpeg \
-	--disable-tests
+	--disable-tests \
+	--disable-webp \
+	--disable-zstd
 HOST_TIFF_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
