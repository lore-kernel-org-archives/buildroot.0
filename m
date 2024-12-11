Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A38E7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 17:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8534B8210D;
	Wed, 11 Dec 2024 17:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dvb3QzdgfgQT; Wed, 11 Dec 2024 17:00:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68E87820F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68E87820F7;
	Wed, 11 Dec 2024 17:00:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A3397ED2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 17:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83889610C4
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 17:00:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F9CuABenbmxg for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 17:00:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6417610BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6417610BD
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 17:00:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9066A86D4C; Wed, 11 Dec 2024 17:00:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Dec 2024 17:50:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ccc0f5642cf173bcc8d51f778331acfea9dbde8
X-Git-Newrev: ed9da089449c53519be02204f97c3452abba5cc3
X-Patchwork-Hint: ignore
Message-Id: <20241211170027.9066A86D4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/infra/emulator.py: add
 qemu version in run log
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ed9da089449c53519be02204f97c3452abba5cc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Romain Naour <romain.naour@smile.fr>
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
