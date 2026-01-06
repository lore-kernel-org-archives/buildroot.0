Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A9ECEFD1E
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 23:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7884980ABE;
	Tue,  6 Jan 2026 23:11:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nMm-CvZf26B4; Tue,  6 Jan 2026 23:11:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CDB980A7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767741093;
	bh=hG702kr5nE6vNnYaG08G/jrC5n7cCdI2HfyU4pe8PVA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=W6Jx6v5glehHFRxhLlpQ29GpllqR8UPqRx3Z85kauYGLwEPw+1jbWzKVCO31z4CjG
	 pdZIUzIdklgyOsMVRS68A44PR2Mzh6vb0sJwtk5R1XvbbsyLboC89P1O/bb4sB5Bj7
	 ZijHKcEG0KHmKmIHBtzi80vn7wYeoVpGm75Jl+m2NrdbiqsqCe5i3vKfVHEPtwaeCA
	 yHP9rPCnyW9JfoBQbSS69CyD2QLC9mkxZjooG8QX5wjPyfkipLvXLAo/tdLy5wI2iy
	 qCTPSx0vxPPzKDqNZQgepKuezjHbAfZnfPe2cJA1hCNwCOwhtMTsJcMe36x+HgNaAk
	 eS+yfOWPKdjyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CDB980A7A;
	Tue,  6 Jan 2026 23:11:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E6792A3
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 23:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14ECF407A6
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 23:11:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AVFB8axcaNVS for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 23:11:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E17BC407A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E17BC407A5
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E17BC407A5
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 23:11:29 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 45DD319F754;
 Wed,  7 Jan 2026 00:11:24 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Alexander Shirokov <shirokovalexs@gmail.com>
Date: Wed,  7 Jan 2026 00:11:10 +0100
Message-ID: <20260106231110.991548-1-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767741086;
 bh=gXX2a9wH9LirnS6GPjvJWXyNov37vESar27wI0+m7AM=;
 h=From:To:Cc:Subject:Date:From;
 b=KsFIMesvDAPJ4SrscNToVq6w3+Q0ZK7gqxUl4stFSuQZJX8N+W5Ob81eSNO1HpALg
 xZ8Ti8N8EU5eH46norK9g4RqgbBTMWzTg6O0lq5Y5Lkk+l4dpbz2nsbIg6UukipUYm
 64nFvRZ2mEWd9l3rRiRUnqdq0WNx+8jPku82LfDxmiBY0bitaXORvWOgFlnUTaXtal
 IPG7eEK6/2vX0WTyS096CdgNu+Aw06Nt3Rw1D0IgRhtBnsyCMQtW3vLh2wfqOZKQkX
 sMq6wJstHXg9dvOdQAcJZZqhJ3xrX1YVrFUifgB15TImqek4nGHaohM6hcxwJUF/wE
 ox3AcP0CV/BWQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=KsFIMesv
Subject: [Buildroot] [PATCH 1/1] support/testing: add aichat runtime test
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

Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/12624150651
---
 DEVELOPERS                                    |   2 +
 support/testing/tests/package/test_aichat.py  | 108 ++++++++++++++++++
 .../root/.config/aichat/config.yaml           |  11 ++
 3 files changed, 121 insertions(+)
 create mode 100644 support/testing/tests/package/test_aichat.py
 create mode 100644 support/testing/tests/package/test_aichat/rootfs-overlay/root/.config/aichat/config.yaml

diff --git a/DEVELOPERS b/DEVELOPERS
index f982e3123a..0db91f6f40 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1870,6 +1870,8 @@ F:	support/testing/tests/package/test_4th.py
 F:	support/testing/tests/package/test_acl.py
 F:	support/testing/tests/package/test_acpica.py
 F:	support/testing/tests/package/test_acpica/
