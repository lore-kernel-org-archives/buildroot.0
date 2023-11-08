Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1C1C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 21:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B7EA8201D;
	Wed,  8 Nov 2023 21:38:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B7EA8201D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UJAz2PJfHyS1; Wed,  8 Nov 2023 21:38:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D348581F57;
	Wed,  8 Nov 2023 21:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D348581F57
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 46F131BF4DD
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 21:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F13040140
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 21:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F13040140
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W7rUES3NrGXk for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 21:38:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FED540114
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 21:38:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FED540114
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2806F86D72; Wed,  8 Nov 2023 21:38:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Nov 2023 21:59:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd41e442f0fdd2cc0c4ba2d33d08721fde114e44
X-Git-Newrev: 1aa198f7285775ad09afa0777d54d831bdce61c0
X-Patchwork-Hint: ignore
Message-Id: <20231108213823.2806F86D72@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: ignore more
 makefiles that aren't packages
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1aa198f7285775ad09afa0777d54d831bdce61c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages are grouped and have a general makefile that defines
reusable variables. These makefiles have no relevant information for
pkg-stats and should be excluded.

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 28f5a0789c..eca638f396 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -338,16 +338,21 @@ def get_pkglist(npackages, package_list):
     package_list: limit to those packages in this list
     """
     WALK_USEFUL_SUBDIRS = ["boot", "linux", "package", "toolchain"]
-    WALK_EXCLUDES = ["boot/common.mk",
+    WALK_EXCLUDES = ["boot/barebox/barebox.mk",
+                     "boot/common.mk",
                      "linux/linux-ext-.*.mk",
+                     "package/fftw/fftw.mk",
                      "package/freescale-imx/freescale-imx.mk",
                      "package/gcc/gcc.mk",
                      "package/gstreamer/gstreamer.mk",
                      "package/gstreamer1/gstreamer1.mk",
                      "package/gtk2-themes/gtk2-themes.mk",
+                     "package/kf5/kf5.mk",
+                     "package/llvm-project/llvm-project.mk",
                      "package/matchbox/matchbox.mk",
                      "package/opengl/opengl.mk",
                      "package/qt5/qt5.mk",
+                     "package/qt6/qt6.mk",
                      "package/x11r7/x11r7.mk",
                      "package/doc-asciidoc.mk",
                      "package/pkg-.*.mk",
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
