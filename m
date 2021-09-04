Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABDA0C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:17:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 544FC60F3A
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 544FC60F3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 303DA606A0;
	Sat,  4 Sep 2021 20:17:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D5ayXItMJZmr; Sat,  4 Sep 2021 20:17:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 590AB60751;
	Sat,  4 Sep 2021 20:17:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7350D1BF95F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62D60606C7
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:17:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KsfCj3nVXtPp for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 20:17:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E2F060658
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 20:17:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 48DB788268; Sat,  4 Sep 2021 20:16:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Sep 2021 22:00:21 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: b44778ecc1b59a127244b3f58c303410a832009a
X-Git-Newrev: c58f4adc9e4f7454c02b5faeedd2cc2afa1873a5
X-Patchwork-Hint: ignore
Message-Id: <20210904201601.48DB788268@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/ffmpeg: add
 -latomic to pkg-config files
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c58f4adc9e4f7454c02b5faeedd2cc2afa1873a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

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
(cherry picked from commit f30bd1eb69c44793485e9f013249d020e3e19fc3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
