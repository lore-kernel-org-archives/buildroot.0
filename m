Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD061C36008
	for <buildroot@archiver.kernel.org>; Tue, 25 Mar 2025 20:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE60361065;
	Tue, 25 Mar 2025 20:41:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TV5XXazy5c3S; Tue, 25 Mar 2025 20:41:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CA2360B22
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CA2360B22;
	Tue, 25 Mar 2025 20:41:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EE746C0
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 20:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D43D440175
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 20:41:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KE69r3V_D9Vo for <buildroot@buildroot.org>;
 Tue, 25 Mar 2025 20:41:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2BC140176
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2BC140176
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 20:41:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D218382DFB; Tue, 25 Mar 2025 20:41:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 25 Mar 2025 21:39:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 22ffdea9e65056a4e1c5307963962e05b5b6f0dc
X-Git-Newrev: 356c70677cd71fbe790b89a6391f41a5bebc4686
X-Patchwork-Hint: ignore
Message-Id: <20250325204146.D218382DFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_gstreamer1: fix test
 by using bootlin toolchain
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=356c70677cd71fbe790b89a6391f41a5bebc4686
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1], the test_gstreamer1 runtime test is
failing to build the tesseract-ocr package. The root cause is that
the test uses the default arm external toolchain, which is the Linaro
ARM 2018.05 based on gcc 7.3.1.

Since [1], tesseract-orc no longer compiles with gcc 7 (it requires at
least gcc 8).

This commit fixes the issue by switching the toolchain to the
bootlin versions (based on gcc 14 at the time of this commit).

Also, changing the compiler version slightly slowed down the video
encoding. This commit also increases the encoding command timeout.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/9407846232

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/f32da8b9844ae5f1b9dc6b7a89d7d9bd9d194f55

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 support/testing/tests/package/test_gstreamer1.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_gstreamer1.py b/support/testing/tests/package/test_gstreamer1.py
index aa4b67d1a6..ff0302a8a6 100644
--- a/support/testing/tests/package/test_gstreamer1.py
+++ b/support/testing/tests/package/test_gstreamer1.py
@@ -15,6 +15,7 @@ class TestGstreamer1(infra.basetest.BRTest):
         BR2_cortex_a9=y
         BR2_ARM_ENABLE_VFP=y
         BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_PACKAGE_DEJAVU=y
         BR2_PACKAGE_GSTREAMER1=y
         BR2_PACKAGE_GST1_PLUGINS_BASE=y
@@ -60,7 +61,7 @@ class TestGstreamer1(infra.basetest.BRTest):
             f"timeoverlay text=\"{msg_prefix}\" font-desc=\"Sans, 24\" ! " \
             f"theoraenc ! oggmux ! filesink location={video_file}"
         cmd = f"gst-launch-1.0 -v {enc_pipeline}"
-        self.assertRunOk(cmd)
+        self.assertRunOk(cmd, timeout=15)
 
         # We decode our previous video file and store each frame in a
         # PNG image file.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
