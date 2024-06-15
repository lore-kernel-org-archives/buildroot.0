Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37172C27C77
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 09:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2A8E40542;
	Sat, 15 Jun 2024 09:16:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P00IO2CRuwZA; Sat, 15 Jun 2024 09:16:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB4EB4040F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB4EB4040F;
	Sat, 15 Jun 2024 09:16:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B00A1BF30A
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 09:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68D3781A6A
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 09:16:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OjRfC71ODHvq for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 09:16:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E2E7881A39
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2E7881A39
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2E7881A39
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 09:16:28 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 88F13B00593;
 Sat, 15 Jun 2024 11:16:24 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Jun 2024 11:16:12 +0200
Message-ID: <20240615091612.9579-2-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240615091612.9579-1-ju.o@free.fr>
References: <20240615091612.9579-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718442987;
 bh=EVXo+Lyskp7hSX4gCS4thU407wgm1JSH3Imhc6GRLBE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sXEEV7y94KwZnvQw88EhMMYcHWah+2UDoNZA2RkR1JYlJTPe/Ox9lCrU5L+wd9q2o
 3N93xM1FTWO73wA+SOxuJFrkLSwp6sLJi30NywwSOfmIZZGxkNo5CxUL6PmTxLnZcZ
 6csImgL15Jg1CMRP68g00QIOZD2lM4Ywi/gfGuddPxsZYmZtMYE/lV20QoecBkJQw8
 XIFcqmOQMeLow1tEqvPNaCTW/VAqOfiyDHs1Iau9fu0Mt8u2uK/12MYH2jzjMN7+3u
 Ag6Vk/N6qtfO90NltnxYk0X8jUnbW3pZdK0ZCTTxP7G9UO/4XdkvPfn/PJkbHc1TTX
 IH571nWRN227g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sXEEV7y9
Subject: [Buildroot] [PATCH 2/2] support/testing: add lame runtime test
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
Note: this test is an example of use of the base class. If accepted,
I will propose tests for other audio codecs.
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_lame.py | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 support/testing/tests/package/test_lame.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 44ff8c01e03..2a2ccde93c0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1841,6 +1841,7 @@ F:	support/testing/tests/package/test_kexec.py
 F:	support/testing/tests/package/test_kexec/
 F:	support/testing/tests/package/test_kmscube.py
 F:	support/testing/tests/package/test_kmscube/
+F:	support/testing/tests/package/test_lame.py
 F:	support/testing/tests/package/test_less.py
 F:	support/testing/tests/package/test_libcamera.py
 F:	support/testing/tests/package/test_libcamera/
diff --git a/support/testing/tests/package/test_lame.py b/support/testing/tests/package/test_lame.py
new file mode 100644
index 00000000000..bffb11672b1
--- /dev/null
+++ b/support/testing/tests/package/test_lame.py
@@ -0,0 +1,20 @@
+from tests.package.test_audio_codec_base import TestAudioCodecBase
+
+
+class TestLame(TestAudioCodecBase):
+    __test__ = True
+    config = TestAudioCodecBase.config + \
+        """
+        BR2_PACKAGE_LAME=y
+        """
+    encoded_file = "encoded.mp3"
+
+    def encode_test(self, input_filename):
+        cmd = "lame --quiet"
+        cmd += f" {input_filename} {self.encoded_file}"
+        self.assertRunOk(cmd)
+
+    def decode_test(self, output_filename):
+        cmd = "lame --quiet --decode"
+        cmd += f" {self.encoded_file} {output_filename}"
+        self.assertRunOk(cmd)
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
