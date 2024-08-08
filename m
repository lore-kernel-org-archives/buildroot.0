Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92357C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 21:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5620781E5E;
	Thu,  8 Aug 2024 21:06:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X8UQg2wQe6hJ; Thu,  8 Aug 2024 21:06:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5866781E65
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5866781E65;
	Thu,  8 Aug 2024 21:06:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3351D1BF380
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 21:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20A1C40BFE
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 21:06:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AD6vBnhhp0HA for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 21:06:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E8A9340226
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8A9340226
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E8A9340226
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 21:06:16 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id BF3ABB0053E;
 Thu,  8 Aug 2024 23:06:13 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu,  8 Aug 2024 23:06:03 +0200
Message-ID: <20240808210603.185284-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723151175;
 bh=VTuUUkbF3/m6w97xlfT8pD+gHbd0p5D+33cJWkVoOSU=;
 h=From:To:Cc:Subject:Date:From;
 b=DxqkpPoZcy7jqvAZWma15ypSWSdRzjr5uy+FSTc4qlJ8HrEK/EHl5YJT9A/S36tOH
 JqFMlnnqUu4mckRbIweID3MZcAiwDLJYgi8pZz2d09ItK461W3bKwlwqeylCTFR48Q
 oQPEeJmW+nb7zCkQlfNoKj2fNm9s3Frffe3c5n4yG9US9MFWWBQ4MvVzWpgpK53o+s
 3UfpHQbz0qDCaIPdOtz6mbmlbSzhTRc6dOPclCvJxExjx8Z+g084B6qabTwcSiSji2
 m1mia0L79xK6rc1hzRJz4xlaVUgI1D2gTQGqd9QSYbaPN8SZV98rPlrraZmoDabBow
 28tbhkx3hjagQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DxqkpPoZ
Subject: [Buildroot] [PATCH 1/1] support/testing: add flac runtime test
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
https://gitlab.com/jolivain/buildroot/-/jobs/7540310064
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_flac.py | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 support/testing/tests/package/test_flac.py

diff --git a/DEVELOPERS b/DEVELOPERS
index d7d0af3543..1255993b39 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1857,6 +1857,7 @@ F:	support/testing/tests/package/test_ethtool.py
 F:	support/testing/tests/package/test_ethtool/
 F:	support/testing/tests/package/test_file.py
 F:	support/testing/tests/package/test_file/
+F:	support/testing/tests/package/test_flac.py
 F:	support/testing/tests/package/test_fluidsynth.py
 F:	support/testing/tests/package/test_fluidsynth/
 F:	support/testing/tests/package/test_fping.py
diff --git a/support/testing/tests/package/test_flac.py b/support/testing/tests/package/test_flac.py
new file mode 100644
index 0000000000..9ee7bc1c0d
--- /dev/null
+++ b/support/testing/tests/package/test_flac.py
@@ -0,0 +1,20 @@
+from tests.package.test_audio_codec_base import TestAudioCodecBase
+
+
+class TestFlac(TestAudioCodecBase):
+    __test__ = True
+    config = TestAudioCodecBase.config + \
+        """
+        BR2_PACKAGE_FLAC=y
+        """
+    encoded_file = "encoded.flac"
+
+    def encode_test(self, input_filename):
+        cmd = "flac"
+        cmd += f" -o {self.encoded_file} {input_filename}"
+        self.assertRunOk(cmd)
+
+    def decode_test(self, output_filename):
+        cmd = "flac -d"
+        cmd += f" -o {output_filename} {self.encoded_file}"
+        self.assertRunOk(cmd)
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
