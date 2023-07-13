Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BAE7C001E0
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 21:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC4E34216A;
	Thu, 13 Jul 2023 21:33:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC4E34216A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E1U9rIbQIBcQ; Thu, 13 Jul 2023 21:33:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DE204219D;
	Thu, 13 Jul 2023 21:33:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DE204219D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 628201BF383
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 21:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CA1581384
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 21:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CA1581384
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FHk1CSSq0h8l for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 21:33:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82F9C81349
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82F9C81349
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 21:33:34 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A842A13F87C;
 Thu, 13 Jul 2023 23:33:31 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 13 Jul 2023 23:33:25 +0200
Message-ID: <20230713213325.105157-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1689284012;
 bh=ia95ugCyJH/L+umd8HRmWQIoLOi6Xd0fj9+rgN4x8Ac=;
 h=From:To:Cc:Subject:Date:From;
 b=Cn85SGzg6fj8pUi1sSFYoAG8ND+FcW+RoFKA/nrcFHwnZ/vmrHQg0LqBqWIo1Lxcv
 niv8ouLnTwrfALWBbswCnGnsmWyJYuCDYKz+QaVvRk3WX4FiQsHpOZBxyqHMpcqwKt
 ow0iCVdQXfPGej3qEIDgYa5Zsvbn+6wk/bcHGOn6BSIKr8zfELcOzRdaxu+y9KzN4T
 d6JOvvi8I5wJ6Ghk3CRx/03ifDXhQnvUTigcPTYMoi+g4W+6L/erKvHtMBeFXGurda
 BIOpBX775G+207K/DJEItFFAhcuOuJ1tPjCc7EDX1gFawDrwzWFkaC7xtJVi8O0RWP
 flwoy1RC2kVpw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Cn85SGzg
Subject: [Buildroot] [PATCH 1/1] support/testing/tests/package/test_zstd.py:
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
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_zstd.py | 11 +++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 support/testing/tests/package/test_zstd.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 0918e9f721..b9bb95a074 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1762,6 +1762,7 @@ F:	support/testing/tests/package/test_stress_ng.py
 F:	support/testing/tests/package/test_xz.py
 F:	support/testing/tests/package/test_z3.py
 F:	support/testing/tests/package/test_z3/
+F:	support/testing/tests/package/test_zstd.py
 
 N:	Julien Viard de Galbert <julien@vdg.name>
 F:	package/dieharder/
diff --git a/support/testing/tests/package/test_zstd.py b/support/testing/tests/package/test_zstd.py
new file mode 100644
index 0000000000..24dc5fb90d
--- /dev/null
+++ b/support/testing/tests/package/test_zstd.py
@@ -0,0 +1,11 @@
+from tests.package.test_compressor_base import TestCompressorBase
+
+
+class TestZstd(TestCompressorBase):
+    __test__ = True
+    config = TestCompressorBase.config + \
+        """
+        BR2_PACKAGE_ZSTD=y
+        """
+    compress_cmd = "zstd"
+    compressed_file_ext = ".zst"
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
