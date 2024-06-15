Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1AD8C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 09:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52AFD40103;
	Sat, 15 Jun 2024 09:16:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kzE1aSRYhBlt; Sat, 15 Jun 2024 09:16:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D52DD40189
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D52DD40189;
	Sat, 15 Jun 2024 09:16:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 681211BF30A
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 09:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54D0240189
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 09:16:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nr8UAKaHkv0p for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 09:16:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 056EA40103
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 056EA40103
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 056EA40103
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 09:16:25 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4040AB00583;
 Sat, 15 Jun 2024 11:16:21 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Jun 2024 11:16:11 +0200
Message-ID: <20240615091612.9579-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718442982;
 bh=XfGbPxcSYwwArkCd+GvnT5I+wtRtsDPV1gFyM4ktVqM=;
 h=From:To:Cc:Subject:Date:From;
 b=mkCjSEZ/7hAKFOBgPCNTIZB6wlZaWj0wIY6Ds14ElkqQFcMr/PeAtQtuqMFX5jrA+
 zt3HiG73i2tjfwrIId86epK1plSgTkLzCQw0EwbUtgF/rEj3oVLJhLXc00flJcQDZb
 LN+IapAu2UnuPonEag9kV6Ttg0xKRNkyrHbYEAMtPHUwdx8MQTQZKoiRvjW/roiUoT
 O0qzWw7QKEPxxByykniogIhdg11HV62EfxZt+DwvzZGURbLgLiebtf6+MeF9IDSv9H
 ugYn0bYIYuMTGbnWk+QoEKWticl8JQsBB5Z42cs0b3YLUEd/iXA0aogXQB90jtSyBG
 32KaVs5HUh0dw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=mkCjSEZ/
Subject: [Buildroot] [PATCH 1/2] support/testing: test_audio_codec_base.py:
 new helper class
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

This is a helper class providing a template for testing audio codec
programs such as lame mp3 encoder, flac tools, ogg vorbis-tools, ...

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                    |  1 +
 .../tests/package/test_audio_codec_base.py    | 86 +++++++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 support/testing/tests/package/test_audio_codec_base.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 52c9b84a9d4..44ff8c01e03 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1796,6 +1796,7 @@ F:	support/testing/tests/package/test_acl.py
 F:	support/testing/tests/package/test_acpica.py
 F:	support/testing/tests/package/test_acpica/
 F:	support/testing/tests/package/test_apache.py
+F:	support/testing/tests/package/test_audio_codec_base.py
 F:	support/testing/tests/package/test_bc.py
 F:	support/testing/tests/package/test_bitcoin.py
 F:	support/testing/tests/package/test_brotli.py
diff --git a/support/testing/tests/package/test_audio_codec_base.py b/support/testing/tests/package/test_audio_codec_base.py
new file mode 100644
index 00000000000..59c7efcad3c
--- /dev/null
+++ b/support/testing/tests/package/test_audio_codec_base.py
@@ -0,0 +1,86 @@
+import math
+import os
+
+import infra.basetest
+
+
+class TestAudioCodecBase(infra.basetest.BRTest):
+    """Common class to test an audio codec package.
+
+    This base class builds a Buildroot system image containing the
+    package enabled in its config, start the emulator, login to it. It
+    prepares an input test WAV file containing a tone. This WAV file
+    is encoded into a new output file in the native encoder format. It
+    is then decoded to a new output WAV file. This final output WAV
+    file is checked to contain the expected tone generated in the
+    initial input WAV file. There is no specific check about file
+    size, nor audio quality. The acceptance criteria is the
+    recognition of the tone. Note: the tone generation is made with
+    the Sox package, and the tone recognition is made with the Aubio
+    package.
+
+    Each test case that inherits from this class must have:
+    __test__ = True  - to let nose2 know that it is a test case
+    config           - defconfig fragment with the packages to run the test
+    encode_test()    - the function that runs the encoder and produces an
+                       encoded file.
+    decode_test()    - the function that runs the decoder and produces a
+                       decode file.
+    """
+    __test__ = False
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_AUBIO=y
+        BR2_PACKAGE_SOX=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    input_file = "reference.wav"
+    decoded_file = "decoded.wav"
+    tone_freq = 440  # General Midi note A3
+
+    def login(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+    def test_run(self):
+        self.login()
+        self.prepare_data()
+        self.encode_test(self.input_file)
+        self.decode_test(self.decoded_file)
+        self.check_test()
+
+    def prepare_data(self):
+        # Generate a sinusoidal tone.
+        cmd = "sox -V -r 48000 -n -b 16 -c 1 "
+        cmd += self.input_file
+        cmd += f" synth 3 sin {self.tone_freq} vol -10dB"
+        self.assertRunOk(cmd)
+
+    def encode_test(self, input_filename):
+        msg = "method must be implemented in derived class"
+        raise NotImplementedError(msg)
+
+    def decode_test(self, output_filename):
+        msg = "method must be implemented in derived class"
+        raise NotImplementedError(msg)
+
+    def note_from_freq(self, freq):
+        """Return a note number from the input frequency in Hertz."""
+        return round((12 * math.log(freq / 440) / math.log(2)) + 69)
+
+    def check_test(self):
+        expected_note = self.note_from_freq(self.tone_freq)
+        out, ret = self.emulator.run(f"aubionotes {self.decoded_file}", timeout=20)
+        self.assertEqual(ret, 0)
+        note_found = False
+        for line in out:
+            values = line.split()
+            if len(values) == 3:
+                note = round(float(values[0]))
+                if note == expected_note:
+                    note_found = True
+        self.assertTrue(note_found, "The expected note was not found")
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
