Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD7ACCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 13:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A282461AED;
	Fri,  1 May 2026 13:10:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m_SY5Vuwul0T; Fri,  1 May 2026 13:10:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F79961B12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777641049;
	bh=WWod0e/fOxkevwKASSmGnDBdS6RQ1yb0q5VEkqUK0E4=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=emdrjGe0+p7nId8EPzm+xYem9rFU4uPqSEEQ79TLLt6rXm/XeR6l+BLCFSbLOigtk
	 Y6UXDLykvJIgCeldrTyCOxB1OgsJ0A7A248l0BWdPfU4IAfX6/pcc2rg7rASEWZPK6
	 dl1sIgFljvBAUreV/baj4TI/8Gn4XMLhPwIsBU4pJoRILB2wQUmx18mCGG30o6nixV
	 bhMwgdLuzbeSaZVIqii+4f9qBx6lxKtR5rAEnlJA4SdCayWXB0H0Js/U6jCh+GVSGc
	 dYLGFr6qtkbkqy1uZMVwBuA4xcbpck5FLzmJNNM907vTty2tb8lqZu3MHg0vj6ewub
	 2JDNdAheu5yrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F79961B12;
	Fri,  1 May 2026 13:10:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D9A38293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 13:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D72D385592
 for <buildroot@buildroot.org>; Fri,  1 May 2026 13:10:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jn_WVMx1ZBv6 for <buildroot@buildroot.org>;
 Fri,  1 May 2026 13:10:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 60DD78558B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60DD78558B
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60DD78558B
 for <buildroot@buildroot.org>; Fri,  1 May 2026 13:10:46 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWASY-1vqoEp0ruM-00I4DI; Fri, 01
 May 2026 15:10:45 +0200
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 15:10:30 +0200
Message-ID: <20260501131030.1109367-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260501131030.1109367-1-fiona.klute@gmx.de>
References: <20260501131030.1109367-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:iq/mPvFQeuqh95p//sHG6zRznlOkUwMu0sOmjm2eWDrFQuA4mEM
 kuw2vT4fOgoc2zuww/1wAgIUXns2YEjntbhBJU34RvlUzZMYImVJlYaBlD3t327MqP1JmYT
 rLYZoMFQ+ESNf9OfcIWm13rkm4rmC43+cZ/otoSmmwIwxAtFSdS1YE7r4t0QDP27Nzy2JZH
 OOFwL6seyyNYIcGeyvYAw==
UI-OutboundReport: notjunk:1;M01:P0:xsRE3rbpLTU=;EFiPBYaPwKinLWSmD1hVnUgOHwe
 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
 NQxjJGYroKJzHV5bup29wCkD+l8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777641045; x=1778245845; i=fiona.klute@gmx.de;
 bh=HBsLFG4Gx9cBrENNT20/SsNusW2ppR0x66X4NgNscUg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=SyREflKgQ3mnqDISym2Xdt0V53EJmgTXSHXo51BX0X8fgtZz3tdMOcbju0OnMPOo
 0uYUN7tCqW6zFA5yiDbks8LfMDP+H3nptWbOucsWrEXZhO9Hoo/mW7kObtbwDXedR
 PiLPW2ppyFwx4H2pHV9g88Sa7jZynLZo5LXyPwi1EAv1URJ9syaYVKMR9ZdHassiI
 Pc42m/IOZaMlUs3pcU+KUVXHaksbyn04bOI6ff0n8o+Ab0398F45zHZB81WCfhU9N
 S8N5wGrIiGYSPPMUro9X58SIlzbWNHDtG5JeWCYFI4e5PmmwPRDGtBOkt2+Oma0Fb
 5Kv5sBpNZzDzclEfLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=SyREflKg
Subject: [Buildroot] [PATCH v2 2/2] package/kmod: enable dlopen() for
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Julien Olivain <ju.o@free.fr>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With dlopen() enabled, kmod will load compression libraries only if
actually needed (loading compressed modules into the kernel does not
if the kernel can handle decompression, depending on its
configuration), and only the needed one.

Use compressed modules in the kmod test without enabling in-kernel
decompression to verify decompression in kmod works.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* extend test to cover compressed module handling

v1: https://patchwork.ozlabs.org/project/buildroot/patch/20260425085657.474422-6-fiona.klute@gmx.de/

 package/kmod/kmod.mk                           |  4 ++++
 support/testing/tests/package/test_kmod.py     | 18 +++++++++++++-----
 .../test_kmod/compressed-modules.fragment      |  3 +++
 3 files changed, 20 insertions(+), 5 deletions(-)
 create mode 100644 support/testing/tests/package/test_kmod/compressed-modules.fragment

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
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
