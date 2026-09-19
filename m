Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5107BC982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 21:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 424978111A;
	Sat, 19 Sep 2026 21:36:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z3laZw4nUem7; Sat, 19 Sep 2026 21:36:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E41C6810AE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789853768;
	b=MVt8DipNxsnt3MuYqXjrwEnKuZBxG2gxrNGsmrctTZJS23bVzMGW672MhoWhkyZG461p
	 zhghXVkzg1L1NCM0aZZVy31LxbKeom1H8qZwCZIbIPgjX5/8nMmm3okkUUZNeacF4qh0U
	 Ml0wK+cA8KSjtUMDm77QWXge1Fy8u9YsW3n3cEwEOqZ1j5p0Hj7hTidhx1E7nvRTBMPKg
	 P8MvUCn9JbCpeRhHL7Xn1P5U/TBCoyVwBR9oUiweOYp+z0RHtGQYg7WxGcLnXRQ5MlEso
	 1ISnVpxUllSlw72rxKtcVzdxZZI72a0is4g84LAlfZvCo9FxZHZDcnx3Hd2WnJ8lswg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789853768;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=epxUJn5Rgu1nx9GZBtjd8x5HsC95RtebXnN9vVRp+VU=;
	b=nqceeuJgPl2BRJcR0NxY0U7MmduYwx1/Bt2S2d8anNb9LZ/m3hbjpppb666Ne/rQTTvD
	 OAVAzRF8WwYX3ygB1YODaIHE+64n0btMKckS6cWsWDR00NmHmCpYXBsPH5qcz4m2roCdR
	 fKtfh/5lmnUU6hnTJxO0tbx/6134EEJCZpWrrUHF6eKYRsZ3gdh4kYJRe9wXitTTZkkN4
	 RQDBLLoKzWf16DhHrCyY46tox//n6b8Uacwgoe9YCjhiybB+NrN/Bm5gtGvZNWluOgeXO
	 tzonGM9gzTrJ1psW1YHATKo44SZqdVJIMdXT7DLw3pTrmArbAmG7h9WCBFvEpnh73PA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789853768;
	bh=epxUJn5Rgu1nx9GZBtjd8x5HsC95RtebXnN9vVRp+VU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DgwmjH4ZrEECXWQpvpiUlBJylmxGLABKBw36n3s5akl9aTxN9eFDc++I2Wg7DnoEJ
	 6MI0VMyq8Nd2ym52WaTYHVdpsKrQm5HbkX9mq6366CUKssjl+9orqkmkPJtji1ONDj
	 UlBqTXkjBYlt3420q+ElYn3bZiuNjR0rNtCffQg5tAB8QdVcUEHkh73cdYdhHCv0Ei
	 493U/hwC78+cLkcWui6G/wXOUmqKr/MD9mEyuEggrZJpQCmfCXdQSclkDgEtW4RUMK
	 omHvmvAR8cSKCam/mqxgeuCLGMaiw0Z+UdNYx24U4ku0nuro+orpT0v3yBYB2s4FNn
	 i+sM7a97Rejog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E41C6810AE;
	Sat, 19 Sep 2026 21:36:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C49F13D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 21:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8210F60665
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 21:36:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xdVsOZRsQykh for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 21:36:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3D7BB60661
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789853765;
 b=Ai8YQzaHuAxb7Vuv/ZYu6kBcGlPGTItKqP33KnfwJb0hiSxLQ4RokmVic4nWl4WjhEjX
 yzNR3vUVi8xz1uvwLLsLlXhAcJdnHsCrz7KwFooLV0Vwk0NBmzUPb+SCdgr3vvfjw3jQm
 3A/z6Uf5YmxOC9WoXbm50f3SmxBbVQuHnGkvo7tJ+P3NRWNnCVP8OfDmmV4aQy9h4L2Wd
 FRyPYYUYBx5ykxAzyo6cWzTuBYZhy0i+t4xDO3DTNoDl6hA/esTGynFVENi6jsw9sJlFk
 t00TUSoNZyfjmoN0ZWI6Jy8FNbXgmiAVW2IDNvT1UiRUt48dw70EQnc0tai8pkaUyJA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789853765;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=IU8FiuV0LQAVcPD4ODvUD8MhJ8LmniA7WBuqrGbwYF0=;
 b=KTPxKWTZ9i9QsTWgX8NLpqSc+75RakWAX4DXDnkC79RSSI40kYeFKrOqj1lD1XbrrWmR
 4u2ffLO9niT1oK4ud5HpyCfgHxVLH3ph6laRBQcShSWUQiaQ3jAVfh+BbsFgD6JOpWzJ9
 wzcz+Wzj84RhhZzpqzzQjegGsbAAGOLVA2Ln0fUPk5x/ve7Rz6Sa1obvYyHucvfr51OQS
 e+qvuW17d+A2LHOjeQxNZdpLLvWzW0cP/hzYyc3/qmaW2aD9mYmHl9QYXZidVv9ncpYpo
 EmFByp3aGE4k+M+Lq3CCEoS+a2wG0STI1XGsoJp0yc39W6CDsurNFiLlNxNqQshSIPw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=nG27fnEx; 
 arc=none smtp.remote-ip=212.227.15.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D7BB60661
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 21:36:04 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N5VDE-1wjZ0N0O2U-018N5c; Sat, 19
 Sep 2026 23:36:01 +0200
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Sat, 19 Sep 2026 23:35:42 +0200
Message-ID: <20260919213542.1294729-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919213542.1294729-1-fiona.klute@gmx.de>
References: <20260919213542.1294729-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:+nwvZvOL+LaxEU16Xg4rMAjMYTxkZGsAMxXPwMuIb4QpjIPVAmL
 iMGeNn0UKEz4DIE7iWddylQKtMdibcv9FNeq9AX071meHZwPfgQyHu0xkd9ZiLRWjFTzOgC
 os+5wZ80GTwF3SQB8h83ws20+nzWY0UfeUgKx7bAmyOmKHX8iGWJ5hlJ74YkyPkxnk9TJ4M
 /xxtNQ6dwf0RgG/oSDPfg==
