Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1888E67485
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 21:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8475E60650;
	Thu, 31 Oct 2024 21:35:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IqWr26376yld; Thu, 31 Oct 2024 21:35:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79B4560671
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79B4560671;
	Thu, 31 Oct 2024 21:35:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B89F5B1E
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E93E08169E
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:34:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 82NyVQMuHXAS for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 21:34:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0360280EAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0360280EAB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0360280EAB
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 21:34:57 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id BB642B00539;
 Thu, 31 Oct 2024 22:34:50 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Romain Naour <romain.naour@gmail.com>
Date: Thu, 31 Oct 2024 22:33:45 +0100
Message-ID: <20241031213348.2057705-6-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031213348.2057705-1-ju.o@free.fr>
References: <20241031213348.2057705-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730410496;
 bh=7otdEn/LD3aE75B8XAT6IqWbqbJIkA9Xt/RUjvWMWLU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aFwLf6w/brydmn4y7YLZt6KmAnqs9hIGm/2i5+Ty7cPta/zAkZEGu99MPd41h4M/y
 jg/G56JJNKAF8blvACvGWyNErWRwgWDwLkOgEKodyy1GMcyynJamBF0Y60z9cHk9t1
 vJ/oSq429NemYDQ2nBRrpM2PIHh/5BNp5bgyoHQweqMDhIJemZebdfMN2/XcMm2kNZ
 zlUhIPqI0ufUZM9wtfH7z1fjyLMwUJ1YOI5Ons+R7JEcsLQxe1FpqMg4DIdXJRhZBD
 T5a6DaaLi2ovUPMPa7urqdh/YF+kCaVvLBzb78UIfuQ8aV4O31IY2eLbJ3k0cNvS+Q
 CavSwCeASrFFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aFwLf6w/
Subject: [Buildroot] [PATCH v3 5/8] support/testing/infra/emulator.py: add
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
 
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
