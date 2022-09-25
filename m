Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577FAC54EE9
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 20:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09D7460E48;
	Sun, 25 Sep 2022 20:41:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09D7460E48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KRdNvnJDEVfv; Sun, 25 Sep 2022 20:41:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE68360E2A;
	Sun, 25 Sep 2022 20:41:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE68360E2A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F08FC1BF321
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 20:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7FFC801EC
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 20:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7FFC801EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rr5HlSALzTMT for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 20:40:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 553BB826BF
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 553BB826BF
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 20:40:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 0C31F20005;
 Sun, 25 Sep 2022 20:40:39 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Buildroot List <buildroot@buildroot.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Sun, 25 Sep 2022 22:40:29 +0200
Message-Id: <20220925204030.1661583-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220925204030.1661583-1-thomas.petazzoni@bootlin.com>
References: <20220925204030.1661583-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664138440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NnJNoGiP7Zi+WrmSc7hVT4zw0RplGu6zW2RnmF80nRQ=;
 b=ed9nFFZcUmkeBWkqpQLms1ssAw62+y+aegl5/vZdVPlxaayR8d63i4DTol8Anc2Bv3C9to
 ukaSj2wk7Ywq6i0FtD8Bgk8jOTNuo+Bs00F65n4tcsX4oFBSrCLQtvwi+UHBUmrwuqHaL0
 6aQ9ryc++TG0dX/ukn0OVj9kQrT6QCE6ls2UhyD+mo2ehRP+4dkmPsLoAmJrxOStb3ZqA3
 lI8M64EMmgVynyzNJCN0NCCrQG9++3hUIxHX+nIhcGMFTzCMa42139ctp34pA6Mn+vLeu2
 yntVo7vqoAxQjQrAq7pn2X0TXkCBRyHi2DGixwYXLmy3BA6MJuvd3zt5Qe2k+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ed9nFFZc
Subject: [Buildroot] [PATCH RFC 4/4]
 support/testing/tests/package/test_nodejs: test both host-nodejs-bin and
 host-nodejs-src
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The TestNodeJSModule test triggers the build of host-nodejs to be able
to install third party modules. Now that host-nodejs has two
providers, it makes sense to test both cases, so we duplicate
TestNodeJSModule into TestNodeJsModuleHostBin (which tests the
host-nodejs-bin) and TestNodeJSModuleHostSrc (which tests the
host-nodejs-src).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_nodejs.py | 29 +++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_nodejs.py b/support/testing/tests/package/test_nodejs.py
index 9463c76b72..b63d44c97e 100644
--- a/support/testing/tests/package/test_nodejs.py
+++ b/support/testing/tests/package/test_nodejs.py
@@ -27,7 +27,7 @@ class TestNodeJSBasic(infra.basetest.BRTest):
         self.assertRunOk("node sample_nodejs_basic.js")
 
 
-class TestNodeJSModule(infra.basetest.BRTest):
+class TestNodeJSModuleHostBin(infra.basetest.BRTest):
     config = \
         """
         BR2_arm=y
@@ -36,6 +36,33 @@ class TestNodeJSModule(infra.basetest.BRTest):
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_PACKAGE_NODEJS=y
         BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL="lodash"
+        BR2_PACKAGE_HOST_NODEJS_BIN=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
+        BR2_ROOTFS_POST_SCRIPT_ARGS="{}"
+        """.format(infra.filepath("tests/package/copy-sample-script-to-target.sh"),
+                   infra.filepath("tests/package/sample_nodejs_module.js"))
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+        self.assertRunOk("node sample_nodejs_module.js")
+
+
+class TestNodeJSModuleHostSrc(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_PACKAGE_NODEJS=y
+        BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL="lodash"
+        BR2_PACKAGE_HOST_NODEJS_SRC=y
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
         BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