UI-OutboundReport: notjunk:1;M01:P0:7k8P/j1tF9A=;XUjbEGdn3Sqvz+Z0dr0wVq8HjrF
 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
Subject: [Buildroot] [PATCH v3 3/3]
 support/testing/tests/fs/test_squashfs.py: add test with dm-verity
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

This test uses the option added in the previous commits to build a
disk image with squashfs root and matching verity tree, and boots from
it. Building a kernel is necessary to get the required device-mapper
and squashfs support.

The test also serves to demonstrate usage of a verity image, more
complex setup may use an initramfs instead of dm-mod.create.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* use BR2_TARGET_ROOTFS_SQUASHFS_VERITY_EXTRA_ARGS to set hash
  algorithm and check if the value was used
* update kernel to 6.18.52

 support/testing/tests/fs/test_squashfs.py     | 90 +++++++++++++++++++
 .../fs/test_squashfs/genimage-verity.cfg      | 14 +++
 .../fs/test_squashfs/linux-verity.fragment    |  8 ++
 3 files changed, 112 insertions(+)
 create mode 100644 support/testing/tests/fs/test_squashfs/genimage-verity.cfg
 create mode 100644 support/testing/tests/fs/test_squashfs/linux-verity.fragment

diff --git a/support/testing/tests/fs/test_squashfs.py b/support/testing/tests/fs/test_squashfs.py
index 0ceb4cab58..62ae8d6c7c 100644
--- a/support/testing/tests/fs/test_squashfs.py
+++ b/support/testing/tests/fs/test_squashfs.py
@@ -1,4 +1,5 @@
 import os
+import re
 
 import infra.basetest
 
