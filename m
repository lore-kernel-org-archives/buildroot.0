Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3629BC982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 21:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5B7F811CA;
	Fri, 18 Sep 2026 21:33:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TDhnbH1IaNtx; Fri, 18 Sep 2026 21:33:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D5DE8811D4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789767226;
	b=Pzp0Go7gOZwxzeD9LLeXfOeKqxs+/jVUMRL2UfKS3wfDBQYGTboSZTtlI3wN9m6L9A28
	 VkkesbqM2Ymn+qAk/Bxc9kekJsM9wHBzO+A4UMxKzned9XhaKlfus9Xqub2jOlRETKYRb
	 MB49niC4z4ouyeBWz0FiSjTz5a0SMD7LHnFbYSv8qXmFXBjxmUZejFD6nuXrrQCeA0heF
	 BZvPTvnqwgSo6g+ATEev5fQ9BqNgzlCtAtorFgJRrO8YoVGxZA5GdTPpMRDl7s++RGPFq
	 zi3xGjpsKjoJh5k43+z9fajgFOwRFJGEQWt+KzIVPY0H6xCrdPGlOLUwyKaRFVmYl5A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789767226;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=/Wiqp+jvrvDWRdnE24/4lCVkzZ5JKigoiRyGJhisYUQ=;
	b=D6/RCoUS0Ep0o9pRkkr11EO+/CNkyBYWpJCn8ECuQnqNfP32NSazgLIQf71oNGoo/R9Z
	 C+odEMLCSARx1MTXzbxdKd4dXK04g9LpMwVqodgCE5ItB0kORHgm8dgCw9SJ4sMGTNzpg
	 NYRxcDGwlb32IagfeP5hbvya4Kbpgn2H4uV6Aw27cGUgNu/htQdEdYclhfZpHVz4KQ7iJ
	 EvhhehBZCUjJvgNamWcSYOZSQ6GWQe189r9jil/ft/w6zRXr2CcA5QF/VzjNHcbV00vZ7
	 fOCYMw43Jwda76y6Zz/EhxxEMjFNaHpkHEi/mHfpDK8lNxmgdAf1Z2R/RRD+q+3elAw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789767225;
	bh=/Wiqp+jvrvDWRdnE24/4lCVkzZ5JKigoiRyGJhisYUQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sZ1AqmydI/2VC1yYsl6gdhIBSzRwAhailKQLOMVvHAOUcoIsQ2xUX8MnNCDB1esCx
	 fmC6AKqtHD/tPMQopsUb3BQXTEp3Uq3qWmcZDTNoRIMkvQNtuG1cGkEfRXcFlJqtwj
	 iAjQCwNhYaUsSHFH7Fn+slVqZWSsxm/pHKPDpBj7h2G8gQAHALHVSNyT72Y40oJljt
	 /RXdyeFrkFK+iIjAHryRFILzA6hrh2YPRntbAA8nbB+IQk9uMtaALUCxjmTqgxC2t+
	 BZ02IMvmjVdEClQ2s3xh6HbFfoprqPx4HbMm9KKVrKTNOwuposmzCqnwzqecdghXwI
	 XFHuf+4OTVfhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5DE8811D4;
	Fri, 18 Sep 2026 21:33:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 018EE224
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBC1A40022
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xt-_DaraFaJt for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 21:33:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 1CE8B400AB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789767223;
 b=LxzdcJ0ZSvYWWR+EP8iz5C0w5z5ewUpmJFLDLzqTx1oOhrHjvhL8YYEUT6D2xh7nuKVT
 XOqyn1mpFrPGUBS5hGct2MN/8kAWjAaiRDGSF17Vv0MgggfG78IaWS9RgeuW0lCElk6yQ
 iL/hWY2bQmm50C2QZqVN5JDb2V3dyGJNZyOZJLzgZsrsYLM/64wKnXTK0C+2K+EzF8/SL
 Rje5PT5P0yat+DFg7SkC1jddb8r0RlXW++tBwYK8YuBm33hJ+/eFj8dGqMb1o3SmhvJDi
 UQ74A6iE5a5Ks4OO6Y2AdvSHYvNw+LCjOuDjMcJJGVOF+mMGD4Av5Fjl85wLDrMBz1g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789767223;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=XlWWZp/ef5fOo5DR4N6fSyehAJnoQWTmXJEUkNXgjDY=;
 b=syIK84gUw3jqNzUszkNL3MzMliFCn7BlTpLLbB3lLhON6AzXUXgPYQl2RGg8E8X7nigC
 a7a0gS8OZeC4kPD3qwQqkm+OZxo/SsCenEEsS8sKXyYe0alHi6NPv25aWSAXRW2ZEsh3R
 hKCMVzZ9vSn/Ei0Ams97A2xbmkKVxbkeaMxjsHEHxslps7wY1d3Ajjf7eEKjDnLRrPMyx
 xVWGh8YK0pWBS5JIVsddKOmIgyz0OtiKpzABynVNTXe9Su5VspFv99bRX/Ku8ikuG9FQ3
 //0RfBJrlDJjhcmDkTAJLVntKyVzarDomzBxnDc/Db0YdQhrI8pyg9Vx4LmT4Zg2jmQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CE8B400AB
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:33:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9152F976B8; Fri, 18 Sep 2026 21:32:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 23:33:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c24ae7f2f1bebeea6fd7252987496d9ac1d9b042
X-Git-Newrev: a304c7bf12c85a4d8b760850da4017fce694cada
X-Patchwork-Hint: ignore
Message-Id: <20260918213235.9152F976B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add tests for openscap
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2572427292473276221=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2572427292473276221==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a304c7bf12c85a4d8b760850da4017fce694cada
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add basic tests for openscap, ensuring that it builds and runs a minimal
command with different cryptographic backends:
- libgcrypt
- libnss
- no crypto backend

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_openscap.py     | 63 ++++++++++++++++++++++
 .../rootfs-overlay/root/benchmark.xml              |  5 ++
 3 files changed, 70 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0a6d4e455e..cbca07f9fa 100644
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

--===============2572427292473276221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2572427292473276221==--
