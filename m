Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B77B3C433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:41:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60BF66108B
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:41:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 60BF66108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10D3D4018D;
	Fri, 12 Nov 2021 22:41:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8BHe90bLStNb; Fri, 12 Nov 2021 22:40:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA77D404D0;
	Fri, 12 Nov 2021 22:40:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E32B11BF3A3
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBB4C40606
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:40:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JUhYqH0xLOF4 for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 22:40:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E9B940625
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 22:40:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 762648C966; Fri, 12 Nov 2021 22:36:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 23:26:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4e6e1b53b07b05d51ebfb70979608c144ac155a
X-Git-Newrev: bff1c6ada55f7a6ce0f2f399f9cb7123832f0727
X-Patchwork-Hint: ignore
Message-Id: <20211112223605.762648C966@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_luvi: make luvi test
 reproducible
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
Content-Type: multipart/mixed; boundary="===============8494237322384254929=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8494237322384254929==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=bff1c6ada55f7a6ce0f2f399f9cb7123832f0727
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As explained by Jörg [1], iteration with pairs() does not result in the
same order since luajit 2.1.

From [2]
"Table iteration with pairs() does not result in the same order?

The order of table iteration is explicitly undefined by the Lua
language standard. Different Lua implementations or versions may use
different orders for otherwise identical tables. Different ways of
constructing a table may result in different orders, too. Due to
improved VM security, LuaJIT 2.1 may even use a different order on
separate VM invocations or when string keys are newly interned.

If your program relies on a deterministic order, it has a bug.
Rewrite it, so it doesn't rely on the key order.
Or sort the table keys, if you must."

Note: The "luvi -v" return 255 even on success.

[1] http://lists.busybox.net/pipermail/buildroot/2021-November/627938.html
[2] https://luajit.org/faq.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Francois Perrad <francois.perrad@gadz.org>
Cc: Jörg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/package/test_luvi.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/package/test_luvi.py b/support/testing/tests/package/test_luvi.py
index eb15ad31b5..4b55091762 100644
--- a/support/testing/tests/package/test_luvi.py
+++ b/support/testing/tests/package/test_luvi.py
@@ -25,11 +25,12 @@ class TestLuvi(infra.basetest.BRTest):
     def version_test(self):
         cmd = "luvi -v"
         output, exit_code = self.emulator.run(cmd)
-        self.assertIn('luvi', output[0])
-        self.assertIn('zlib', output[1])
+        output = sorted(output)
+        self.assertIn('libuv', output[0])
+        self.assertIn('luvi', output[1])
         self.assertIn('rex', output[2])
-        self.assertIn('libuv', output[3])
-        self.assertIn('ssl', output[4])
+        self.assertIn('ssl', output[3])
+        self.assertIn('zlib', output[4])
 
     def test_run(self):
         self.login()

--===============8494237322384254929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8494237322384254929==--
