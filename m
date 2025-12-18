Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1959CD711C4
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 21:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD775412F3;
	Thu, 18 Dec 2025 21:46:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u5_fblAvgg79; Thu, 18 Dec 2025 21:46:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50715412ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766094418;
	bh=AbPG8R2eoYklB+vyzMtXAc9z57NVxl3epGW4pwhEkNo=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=BJOE1/SD+wMlCPlAQ8gLUwi0iH7icLnn/bLU3wdl3yY9nfsyCsIymM3GT76Vmdjf0
	 Gn3A+gtJRJm1AQtepVo01qTPOp0WitGJ/tjzSdvSMofyclL00sKwJ5RBExlqR459u0
	 7rzzkOPx86GiEcxI6B9hNP9g9krp2prrhVB6RcdnHAsAS3XrooBvq9e15v4/Vi/esU
	 ELpgSS7eVKnoo4015QH/h4ODK/wRM5Mceda7tmmKKdEBYuc12aWSDnXzUt7S+o5K0W
	 4TkqKCjBDbCk9K5NIA1/ATuG7DGO07hNV5/tiC4L9/rzmOdUb6zUZ9aUudPPn9lHPi
	 h/Q0vxINhIUbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50715412ED;
	Thu, 18 Dec 2025 21:46:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 77A38293
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 21:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 689116086C
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 21:46:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZHsnPysvcz7Z for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 21:46:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3C4CD60860
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C4CD60860
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C4CD60860
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 21:46:55 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a0d:e487:58e:a561:62b7:fc9e:7363:91df])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 15FAA780389;
 Thu, 18 Dec 2025 22:46:50 +0100 (CET)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	Julien Olivain <ju.o@free.fr>
Date: Thu, 18 Dec 2025 22:46:35 +0100
Message-ID: <20251218214636.736781-1-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766094414;
 bh=qgKooQ8KPe4V5s2fIYivK6CyN5WDLKoJwjtyhNVe4Sw=;
 h=From:To:Cc:Subject:Date:From;
 b=D9zaZLMxDbqpQrUleT8qivq17eo6jxAWYUqsbs0jQFMUkcBj8WKk1wkX/9l9mKOCf
 FoBb8y8BSQJmWVFxQhHm802GjFW8z+F2sd7XqV7FstXdAWZjJu0xopFGD2PFDKulwd
 8DSRq2sAfAnp1n82f8WgEi1KKp+FT8c8CqJyIagZlk92KDrzJdyY7ADZSmg4NIf90g
 19x6kUq9PmlR8F1aosr0U4TPmAktHy0830stTp5of6anqbFPb4d6BdR3E+olVfd05g
 KzEXueV4AAVpcWZ0dqqwawakSdK3YA+aFLJtu3wPYK44FnPOBY3mWO4tn+w+rflPvg
 bjrfgdZ64dw3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=D9zaZLMx
Subject: [Buildroot] [PATCH 1/2] support/testing: add opus-tools runtime test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                     |  1 +
 .../testing/tests/package/test_opus_tools.py   | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 support/testing/tests/package/test_opus_tools.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 1b27df9beb..3ea5f84b30 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1973,6 +1973,7 @@ F:	support/testing/tests/package/test_oath_toolkit.py
 F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_openblas.py
 F:	support/testing/tests/package/test_openocd.py
+F:	support/testing/tests/package/test_opus_tools.py
 F:	support/testing/tests/package/test_parted.py
 F:	support/testing/tests/package/test_patch.py
 F:	support/testing/tests/package/test_patch/
diff --git a/support/testing/tests/package/test_opus_tools.py b/support/testing/tests/package/test_opus_tools.py
new file mode 100644
index 0000000000..89b76fb954
--- /dev/null
+++ b/support/testing/tests/package/test_opus_tools.py
@@ -0,0 +1,18 @@
+from tests.package.test_audio_codec_base import TestAudioCodecBase
+
+
+class TestOpusTools(TestAudioCodecBase):
+    __test__ = True
+    config = TestAudioCodecBase.config + \
+        """
+        BR2_PACKAGE_OPUS_TOOLS=y
+        """
+    encoded_file = "encoded.opus"
+
+    def encode_test(self, input_filename):
+        cmd = f"opusenc {input_filename} {self.encoded_file}"
+        self.assertRunOk(cmd)
+
+    def decode_test(self, output_filename):
+        cmd = f"opusdec {self.encoded_file} {output_filename}"
+        self.assertRunOk(cmd)
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
