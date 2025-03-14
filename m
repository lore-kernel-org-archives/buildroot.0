Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F20C282EC
	for <buildroot@archiver.kernel.org>; Fri, 14 Mar 2025 21:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C66FA42420;
	Fri, 14 Mar 2025 21:03:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQQDq2-XqN6g; Fri, 14 Mar 2025 21:03:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F08742409
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F08742409;
	Fri, 14 Mar 2025 21:03:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 51C9161
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 21:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35BF842413
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 21:03:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8FbIxRxgmVUf for <buildroot@buildroot.org>;
 Fri, 14 Mar 2025 21:03:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 12F3C40799
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12F3C40799
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 12F3C40799
 for <buildroot@buildroot.org>; Fri, 14 Mar 2025 21:03:32 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id A6289B00548;
 Fri, 14 Mar 2025 22:03:27 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Gilles Talis <gilles.talis@gmail.com>,
	Julien Olivain <ju.o@free.fr>
Date: Fri, 14 Mar 2025 22:03:13 +0100
Message-ID: <20250314210313.775885-2-ju.o@free.fr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314210313.775885-1-ju.o@free.fr>
References: <20250314210313.775885-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741986211;
 bh=LxY7HP6CXUIEYXr6/4rpnigKheeYBEi/7CblMkM97so=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QKAfslc2WVyR2wLZlOsS79xuihvvPCTHqYbQl7yb3uAypa2wANo5N8RGeFZ+ThBB7
 9D4JNTm/HoXOe0vCYBvvy1NgHuoIxZ7u2JrbyDmXeRALX6LGcFOEXml7D6BVPRnXYR
 muV9jyRoSrakHhOBq9MLeukzDYBCHJxjb+jJ6ursD+FoMnVj72xeglXXo+3xToTb84
 KPRLWc0yFNToBpwRie0gOs646hHjfV5/IQjbp38T9SVRqFLavliOSGYKkgJLzFt3FL
 BfTFlkVhEZk4HuBJd48UUylOB93p/f/3hREg2q876CeKmoOSqNIe4WrRrOjpQRK48r
 We+F6MbTxpXFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QKAfslc2
Subject: [Buildroot] [PATCH 2/2] support/testing: test_gstreamer1: fix test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/9418705579
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
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
