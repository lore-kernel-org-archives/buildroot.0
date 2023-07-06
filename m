Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8970CEB64DC
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 19:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 358C541596;
	Thu,  6 Jul 2023 19:02:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 358C541596
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vtzwj-q4G-rV; Thu,  6 Jul 2023 19:02:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 719AC415CB;
	Thu,  6 Jul 2023 19:02:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 719AC415CB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D5A81BF580
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 19:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77497415AF
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 19:01:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77497415AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ArdzuCXaKKPm for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 19:01:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 324C141596
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 324C141596
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 19:01:31 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id C4CE713F8AA;
 Thu,  6 Jul 2023 21:01:26 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu,  6 Jul 2023 21:01:02 +0200
Message-ID: <20230706190102.10901-4-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706190102.10901-1-ju.o@free.fr>
References: <20230706190102.10901-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1688670089;
 bh=WDNaKXiGat9MrcPMwvlE8jAryViBeMh0dwy3S1bBDh8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CFCmkMBR+eBTSb94lVgtfJpWDfBb61Z4DfIMr0Iz3PIzGRS+gx26W0Qzlr9088rMN
 i+QHgNnv355J39eYOKS/a5yEplD24HwTwquir73laGbGvIDZgJ1frWiu9ZYpS6ZCDb
 reN3CZthEBOnDxSmiFHSRsrwlCqwScC0nM1WDbcnTjKNvZ4ZUNdx88D3G5Qy32ibbP
 U7eO7NhrOtcckQhRLPoQXD3IK4wxoN1+btdkUEoGLtdt+U8wdkK9hWouB9DSYyIjF2
 R8Qb7nQMyEeF4SgKOSPSCcjt9VA25TqO7p6sOg+2o9RGjbHpZ8yukfbo5J3Dbnb0jo
 D6MB90jJtP52w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CFCmkMBR
Subject: [Buildroot] [PATCH 4/4] support/testing/tests/package/test_xz.py:
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
 DEVELOPERS                               |  1 +
 support/testing/tests/package/test_xz.py | 10 ++++++++++
 2 files changed, 11 insertions(+)
 create mode 100644 support/testing/tests/package/test_xz.py

diff --git a/DEVELOPERS b/DEVELOPERS
index d22e3172be..f25d2ed9c9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1751,6 +1751,7 @@ F:	support/testing/tests/package/test_python_spake2.py
 F:	support/testing/tests/package/test_rdma_core.py
 F:	support/testing/tests/package/test_rdma_core/
 F:	support/testing/tests/package/test_stress_ng.py
+F:	support/testing/tests/package/test_xz.py
 F:	support/testing/tests/package/test_z3.py
 F:	support/testing/tests/package/test_z3/
 
diff --git a/support/testing/tests/package/test_xz.py b/support/testing/tests/package/test_xz.py
new file mode 100644
index 0000000000..7776c1608f
--- /dev/null
+++ b/support/testing/tests/package/test_xz.py
@@ -0,0 +1,10 @@
+from tests.package.test_compressor_base import TestCompressorBase
+
+
+class TestXz(TestCompressorBase):
+    __test__ = True
+    config = TestCompressorBase.config + \
+        """
+        BR2_PACKAGE_XZ=y
+        """
+    compress_cmd = "xz"
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