@@ -55,3 +56,92 @@ class TestSquashfsMaxBlocksize(TestSquashfs):
         # BR2_TARGET_ROOTFS_TAR is not set
         """
     expected_blocksize_in_bytes = 1024*1024
+
+
+class TestSquashfsVerity(infra.basetest.BRTest):
+    kernel_fragment = \
+        infra.filepath("tests/fs/test_squashfs/linux-verity.fragment")
+    genimage_config = \
+        infra.filepath("tests/fs/test_squashfs/genimage-verity.cfg")
+    hash_algo = "sha384"
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.52"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kernel_fragment}"
+        BR2_TARGET_ROOTFS_SQUASHFS=y
+        BR2_TARGET_ROOTFS_SQUASHFS4_LZO=y
+        BR2_TARGET_ROOTFS_SQUASHFS_VERITY=y
+        BR2_TARGET_ROOTFS_SQUASHFS_VERITY_EXTRA_ARGS="--hash {hash_algo}"
+        BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+        BR2_ROOTFS_POST_SCRIPT_ARGS="-c {genimage_config}"
+        BR2_PACKAGE_CRYPTSETUP=y
+        BR2_PACKAGE_HOST_GENIMAGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self) -> None:
+        img = os.path.join(self.builddir, "images", "rootfs.squashfs")
+        hash_img = f"{img}.verity"
+        root_hash_file = f"{hash_img}.root-hash"
+        verify_cmd = [
+            "host/sbin/veritysetup", "verify",
+            "--root-hash-file", root_hash_file, img, hash_img
+        ]
+        infra.run_cmd_on_host(self.builddir, verify_cmd)
+
+        dump_cmd = ["host/sbin/veritysetup", "dump", hash_img]
+        out = infra.run_cmd_on_host(self.builddir, dump_cmd)
+        params = dict()
+        for line in out.splitlines():
+            m = re.match(r"^(.*):\s+(\S+)", line)
+            if m is None:
+                continue
+            params[m.group(1)] = m.group(2)
+
+        data_block_size = int(params["Data block size"])
+        data_blocks = int(params["Data blocks"])
+        sector_size = 512  # default
+        data_sectors = data_blocks * data_block_size // sector_size
+        hash_algorithm = params["Hash algorithm"]
+        hash_start_block = 1  # skip header
+        hash_block_size = int(params["Hash block size"])
+        salt = params["Salt"]
+        with open(root_hash_file) as fh:
+            root_hash = fh.read()
+
+        # check if setting --hash in
+        # BR2_TARGET_ROOTFS_SQUASHFS_VERITY_EXTRA_ARGS worked
+        self.assertEqual(hash_algorithm, self.hash_algo)
+
+        disk_img = os.path.join(self.builddir, "images", "disk.img")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(
+            arch="aarch64",
+            kernel=kern,
+            kernel_cmdline=[
+                "console=ttyAMA0",
+                "root=/dev/dm-0",
+                "rootfstype=squashfs",
+                f'dm-mod.create="verity,,,ro,0 {data_sectors} verity 1 '
+                f'/dev/vda1 /dev/vda2 {data_block_size} {hash_block_size} '
+                f'{data_blocks} {hash_start_block} {hash_algorithm} '
+                f'{root_hash} {salt}"',
+            ],
+            options=[
+                "-M", "virt", "-cpu", "cortex-a57", "-m", "256M",
+                "-drive", f"file={disk_img},if=virtio,format=raw",
+            ])
+        self.emulator.login()
+
+        self.assertRunOk("mount | grep '/dev/root on / type squashfs'")
+        out, ret = self.emulator.run("dmsetup info verity", 5)
+        self.assertEqual(ret, 0)
+        state = next(filter(lambda s: s.startswith("State:"), out))
+        self.assertRegex(state, r"^State:\s+ACTIVE \(READ-ONLY\)$")
diff --git a/support/testing/tests/fs/test_squashfs/genimage-verity.cfg b/support/testing/tests/fs/test_squashfs/genimage-verity.cfg
new file mode 100644
index 0000000000..13761dca8e
--- /dev/null
+++ b/support/testing/tests/fs/test_squashfs/genimage-verity.cfg
@@ -0,0 +1,14 @@
+image disk.img {
+	hdimage {
+	}
+
+	partition root {
+		partition-type = 0x83
+		image = "rootfs.squashfs"
+	}
+
+	partition verity {
+		partition-type = 0x83
+		image = "rootfs.squashfs.verity"
+	}
+}
diff --git a/support/testing/tests/fs/test_squashfs/linux-verity.fragment b/support/testing/tests/fs/test_squashfs/linux-verity.fragment
new file mode 100644
index 0000000000..a559a51ee2
--- /dev/null
+++ b/support/testing/tests/fs/test_squashfs/linux-verity.fragment
@@ -0,0 +1,8 @@
+CONFIG_MD=y
+CONFIG_BLK_DEV_DM=y
+CONFIG_DM_VERITY=y
+CONFIG_DM_INIT=y
+CONFIG_CRYPTO_SHA512=y
+CONFIG_MISC_FILESYSTEMS=y
+CONFIG_SQUASHFS=y
+CONFIG_SQUASHFS_LZO=y
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
