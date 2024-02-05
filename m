Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C5DC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 22:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEA0641AE1;
	Mon,  5 Feb 2024 22:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEA0641AE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zBgsauNLBzL7; Mon,  5 Feb 2024 22:20:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F980418A9;
	Mon,  5 Feb 2024 22:20:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F980418A9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 423431BF319
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C05B81FEC
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:20:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C05B81FEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id utlTBuFWawCf for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 22:20:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11EAA81FEA
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 22:20:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11EAA81FEA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F025586E52; Mon,  5 Feb 2024 22:20:12 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 23:19:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3aecae1802f28d1662e29b31167f7959bfe6a7ce
X-Git-Newrev: f72ba67d081a728a13f76cb8d18e2b5b781d2a46
X-Patchwork-Hint: ignore
Message-Id: <20240205222012.F025586E52@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: netcat: improve test
 robustness
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

commit: https://git.buildroot.net/buildroot/commit/?id=f72ba67d081a728a13f76cb8d18e2b5b781d2a46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Under some conditions (mostly slow execution due to test host load),
the netcat runtime test can randomly fail. This is due to several
facts:

- the sleep time between the server and client is too short,
- the use of netcat option -c could close the connection before the
  server could receive all the data.

This commit improves the test robustness by increasing the sleep time,
and by reducing the amount of transferred data (from 1MB of random data,
to a simpler string of few bytes). Also, to make sure netcat cannot wait
on DNS resolution, this commit also adds the -n option.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6093854664

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/package/test_netcat.py | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/support/testing/tests/package/test_netcat.py b/support/testing/tests/package/test_netcat.py
index b3efa4c40b..88d58a72f3 100644
--- a/support/testing/tests/package/test_netcat.py
+++ b/support/testing/tests/package/test_netcat.py
@@ -22,20 +22,19 @@ class TestNetCat(infra.basetest.BRTest):
 
         self.assertRunOk("nc --version")
 
-        in_file = "input.bin"
-        out_file = "output.bin"
+        msg = "Hello Buildroot!"
+        out_file = "output.txt"
         port = 12345
 
-        cmd = f"dd if=/dev/urandom of={in_file} bs=1k count=1k"
+        cmd = f"nc -n -l -p {port} > {out_file} 2> /dev/null &"
         self.assertRunOk(cmd)
 
-        cmd = f"nc -l -p {port} > {out_file} &"
-        self.assertRunOk(cmd)
-
-        time.sleep(1)
+        time.sleep(5)
 
-        cmd = f"cat {in_file} | nc -c 127.0.0.1 {port}"
+        cmd = f"echo '{msg}' | nc -n -c 127.0.0.1 {port}"
         self.assertRunOk(cmd)
 
-        cmd = f"cmp {in_file} {out_file}"
-        self.assertRunOk(cmd)
+        cmd = f"cat {out_file}"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], msg)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
