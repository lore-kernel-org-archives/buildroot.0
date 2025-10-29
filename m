Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE59CCF9EB
	for <buildroot@archiver.kernel.org>; Wed, 29 Oct 2025 20:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9029882311;
	Wed, 29 Oct 2025 20:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id adqGgaoE3V5K; Wed, 29 Oct 2025 20:23:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91DE582314
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91DE582314;
	Wed, 29 Oct 2025 20:23:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D7AF022F
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 20:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C977A409DE
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 20:23:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L2zLhmflhOJa for <buildroot@buildroot.org>;
 Wed, 29 Oct 2025 20:23:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0DBCE40919
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DBCE40919
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0DBCE40919
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 20:23:41 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:7427:ac55:2702:f075])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C548960128;
 Wed, 29 Oct 2025 21:23:36 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 29 Oct 2025 21:23:31 +0100
Message-ID: <20251029202331.16192-1-ju.o@free.fr>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761769419;
 bh=ief/K2NR5uJuE8aUOGSuiIkNojNDkpQ4ep1OKyi+LEo=;
 h=From:To:Cc:Subject:Date:From;
 b=PHlzRlKGJUf48r/cOMUDTwp6DhFUX+uVHsNB+Fe28Slr18SEosgoTcafSdCqj/Ipg
 QdwosuIiQhXiiDj/0Er0DQOXgsT7jF/tIdoWR3npONvftYdWiYDOJtknKb6ZA2kq7u
 4t64ygRTI2KnR9xaB1+tZ01RrrHlwkL47w+4B+vGdnjnaPLiHBH3uxW2ar7FD0H5eD
 7kSP30kKxo9K/SWxrRv1PYJsNGrHEX69CKZ7sdc8yTe2yWbl2/oWTaJl4LvaXdv2MI
 bwpUr9d5tQMs/9GFXvVq+gxThhEBzkCTEuBgSDX31+AV2QbSs/GkDCug4eIh1p5XBS
 wSTrTR/zvJtOQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PHlzRlKG
Subject: [Buildroot] [PATCH 1/1] support/testing: llama-cpp: new runtime test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cc: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                    |  1 +
 .../testing/tests/package/test_llama_cpp.py   | 79 +++++++++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 support/testing/tests/package/test_llama_cpp.py

diff --git a/DEVELOPERS b/DEVELOPERS
index f5c8b832f8..337b2c7ba3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1943,6 +1943,7 @@ F:	support/testing/tests/package/test_libjxl.py
 F:	support/testing/tests/package/test_lighttpd.py
 F:	support/testing/tests/package/test_links.py
 F:	support/testing/tests/package/test_links/
+F:	support/testing/tests/package/test_llama_cpp.py
 F:	support/testing/tests/package/test_lrzip.py
 F:	support/testing/tests/package/test_lrzsz.py
 F:	support/testing/tests/package/test_ltp_testsuite.py
diff --git a/support/testing/tests/package/test_llama_cpp.py b/support/testing/tests/package/test_llama_cpp.py
new file mode 100644
index 0000000000..4462be0a5b
--- /dev/null
+++ b/support/testing/tests/package/test_llama_cpp.py
@@ -0,0 +1,79 @@
+import os
+
+import infra.basetest
+
+
+class TestLlamaCpp(infra.basetest.BRTest):
+    config = """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_SYSTEM_DHCP="eth0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.55"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_PACKAGE_CA_CERTIFICATES=y
+        BR2_PACKAGE_OPENSSL=y
+        BR2_PACKAGE_LIBCURL=y
+        BR2_PACKAGE_LIBCURL_CURL=y
+        BR2_PACKAGE_LLAMA_CPP=y
+        BR2_PACKAGE_LLAMA_CPP_TOOLS=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="1024M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+    """
+
+    def login(self):
+        img = os.path.join(self.builddir, "images", "rootfs.ext2")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(
+            arch="aarch64",
+            kernel=kern,
+            kernel_cmdline=["root=/dev/vda", "console=ttyAMA0"],
+            options=[
+                "-M", "virt",
+                "-cpu", "cortex-a57",
+                "-smp", "4",
+                "-m", "2G",
+                "-drive", f"file={img},if=virtio,format=raw",
+                "-net", "nic,model=virtio",
+                "-net", "user"
+            ]
+        )
+        self.emulator.login()
+
+    def test_run(self):
+        self.login()
+
+        # Check the program can execute.
+        self.assertRunOk("llama-cli --version")
+
+        # We define a Hugging Face model to be downloaded.
+        # We choose a relatively small model, for testing.
+        hf_model = "ggml-org/gemma-3-270m-it-GGUF"
+
+        # We define a common knowledge question to ask to the model.
+        prompt = "What is the capital of the United Kingdom?"
+
+        # We define an expected keyword, to be present in the answer.
+        expected_answer = "london"
+
+        # We set few llama-cli options:
+        # We don't want an interactive session
+        llama_opts = "--single-turn"
+        llama_opts += " --no-display-prompt"
+        # We set a fixed seed, to reduce variability of the test
+        llama_opts += " --seed 123456789"
+        llama_opts += f" --hf-repo {hf_model}"
+        llama_opts += f" --prompt '{prompt}'"
+
+        # Run the command. We suppress all stderr output logs to get
+        # only the answer. Remove the redirection for debugging.
+        cmd = f"llama-cli {llama_opts} 2>/dev/null"
+        out, ret = self.emulator.run(cmd, timeout=60)
+        self.assertEqual(ret, 0)
+        out_str = "\n".join(out).lower()
+        self.assertIn(expected_answer, out_str)
-- 
2.51.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
