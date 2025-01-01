Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75A9E7718B
	for <buildroot@archiver.kernel.org>; Wed,  1 Jan 2025 18:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D832812CF;
	Wed,  1 Jan 2025 18:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D7FoJI--s6vw; Wed,  1 Jan 2025 18:27:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 304FE8048E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 304FE8048E;
	Wed,  1 Jan 2025 18:27:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C689F27
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 18:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8EAE40169
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 18:27:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bwt0bOyJOHcU for <buildroot@buildroot.org>;
 Wed,  1 Jan 2025 18:27:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 55E624035D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55E624035D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55E624035D
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 18:27:19 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B2CBEB00583;
 Wed,  1 Jan 2025 19:27:15 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Wed,  1 Jan 2025 19:27:05 +0100
Message-ID: <20250101182705.976322-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735756036;
 bh=C0OypW01GU3hqU5zXG2nWRPcBqCwt9pNaDdC12w5awk=;
 h=From:To:Cc:Subject:Date:From;
 b=d2Iukgl+4QA/qK+jUMM67RNrXwh43XDesiRQ2tHoDaGCCq5ACFRP9MRKWIkz7Ba87
 hWkyA07DhtGph1Nky7w5STRuXWIrSQDu2Uf6SiomzJL7VQgkAS+d6XNSLRb7oROWyu
 uLUCgBGqrOnPzcXtTq1EUJ0Q4ZOoh69KdLEffxDpG2pBdccI/4jI5PDTMA3g98STV9
 Dn2Eh0XEBs84EGAuAF1xO3uHckS5Esdh/H2geI3JrZ4jbT4rqfzA4P8M6/JT/vzUMT
 +cibI6gCSe5vKF+OBevHBtG051py4YZHhW0Opja0L2WQE66+CBAgVqSuKq0ecLvZOg
 E02yWDEB9V/xw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=d2Iukgl+
Subject: [Buildroot] [PATCH 1/1] support/testing: new gstreamer1 runtime test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8751575397
---
 DEVELOPERS                                    |  1 +
 .../testing/tests/package/test_gstreamer1.py  | 82 +++++++++++++++++++
 2 files changed, 83 insertions(+)
 create mode 100644 support/testing/tests/package/test_gstreamer1.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 381bc9f490..d435abb8d2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1887,6 +1887,7 @@ F:	support/testing/tests/package/test_gnuradio.py
 F:	support/testing/tests/package/test_gnuradio/
 F:	support/testing/tests/package/test_gpsd.py
 F:	support/testing/tests/package/test_gpsd/
+F:	support/testing/tests/package/test_gstreamer1.py
 F:	support/testing/tests/package/test_gzip.py
 F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
diff --git a/support/testing/tests/package/test_gstreamer1.py b/support/testing/tests/package/test_gstreamer1.py
new file mode 100644
index 0000000000..aa4b67d1a6
--- /dev/null
+++ b/support/testing/tests/package/test_gstreamer1.py
@@ -0,0 +1,82 @@
+import os
+
+import infra.basetest
+
+
+class TestGstreamer1(infra.basetest.BRTest):
+    # This test creates a full, yet simple, Gstreamer pipeline which
+    # encodes/decodes a video, using only plugins from Base and Good
+    # packages. It will use Tesseract OCR to validate the final
+    # output. The DejaVu font package is also installed, in order to
+    # have few fonts for the Pango plugin.
+    config = \
+        """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_PACKAGE_DEJAVU=y
+        BR2_PACKAGE_GSTREAMER1=y
+        BR2_PACKAGE_GST1_PLUGINS_BASE=y
+        BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OGG=y
+        BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PANGO=y
+        BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_THEORA=y
+        BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC=y
+        BR2_PACKAGE_GST1_PLUGINS_GOOD=y
+        BR2_PACKAGE_GST1_PLUGINS_GOOD_PNG=y
+        BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MULTIFILE=y
+        BR2_PACKAGE_TESSERACT_OCR=y
+        BR2_PACKAGE_TESSERACT_OCR_LANG_ENG=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        video_file = "videotest.ogg"
+        num_frames = 10
+        msg_prefix = "Hello Buildroot:"
+
+        # We check the main program can execute.
+        self.assertRunOk("gst-launch-1.0 --version")
+
+        # We check we can list installed plugins.
+        self.assertRunOk("gst-inspect-1.0")
+
+        # We check we can query one of the plugin we requested.
+        self.assertRunOk("gst-inspect-1.0 theoraenc")
+
+        # We create a Ogg/Theora video file. We use the "videotestsrc"
+        # with the ball animation which will create a small file. We
+        # add a time overlay with a message. We encode with the Theora
+        # codec and store everything in an Ogg container file.
+        enc_pipeline = \
+            f"videotestsrc num-buffers={num_frames} pattern=ball ! " \
+            f"timeoverlay text=\"{msg_prefix}\" font-desc=\"Sans, 24\" ! " \
+            f"theoraenc ! oggmux ! filesink location={video_file}"
+        cmd = f"gst-launch-1.0 -v {enc_pipeline}"
+        self.assertRunOk(cmd)
+
+        # We decode our previous video file and store each frame in a
+        # PNG image file.
+        dec_pipeline = \
+            f"filesrc location={video_file} ! " \
+            "decodebin ! videoconvert ! pngenc ! " \
+            "multifilesink index=1 location=frame%02d.png"
+        cmd = f"gst-launch-1.0 -v {dec_pipeline}"
+        self.assertRunOk(cmd)
+
+        # We extract the text from our last image.
+        img_file = f"frame{num_frames}.png"
+        cmd = f"tesseract {img_file} output"
+        self.assertRunOk(cmd)
+
+        # We check we have our initial message.
+        out, ret = self.emulator.run("cat output.txt")
+        self.assertEqual(ret, 0)
+        self.assertTrue(out[0].startswith(msg_prefix))
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
