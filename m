Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C8AC48BF6
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 17:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 368278218E;
	Sun, 18 Feb 2024 17:26:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rXh6w2Yrromt; Sun, 18 Feb 2024 17:25:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EAA58218F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EAA58218F;
	Sun, 18 Feb 2024 17:25:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B81621BF396
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 17:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B31728218F
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 17:25:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E2XVz-zjRXm0 for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 17:25:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6D6EE8218E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D6EE8218E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D6EE8218E
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 17:25:55 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id C3EEB13F846;
 Sun, 18 Feb 2024 18:25:51 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 Feb 2024 18:25:47 +0100
Message-ID: <20240218172547.262368-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708277153;
 bh=wzELClp5zPYr+I6rzPEbrkPTQqk0rfb9zQDS2pEHQBA=;
 h=From:To:Cc:Subject:Date:From;
 b=ZeqlvTEflq6x6nLZUHPSpo6dHP902idd1a776G4XaTPi6zq4Q4mMM4IXtODh1ncQR
 JblxYM2cki0yIusvAjlSyfuyUGZP9yz6DKOTgf2gz8JBBMvFdnwBWqbmMEljNwjstU
 IL1Il2QYoWKAkWA5Yg1gfvccouGuy+qWSTSsEcxPf0EouE90DYnx0NQnn8321YIoNB
 Kq2AzQjpi2wyf4h0layJ81FsKO43dFIQ1xAduOBf85PhXhbkq6jFPVtHq9vtTdip4N
 kWe5yksONIwxmDWeWGLBMvx2Tp/Sp87aq73nI7QRfXoSIK2PPGMCW77Oh9jU1rjGle
 CQoAQT1snR9gQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZeqlvTEf
Subject: [Buildroot] [PATCH 1/1] support/testing: add sox runtime test
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
 DEVELOPERS                                |  1 +
 support/testing/tests/package/test_sox.py | 74 +++++++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 support/testing/tests/package/test_sox.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 0d12c3abcb..34dc87e98f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1848,6 +1848,7 @@ F:	support/testing/tests/package/test_rdma_core.py
 F:	support/testing/tests/package/test_rdma_core/
 F:	support/testing/tests/package/test_screen.py
 F:	support/testing/tests/package/test_sed.py
+F:	support/testing/tests/package/test_sox.py
 F:	support/testing/tests/package/test_sqlite.py
 F:	support/testing/tests/package/test_strace.py
 F:	support/testing/tests/package/test_stress_ng.py
diff --git a/support/testing/tests/package/test_sox.py b/support/testing/tests/package/test_sox.py
new file mode 100644
index 0000000000..74f784a36f
--- /dev/null
+++ b/support/testing/tests/package/test_sox.py
@@ -0,0 +1,74 @@
+import math
+import os
+
+import infra.basetest
+
+
+class TestSox(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_AUBIO=y
+        BR2_PACKAGE_SOX=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def note_from_freq(self, freq):
+        """Return a note number from the input frequency in Hertz."""
+        return round((12 * math.log(freq / 440) / math.log(2)) + 69)
+
+    def check_audio_note(self, input_file, expected_note):
+        """Check the input_file include the expected_note."""
+        out, ret = self.emulator.run(f"aubionotes {input_file}", timeout=20)
+        self.assertEqual(ret, 0)
+        note_found = False
+        for line in out:
+            values = line.split()
+            if len(values) == 3:
+                note = round(float(values[0]))
+                if note == expected_note:
+                    note_found = True
+        self.assertTrue(note_found, "The expected note was not found")
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Check the program can execute.
+        self.assertRunOk("sox --version")
+
+        freq = 440  # General Midi note A3
+        expected_note = self.note_from_freq(freq)
+        wav_file = "ref.wav"
+        tmpwav_file = "tmp.wav"
+
+        # Generate a sinusoidal tone.
+        cmd = "sox -V -r 48000 -n -b 16 -c 1"
+        cmd += f" {wav_file} synth 3 sin {freq} vol -10dB"
+        self.assertRunOk(cmd)
+
+        # Compute statistics on the generated file.
+        self.assertRunOk(f"sox {wav_file} -n stat")
+
+        # We check the generated wave file includes the expected note.
+        self.check_audio_note(wav_file, expected_note)
+
+        # We resample the reference file.
+        cmd = f"sox -V {wav_file} -r 22050 {tmpwav_file}"
+        self.assertRunOk(cmd)
+
+        # We should still detect our expected note.
+        self.check_audio_note(tmpwav_file, expected_note)
+
+        # We convert the file by changing the speed by a factor.
+        speed_factor = 2
+        cmd = f"sox -V {wav_file} {tmpwav_file} speed {speed_factor}"
+        self.assertRunOk(cmd)
+
+        # We compute the new expected note from this test controller
+        # side, and check we detect this new note in the audio file.
+        new_expected_note = self.note_from_freq(freq * speed_factor)
+        self.check_audio_note(tmpwav_file, new_expected_note)
-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
