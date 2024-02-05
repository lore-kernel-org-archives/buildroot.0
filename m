Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92836C48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 21:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2986B41503;
	Mon,  5 Feb 2024 21:48:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2986B41503
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Evn9DNWruuLC; Mon,  5 Feb 2024 21:48:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73903415BB;
	Mon,  5 Feb 2024 21:48:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73903415BB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A0C231BF341
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B25960ED0
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:48:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B25960ED0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JEHlo3ypHlRg for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 21:48:46 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3169760ECE
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 21:48:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3169760ECE
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 150FB13F8B9;
 Mon,  5 Feb 2024 22:48:41 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon,  5 Feb 2024 22:48:37 +0100
Message-ID: <20240205214837.3497535-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707169723;
 bh=HdVRla0FZAQUeKB+nhiYpxw0cK2JI9ZhRd5gd0VhuMY=;
 h=From:To:Cc:Subject:Date:From;
 b=JAPBIJkw6wfjdvnEksw4XIR/Cky5cxJZs5YuHYWjDa9koWQ0nqxtUCgTTgY1hy1gM
 v9oGonVKDN6fc4IpDhBPA3p52S6nQOvJ18GATYeiCqVIwRnB4dNHTMau0mB6xjezRd
 nUJadrTFFG/wTNAoIDKgE/xhL+TtxCL6pWL6YpxfhTkzTYfwkvxuRckJS9L38LfdP1
 EWOvgguKzWq2bXTZaLslGupEXCyyZJlx3YMRvFX73S2zWFVGKwDpsXjhAGydSBax8H
 B27UFiT51ioNsazby5iPS6gQCi8PQgRAOU7I4Oc9F4LVVJYnorIAAHjVekHAnolDCm
 j+WDRwYVupbAg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JAPBIJkw
Subject: [Buildroot] [PATCH 1/1] support/testing: netcat: improve test
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
