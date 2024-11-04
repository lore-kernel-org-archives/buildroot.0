Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AE3D1CA01
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 22:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98FC160793;
	Mon,  4 Nov 2024 22:07:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A2rf3KlO1mw5; Mon,  4 Nov 2024 22:07:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A676607AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A676607AD;
	Mon,  4 Nov 2024 22:07:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E6157962
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 22:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E63266079D
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 22:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 23SW5_Si7K_B for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 22:06:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7456960793
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7456960793
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 22:06:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 622C085D09; Mon,  4 Nov 2024 22:06:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 4 Nov 2024 23:03:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c58a2a9687c045379c0f768c8c6c1c1a41842a85
X-Git-Newrev: 0d4177598ce7e73f2b97ac58c21fb177343643e3
X-Patchwork-Hint: ignore
Message-Id: <20241104220651.622C085D09@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/infra/emulator.py: add
 build host dir to qemu search path
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

commit: https://git.buildroot.net/buildroot/commit/?id=0d4177598ce7e73f2b97ac58c21fb177343643e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The relevant qemu emulator is started with pexpect.spawn() with a
default environment (and PATH). This will always use the qemu available
on the host. When running in the reference Docker image, it is using an
old Qemu v5.2.0. This version is getting too old to run with more
recent components, like EDK2 or ATF.

The main reason to use a qemu version preinstalled in the Docker image
was to save some build time. Also, this behavior is opposite to the
"start-qemu.sh" helper script [1], which tries to execute the
Buildroot host-qemu first (and then fallback the the version on the
host system, if available). An option was added in [2] to let the user
have a better control on which version is used.

Also, updating the Buildroot reference Docker image has a larger
impact on the whole project (i.e. updating the image would bring
a newer qemu version, but might break many other things, at a time
which is not always convenient).

We now need some kind of control in runtime tests, to choose between a
"stock" qemu, and a more recent version with all the bells and
whistles.

This commit adds the Buildroot host build directory in the path. This
will make the runtime test infrastructure to use a host-qemu, if
selected by a runtime test configuration.

For now, most of the test can continue to use the qemu version provided
in the Docker image. Only the problematic tests relying on a recent
version will select BR2_PACKAGE_HOST_QEMU=y. The host-qemu package is
usually maintained to a recent version, so this should be sufficient.

[1] https://gitlab.com/buildroot.org/buildroot/-/blob/master/board/qemu/start-qemu.sh.in
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/5de78f181acc53959b0a446a3fb116ecdec13577

Signed-off-by: Julien Olivain <ju.o@free.fr>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/infra/emulator.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 5318577cda..238e123302 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -44,6 +44,7 @@ class Emulator(object):
     def __init__(self, builddir, downloaddir, logtofile, timeout_multiplier):
         self.qemu = None
         self.repl = None
+        self.builddir = builddir
         self.downloaddir = downloaddir
         self.logfile = infra.open_log_file(builddir, "run", logtofile)
         # We use elastic runners on the cloud to runs our tests. Those runners
@@ -116,11 +117,14 @@ class Emulator(object):
         self.logfile.write(f"> host loadavg: {ldavg_str}\n")
         self.logfile.write(f"> timeout multiplier: {self.timeout_multiplier}\n")
         self.logfile.write("> starting qemu with '%s'\n" % " ".join(qemu_cmd))
+        host_bin = os.path.join(self.builddir, "host", "bin")
+        br_path = host_bin + os.pathsep + os.environ["PATH"]
         self.qemu = pexpect.spawn(qemu_cmd[0], qemu_cmd[1:],
                                   timeout=5 * self.timeout_multiplier,
                                   encoding='utf-8',
                                   codec_errors='replace',
-                                  env={"QEMU_AUDIO_DRV": "none"})
+                                  env={"QEMU_AUDIO_DRV": "none",
+                                       "PATH": br_path})
         # We want only stdout into the log to avoid double echo
         self.qemu.logfile_read = self.logfile
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
