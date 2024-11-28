Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BFFD70DEB
	for <buildroot@archiver.kernel.org>; Thu, 28 Nov 2024 20:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8181340662;
	Thu, 28 Nov 2024 20:15:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VaCYNj5Bdkoh; Thu, 28 Nov 2024 20:15:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F50B40661
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F50B40661;
	Thu, 28 Nov 2024 20:15:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C484AA6A
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0C4D404C7
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:15:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JwHo-UldaPca for <buildroot@buildroot.org>;
 Thu, 28 Nov 2024 20:15:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA85F4047A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA85F4047A
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 20:15:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A118686726; Thu, 28 Nov 2024 20:15:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Nov 2024 21:14:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20c2b2f76cda507a3b0dc12ea75b2b7e13bef10e
X-Git-Newrev: 07a444d08804b3a453e4d01686ba0bef990070ca
X-Patchwork-Hint: ignore
Message-Id: <20241128201519.A118686726@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: improve mosquitto test
 reliability
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=07a444d08804b3a453e4d01686ba0bef990070ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mosquitto runtime test can randomly fail on slow
runners, see [1].

This commit improves this test in the following ways:

- the mosquitto_sub subscriber process is now started in a subshell
to suppress the job control messages (to prevent any spurious
messages when the job stops),

- the standard error is redirected to /dev/null, to prevent the
printing of any messages,

- the mosquitto_pub publisher process is started later, by increasing
the sleep time,

- finally, a new sleep time is introduced between the mosquitto_pub
publisher process and the check of the mosquitto_sub subscriber, to
make sure it will have time to write its output and exit.

Fixes: [1]

[1] https://gitlab.com/buildroot.org/buildroot/-/jobs/8453386454

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_mosquitto.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_mosquitto.py b/support/testing/tests/package/test_mosquitto.py
index ba10b30b00..6b256e5e27 100644
--- a/support/testing/tests/package/test_mosquitto.py
+++ b/support/testing/tests/package/test_mosquitto.py
@@ -25,13 +25,19 @@ class TestMosquitto(infra.basetest.BRTest):
         msg = "Hello Buildroot!"
 
         # We subscribe to a topic and write one message to a log file.
-        self.assertRunOk(f"mosquitto_sub -t {topic} -C 1 > {log} &")
+        cmd = f"( mosquitto_sub -t {topic} -C 1 > {log} 2> /dev/null & )"
+        self.assertRunOk(cmd)
 
-        time.sleep(1)
+        # We give some time to the subscriber process to settle.
+        time.sleep(5)
 
         # We publish a message.
         self.assertRunOk(f"mosquitto_pub -t {topic} -m '{msg}'")
 
+        # We give some more time to the subscriber process to write
+        # the log and quit.
+        time.sleep(5)
+
         # We check the log file contains our message.
         out, ret = self.emulator.run(f"cat {log}")
         self.assertEqual(ret, 0)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
