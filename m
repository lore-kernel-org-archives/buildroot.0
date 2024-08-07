Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDA1C52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 19:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAE0481224;
	Wed,  7 Aug 2024 19:57:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uRm7U6eCGmgM; Wed,  7 Aug 2024 19:57:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D01FB8122B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D01FB8122B;
	Wed,  7 Aug 2024 19:57:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 809FC1BF2E3
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 19:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F0006068F
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 19:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Abn-LeU2-c-F for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 19:57:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5A55F6066A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A55F6066A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A55F6066A
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 19:57:46 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 2185FB00535;
 Wed,  7 Aug 2024 21:57:43 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed,  7 Aug 2024 21:57:36 +0200
Message-ID: <20240807195736.167142-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723060664;
 bh=QfQKTsQXGCbnNqxNRP3/+MMsROV5vAKGjaiEl8RHFik=;
 h=From:To:Cc:Subject:Date:From;
 b=stIevfAgMvQkm27wrjyYqmcE6OumcRroxazGw+qjym/YaYrSox1epBfA6wDlefCaX
 e04d+pLmOasxFiMma+yXZB/pNgA6oRXtJ8MJpi4DkywdfxtcQBuYexMQQJH9Ck/mkb
 EyELzNcNmHtyFcAOu8Ca9BFN0RS7eV7lbmGodiHsKfDQTSgTAAuWJ90jUM5ALMLljY
 /QemQrgqB2m7vdC9wGdaG8d3p1+KRO3lldaIAJc33Uf/ft29zIeUweXsbGwZ8iXiES
 V1oDIfASV6wBHGNeEPkO8DuIhYIdlRkiZZH3FqjTu0UGxiAeVfdzkXBMCfnNwAF+au
 beZhSCWnq05OQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=stIevfAg
Subject: [Buildroot] [PATCH 1/1] support/testing: add vorbis-tools runtime
 test
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
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/7530002562
---
 DEVELOPERS                                    |  1 +
 .../tests/package/test_vorbis_tools.py        | 20 +++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 support/testing/tests/package/test_vorbis_tools.py

diff --git a/DEVELOPERS b/DEVELOPERS
index c472aa4c53..7eba595ed9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1976,6 +1976,7 @@ F:	support/testing/tests/package/test_trace_cmd.py
 F:	support/testing/tests/package/test_trace_cmd/
 F:	support/testing/tests/package/test_usbutils.py
 F:	support/testing/tests/package/test_usbutils/
+F:	support/testing/tests/package/test_vorbis_tools.py
 F:	support/testing/tests/package/test_weston.py
 F:	support/testing/tests/package/test_weston/
 F:	support/testing/tests/package/test_wine.py
diff --git a/support/testing/tests/package/test_vorbis_tools.py b/support/testing/tests/package/test_vorbis_tools.py
new file mode 100644
index 0000000000..edf186f31d
--- /dev/null
+++ b/support/testing/tests/package/test_vorbis_tools.py
@@ -0,0 +1,20 @@
+from tests.package.test_audio_codec_base import TestAudioCodecBase
+
+
+class TestVorbisTools(TestAudioCodecBase):
+    __test__ = True
+    config = TestAudioCodecBase.config + \
+        """
+        BR2_PACKAGE_VORBIS_TOOLS=y
+        """
+    encoded_file = "encoded.ogg"
+
+    def encode_test(self, input_filename):
+        cmd = "oggenc"
+        cmd += f" -o {self.encoded_file} {input_filename}"
+        self.assertRunOk(cmd)
+
+    def decode_test(self, output_filename):
+        cmd = "oggdec"
+        cmd += f" -o {output_filename} {self.encoded_file}"
+        self.assertRunOk(cmd)
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
