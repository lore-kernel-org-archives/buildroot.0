Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2053AEB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 19:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A36CF415A0;
	Thu,  6 Jul 2023 19:01:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A36CF415A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tyFmu3FC3C2t; Thu,  6 Jul 2023 19:01:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 068AF415C2;
	Thu,  6 Jul 2023 19:01:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 068AF415C2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 491DD1BF580
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 19:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21C1141904
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 19:01:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21C1141904
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fb6M_AmFJU62 for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 19:01:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AAB041900
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4AAB041900
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 19:01:28 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 54F8B13F895;
 Thu,  6 Jul 2023 21:01:24 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu,  6 Jul 2023 21:01:01 +0200
Message-ID: <20230706190102.10901-3-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706190102.10901-1-ju.o@free.fr>
References: <20230706190102.10901-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1688670086;
 bh=bRJFkxxoVjBPCeS7PNuaimvuRy8zu9XMr2OoBSqN3qQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Isr0qRpAY6hEGswb5hO32Eux611+18QMcUuGKscRdI/WWy2IMEQ1N17NGbhN2gU5b
 /7JMQmCumd1SL1e6QjdFlV9vIQVEYqAOU4sNtkLKX0Qwoq9/BN2oeDDgJCMhtd17mg
 CXSzXIh5nTbrMHR+M8OxPyMjLtrnWyZiRKkXfRjbpdIuO5xmQRqar1o4ixBYE/6SOQ
 8MBAdgF73+ZHnFL92xui3upnWrZV/K0TslbJAHTWWdwlFy9Gzd3VPcw/rTBchDxqj0
 1ijN5TFco0Em4CI9lHLBklfJA5AdcZmllU9x9v1CcDhSk/d24xrunm829vlhMMIcbO
 BlndKj1lQVS8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Isr0qRpA
Subject: [Buildroot] [PATCH 3/4]
 support/testing/tests/package/test_bzip2.py: new runtime test
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
 DEVELOPERS                                  |  1 +
 support/testing/tests/package/test_bzip2.py | 12 ++++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 support/testing/tests/package/test_bzip2.py

diff --git a/DEVELOPERS b/DEVELOPERS
index b0cab5c833..d22e3172be 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1721,6 +1721,7 @@ F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_hwdata.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/sample_python_spake2.py
+F:	support/testing/tests/package/test_bzip2.py
 F:	support/testing/tests/package/test_compressor_base.py
 F:	support/testing/tests/package/test_ddrescue.py
 F:	support/testing/tests/package/test_ddrescue/
diff --git a/support/testing/tests/package/test_bzip2.py b/support/testing/tests/package/test_bzip2.py
new file mode 100644
index 0000000000..4b7ae8180f
--- /dev/null
+++ b/support/testing/tests/package/test_bzip2.py
@@ -0,0 +1,12 @@
+from tests.package.test_compressor_base import TestCompressorBase
+
+
+class TestBzip2(TestCompressorBase):
+    __test__ = True
+    config = TestCompressorBase.config + \
+        """
+        BR2_PACKAGE_BZIP2=y
+        """
+    compress_cmd = "bzip2"
+    decompress_cmd = "bunzip2"
+    compressed_file_ext = ".bz2"
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
