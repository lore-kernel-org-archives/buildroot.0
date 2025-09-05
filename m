Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6A1CA1013
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 10:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D17C42C2E;
	Mon,  8 Sep 2025 10:39:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id So-gsV0uzwOm; Mon,  8 Sep 2025 10:39:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A035D42C11
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A035D42C11;
	Mon,  8 Sep 2025 10:39:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DEB9186
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D1BD42B9E
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:39:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xehfCvwkEPug for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 10:39:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 546C542B83
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 546C542B83
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:39:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52B1983A93; Mon,  8 Sep 2025 10:39:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Sep 2025 17:19:31 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 39615bc2727fa3fa706baed2a96a12de8b8228e1
X-Git-Newrev: 81c94c0d93f19f5daa91bfc33ce9bdffc6d65dab
X-Patchwork-Hint: ignore
Message-Id: <20250908103908.52B1983A93@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/weston: jpeg
 support needs jpeg-turbo
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=81c94c0d93f19f5daa91bfc33ce9bdffc6d65dab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since upstream commit 312efb2acba7dba80b6652ccf98339dcbbd47695, the
JPEG loading code is using jpeg_read_icc_profile(), which is only
available when the jpeg-turbo implementation is used, not the classic
libjpeg. When classic jpeg is used, the build fails with:

../shared/image-loader.c:163:14: error: implicit declaration of function 'jpeg_read_icc_profile' [-Wimplicit-function-declaration]
  163 |         if (!jpeg_read_icc_profile(cinfo, &profdata, &proflen)) {

This commit first appeared in development version 13.0.91 and stable
version 14.0.0, which means the problem exists in Buildroot since
commit 430b80cfc11c59949da8e0a4f11a7088d0b4bd79, when weston was
bumped from 13.0.3 to 14.0.0.

So let's enable the JPEG logic only when jpeg-turbo is used.

Fixes:

  https://autobuild.buildroot.org/results/353e39902616bdbce40ac667e98cbaf51079f69e/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f74f7d4a03885de3ea1b0c590deb720ad53fd1ec)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/weston/weston.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 7d43132073..1d55a1fcba 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -36,7 +36,8 @@ WESTON_SIMPLE_CLIENTS += dmabuf-v4l
 endif
 endif # BR2_PACKAGE_WESTON_SIMPLE_CLIENTS
 
-ifeq ($(BR2_PACKAGE_JPEG),y)
+# weston uses jpeg_read_icc_profile(), only provided by jpeg-turbo
+ifeq ($(BR2_PACKAGE_JPEG_TURBO),y)
 WESTON_CONF_OPTS += -Dimage-jpeg=true
 WESTON_DEPENDENCIES += jpeg
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
