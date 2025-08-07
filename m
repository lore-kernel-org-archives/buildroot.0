Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C38C87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 10:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9447561BD3;
	Thu,  7 Aug 2025 10:07:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9CKq40oA526Q; Thu,  7 Aug 2025 10:07:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D25316F5F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D25316F5F8;
	Thu,  7 Aug 2025 10:07:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 048E2D79
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 10:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E276041E35
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 10:07:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3i3oy3efO-1U for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 10:07:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8E33B40141
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E33B40141
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E33B40141
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 10:07:20 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1786454076; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 07 Aug 2025 10:07:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1ujxWh-002Stc-0y;
 Thu, 07 Aug 2025 12:07:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu,  7 Aug 2025 12:07:09 +0200
Message-Id: <20250807100710.587721-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=n/B9T0Djctj954PJQ6Ol6OlvNndPXPVztiqcxdy8kvUqY8xz79f/0kimGhSHBRFGgVJ1D9wOEmIkNCjgu5W/leOi4N0jLlIQ41tu5yt8he/LKIiahGXHXoCAaPZzhhaN6X5c13sxHZH4rQ3QORUV3mc3Pp9V9USj9ssOji7iGJbLjXPG7hl2NTKDVK2H0rYRw3GSCzH0A1rkOPdhyVmiH4kWjHSbRsYQk88GwCzEikoV2w2WNarXxCXoo3ZOAZn+fd378fYuTp8Y8Kz7oHEoTgtlcw95zU8KwGGhIE1w/GQT7UD0279cobKX0u8dd58YRbSZNitekFfm4u/SESc9hw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=aI7JiuPprPsrksZ6U5AUcuMnVAsvnP3w7HEjTqqX1wo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=n/B9T0Dj
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] support/testing: test_gstreamer1: raise
 tesseract-ocr timeout to 15s
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On my laptop (i5-8365U), running cross-tesseract-ocr in QEMU takes
longer than the default timeout (5s), causing the test to fail:

 # time tesseract frame10.png output
 Error in pixReadMemTiff: function not present
 Error in pixReadMem: tiff: no pix returned
 Error in pixaGenerateFontFromString: pix not made
 Error in bmfCreate: font pixa not made
 Estimating resolution as 157
 real    0m 8.17s
 user    0m 5.36s
 sys     0m 2.79s

So extend the assertRunOk() timeout with ~2x that similar to how it is done
for the gst-launch-1.0 pipeline.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_gstreamer1.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_gstreamer1.py b/support/testing/tests/package/test_gstreamer1.py
index ff0302a8a6..82829dab98 100644
--- a/support/testing/tests/package/test_gstreamer1.py
+++ b/support/testing/tests/package/test_gstreamer1.py
@@ -75,7 +75,7 @@ class TestGstreamer1(infra.basetest.BRTest):
         # We extract the text from our last image.
         img_file = f"frame{num_frames}.png"
         cmd = f"tesseract {img_file} output"
-        self.assertRunOk(cmd)
+        self.assertRunOk(cmd, timeout=15)
 
         # We check we have our initial message.
         out, ret = self.emulator.run("cat output.txt")
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
