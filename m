Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED80C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:28:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2544B6103E
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2544B6103E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F06A483BAA;
	Wed,  6 Oct 2021 15:28:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jMbhZDRjl9Nm; Wed,  6 Oct 2021 15:28:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4722F83B32;
	Wed,  6 Oct 2021 15:28:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 125A81BF9AF
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F4C260E90
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:28:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FcjTiPL-Lcyq for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 15:28:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 403456064C
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 15:28:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 166F0923A2; Wed,  6 Oct 2021 15:26:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 16:56:43 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 3b4681098bf6c59b3e14a713b7b5da5f1e14f92a
X-Git-Newrev: b22acc487f7fd665612eb3e8e2f0de25ee0895e8
X-Patchwork-Hint: ignore
Message-Id: <20211006152600.166F0923A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] support/testing: don't
 fail on tests emitting invalid utf-8 sequences
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b22acc487f7fd665612eb3e8e2f0de25ee0895e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

When booting under EFI, grub2 will output a nice and shiny boot menu,
using extended ASCII characters (in the [0x80..0xFF] range), namely
CP437 [0], on the assumption that the VGA BIOS is a real one and has the
corresponding (and only!) font, as is the case on real hardware.

However, when run in our runtime test infrastructure, this triggers the
infamous python UnicodeDecodeError exception:

    Traceback (most recent call last):
      [...]
        emulator.login()
      File "[...]/buildroot/support/testing/infra/emulator.py", line 89, in login
        index = self.qemu.expect(["buildroot login:", pexpect.TIMEOUT],
      File "/usr/lib/python3/dist-packages/pexpect/spawnbase.py", line 340, in expect
        return self.expect_list(compiled_pattern_list,
      File "/usr/lib/python3/dist-packages/pexpect/spawnbase.py", line 369, in expect_list
        return exp.expect_loop(timeout)
      File "/usr/lib/python3/dist-packages/pexpect/expect.py", line 111, in expect_loop
        incoming = spawn.read_nonblocking(spawn.maxread, timeout)
      File "/usr/lib/python3/dist-packages/pexpect/pty_spawn.py", line 485, in read_nonblocking
        return super(spawn, self).read_nonblocking(size)
      File "/usr/lib/python3/dist-packages/pexpect/spawnbase.py", line 178, in read_nonblocking
        s = self._decoder.decode(s, final=False)
      File "/usr/lib/python3.8/codecs.py", line 322, in decode
        (result, consumed) = self._buffer_decode(data, self.errors, final)
    UnicodeDecodeError: 'utf-8' codec can't decode byte 0xda in position 0: invalid continuation byte

Grub2 is not wrong in emitting those chars, and basically we should not
expect the packages we test to always emit correct UTF-8 sequences; at
the very least, this should not cause the test infra to fail.

We fix that by telling pexpect.spawn to "fix" such invalid sequences by
replacing them with the suitable Unicode character, U+FFFD REPLACEMENT
CHARACTER.

[0] https://en.wikipedia.org/wiki/Code_page_437
[1] https://docs.python.org/3/library/codecs.html#error-handlers

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
[yann.morin.1998@free.fr:
  - don't change encoding, use codec_errors
  - rewrite commit log accordingly
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d6d7cbb8e047f86bdf626fec90f10e8590b7adf7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/infra/emulator.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 5611ec96e8..2412fe1cc9 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -77,6 +77,7 @@ class Emulator(object):
         self.qemu = pexpect.spawn(qemu_cmd[0], qemu_cmd[1:],
                                   timeout=5 * self.timeout_multiplier,
                                   encoding='utf-8',
+                                  codec_errors='replace',
                                   env={"QEMU_AUDIO_DRV": "none"})
         # We want only stdout into the log to avoid double echo
         self.qemu.logfile_read = self.logfile
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
