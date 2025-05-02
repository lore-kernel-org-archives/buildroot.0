Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE9AC3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0B2E83A8D;
	Fri,  2 May 2025 11:12:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 79s35q7yo0Yv; Fri,  2 May 2025 11:12:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03C8583AC2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03C8583AC2;
	Fri,  2 May 2025 11:12:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EC4EEE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EADB441A51
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UQDVycFD_WIR for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CD47417B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CD47417B1
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CB52864AD; Fri,  2 May 2025 11:11:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 12:10:37 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 88cd11c166b1645a6f7d97063f0bf70f37273a70
X-Git-Newrev: b562ab494b1bbec8daea3a37bb979dc59f59e080
X-Patchwork-Hint: ignore
Message-Id: <20250502111135.7CB52864AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libv4l: backport
 upstream patch to fix time_t issue
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b562ab494b1bbec8daea3a37bb979dc59f59e080
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

libv4l has some really special code that is built explicitly with
_FILE_OFFSET_BITS=32, which doesn't work with _TIME_BITS=64, causing
build failures when BR2_TIME_BITS_64=y. This build issue has been
fixed upstream. While how the upstream patch exactly works is unclear,
it's the patch that upstream has decided to implement to resolve the
build issue, so we simply backport it.

The issue exists since at least upstream commit
99f245f5e2826c7ae3ac8de530bc2fbd906eb62b, which was merged in
v4l-utils 1.26.0.

Fixes:

  https://autobuild.buildroot.org/results/616608ef2a44efff67fa21b3263b341da82744c4/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Julien: add upstream commit url in patch]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit bdb5809adfcff3a47d7117b5c856a400c7432273)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...1-meson.build-fix-arm-_TIME_BITS-64-error.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/libv4l/0001-meson.build-fix-arm-_TIME_BITS-64-error.patch b/package/libv4l/0001-meson.build-fix-arm-_TIME_BITS-64-error.patch
new file mode 100644
index 0000000000..43fe9b2721
--- /dev/null
+++ b/package/libv4l/0001-meson.build-fix-arm-_TIME_BITS-64-error.patch
@@ -0,0 +1,37 @@
+From 6faf5e963eadeab8b7d47d5b3c14f06e0ae1da01 Mon Sep 17 00:00:00 2001
+From: Hans Verkuil <hverkuil@xs4all.nl>
+Date: Sat, 12 Apr 2025 12:30:13 +0200
+Subject: [PATCH] meson.build: fix arm _TIME_BITS=64 error
+
+Undefine _TIME_BITS to avoid this error on 32-bit arm:
+
+/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
+
+Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
+Upstream: https://git.linuxtv.org/v4l-utils.git/commit/?id=d517cfdcdc16533ab7e06e97c07ca089cf261aef
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ meson.build | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 269a9da7..31927cda 100644
+--- a/meson.build
++++ b/meson.build
+@@ -53,8 +53,12 @@ v4l2_wrapper_args = [
+     # As the library needs to provide both 32-bit and 64-bit versions
+     # of file operations, disable transparent large file support (fixes
+     # 'Error: symbol `open64/mmap64' is already defined' compile failure
+-    # otherwise)
++    # otherwise).
++    #
++    # Also disable _TIME_BITS=64 since this is allowed only with
++    # _FILE_OFFSET_BITS=64, which is now 32.
+     '-U_FILE_OFFSET_BITS',
++    '-U_TIME_BITS',
+     '-D_FILE_OFFSET_BITS=32',
+     '-D_LARGEFILE64_SOURCE',
+ ]
+-- 
+2.49.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
