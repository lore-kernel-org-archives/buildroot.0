Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB3FC4332F
	for <buildroot@archiver.kernel.org>; Sat, 24 Dec 2022 09:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F50D402E4;
	Sat, 24 Dec 2022 09:18:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F50D402E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GXw9CyOCB9wr; Sat, 24 Dec 2022 09:18:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE91340167;
	Sat, 24 Dec 2022 09:18:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE91340167
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 311401BF296
 for <buildroot@lists.busybox.net>; Sat, 24 Dec 2022 09:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 199C760B1B
 for <buildroot@lists.busybox.net>; Sat, 24 Dec 2022 09:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 199C760B1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Up7kUG6LLKyl for <buildroot@lists.busybox.net>;
 Sat, 24 Dec 2022 09:18:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 015D5607C7
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 015D5607C7
 for <buildroot@buildroot.org>; Sat, 24 Dec 2022 09:18:15 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id o15so4976913wmr.4
 for <buildroot@buildroot.org>; Sat, 24 Dec 2022 01:18:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LeEi3n1lC+7sQvufrSNutIf0PCxQHTe+uHIDfT5844E=;
 b=zNOSFCK/ijAFYE/cXSxEUCvXJP620coYaP87k3M9wkBnVEjfc9R1zH53H49WSGCbYQ
 bKgoKqiCm3OHzQlLlgTv+ttsGNH3zWYcui57nTzyQ9IYC5P+nF0aT4eeBHZR0QSMAUL0
 akPU3U0xNzBJRDf4quNKh4pm30xERZkNnIf2phvsdNoext2nuappEsWypY2EgOLokgoN
 gRf2McCG0ZpnpoQ12flsBTolfJUxeqSpchBeR/axyqNPHQIePzvbW66AxkfkelQQqVRD
 Bk3RnUZgOcLoVXotF4AEDNgIhn2btsMfSXKXhZ7CZikwIDe86DuDGJSZFbMkNKZsXE2R
 UWOg==
X-Gm-Message-State: AFqh2kp6V4wdY1HMnaY0BM+eyiNQ4YKYPMljd1UGrR5mFAxREdco1tis
 2zRmjbpVzdHpRgk+XhjZCDcmeR5jNH8=
X-Google-Smtp-Source: AMrXdXuIFHuDIRCWHGZOqD80cC3OpUUzvh03xvVVcTQUc0OXyzrFptyZnCZHF3p8AxKYuS0oqyGl8g==
X-Received: by 2002:a7b:c3c1:0:b0:3c7:1359:783b with SMTP id
 t1-20020a7bc3c1000000b003c71359783bmr9099288wmj.1.1671873494164; 
 Sat, 24 Dec 2022 01:18:14 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:9ce0:1380:e1bd:a6d1])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a05600c35c900b003d6b71c0c92sm16526202wmq.45.2022.12.24.01.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 01:18:13 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 24 Dec 2022 10:18:11 +0100
Message-Id: <3e3ef4e45b435317b2a6e60da1007ef6b4cf774d.1671873478.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671873478.git.yann.morin.1998@free.fr>
References: <cover.1671873478.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LeEi3n1lC+7sQvufrSNutIf0PCxQHTe+uHIDfT5844E=;
 b=h7xWU7KtjEGxWco+E5xGMVu/KTLM66xUSu/E1cyUAFD0+qmJPKN5Xq78l0918dJnE5
 0vwMZ7xemK6nB5gsFukUSTSvMpk5Y+nXMMGKoOwYhYYMHW4yiPhJBs479BPaUec5nJcb
 ICtZ9YfWujMmlD802tTzIkopkX0vo7sfWwWpuGFC7HsevNVlmbv4IFzXGtwh9UOtoUg6
 fkaeW7v3OrXPCWHaTtgqRbt7zTRtDSritQi6McHElF8GT0KbIJlshE7HjSKduNPQ5DYg
 FpyU+jhidXqUd73qelayD7uo56aHsRB9ibdkjvIgqXeYwFQG5Q7Y4L3dK886BNIdpRdK
 F0JA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=h7xWU7Kt
Subject: [Buildroot] [PATCH 1/3] support/tests: print failed command and
 output on assertRunOK error
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, when asserting that a command succeeded, we just capture the
return code of the command. If that is not zero, the assertion fails,
but the error message is not very splicit:
    AssertionError: 1 != 0

Replace the error message with an explicit message that dumps the failed
command, the error code, and the resulting output.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/infra/basetest.py | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 96c6848dfc..45bcd4c2e2 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -88,7 +88,12 @@ class BRTest(BRConfigTest):
         super(BRTest, self).tearDown()
 
     # Run the given 'cmd' with a 'timeout' on the target and
-    # assert that the command succeeded
+    # assert that the command succeeded; on error, print the
+    # faulty command and its output
     def assertRunOk(self, cmd, timeout=-1):
-        _, exit_code = self.emulator.run(cmd, timeout)
-        self.assertEqual(exit_code, 0)
+        out, exit_code = self.emulator.run(cmd, timeout)
+        self.assertEqual(
+            exit_code,
+            0,
+            "\nFailed to run: {}\noutput was:\n{}".format(cmd, '  '+'\n  '.join(out))
+        )
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
