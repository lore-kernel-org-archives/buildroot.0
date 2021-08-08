Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0405C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 21:22:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3582560E53
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 21:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3582560E53
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0461482C18;
	Sun,  8 Aug 2021 21:22:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M8xGAZoHkH0L; Sun,  8 Aug 2021 21:22:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5706E82BFD;
	Sun,  8 Aug 2021 21:22:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 182901BF42E
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 21:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0554940160
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 21:22:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2lU01mQD-T6p for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 21:22:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2989400AE
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 21:22:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 68E198D320; Sun,  8 Aug 2021 21:22:08 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 23:21:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05442cd78492259944d73fb52d7bca3b5ff9e0e6
X-Git-Newrev: f30bd1eb69c44793485e9f013249d020e3e19fc3
X-Patchwork-Hint: ignore
Message-Id: <20210808212208.68E198D320@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ffmpeg: add -latomic to pkg-config
 files
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

commit: https://git.buildroot.net/buildroot/commit/?id=f30bd1eb69c44793485e9f013249d020e3e19fc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

-latomic was added to extralibs to fix static build of ffmpeg in commit
fc8798197b57488a852e2c14b4677b5eb0114a0b. However, extralibs is not
added to libavformat.pc resulting in the following static build failure
of motion:

/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libavformat.a(fifo.o): in function `fifo_init':
/home/buildroot/autobuild/instance-1/output-1/build/ffmpeg-4.4/libavformat/fifo.c:519: undefined reference to `__atomic_store_8'

So add a patch to add extralibs (and so -latomic) to all pkg-config
files

Fixes:
 - http://autobuild.buildroot.org/results/62ec618e40081a250b8129ec6f5a178eb06fba1d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-configure-add-extralibs-to-extralibs_xxx.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch b/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch
new file mode 100644
index 0000000000..dbc19c1cec
--- /dev/null
+++ b/package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch
@@ -0,0 +1,47 @@
+From 0c288853630b7b4e004774c39945d4a804afcfa8 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 6 Aug 2021 09:17:20 +0200
+Subject: [PATCH] configure: add extralibs to extralibs_xxx
+
+Add extralibs to extralibs_xxx (e.g. extralibs_avformat) to allow
+applications such as motion to retrieve ffmpeg dependencies such as
+-latomic through pkg-config
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not upstreamable]
+---
+ configure | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/configure b/configure
+index 0bb3a7cf2b..3bda99e415 100755
+--- a/configure
++++ b/configure
+@@ -7602,15 +7602,15 @@ rpath=$(enabled rpath && echo "-Wl,-rpath,\${libdir}")
+ source_path=${source_path}
+ LIBPREF=${LIBPREF}
+ LIBSUF=${LIBSUF}
+-extralibs_avutil="$avutil_extralibs"
+-extralibs_avcodec="$avcodec_extralibs"
+-extralibs_avformat="$avformat_extralibs"
+-extralibs_avdevice="$avdevice_extralibs"
+-extralibs_avfilter="$avfilter_extralibs"
+-extralibs_avresample="$avresample_extralibs"
+-extralibs_postproc="$postproc_extralibs"
+-extralibs_swscale="$swscale_extralibs"
+-extralibs_swresample="$swresample_extralibs"
++extralibs_avutil="$avutil_extralibs $extralibs"
++extralibs_avcodec="$avcodec_extralibs $extralibs"
++extralibs_avformat="$avformat_extralibs $extralibs"
++extralibs_avdevice="$avdevice_extralibs $extralibs"
++extralibs_avfilter="$avfilter_extralibs $extralibs"
++extralibs_avresample="$avresample_extralibs $extralibs"
++extralibs_postproc="$postproc_extralibs $extralibs"
++extralibs_swscale="$swscale_extralibs $extralibs"
++extralibs_swresample="$swresample_extralibs $extralibs"
+ EOF
+ 
+ for lib in $LIBRARY_LIST; do
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
