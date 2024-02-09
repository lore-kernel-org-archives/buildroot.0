Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6D2C48297
	for <buildroot@archiver.kernel.org>; Fri,  9 Feb 2024 19:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9796340141;
	Fri,  9 Feb 2024 19:29:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 905PeLDNk2T1; Fri,  9 Feb 2024 19:29:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 491694033F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 491694033F;
	Fri,  9 Feb 2024 19:29:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D79F41BF318
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 19:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1E284033F
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 19:29:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2FCp3gpO43fY for <buildroot@lists.busybox.net>;
 Fri,  9 Feb 2024 19:29:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 424AF40141
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 424AF40141
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 424AF40141
 for <buildroot@buildroot.org>; Fri,  9 Feb 2024 19:29:32 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id EFA7C13F89C;
 Fri,  9 Feb 2024 20:29:27 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri,  9 Feb 2024 20:29:23 +0100
Message-ID: <20240209192923.1201371-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707506969;
 bh=3drTpNk7ngFr697255zLkPfEZ+HEVkpcPd8q8bhDS9w=;
 h=From:To:Cc:Subject:Date:From;
 b=nwDEI0utt+CBO2Eshk/Y8+v4KIY5QSUERKDQiUNjIn3GChldnYhrq/LbxtjuPmR6B
 eA4PB57DnyWwQfxgRcZwHJ4DPzbVkI/MQM+8eDp7ZlMBu8vwyfW7GispMZKdMEwp1K
 5DOlpU+MjJBz42nv5T6ZCmDWeIKtZZWd2Ty8ks2pL6MEMlhmcxcbFaxtdQuxVbwrXQ
 Zkm5H9X8zIBQw3JrVs44bfkktdRkxGzQc59lKZV3Qxh1JgoWszs69AxkjfTkpC7k4F
 Tn6FFFDHk7fu1QHnanmO+8EOuuyK/3qw6ExicvMwJqp7rvbX3X0cOKQC6eP6iB5Zaz
 6BpLB/YRgwROw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nwDEI0ut
Subject: [Buildroot] [PATCH 1/1] support/testing: add ghostscript runtime
 test
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                    |  2 +
 .../testing/tests/package/test_ghostscript.py | 48 +++++++++++++++++++
 .../rootfs-overlay/root/document.ps           |  9 ++++
 3 files changed, 59 insertions(+)
 create mode 100644 support/testing/tests/package/test_ghostscript.py
 create mode 100644 support/testing/tests/package/test_ghostscript/rootfs-overlay/root/document.ps

diff --git a/DEVELOPERS b/DEVELOPERS
index 1c6c84b05b..db0821c82b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1783,6 +1783,8 @@ F:	support/testing/tests/package/test_fluidsynth.py
 F:	support/testing/tests/package/test_fluidsynth/
 F:	support/testing/tests/package/test_fping.py
 F:	support/testing/tests/package/test_gawk.py
+F:	support/testing/tests/package/test_ghostscript.py
+F:	support/testing/tests/package/test_ghostscript/
 F:	support/testing/tests/package/test_glslsandbox_player.py
 F:	support/testing/tests/package/test_glslsandbox_player/
 F:	support/testing/tests/package/test_gnupg2.py
diff --git a/support/testing/tests/package/test_ghostscript.py b/support/testing/tests/package/test_ghostscript.py
new file mode 100644
index 0000000000..3c6c16ef2c
--- /dev/null
+++ b/support/testing/tests/package/test_ghostscript.py
@@ -0,0 +1,48 @@
+import os
+
+import infra.basetest
+
+
+class TestGhostscript(infra.basetest.BRTest):
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_ghostscript/rootfs-overlay")
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        f"""
+        BR2_PACKAGE_GHOSTSCRIPT=y
+        BR2_PACKAGE_TESSERACT_OCR=y
+        BR2_PACKAGE_TESSERACT_OCR_LANG_ENG=y
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
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
+        # Check the program can execute.
+        self.assertRunOk("gs --version")
+
+        doc_basename = "document"
+        ps_file = doc_basename + ".ps"
+        pgm_file = doc_basename + ".pgm"
+        txt_file = doc_basename + ".txt"
+
+        # Render a basic PostScript file to an image file.
+        cmd = "gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=pgmraw -r150"
+        cmd += f" -dTextAlphaBits=4 -sOutputFile='{pgm_file}' {ps_file}"
+        self.assertRunOk(cmd)
+
+        # Run text recognition on the image file.
+        cmd = f"tesseract {pgm_file} {doc_basename}"
+        self.assertRunOk(cmd, timeout=30)
+
+        # Check we extracted the expected string from the input
+        # PostScript file.
+        cmd = f"cat {txt_file}"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], "Hello Buildroot!")
diff --git a/support/testing/tests/package/test_ghostscript/rootfs-overlay/root/document.ps b/support/testing/tests/package/test_ghostscript/rootfs-overlay/root/document.ps
new file mode 100644
index 0000000000..5ca2b3581f
--- /dev/null
+++ b/support/testing/tests/package/test_ghostscript/rootfs-overlay/root/document.ps
@@ -0,0 +1,9 @@
+%!PS
+% See: PostScript: Language Reference, third edition
+% Example 5.1, page 314
+% https://www.adobe.com/jp/print/postscript/pdfs/PLRM.pdf
+/Helvetica findfont
+16 scalefont setfont
+54 720 moveto
+(Hello Buildroot!) show
+showpage
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
