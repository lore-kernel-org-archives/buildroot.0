Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3034DC98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 19:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E729C814C5;
	Thu, 24 Sep 2026 19:00:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PZYTdB-men8O; Thu, 24 Sep 2026 19:00:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E961281566
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276400;
	b=dW1fT68aGJVQtCSSPodVHKiIX/81C2mYcYHo5msUTbActe6CLRsmGPlGL3eMbKH6zuK0
	 NRPaFN5gJIJLTDz22Gc21ox+UDuCB4oQqR+mI+90wo3bmYeyTEqsiFc6E2+7ivOKBxMNn
	 6xvMidXUw2W5ZCWtXz+8iEt36EbvxnFgaXL7hhbyUOM9YTO5cL3lq8B2RmLjO+y2llM4h
	 zqDumCeleRelXqv3jct4YOlAtCGrQHQ0rrCJcXfLWp/26cwHcB3cJZ7/KFRgXmDHDltbM
	 +xmbH+VkJ9/VJapyrrC4IL1Y+y3Ge3yBTUph65SXnFtaILF6bwRThu0oEYM0/luEpbA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276400;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=zIDjnyfP2SkTXzUnvcfFel+OZlQ3oHePnl45w7MnV0Y=;
	b=KU+RpUyhWCt0OsWbFVO7+qARnJF2yQrmoZm2FbM4sdNIcby0Px/zcM95THDa4lGZYGhl
	 oxzhnqvkQ0TBL1ftMoV/lHHPcSz1Jo//t5ts/EAUFtjx8cRPgR7tHQWCPMoY1Obv1PGdz
	 XZDLlXsWy7t3/CFzzeg3/LAHu4fI10iJsEcj5C8rDWea8KZZOBeh05ePU28QQ6sYHeZG8
	 F+qEoHD8qIVizRKMOqyzE9ilqtjKiqYMJank4UFaX9bMMImwT38rdOs5sHdqbKiyp92hQ
	 +/Z5vZog/LAYkr6bQjNSCgdreU0uYdXWZ7jPSmM/JpipLvHFPaZIk3ZXC6cQ7CTkx9A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276400;
	bh=zIDjnyfP2SkTXzUnvcfFel+OZlQ3oHePnl45w7MnV0Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Pv/11kEoLH5Tx1XoFGJ1kulXzFgHmr3lO1toYPXZIGJPj+Eub8GPEY//0muDdzO26
	 yGXXjzXNQQ/syrY923ovvwUYstGAJYcU2KQHsHhfJt/+6iHh4ZDt+mYWebNAQN6ICC
	 wqsTfPHH5BeAgV4usiQlLggpLA2amfbfeajaO64esV6lKZoladq4YQCgvS9aWV8luc
	 jp964MWxH4smEykQrEcM+LN9WjexEm1QgYNxBmEjZx/du+3bHMjm1D2nP2GxOZtGUf
	 F4gwgOxWmEeIGWdAsXbPX2Jb9yRraNiRG+wG313lC8+gAhskYIajstoeeUuLCpypcO
	 el/gGzxJrTxVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E961281566;
	Thu, 24 Sep 2026 18:59:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AEC83B7
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 266FC81218
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pvw4nStXMtkP for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 256298121E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276214;
 b=J2EYQNzxHuyvWQ29MZ4s8s0zeGGPloD1jUCXFu5c43A+D4+YbAnfRgZI3hB8oPcs51OJ
 bLHxDx+nX0WRasbgaC7nsZoQQ62nEhzjQq9uPmNWRL/+RBdAibAGBPJrBqOFETghAwbjT
 YeI1yA03P/dk9IdcWwxDMEKpfasvJr0+vu3qOUcweXkRkx7oWvAAl/VDfQ1QpPJEYwofW
 ZYRCfz92khGzLkO9Wqx5pELCkPfQ5+gZCtlvMGppN+jMuWgUdsbIvoi7NbEaco+sZWq1S
 8G8EPae5fK9cxaDoI0Yscq6Xaljv7Zkgr2Tc/KbaNmSRfHrIGsBjOG7D79fREr6SDng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276214;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=A1wSMvqYQ46NgnQ4b2xl7+9pEGdJ46WHOJdtw7QGLb8=;
 b=KHm+mk6cnq76Aj6BmK6GO66F1qD+a4iNQtxrmPkJn8E4EwPoD2zDQBQWgW+C9E3qn7H3
 K2XQU6b0JoxO9uKBWpXVN0Q5vnKEK9YL5b9chHlqbuAynSfSQLwUOS3fFPccTFxPWYykR
 rkU//Z1meDma3DyCOCg+2074I/HMFG1ooWhPEeLlF4Z5xI1KbbfNJfWKLpOdtm0kDBgqk
 6O7TOrUCWkGHcR9Xl8/VSHrHnluR1KuDEacAZPTUd1SsBKQGfq2Rfn6ETzHC2j/9OcX+g
 v6VgIb2mySiiJh+Uf2mDbtVDLkivfhtLtse93D0+wr0EbSUYoD7D/U3wbqrMPatVOeQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 256298121E
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC33298323; Thu, 24 Sep 2026 18:55:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:34:13 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 680074eeb1b71254adc2dedb26906ef9c855cb03
X-Git-Newrev: 303a5a2004180ed2de4f0bd78d48a29226f1f3c2
X-Patchwork-Hint: ignore
Message-Id: <20260924185543.BC33298323@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] support/testing: add
 tests for openscap
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7677006489806869826=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7677006489806869826==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/303a5a2004180ed2de4f0bd78d48a29226f1f3c2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Add basic tests for openscap, ensuring that it builds and runs a minimal
command with different cryptographic backends:
- libgcrypt
- libnss
- no crypto backend

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a304c7bf12c85a4d8b760850da4017fce694cada)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_openscap.py     | 63 ++++++++++++++++++++++
 .../rootfs-overlay/root/benchmark.xml              |  5 ++
 3 files changed, 70 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index fc50cd4f8f..7dc09bdbb3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -159,6 +159,8 @@ F:	package/libxmlsec1/
 F:	package/openscap/
 F: 	package/python-scp/
 F:	support/testing/tests/package/test_libldns.py
