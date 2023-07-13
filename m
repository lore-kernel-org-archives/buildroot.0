Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204EFC001E0
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 21:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BABD4209A;
	Thu, 13 Jul 2023 21:33:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BABD4209A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fuNhADcDxtGE; Thu, 13 Jul 2023 21:33:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F2A24214B;
	Thu, 13 Jul 2023 21:33:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F2A24214B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1954A1BF383
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 21:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6F7C83EA7
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 21:33:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6F7C83EA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S2oQzNjnf1T4 for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 21:33:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2901683D13
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2901683D13
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 21:33:22 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 63EB313F8B7;
 Thu, 13 Jul 2023 23:33:19 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 13 Jul 2023 23:33:13 +0200
Message-ID: <20230713213313.105116-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1689284000;
 bh=Gbsb3RbDNvuDTwcFmn3USTVSv4VnzHR+T8XKBZh4xI8=;
 h=From:To:Cc:Subject:Date:From;
 b=WpSdrpiIrKMmUdSsU1o8Q495eDK4oobRTPXWAuzaO3LtRS/C0mmVSL5g+kQd1OzWw
 gFzQdhpFm5SQY96zBWsd1zh1tv418917xguPzRPoIqSq8OX4ZnQuKIY9w9jQ6mX8EG
 oZ8R30milF5PXVAL7ULp4pUsOfPrnYlLLhgrpVKELFNdpeaDCAcX7tQgSjUiXiXXN1
 jIh7k/KKP5ekgJMqrRwLRhXD5hP4aG5g0iLDrZ/Dov/pgQjYPBbZ+YbRDdYJzuRZt5
 +f1kXuAaWTVpGxcCRooAQLJQudwyICulrPQvJTTa3uKkWUH4uDQC+gCVZYgl+hjlC3
 Z8JQUC4tKowow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WpSdrpiI
Subject: [Buildroot] [PATCH 1/1] support/testing/tests/package/test_lz4.py:
 new runtime test
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

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                |  1 +
 support/testing/tests/package/test_lz4.py | 11 +++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 support/testing/tests/package/test_lz4.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 0918e9f721..d9e81989a8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1742,6 +1742,7 @@ F:	support/testing/tests/package/test_kexec.py
 F:	support/testing/tests/package/test_kexec/
 F:	support/testing/tests/package/test_libjxl.py
 F:	support/testing/tests/package/test_lsof.py
+F:	support/testing/tests/package/test_lz4.py
 F:	support/testing/tests/package/test_mtools.py
 F:	support/testing/tests/package/test_ncdu.py
 F:	support/testing/tests/package/test_octave.py
diff --git a/support/testing/tests/package/test_lz4.py b/support/testing/tests/package/test_lz4.py
new file mode 100644
index 0000000000..988200250a
--- /dev/null
+++ b/support/testing/tests/package/test_lz4.py
@@ -0,0 +1,11 @@
+from tests.package.test_compressor_base import TestCompressorBase
+
+
+class TestLz4(TestCompressorBase):
+    __test__ = True
+    config = TestCompressorBase.config + \
+        """
+        BR2_PACKAGE_LZ4=y
+        BR2_PACKAGE_LZ4_PROGS=y
+        """
+    compress_cmd = "lz4"
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
