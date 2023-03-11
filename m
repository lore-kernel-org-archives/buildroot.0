Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E466C74A44
	for <buildroot@archiver.kernel.org>; Sat, 11 Mar 2023 08:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC94F8124A;
	Sat, 11 Mar 2023 08:57:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC94F8124A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yY0AgMapF5Ca; Sat, 11 Mar 2023 08:57:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02E4081255;
	Sat, 11 Mar 2023 08:57:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02E4081255
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C21AA1BF312
 for <buildroot@lists.busybox.net>; Sat, 11 Mar 2023 08:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A451081255
 for <buildroot@lists.busybox.net>; Sat, 11 Mar 2023 08:57:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A451081255
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BdxwRCdVqNJn for <buildroot@lists.busybox.net>;
 Sat, 11 Mar 2023 08:57:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21D2B8124A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21D2B8124A
 for <buildroot@buildroot.org>; Sat, 11 Mar 2023 08:57:23 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.174.13.46])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B823613F88A;
 Sat, 11 Mar 2023 09:57:16 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Mar 2023 09:57:07 +0100
Message-Id: <20230311085708.88937-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1678525040;
 bh=I9XMGAdfRiommAHC6JeJFXx7qrMli6dst4WPGN/v1pw=;
 h=From:To:Cc:Subject:Date:From;
 b=Z7+S4LxXJRPcLIrLaM6sRu9CApeIRWouMssBe+p2FUhPJEY/waC+mbwI+GIKwvGEk
 Hf8JZGmn3OeribhP6WFpu6uM0BbBAY42qPagT+igllDAiJvCf+JwyXqC4CNaOjnla5
 8KjTBZppEbC2b5/iPHDuPGiCeXoPpGGFBo/iFRkUdOOJtnztWZ5RCb+/ZUnjyLGnbr
 EVc1cRdzjyLTl11IkpFHeSuRAC7y7JWMGUU39CzUz8UXIPDDfafPKOgM+cYa0Swxlg
 7XRLrxrLM9Qmz/8YDV6skkjhj50h6+9srlcV0pCDnOq2U8Q8FZiozYQG2yRfM817eR
 UBYs3ZJbABDSA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Z7+S4LxX
Subject: [Buildroot] [PATCH next 1/2] support/testing/infra/emulator.py:
 change the shell prompt before running tests
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
Cc: Julien Olivain <ju.o@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If a program has the string '# ' (i.e. the default shell prompt) in
its output, the test execution in the Buildroot runtime test infra is
failing.

This can be reproduced by adding a single line in a package test
script:

    self.assertRunOk("echo ### this is a string with hashes ###")

When executed with, for example, the command:

    support/testing/run-tests \
        -d dl -o output_folder tests.package.test_sometest

The test will fail with output:

    Traceback (most recent call last):
      File "/buildroot/support/testing/tests/package/test_sometest.py", line 20, in test_run
        self.assertRunOk("echo ### this is a string with hashes ###")
      File "/buildroot/support/testing/infra/basetest.py", line 94, in assertRunOk
        out, exit_code = self.emulator.run(cmd, timeout)
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
      File "/buildroot/support/testing/infra/emulator.py", line 121, in run
        exit_code = int(exit_code)
                    ^^^^^^^^^^^^^^
    ValueError: invalid literal for int() with base 10: ''

This issue has been seen with real softwares, for example while
writing tests for the dieharder package, which creates report tables
formatted with hash characters. See:
https://github.com/eddelbuettel/dieharder/blob/3.31.1.4/libdieharder/version.c#L34
See also the output produced by a program invocation with command
"dieharder -d 0".

This issue could technically be seen with program producing MarkDown
formatted output (for example "# Header 1").

This issue happen because the test infra emulator.run() method expect
the prompt "# " after running a command and while getting the return
code. See:
https://git.buildroot.org/buildroot/tree/support/testing/infra/emulator.py?h=2023.02-rc2#n113

Since the string "# " is quite common, this patch changes the prompt
after the emulator.login(), by setting the PS1 variable to a string
which is less likely to appear in a normal program output. A small
caveat: since there is a command echo, the command setting the new
prompt needs to be protected to make sure it will not be detected as
an actual shell prompt. The prompt is encoded by single-quoting
each character (e.g. abc -> 'a''b''c').

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/infra/emulator.py | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 53876f828c..96f0341c3d 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -13,6 +13,7 @@ class Emulator(object):
         # can take a long time to run the emulator. Use a timeout multiplier
         # when running the tests to avoid sporadic failures.
         self.timeout_multiplier = timeout_multiplier
+        self.shell_prompt = "#BRTEST# "
 
     # Start Qemu to boot the system
     #
@@ -100,6 +101,15 @@ class Emulator(object):
         index = self.qemu.expect(["# ", pexpect.TIMEOUT])
         if index != 0:
             raise SystemError("Cannot login")
+        # Set a special shell prompt while testing. Since the standard
+        # prompt '# ' is quite generic, a normal process output could
+        # contain that string and confuse expect. When changing the
+        # prompt, we also need to encode or escape it in some way to
+        # make sure the command echo will not be seen as a prompt
+        # itself. The prompt is encoded by single-quoting each
+        # character (e.g. abc -> 'a''b''c').
+        encoded_prompt = "''".join(self.shell_prompt)
+        self.run("export PS1='{}'".format(encoded_prompt))
         self.run("dmesg -n 1")
         # Prevent the shell from wrapping the commands at 80 columns.
         self.run("stty columns 29999")
@@ -110,13 +120,13 @@ class Emulator(object):
         self.qemu.sendline(cmd)
         if timeout != -1:
             timeout *= self.timeout_multiplier
-        self.qemu.expect("# ", timeout=timeout)
+        self.qemu.expect(self.shell_prompt, timeout=timeout)
         # Remove double carriage return from qemu stdout so str.splitlines()
         # works as expected.
         output = self.qemu.before.replace("\r\r", "\r").splitlines()[1:]
 
         self.qemu.sendline("echo $?")
-        self.qemu.expect("# ")
+        self.qemu.expect(self.shell_prompt)
         exit_code = self.qemu.before.splitlines()[2]
         exit_code = int(exit_code)
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
