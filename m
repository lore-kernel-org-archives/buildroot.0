Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189A9EB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 16:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C418D6149F;
	Fri, 14 Jul 2023 16:42:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C418D6149F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rw1ysEihW1-P; Fri, 14 Jul 2023 16:42:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09BFF6149A;
	Fri, 14 Jul 2023 16:42:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09BFF6149A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 85EA81BF369
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 16:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E6A14223A
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 16:42:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E6A14223A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2cmurRdVP3Nr for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 16:42:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E7A342238
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E7A342238
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 16:42:39 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5F10313F85F;
 Fri, 14 Jul 2023 18:42:36 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 14 Jul 2023 18:42:30 +0200
Message-ID: <20230714164230.9975-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1689352957;
 bh=DoDrxEnnpAkhKgU9xOZ3MAUWjTvvVGIVG02ulsT6Zok=;
 h=From:To:Cc:Subject:Date:From;
 b=gcAaYFNNEMRTER8NbafsNWsd/hV+aWoy2cimAtAu7A7qpUrNAscfVXBRD2Env1tJC
 TriRIjUmEFaI45N8syVN11VypYnvlrXFySojfG04bw6BPS2FAfz/M2H7E6MBj30UkT
 E8wLYrTOV3nuY1bMsXm89h5Pk5Kfy7tpusmeJUBiioeRsksUjSYtKi5AiXzO7Rngdr
 Bw8VMI6ZRtyn5JLT9JPD+pNBGGa7CVJEu1VgzY576puskgNdFihs3jgi7sGKr1iSlb
 uCwh6op7+/nCWBEFPL2pxeTc0QQjL+BMlYj9nYix+mAjaBBtUwXyQhLrMzZ194d72l
 9prXPsqt80Qzg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gcAaYFNN
Subject: [Buildroot] [PATCH 1/1]
 support/testing/tests/package/test_zchunk.py: new runtime test
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
 DEVELOPERS                                   |  1 +
 support/testing/tests/package/test_zchunk.py | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 support/testing/tests/package/test_zchunk.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 1021e5c6ba..bc317bab68 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1767,6 +1767,7 @@ F:	support/testing/tests/package/test_stress_ng.py
 F:	support/testing/tests/package/test_xz.py
 F:	support/testing/tests/package/test_z3.py
 F:	support/testing/tests/package/test_z3/
+F:	support/testing/tests/package/test_zchunk.py
 F:	support/testing/tests/package/test_zstd.py
 
 N:	Julien Viard de Galbert <julien@vdg.name>
diff --git a/support/testing/tests/package/test_zchunk.py b/support/testing/tests/package/test_zchunk.py
new file mode 100644
index 0000000000..c250b748ef
--- /dev/null
+++ b/support/testing/tests/package/test_zchunk.py
@@ -0,0 +1,16 @@
+from tests.package.test_compressor_base import TestCompressorBase
+
+
+class TestZchunk(TestCompressorBase):
+    __test__ = True
+    config = TestCompressorBase.config + \
+        """
+        BR2_PACKAGE_ZCHUNK=y
+        BR2_PACKAGE_ZSTD=y
+        """
+    compress_cmd = "zck"
+
+    def check_integrity_test(self):
+        # Do nothing for the integrity test, because "zck" does not
+        # implement this feature.
+        pass
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
