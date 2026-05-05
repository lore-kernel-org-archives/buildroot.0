Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EB8CD3430
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 09:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D499B409BF;
	Tue,  5 May 2026 09:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SrHDnhxn609x; Tue,  5 May 2026 09:43:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB881409B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777974222;
	bh=NB+w4Ljbzrz4LvmWKDd26EBefG42Mf5K/fJ8smODZ9s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hCd9zvziaoLB/kSioeap4Zzf9UyEyZuqK696R2yyyW4bQT9qMpFJWXv185wWrjWH5
	 I9jjD34Occ62j/oy7br5JkDBuF6jKgYx+Kz6EeXu4+HTdZmJNRlrwGXLw5A+WtNT4t
	 gdTU06Eihibx2VIYaoepXW11iLBSa4qXXBgP+dN+v/nsNOsqQSoMNazgmjGENck0W2
	 7Y7nwoO6rYbLRkSQU/j6kop2hjxkJp4DYONjCgFwb3CGgCKF+u3ufPQEYm2vnfsGKv
	 oGJl6ap1j5sFxtqK+oe/ZQtwKe8gkbgejMFTcm4bTd1oImLOjO7EVzrhfpGQw0Ti8y
	 GiIeKXCT7NAXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB881409B2;
	Tue,  5 May 2026 09:43:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B1DE30A
 for <buildroot@buildroot.org>; Tue,  5 May 2026 09:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D34040232
 for <buildroot@buildroot.org>; Tue,  5 May 2026 09:43:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p4OBrehprJ0r for <buildroot@buildroot.org>;
 Tue,  5 May 2026 09:43:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C2BE40231
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C2BE40231
 for <buildroot@buildroot.org>; Tue,  5 May 2026 09:43:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 93745844EB; Tue,  5 May 2026 09:43:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 5 May 2026 11:42:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e4a9c1c760eccfd409ab1d33cb8a7df5e11f43db
X-Git-Newrev: 986a30bf9ba561b0d5acd7e39e16093639a82917
X-Patchwork-Hint: ignore
Message-Id: <20260505094338.93745844EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kmod: enable dlopen() for
 compression libraries (if any)
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/986a30bf9ba561b0d5acd7e39e16093639a82917
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

With dlopen() enabled, kmod will load compression libraries only if
actually needed (loading compressed modules into the kernel does not
if the kernel can handle decompression, depending on its
configuration), and only the needed one.

Use compressed modules in the kmod test without enabling in-kernel
decompression to verify decompression in kmod works.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/kmod/kmod.mk                                   |  4 ++++
 support/testing/tests/package/test_kmod.py             | 18 +++++++++++++-----
 .../package/test_kmod/compressed-modules.fragment      |  3 +++
 3 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 0901afc872..4bd64f8456 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -28,6 +28,10 @@ endif
 
 KMOD_CONF_OPTS += -Dfishcompletiondir=no -Dzshcompletiondir=no
 
+# load compression libraries (if any are enabled below) as needed
+# using dlopen()
+KMOD_CONF_OPTS += -Ddlopen=all
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 KMOD_DEPENDENCIES += zlib
 KMOD_CONF_OPTS += -Dzlib=enabled
diff --git a/support/testing/tests/package/test_kmod.py b/support/testing/tests/package/test_kmod.py
index e11d3b702c..3c06589b2b 100644
--- a/support/testing/tests/package/test_kmod.py
+++ b/support/testing/tests/package/test_kmod.py
@@ -4,10 +4,13 @@ import infra.basetest
 
 
 class TestKmod(infra.basetest.BRTest):
-    # This test uses the "virtio_net" driver compiled as a module. We
-    # need to recompile a Kernel for that.
-    kernel_fragment = \
-        infra.filepath("tests/package/test_kmod/linux-virtio-net.fragment")
+    # This test uses the "virtio_net" driver compiled as a module, and
+    # compressed modules to test that kmod can handle them. We need to
+    # compile a kernel for that.
+    kernel_fragments = (
+        infra.filepath("tests/package/test_kmod/compressed-modules.fragment"),
+        infra.filepath("tests/package/test_kmod/linux-virtio-net.fragment"),
+    )
     config = \
         f"""
         BR2_aarch64=y
@@ -18,10 +21,13 @@ class TestKmod(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.135"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
-        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kernel_fragment}"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{" ".join(kernel_fragments)}"
         BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
         BR2_PACKAGE_KMOD=y
         BR2_PACKAGE_KMOD_TOOLS=y
+        BR2_PACKAGE_ZSTD=y
+        BR2_PACKAGE_HOST_KMOD=y
+        BR2_PACKAGE_HOST_KMOD_ZSTD=y
         BR2_TARGET_ROOTFS_EXT2=y
         BR2_TARGET_ROOTFS_EXT2_4=y
         # BR2_TARGET_ROOTFS_TAR is not set
@@ -48,6 +54,7 @@ class TestKmod(infra.basetest.BRTest):
         out, ret = self.emulator.run("modprobe --version")
         self.assertEqual(ret, 0)
         self.assertTrue(out[0].startswith("kmod version"))
+        self.assertIn("+ZSTD", out[1])
 
         # List modules with "kmod list", the virtio-net module should
         # NOT be loaded yet.
@@ -61,6 +68,7 @@ class TestKmod(infra.basetest.BRTest):
         lsmod_out = "\n".join(out)
         self.assertRegex(lsmod_out, r'name: *virtio_net')
         self.assertRegex(lsmod_out, r'description: *Virtio network driver')
+        self.assertRegex(lsmod_out, r'filename:\s+/.*/virtio_net.ko.zst')
 
         # With this test configuration, we are not supposed to have an
         # eth0 Ethernet interface yet. Attempting to show info on this
diff --git a/support/testing/tests/package/test_kmod/compressed-modules.fragment b/support/testing/tests/package/test_kmod/compressed-modules.fragment
new file mode 100644
index 0000000000..2471adebbd
--- /dev/null
+++ b/support/testing/tests/package/test_kmod/compressed-modules.fragment
@@ -0,0 +1,3 @@
+CONFIG_MODULE_COMPRESS=y
+CONFIG_MODULE_COMPRESS_ZSTD=y
+CONFIG_MODULE_COMPRESS_ALL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
