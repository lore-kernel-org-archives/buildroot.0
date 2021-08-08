Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2263EC4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 21:22:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A53D060E53
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 21:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A53D060E53
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B95D402E9;
	Sun,  8 Aug 2021 21:22:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NvvCX_yIm2D4; Sun,  8 Aug 2021 21:22:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA87E402E5;
	Sun,  8 Aug 2021 21:22:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD96D1BF42E
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 21:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8CF2402E5
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 21:22:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Io3quZ6q7uW for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 21:22:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 170C540279
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 21:22:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9A1878D328; Sun,  8 Aug 2021 21:22:35 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 23:22:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f30bd1eb69c44793485e9f013249d020e3e19fc3
X-Git-Newrev: ef37a144798dacd62743f189e462543d2013aa88
X-Patchwork-Hint: ignore
Message-Id: <20210808212235.9A1878D328@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/efl: fix build with tslib
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=ef37a144798dacd62743f189e462543d2013aa88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build with tslib is broken since bump to version 1.25.0 in commit
cf57eceabcca134197fed79c043587439b3d4e39:

/data/buildroot-autobuilder/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/9.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: src/lib/ecore_fb/libecore_fb.so.1.25.1.p/ecore_fb_ts.c.o: in function `_ecore_fb_ts_fd_handler':
ecore_fb_ts.c:(.text+0x4c): undefined reference to `ts_read_raw'

Fixes:
 - http://autobuild.buildroot.org/results/fa111306b95316eed54771550474dae804fa261e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../efl/0003-ecore_fb-fix-build-with-tslib.patch   | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/efl/0003-ecore_fb-fix-build-with-tslib.patch b/package/efl/0003-ecore_fb-fix-build-with-tslib.patch
new file mode 100644
index 0000000000..8eb159505f
--- /dev/null
+++ b/package/efl/0003-ecore_fb-fix-build-with-tslib.patch
@@ -0,0 +1,35 @@
+From 9a785396a7940ec541cf4793f9c9f92548c99d4c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 10 Jul 2021 22:38:03 +0200
+Subject: [PATCH] ecore_fb: fix build with tslib
+
+Build with tslib is broken since version 1.25.0 and
+https://git.enlightenment.org/core/efl.git/commit/?id=8e3606698eb439eecd7302a885504365aca7e564:
+
+/data/buildroot-autobuilder/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/9.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: src/lib/ecore_fb/libecore_fb.so.1.25.1.p/ecore_fb_ts.c.o: in function `_ecore_fb_ts_fd_handler':
+ecore_fb_ts.c:(.text+0x4c): undefined reference to `ts_read_raw'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/fa111306b95316eed54771550474dae804fa261e
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/lib/ecore_fb/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lib/ecore_fb/meson.build b/src/lib/ecore_fb/meson.build
+index 6d50e0f146..7c7f6786c3 100644
+--- a/src/lib/ecore_fb/meson.build
++++ b/src/lib/ecore_fb/meson.build
+@@ -22,7 +22,7 @@ ecore_fb_src = files([
+ ecore_fb_lib = library('ecore_fb',
+     ecore_fb_src, pub_eo_file_target,
+     c_args : package_c_args,
+-    dependencies: ecore_fb_pub_deps + ecore_fb_deps,
++    dependencies: ecore_fb_pub_deps + ecore_fb_deps + ecore_fb_ext_deps,
+     include_directories : config_dir,
+     install: true,
+     version : meson.project_version()
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
