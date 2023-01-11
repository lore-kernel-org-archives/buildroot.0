Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32291C46467
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 19:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4C0841822;
	Wed, 11 Jan 2023 19:47:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4C0841822
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rUNoAAgIXYvC; Wed, 11 Jan 2023 19:47:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE51E4189F;
	Wed, 11 Jan 2023 19:47:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE51E4189F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7FB171BF3ED
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 19:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66CC940C39
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 19:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66CC940C39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZiICe05nFWyG for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 19:46:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83B73402BC
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 19:46:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83B73402BC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72AEC8794B; Wed, 11 Jan 2023 19:46:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 11 Jan 2023 20:40:00 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: b9026d539e0f7e928c2b382ee49220e5ef353eed
X-Git-Newrev: 847c45a8d3c7d181e95abf44cb9dc440c8642f79
X-Patchwork-Hint: ignore
Message-Id: <20230111194658.72AEC8794B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/tiff: fix host
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=847c45a8d3c7d181e95abf44cb9dc440c8642f79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit 84e52a60b4044d3c54d6d4be5729a6d30aaf5aee)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tiff/tiff.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 4d3c90f956..ac34e300a9 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -27,9 +27,12 @@ HOST_TIFF_CONF_OPTS = \
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
 
 ifneq ($(BR2_PACKAGE_TIFF_CCITT),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