+F:	support/testing/tests/package/test_openscap/
+F:	support/testing/tests/package/test_openscap.py
 F:	support/testing/tests/package/test_python_scp.py
 
 N:	Alistair Francis <alistair@alistair23.me>
diff --git a/support/testing/tests/package/test_openscap.py b/support/testing/tests/package/test_openscap.py
new file mode 100644
index 0000000000..08527d28aa
--- /dev/null
+++ b/support/testing/tests/package/test_openscap.py
@@ -0,0 +1,63 @@
+import os
+
+import infra.basetest
+
+
+class TestOpenSCAPBase(infra.basetest.BRTest):
+    config = """
+        BR2_arm=y
+        BR2_cortex_a8=y
+        BR2_ARM_EABIHF=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
+        BR2_PACKAGE_OPENSCAP=y
+        BR2_ROOTFS_OVERLAY="{}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(
+                infra.filepath("tests/package/test_openscap/rootfs-overlay"))
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(
+            arch="armv7",
+            kernel="builtin",
+            options=["-m", "512M", "-initrd", cpio_file],
+        )
+        self.emulator.login()
+
+        out, ret = self.emulator.run("oscap --version")
+        self.assertEqual(ret, 0)
+
+        out, ret = self.emulator.run("oscap info /root/benchmark.xml")
+        self.assertEqual(ret, 0)
+        self.assertIn("Document type: XCCDF Checklist", "\n".join(out))
+
+
+class TestOpenSCAPGcrypt(TestOpenSCAPBase):
+    """Test openscap using the gcrypt crypto backend."""
+
+    config = (
+        TestOpenSCAPBase.config
+        + """
+        BR2_PACKAGE_LIBGCRYPT=y
+        """
+    )
+
+
+class TestOpenSCAPNss(TestOpenSCAPBase):
+    """Test openscap using the nss crypto backend."""
+
+    config = (
+        TestOpenSCAPBase.config
+        + """
+        BR2_PACKAGE_LIBNSS=y
+        """
+    )
+
+
+class TestOpenSCAPNoCrypto(TestOpenSCAPBase):
+    """Test openscap without any crypto backend."""
+
+    config = TestOpenSCAPBase.config
diff --git a/support/testing/tests/package/test_openscap/rootfs-overlay/root/benchmark.xml b/support/testing/tests/package/test_openscap/rootfs-overlay/root/benchmark.xml
new file mode 100644
index 0000000000..aac0f1e0fa
--- /dev/null
+++ b/support/testing/tests/package/test_openscap/rootfs-overlay/root/benchmark.xml
@@ -0,0 +1,5 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<xccdf:Benchmark xmlns:xccdf="http://checklists.nist.gov/xccdf/1.2" id="xccdf_org.buildroot.benchmark">
+  <xccdf:status>accepted</xccdf:status>
+  <xccdf:version>1.0</xccdf:version>
+</xccdf:Benchmark>

--===============7677006489806869826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7677006489806869826==--
