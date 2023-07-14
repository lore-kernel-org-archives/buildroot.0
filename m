Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A1DEB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 16:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F5DF61496;
	Fri, 14 Jul 2023 16:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F5DF61496
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G7zoLxdB9EGU; Fri, 14 Jul 2023 16:42:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85A816146C;
	Fri, 14 Jul 2023 16:42:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85A816146C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4CA9D1BF369
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 16:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3397541863
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 16:42:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3397541863
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1cCXz6r2HF7S for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 16:42:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 857D341858
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 857D341858
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 16:42:27 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id AB5D013F86F;
 Fri, 14 Jul 2023 18:42:24 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 14 Jul 2023 18:42:19 +0200
Message-ID: <20230714164219.9934-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1689352945;
 bh=qFAO2sVglhuxCZfoeNxH9M61HMLuJM9o7uu4TvcdfyQ=;
 h=From:To:Cc:Subject:Date:From;
 b=b6OMSpaht2b7dH61eoLDnEJf9zhwF5rKj2QUsc20mmM48+kfUrvEupRA+k8V1na6M
 Tg3TRoohMJfnX6ZCrJ5cogwbDFo91Vbpqt1E6RYkAD9Hd+ccVfKdCFXgfVGuXGtJrB
 tsSdLIwtqtOPKzRD0p2W2w2USXarR7jQj7SiWTk90uLHc+aWyjMsOUhowapQ+3nMAM
 3SvShU1jqd74mia28HwKeEm4+KzQDaquqvYQdV2msHk06+wVgiaJjdojwivfCLw6T+
 SR6vB3KVStkBQE2+LXHtFUdM4qwriNggU1IOePuRmPOTFwD4zFQEFV4ECQ/TNHrx+C
 BsdU/AQHPVKXA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=b6OMSpah
Subject: [Buildroot] [PATCH 1/1] support/testing/tests/package/test_pigz.py:
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
 support/testing/tests/package/test_pigz.py | 12 ++++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 support/testing/tests/package/test_pigz.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 1021e5c6ba..b65f583542 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1754,6 +1754,7 @@ F:	support/testing/tests/package/test_ola.py
 F:	support/testing/tests/package/test_ola/
 F:	support/testing/tests/package/test_openblas.py
 F:	support/testing/tests/package/test_perftest.py
+F:	support/testing/tests/package/test_pigz.py
 F:	support/testing/tests/package/test_python_distro.py
 F:	support/testing/tests/package/test_python_gnupg.py
 F:	support/testing/tests/package/test_python_hkdf.py
diff --git a/support/testing/tests/package/test_pigz.py b/support/testing/tests/package/test_pigz.py
new file mode 100644
index 0000000000..92a4170265
--- /dev/null
+++ b/support/testing/tests/package/test_pigz.py
@@ -0,0 +1,12 @@
+from tests.package.test_compressor_base import TestCompressorBase
+
+
+class TestPigz(TestCompressorBase):
+    __test__ = True
+    config = TestCompressorBase.config + \
+        """
+        BR2_PACKAGE_PIGZ=y
+        """
+    compress_cmd = "pigz -p3"
+    decompress_cmd = "pigz -d -p3"
+    compressed_file_ext = ".gz"
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
