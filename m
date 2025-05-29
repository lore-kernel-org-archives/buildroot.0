Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A1EC5AD49
	for <buildroot@archiver.kernel.org>; Thu, 29 May 2025 21:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 352476164E;
	Thu, 29 May 2025 21:04:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6MiUfiSfkhEa; Thu, 29 May 2025 21:04:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 383CB6164B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 383CB6164B;
	Thu, 29 May 2025 21:04:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A18451513
 for <buildroot@buildroot.org>; Thu, 29 May 2025 21:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E6FB83EB0
 for <buildroot@buildroot.org>; Thu, 29 May 2025 21:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oltEblBz_Dy5 for <buildroot@buildroot.org>;
 Thu, 29 May 2025 21:04:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E106F83EAD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E106F83EAD
 for <buildroot@buildroot.org>; Thu, 29 May 2025 21:04:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9A19877E4; Thu, 29 May 2025 21:04:15 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 29 May 2025 21:20:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c9ae932c94e84f325d1d1d87e00965559263a8c6
X-Git-Newrev: 2b2120dc4a56c88314f8d94546c9a9120bb45527
X-Patchwork-Hint: ignore
Message-Id: <20250529210415.C9A19877E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5webengine: fix thumb
 detection logic
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0249872882847638899=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0249872882847638899==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2b2120dc4a56c88314f8d94546c9a9120bb45527
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch that removes part of the logic that attempts to detect if
thumb is supported. This logic simply doesn't work at all in the
Buildroot context. In fact, thumb is supported on all 32-bit ARM on
which we can build qt5webengine.

Fixes:
WARNING: Thumb instruction set is required to build ffmpeg for QtWebEngine.
[...]
FAILED: obj/third_party/ffmpeg/ffmpeg_internal/vp8.o
[...] -c ../../3rdparty/chromium/third_party/ffmpeg/libavcodec/vp8.c -o obj/third_party/ffmpeg/ffmpeg_internal/vp8.o
{standard input}: Assembler messages:
{standard input}:1119: Error: bad instruction `ldrhcs r0,[ip],#2'
{standard input}:1156: Error: bad instruction `ldrhcs r9,[ip],#2'
{standard input}:1190: Error: bad instruction `ldrhcs lr,[ip],#2'
{standard input}:1253: Error: bad instruction `ldrhcs r9,[r7],#2'
[...]

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
Cc: Gaël PORTAY <gael.portay@rtone.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ri-remove-some-of-the-thumb-detection-log.patch | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/package/qt5/qt5webengine/0003-configure.pri-remove-some-of-the-thumb-detection-log.patch b/package/qt5/qt5webengine/0003-configure.pri-remove-some-of-the-thumb-detection-log.patch
new file mode 100644
index 0000000000..57ed3558bc
--- /dev/null
+++ b/package/qt5/qt5webengine/0003-configure.pri-remove-some-of-the-thumb-detection-log.patch
@@ -0,0 +1,69 @@
+From b00f7b41ffdee03f9982287d61c2fa21ebee5e6b Mon Sep 17 00:00:00 2001
+From: Arnout Vandecappelle <arnout@rnout.be>
+Date: Sat, 17 May 2025 22:09:32 +0200
+Subject: [PATCH] configure.pri: remove some of the thumb detection logic
+
+The hasThumbFlag test has a roundabout way of discovering whether thumb
+is available. It looks at the -mthumb and -marm flag (which does make
+some sense), but then it tries to look at -march to determine which ARM
+architecture version is used. That test doesn't work if GCC is
+configured for a default target architecture and no -march is passed on
+the command line.
+
+In Buildroot, we don't pass any -mthumb, -marm or -march in CFLAGS
+because all of that is included in the toolchain wrapper. Therefore, the
+logic has nothing to determine the target ARM ISA version and returns
+false.
+
+As a result, nothing is passed down to gn, and gn adds -marm to the
+build. There is in fact a warning about this:
+
+    WARNING: Thumb instruction set is required to build ffmpeg for QtWebEngine.
+
+but since it's just a warning, it gets ignored.
+
+Indeed, the build does fail (when ffmpeg is built, i.e. when
+BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS is enabled) with:
+
+    FAILED: obj/third_party/ffmpeg/ffmpeg_internal/vp8.o
+    [...]
+    {standard input}: Assembler messages:
+    {standard input}:1119: Error: bad instruction `ldrhcs r0,[ip],#2'
+    {standard input}:1156: Error: bad instruction `ldrhcs r9,[ip],#2'
+
+In practice, the architecture version doesn't really matter, because all
+the architectures supported by JSCore have thumb.
+
+Therefore, remove the logic for detecting if the CPU architecture
+supports thumb. Do keep the -marm and -mthumb logic, even though in
+Buildroot it doesn't do anything, and the warning gets ignored.
+
+Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
+Upstream: It's not clear if the same logic about JSCore applies in
+upstream, so not sent.
+---
+ configure.pri | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/configure.pri b/configure.pri
+index 8da334c83..3ff298e9f 100644
+--- a/configure.pri
++++ b/configure.pri
+@@ -370,14 +370,6 @@ defineTest(qtConfTest_hasThumbFlag) {
+     !isEmpty(FLAG): return(true)
+     FLAG = $$qtwebengine_extractCFlag("-marm")
+     !isEmpty(FLAG): return(false)
+-
+-    MARCH = $$qtwebengine_extractCFlag("-march=.*")
+-    MARMV = $$replace(MARCH, "armv",)
+-    !isEmpty(MARMV) {
+-        MARMV = $$split(MARMV,)
+-        MARMV = $$member(MARMV, 0)
+-    }
+-    if (isEmpty(MARMV) | lessThan(MARMV, 7)): return(false)
+     # no flag assume mthumb
+     return(true)
+ }
+-- 
+2.49.0
+

--===============0249872882847638899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0249872882847638899==--
