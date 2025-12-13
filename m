Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B8EAD5B15E
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 18:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A8D56074A;
	Sat, 13 Dec 2025 18:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vc2hEImAQbiz; Sat, 13 Dec 2025 18:01:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36D6C60773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765648870;
	bh=BGr2NFocb/rCuSYXyO8segGQO31TVJwwqJNsYYe2q+w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TfW3l91ESgMs8lMZdnMqTm2vRe5T3yxtMhNnMc7qjWdj4khAPdKVxBzOQci7he+sM
	 JvN4kQ9tyV14zkXRxwibBw4WLs/k4jZq2yudo8F7c6A4RqoLB1sEeAtP5U2aHI6jMl
	 wFgKgFuWQKXYi67Son7Hc+K+WeUvI8rmX/faoxUELQUK8oGppc2v9s7Dv1kEzn5TqF
	 /f37uhQlpshbgOCHqPYHDrx8381ZrUkZDhZPlX2B///suJrY7T3/qpPngPdfBG3/ZS
	 cSVuFz1Vbz4ncIfsj9ZSf5KdESiqI49oe97SnRa55AsUgIs+RXdIhD8bYEh95ATMSI
	 CzLwVowGMA69w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36D6C60773;
	Sat, 13 Dec 2025 18:01:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E7CA4117
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 18:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D98A660773
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 18:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s7xobpJPIVkk for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 18:01:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 230846074A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 230846074A
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 18:01:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14D3886DAA; Sat, 13 Dec 2025 18:01:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 18:51:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70a689f9dc4a50b2bf909f891a1c9220cb5da920
X-Git-Newrev: 74d7259a33f0d094556405239106e637db9ff71b
X-Patchwork-Hint: ignore
Message-Id: <20251213180108.14D3886DAA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add basic runtime test
 for libldns/drill
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
Content-Type: multipart/mixed; boundary="===============7602058928948071557=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7602058928948071557==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=74d7259a33f0d094556405239106e637db9ff71b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a simple test ensuring that
- libldns is correctly built and installed
- drill is correctly built and installed
- drill is able to execute on the target

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_libldns.py | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/support/testing/tests/package/test_libldns.py b/support/testing/tests/package/test_libldns.py
new file mode 100644
index 0000000000..6c1a4da3f2
--- /dev/null
+++ b/support/testing/tests/package/test_libldns.py
@@ -0,0 +1,21 @@
+import infra.basetest
+import os
+
+
+class TestLibLdns(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_LIBLDNS=y
+        BR2_PACKAGE_LIBLDNS_DRILL=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        self.assertRunOk("drill -v")

--===============7602058928948071557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7602058928948071557==--
