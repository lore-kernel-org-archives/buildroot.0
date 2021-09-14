Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B155C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 09:35:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0429610A2
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 09:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0429610A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B78440211;
	Tue, 14 Sep 2021 09:35:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b2VJEfzMglzv; Tue, 14 Sep 2021 09:35:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECBB6403E7;
	Tue, 14 Sep 2021 09:35:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 193881BF3EB
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 09:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87CD480D81
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 09:35:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tkPq_ubxfpb1 for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 09:35:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE02D80D77
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 09:35:01 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id F03E3FF817;
 Tue, 14 Sep 2021 09:34:59 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 11:34:55 +0200
Message-Id: <20210914093457.1389174-7-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914093457.1389174-1-kory.maincent@bootlin.com>
References: <20210914093457.1389174-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 6/8] support/testing/infra/emulator.py: update
 encoding when calling qemu
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

With UTF-8 got issue with wrong character returned by Qemu when using EFI
BIOS. This breaks the test process with the following error. Update to
ISO-8859-1 encoding to avoid it.

    emulator.login()
  File "/home/kmaincent/Documents/projects/ariane-groupe/buildroot/support/testing/infra/emulator.py", line 89, in login
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

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 support/testing/infra/emulator.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 5611ec96e8..06b3840b75 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -76,7 +76,7 @@ class Emulator(object):
         self.logfile.write("> starting qemu with '%s'\n" % " ".join(qemu_cmd))
         self.qemu = pexpect.spawn(qemu_cmd[0], qemu_cmd[1:],
                                   timeout=5 * self.timeout_multiplier,
-                                  encoding='utf-8',
+                                  encoding='ISO-8859-1',
                                   env={"QEMU_AUDIO_DRV": "none"})
         # We want only stdout into the log to avoid double echo
         self.qemu.logfile_read = self.logfile
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
