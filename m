Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DB2C04FFE
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 16:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D81F160D5F;
	Wed,  8 May 2024 16:33:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yRd5caZtjJTm; Wed,  8 May 2024 16:33:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4247860D61
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4247860D61;
	Wed,  8 May 2024 16:33:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D1761BF97E
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5938A81948
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A0plfNg7XYF4 for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 16:33:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99B9F8188D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99B9F8188D
 for <buildroot@buildroot.org>; Wed,  8 May 2024 16:33:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 919AA86ACF; Wed,  8 May 2024 16:33:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 May 2024 18:32:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43b961089e19c16d5f6dd682a32a0e4f5cabdaaa
X-Git-Newrev: fa94135455db294bc33807a4217ad4f705c464af
X-Patchwork-Hint: ignore
Message-Id: <20240508163327.919AA86ACF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/igt-gpu-tools: disable chamelium
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

commit: https://git.buildroot.net/buildroot/commit/?id=fa94135455db294bc33807a4217ad4f705c464af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable chamelium to avoid the following build failure if gsl is found
but not alsa-lib raised since the addition of the package in commit
d8a729d1731339da141612be33c5e59bc9928748:

In file included from ../lib/igt_audio.c:35:
../lib/igt_audio.h:35:10: fatal error: alsa/asoundlib.h: No such file or directory
   35 | #include <alsa/asoundlib.h>
      |          ^~~~~~~~~~~~~~~~~~

Fixes: d8a729d1731339da141612be33c5e59bc9928748
 - http://autobuild.buildroot.org/results/a7818af881d9aafa9a36f87dc7c882a6880554e8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/igt-gpu-tools/igt-gpu-tools.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/igt-gpu-tools/igt-gpu-tools.mk b/package/igt-gpu-tools/igt-gpu-tools.mk
index d4997c9c28..e3e7d4a896 100644
--- a/package/igt-gpu-tools/igt-gpu-tools.mk
+++ b/package/igt-gpu-tools/igt-gpu-tools.mk
@@ -23,7 +23,9 @@ IGT_GPU_TOOLS_DEPENDENCIES = \
 	udev \
 	zlib
 
-IGT_GPU_TOOLS_CONF_OPTS = -Dtests=disabled
+IGT_GPU_TOOLS_CONF_OPTS = \
+	-Dchamelium=disabled \
+	-Dtests=disabled
 
 # On x86 systems, libigt resolves igt_half_to_float and igt_float_to_half as
 # indirect functions at runtime by checking CPU features with igt_x86_features.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
