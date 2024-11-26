Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F28D65544
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 18:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 052284EBE0;
	Tue, 26 Nov 2024 18:29:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 88nXu8Y1E0km; Tue, 26 Nov 2024 18:29:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7C554EBD5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7C554EBD5;
	Tue, 26 Nov 2024 18:29:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DFC67DB3
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 18:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEC78606C0
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 18:29:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rZ43YYCPBcVc for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 18:29:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2B50B605EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B50B605EB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B50B605EB
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 18:29:03 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D8FC8B00535;
 Tue, 26 Nov 2024 19:28:59 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Tue, 26 Nov 2024 19:28:55 +0100
Message-ID: <20241126182855.38704-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732645741;
 bh=QOHrYJXEQ8SVH7EiGMeRNPRnrzpq1UN4407w2nVJBG0=;
 h=From:To:Cc:Subject:Date:From;
 b=X05Ak6DAeMPXzYXnaU9q95712lSmPeNC1++UtBJ42/vnWtzRW+YbTJTADbEYtc6h6
 0+YOrXKVLW5/Gl2nsjbJrczQQDE2s+BIs2sG6z2kK7aFuZkzPz8ajuirDRzp14FED1
 4EXGJjwnud1dpGofMvim473xJck0/2+5frMv5L3xAlYtG9w7av8F99Xncy6ldNr+6V
 7eEkvL6M5O0LktUH2Js1NEI/VRwaBg/N/OTZ85dooIee862Z3O/FJ14FdK+vXt7oHh
 hfYkoN61H5b8r23lQH75vMxJ5J2utLGITOdXAU7gbbXm3kgtCAkROo7tXXg1/QPcmL
 C/q70374rpl4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=X05Ak6DA
Subject: [Buildroot] [PATCH 1/1] support/testing: improve mosquitto test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
