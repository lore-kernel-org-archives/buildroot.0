Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FE3D36136
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 20:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3C9C80FB9;
	Tue,  5 Nov 2024 20:20:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jz5g0a-Ufsy1; Tue,  5 Nov 2024 20:20:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA0A080FDE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA0A080FDE;
	Tue,  5 Nov 2024 20:20:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 22C303B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 20:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10E9440664
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 20:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t6RSM_wLflQo for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 20:20:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9C7D740668
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C7D740668
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C7D740668
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 20:20:52 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C6C05B0051B;
 Tue,  5 Nov 2024 21:20:46 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Julien Olivain <ju.o@free.fr>
Date: Tue,  5 Nov 2024 21:20:39 +0100
Message-ID: <20241105202039.2556992-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730838051;
 bh=y/9Lc3WyD9CKGF7lWNaNfarb6RXm+IX3XIs2T5vi9Pk=;
 h=From:To:Cc:Subject:Date:From;
 b=ElR2DSezJRn0UntryOfJM9kW2SiPF2/09UNjk4BHsOOZ0BP/OWW6mha73a3KhcIE1
 NryOmcC7oSGZ06mby5dai1l+jAze6l1Z3zlw+I3RH9CvrsiP4DIOpKA4ZngXZ22X4P
 P5Co8UYXrBM1T+ziR7oYmusnKx/hKwy68UvtfFufSNcJVSltrF2kTFXAQym4CN480U
 MI+Yo11CO8U8htT+MMZ66gE2kYClMDF5oJ9/v7LrOIxo8h4RvzBEGP/3yBOeSpOYq+
 z/pqiLUrISDh/lXvdirqamqtQdJMaayk4DPv8PYwHxbeF/8hw6FM9PGVqJJlEYYYin
 giE/Fy78Zw3jw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ElR2DSez
Subject: [Buildroot] [PATCH 1/1] support/testing/infra/emulator.py: add qemu
 version in run log
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In some specific situations, there is subtle bugs which depends on a
specific Qemu emulator version and the code it runs.

For example, EDK2 on Aarch64 could work with specific versions of Qemu,
EDK2 and ATF. See commit cc0823c2d "boot/edk2: bump to version
edk2-stable202405" [1].

Also, some Qemu bugs made the guest OS crash. See for example commit
9534b9c00 "package/qemu: fix qemu 9.x issue for AArch32 Secure
PL1&0" [2].

Commit 0d4177598 "support/testing/infra/emulator.py: add build host
dir to qemu search path" added the ability for a runtime test to
select host-qemu in order to use it. It is also possible for a user
to use the "utils/run-tests" script on its host system providing its
own version of Qemu. The Buildroot CI can also use its Qemu version
included in the reference Docker image.

This means the Qemu emulator for running a runtime test can be from
several sources:
- Buildroot Docker reference image,
- Buildroot host-qemu package version,
- Developer host OS qemu version.

Those versions can also change in time.

In order to help debugging of those subtle emulator bugs, this commit
adds a recording of the actual Qemu version used to run a test.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/cc0823c2d14321b91b94801834050331f5ea28e1
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/9534b9c00c23cfd69a4e122c26fca9d3da93d329
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/0d4177598ce7e73f2b97ac58c21fb177343643e3

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/infra/emulator.py | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 238e123302..ef5be2a19e 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -116,15 +116,21 @@ class Emulator(object):
         ldavg_str = f"{ldavg[0]:.2f}, {ldavg[1]:.2f}, {ldavg[2]:.2f}"
         self.logfile.write(f"> host loadavg: {ldavg_str}\n")
         self.logfile.write(f"> timeout multiplier: {self.timeout_multiplier}\n")
-        self.logfile.write("> starting qemu with '%s'\n" % " ".join(qemu_cmd))
+        self.logfile.write(f"> emulator using {qemu_cmd[0]} version:\n")
         host_bin = os.path.join(self.builddir, "host", "bin")
         br_path = host_bin + os.pathsep + os.environ["PATH"]
+        qemu_env = {"QEMU_AUDIO_DRV": "none",
+                    "PATH": br_path}
+        pexpect.run(f"{qemu_cmd[0]} --version",
+                    encoding='utf-8',
+                    logfile=self.logfile,
+                    env=qemu_env)
+        self.logfile.write("> starting qemu with '%s'\n" % " ".join(qemu_cmd))
         self.qemu = pexpect.spawn(qemu_cmd[0], qemu_cmd[1:],
                                   timeout=5 * self.timeout_multiplier,
                                   encoding='utf-8',
                                   codec_errors='replace',
-                                  env={"QEMU_AUDIO_DRV": "none",
-                                       "PATH": br_path})
+                                  env=qemu_env)
         # We want only stdout into the log to avoid double echo
         self.qemu.logfile_read = self.logfile
 
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
