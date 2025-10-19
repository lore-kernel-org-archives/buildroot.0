Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B260CCD184
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 13:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3378B837AD;
	Sun, 19 Oct 2025 13:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7V5FMBLn_HaK; Sun, 19 Oct 2025 13:40:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4607083837
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4607083837;
	Sun, 19 Oct 2025 13:40:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 898821CC
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 13:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B3EE40AC1
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 13:40:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L9sifyN62Eb2 for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 13:40:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CB8840481
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CB8840481
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 13:40:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8DD338755C; Sun, 19 Oct 2025 13:40:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Oct 2025 15:37:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd5934cd7e6bea10c0ce5d854e1e57962489c9ac
X-Git-Newrev: af4eef1e0f7610573802273abbe8518a2f5b4a61
X-Patchwork-Hint: ignore
Message-Id: <20251019134041.8DD338755C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mjpg-streamer: fix build with gcc
 >= 14
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1419336525526289148=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1419336525526289148==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=af4eef1e0f7610573802273abbe8518a2f5b4a61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When mjpg-streamer is built with gcc >= 14 using libjpeg (rather than
jpeg-turbo), and with SDL is enabled (to enable the output_viewer),
the compilation can fail with error:

    output_viewer.c:125:32: error: assignment to ‘boolean (*)(struct jpeg_decompress_struct *)’ from incompatible pointer type ‘int (*)(struct jpeg_decompress_struct *)’ [-Wincompatible-pointer-types]

The issue can be reproduced with the commands:

    cat >.config <<EOF
    BR2_aarch64=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
    BR2_PACKAGE_LIBJPEG=y
    BR2_PACKAGE_MJPG_STREAMER=y
    BR2_PACKAGE_SDL=y
    EOF
    make olddefconfig
    make mjpg-streamer

This commit adds a patch to fix this issue.

Fixes:
https://autobuild.buildroot.net/results/3a5/3a5674e4e7bb3f2894575191af24598e2a696912/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add commands to reproduce the issue]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0003-output_viewer-fix-build-with-gcc-14.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/mjpg-streamer/0003-output_viewer-fix-build-with-gcc-14.patch b/package/mjpg-streamer/0003-output_viewer-fix-build-with-gcc-14.patch
new file mode 100644
index 0000000000..74c26ec3ea
--- /dev/null
+++ b/package/mjpg-streamer/0003-output_viewer-fix-build-with-gcc-14.patch
@@ -0,0 +1,34 @@
+From c0656c6a538739635441b165b4f1ba7c22c68b1d Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 18 Oct 2025 18:54:36 +0200
+Subject: [PATCH] output_viewer: fix build with gcc >= 14
+
+Fixes build error found by buildroot autobuilders:
+
+output_viewer.c:125:32: error: assignment to 'boolean (*)(struct jpeg_decompress_struct *)'
+from incompatible pointer type 'int (*)(struct jpeg_decompress_struct *)'
+[-Wincompatible-pointer-types]
+
+Upstream: https://github.com/jacksonliam/mjpg-streamer/pull/420
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ .../plugins/output_viewer/output_viewer.c                       | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mjpg-streamer-experimental/plugins/output_viewer/output_viewer.c b/mjpg-streamer-experimental/plugins/output_viewer/output_viewer.c
+index dd6c55b..c50f701 100644
+--- a/mjpg-streamer-experimental/plugins/output_viewer/output_viewer.c
++++ b/mjpg-streamer-experimental/plugins/output_viewer/output_viewer.c
+@@ -86,7 +86,7 @@ static void init_source(j_decompress_ptr cinfo)
+     return;
+ }
+ 
+-static int fill_input_buffer(j_decompress_ptr cinfo)
++static boolean fill_input_buffer(j_decompress_ptr cinfo)
+ {
+     my_source_mgr * src = (my_source_mgr *) cinfo->src;
+ 
+-- 
+2.47.3
+

--===============1419336525526289148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1419336525526289148==--