+F:	support/testing/tests/package/test_aichat.py
+F:	support/testing/tests/package/test_aichat/
 F:	support/testing/tests/package/test_apache.py
 F:	support/testing/tests/package/test_attr.py
 F:	support/testing/tests/package/test_audio_codec_base.py
diff --git a/support/testing/tests/package/test_aichat.py b/support/testing/tests/package/test_aichat.py
new file mode 100644
index 0000000000..7c978315c9
--- /dev/null
+++ b/support/testing/tests/package/test_aichat.py
@@ -0,0 +1,108 @@
+import json
+import os
+import time
+
+import infra.basetest
+
+
+class TestAiChat(infra.basetest.BRTest):
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_aichat/rootfs-overlay")
+    config = f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_SYSTEM_DHCP="eth0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.3"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_PACKAGE_AICHAT=y
+        BR2_PACKAGE_CA_CERTIFICATES=y
+        BR2_PACKAGE_LIBCURL=y
+        BR2_PACKAGE_LIBCURL_CURL=y
+        BR2_PACKAGE_LLAMA_CPP=y
+        BR2_PACKAGE_LLAMA_CPP_SERVER=y
+        BR2_PACKAGE_LLAMA_CPP_TOOLS=y
+        BR2_PACKAGE_OPENSSL=y
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
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
+            kernel_cmdline=["root=/dev/vda"],
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
+        self.assertRunOk("aichat --version")
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
+        # We set few llama-server options:
+        llama_opts = "--log-file /tmp/llama-server.log"
+        # We set a fixed seed, to reduce variability of the test
+        llama_opts += " --seed 123456789"
+        llama_opts += f" --hf-repo {hf_model}"
+
+        # We start a llama-server in background, which will expose an
+        # openai-compatible API to be used by aichat.
+        cmd = f"( llama-server {llama_opts} &>/dev/null & )"
+        self.assertRunOk(cmd)
+
+        # We wait for the llama-server to be ready. We query the
+        # available models API to check the server is ready. We expect
+        # to see the our model. We also add an extra "echo" to add an
+        # extra newline.
+        cmd = "curl http://127.0.0.1:8080/v1/models && echo"
+        for attempt in range(20 * self.timeout_multiplier):
+            time.sleep(5)
+            # To debug the llama-server startup, uncomment the
+            # following line:
+            # self.assertRunOk("cat /tmp/llama-server.log")
+            out, ret = self.emulator.run(cmd)
+            if ret == 0:
+                models_json = "".join(out)
+                models = json.loads(models_json)
+                model_name = models['models'][0]['name']
+                if model_name == hf_model:
+                    break
+        else:
+            self.fail("Timeout while waiting for llama-server.")
+
+        # We ask our question and check the expected answer is present
+        # in the output. We pipe the output in "cat" to suppress the
+        # aichat UTF-8 spinner (aichat stdout will not be a tty).
+        cmd = f"aichat '{prompt}' | cat"
+        out, ret = self.emulator.run(cmd, timeout=120)
+        self.assertEqual(ret, 0)
+        out_str = "\n".join(out).lower()
+        self.assertIn(expected_answer, out_str)
diff --git a/support/testing/tests/package/test_aichat/rootfs-overlay/root/.config/aichat/config.yaml b/support/testing/tests/package/test_aichat/rootfs-overlay/root/.config/aichat/config.yaml
new file mode 100644
index 0000000000..f6a054696e
--- /dev/null
+++ b/support/testing/tests/package/test_aichat/rootfs-overlay/root/.config/aichat/config.yaml
@@ -0,0 +1,11 @@
+# see https://github.com/sigoden/aichat/blob/main/config.example.yaml
+
+model: llama-server:ggml-org/gemma-3-270m-it-GGUF
+stream: false
+highlight: false
+clients:
+- type: openai-compatible
+  name: llama-server
+  api_base: http://127.0.0.1:8080/v1
+  models:
+  - name: ggml-org/gemma-3-270m-it-GGUF
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
