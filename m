Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E62FEB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 20:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6BE460AEC;
	Thu,  6 Jul 2023 20:19:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6BE460AEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wqeH1MYltbd0; Thu,  6 Jul 2023 20:19:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE34860A82;
	Thu,  6 Jul 2023 20:19:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE34860A82
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 59FF61BF4DB
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 20:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33525821A9
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 20:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33525821A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EN2ppOUzj1uK for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 20:19:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9DF3821A7
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9DF3821A7
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 20:19:36 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CFA1813F85F;
 Thu,  6 Jul 2023 22:19:32 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu,  6 Jul 2023 22:19:14 +0200
Message-ID: <20230706201917.284060-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1688674774;
 bh=ibSEyjxdkvlzwHu8LeUjPPriom+t+OXPzjHPltDJ0uQ=;
 h=From:To:Cc:Subject:Date:From;
 b=uPlp2Ngiq3o0D1El8yv5JWUfiMI3gLFVj4VX1UZCJqFqKeXbSc2OvoC3F2ERZsTC8
 kgzalZC6ioDhUHHaXYND75jCR+Bz5LKDKUXfkeZCdZRV5BPFBHdpZgnMzEdYz9e9B3
 98yZHR7wWNC4+LQTGIRH7RBJeelTFCB9beLttxb+/7nq/Y9TuxRn7HU8lapUXi0x3d
 X4947fZXj5t0UrTEsM8DDBgTsGwo2woRuJImwfObpgkCM3JaotM944bYDVmsfh0VeM
 0ol2u6UNfrkvqaPd/j0XJy6zsWbDjRSSbtT4lXNTjfJ5jJB/Ztmyg0PKunE8V1haca
 xOsDu8mEX7Law==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uPlp2Ngi
Subject: [Buildroot] [PATCH v3 1/4] support/testing/infra/emulator.py:
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
Cc: Julien Olivain <ju.o@free.fr>
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
"dieharder -d 0". This issue has also been seen with dmidecode,
producing comments in its output (when simply invoked with
"dmidecode"). See:
https://git.savannah.gnu.org/cgit/dmidecode.git/tree/dmioutput.c?h=dmidecode-3-5#n30

This issue could technically be seen with program producing MarkDown
formatted output (for example "# Header 1").

This issue happen because the test infra emulator.run() method expect
the prompt "# " after running a command and while getting the return
code. See:
https://git.buildroot.org/buildroot/tree/support/testing/infra/emulator.py?h=2023.05#n113

Since the string "# " is quite common, this patch changes the prompt
after the emulator.login(), by setting the PS1 variable to a string
which is less likely to appear in a normal program output. A small
caveat: since there is a command echo, the command setting the new
prompt needs to be slightly obfuscated to make sure it will not be
detected as an actual shell prompt. The simple obfuscation scheme
consist of single-quoting each character (e.g. abc -> 'a''b''c').

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v2 -> v3:
- reworded the comment about the prompt obfuscation
- rewrote the prompt obfuscation with map()

Changes v1 -> v2:
- reworded commit log, to mention this issue was also seen while writing
  a test for the dmidecode package
- the patch series also introduce the new test for dmidecode
---
 support/testing/infra/emulator.py | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 02cf486128..e010fb3d28 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -13,6 +13,7 @@ class Emulator(object):
         # can take a long time to run the emulator. Use a timeout multiplier
         # when running the tests to avoid sporadic failures.
         self.timeout_multiplier = timeout_multiplier
+        self.shell_prompt = "#BRTEST# "
 
     # Start Qemu to boot the system
     #
@@ -100,6 +101,16 @@ class Emulator(object):
         index = self.qemu.expect(["# ", pexpect.TIMEOUT])
         if index != 0:
             raise SystemError("Cannot login")
+        # We set a special shell prompt for testing. Since the
+        # standard prompt '# ' is quite generic, a normal process
+        # output could contain that string and confuse expect. When
+        # changing the prompt, we also need to slightly obfuscate it
+        # in some way to make sure the command echo will not be seen
+        # as a prompt itself. The simple obfuscation scheme just
+        # consist of single-quoting each character (for example, the
+        # string "abc" becomes 'a''b''c').
+        quoted_prompt = "".join((map(lambda c: f"'{c}'", self.shell_prompt)))
+        self.run("export PS1={}".format(quoted_prompt))
         self.run("dmesg -n 1")
         # Prevent the shell from wrapping the commands at 80 columns.
         self.run("stty columns 29999")
@@ -110,13 +121,13 @@ class Emulator(object):
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
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
