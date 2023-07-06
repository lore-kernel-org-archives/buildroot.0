Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6384EEB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 19:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16A7F415C5;
	Thu,  6 Jul 2023 19:01:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16A7F415C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ctawLdDIxso2; Thu,  6 Jul 2023 19:01:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CA2F415BB;
	Thu,  6 Jul 2023 19:01:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CA2F415BB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F334B1BF580
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 19:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9DE841596
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 19:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9DE841596
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NNDXII3Ek6F9 for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 19:01:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27FC240476
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 27FC240476
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 19:01:26 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id DF6E713F85A;
 Thu,  6 Jul 2023 21:01:21 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu,  6 Jul 2023 21:01:00 +0200
Message-ID: <20230706190102.10901-2-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706190102.10901-1-ju.o@free.fr>
References: <20230706190102.10901-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1688670084;
 bh=TFDi6NtDZjQNTmjPqZZE2ViESl8uc5pNeIlFDPC3qnM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bg/68kOCWGnZlVMF+zZVA9SsycBtATDlv29p7Y00vsXKG8CYg5CRFzD29mWLJ1PoT
 UGCPBtyGn4yospe3lwNoNo0AQsuYF4CiKAReGlIlJOQcRyrMGfM1Br/kJopjw/meHj
 LsL2C3wgPP7so56un2YRDGjFbGUYQc04QfNH+eJy0WgsVTEKPwlq6321Y5LtJlNJVO
 /CPL2dwDBr+vC/S/ykq36gXCtgFMeKt/fd2ZuGJDSgTjBnMd1biL/TLeUD7Doip+AV
 njAKBx6hA/hN/CZ44FqdK+ZEqXPd+0LhcqRsvS2znb+9XRmw1L6kTncOEv3SyT+vJP
 S6k6cGw8y+8iA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Bg/68kOC
Subject: [Buildroot] [PATCH 2/4] support/testing/tests/package/test_gzip.py:
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
 support/testing/tests/package/test_gzip.py | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 support/testing/tests/package/test_gzip.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 75cfbd85a8..b0cab5c833 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1725,6 +1725,7 @@ F:	support/testing/tests/package/test_compressor_base.py
 F:	support/testing/tests/package/test_ddrescue.py
 F:	support/testing/tests/package/test_ddrescue/
 F:	support/testing/tests/package/test_gnupg2.py
+F:	support/testing/tests/package/test_gzip.py
 F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
 F:	support/testing/tests/package/test_iperf3.py
diff --git a/support/testing/tests/package/test_gzip.py b/support/testing/tests/package/test_gzip.py
new file mode 100644
index 0000000000..1d5f374853
--- /dev/null
+++ b/support/testing/tests/package/test_gzip.py
@@ -0,0 +1,13 @@
+from tests.package.test_compressor_base import TestCompressorBase
+
+
+class TestGzip(TestCompressorBase):
+    __test__ = True
+    config = TestCompressorBase.config + \
+        """
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_GZIP=y
+        """
+    compress_cmd = "gzip"
+    decompress_cmd = "gunzip"
+    compressed_file_ext = ".gz"
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
