Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A51C4332F
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 14:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 588C560B23;
	Sun, 27 Nov 2022 14:48:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 588C560B23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XXUt58kuDCPx; Sun, 27 Nov 2022 14:48:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7002E60601;
	Sun, 27 Nov 2022 14:48:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7002E60601
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C3E5D1BF3C5
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 14:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACC13605B5
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 14:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACC13605B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xCxJLQ4G9utS for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 14:48:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97A706059C
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97A706059C
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 14:48:36 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 m7-20020a9d6447000000b0066da0504b5eso5450028otl.13
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 06:48:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TQCnaImiukqjp5NEczG9HZsumpStM9N7/VaXdxjg68Y=;
 b=QOf+ewCejsl7DhySOYD/mqtPNfuhQPp4bGQiA90B15Yv/qHImz0GQ+EmIAF3Ag2a1R
 ep1R5qm1IJYEftC1RPJeJ8jkQ6R1LC7PKL8p8xdZm+J6e1zlJZ8lSz7Czup633NtR9Aw
 W1xHy8qcpwFDyqLgWMz028L0R5GGWCHjmqm2sBwMg1yYqJj98Gzp8Br0RfIPYFS5TTwf
 pZHdT7PJowPYhp7//RQzKoo76p0lVPcG2OMXuBQ6u/u7MMfmQ3Zm5HW8RSWUGf7bBlkK
 Z82sDn3Zxp7GOYyGjLIK/W/TYijO76G3l9l9WHq0JNPAYaaFQu0q8wGRpO/AJbcwUcVs
 6XMQ==
X-Gm-Message-State: ANoB5pm8oEGe087l5CosyLMuD/ikRAIOHYJELJJVCOZ7lJhRp4XYOXiK
 DCy2TwZpHFO7nRaMXqoSFp7GY5NMRfo=
X-Google-Smtp-Source: AA0mqf5iXNpTntD0dK+QMRcl9nZF7LZrpjNBlUsgru1Vaq4117c7DFm5lkFVqPaaQf9mlgCzCyZSgw==
X-Received: by 2002:a9d:7097:0:b0:66d:d37:205 with SMTP id
 l23-20020a9d7097000000b0066d0d370205mr13531070otj.222.1669560515590; 
 Sun, 27 Nov 2022 06:48:35 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:9b54:d73e:4d8c:458c])
 by smtp.gmail.com with ESMTPSA id
 e64-20020aca3743000000b00342e8bd2299sm3471711oia.6.2022.11.27.06.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 06:48:34 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 11:48:18 -0300
Message-Id: <20221127144819.2022348-1-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TQCnaImiukqjp5NEczG9HZsumpStM9N7/VaXdxjg68Y=;
 b=HVqmH49+MkG8OYW6xKBXu484skFY6vYLXmzXuvZdA81FJ1mDXNi5NHALTq2ecVz8nH
 0uR9uO+jBOIxWbN7GyNLGXQDCPdudXdUkS6L9q1BXascMTmsRyav7y2KDNdnj8v1tlaT
 LRshsRaSNe7iz+FAnQwf8hiqRy7K1ftfMB/V7qW0GO8L+qM10T65XxZ5ie3zIIlzC8XA
 C5pliIebVZFVBHi+h0c5XL0zV9cmA+IAt/6KXKXE1hXKODwn4U1k8gA+LKupRCUJesc/
 yAwDeAP2GDPaBwUKnLb8yWfxyESxzCdV78EsHXOjA/4XmKZqmtEKi+b+mD07jXq3aNgY
 739Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HVqmH49+
Subject: [Buildroot] [next,
 v2 1/2] utils/get-developers: bail out on parsing errors
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently 4 types of parsing errors/warnings can be found:
- entry for a file that is not in the tree anymore (warning)
- developer entry with no file entry (error)
- file entry with no developer (error)
- entry that is not a developer, a file or a comment (hard error)

Currently only the last one ends the script with -v with error code.

Make all 3 error types into hard errors and bail out at the first error
found, because the rest of the state machine is not designed to handle
malformed input.
Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v1 -> v2:
  - do not change warning to error, an entry for a file that is not in
    the tree anymore is not a syntax error (Thomas)
  - add the lineno on the warning messages in the next patch instead of
    this patch

check-*:
https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/706249815

tests.utils.test_get_developers.TestGetDevelopers:
https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/706249847
---
 support/testing/tests/utils/test_get_developers.py | 9 ++++-----
 utils/getdeveloperlib.py                           | 1 +
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/support/testing/tests/utils/test_get_developers.py b/support/testing/tests/utils/test_get_developers.py
index 12710fe8d3..0b313c7c59 100644
--- a/support/testing/tests/utils/test_get_developers.py
+++ b/support/testing/tests/utils/test_get_developers.py
@@ -70,11 +70,11 @@ class TestGetDevelopers(unittest.TestCase):
                      b'F:\tutils/get-developers\n'
         out, err, rc = call_get_developers("get-developers", ["-v"], self.WITH_UTILS_IN_PATH, topdir, developers)
         self.assertIn("Syntax error in DEVELOPERS file, line 1", err)
-        self.assertEqual(rc, 0)
+        self.assertEqual(rc, 1)
         self.assertEqual(len(out), 0)
         self.assertEqual(len(err), 1)
 
-        # -v generating error for developer entry with no file entries
+        # -v generating error for developer entry with no file entries, stopping on first error
         developers = b'# comment\n' \
                      b'# comment\n' \
                      b'\n' \
@@ -84,10 +84,9 @@ class TestGetDevelopers(unittest.TestCase):
                      b'F:\tutils/get-developers\n'
         out, err, rc = call_get_developers("get-developers", ["-v"], self.WITH_UTILS_IN_PATH, topdir, developers)
         self.assertIn("Syntax error in DEVELOPERS file, line 1", err)
-        self.assertIn("Syntax error in DEVELOPERS file, line 2", err)
-        self.assertEqual(rc, 0)
+        self.assertEqual(rc, 1)
         self.assertEqual(len(out), 0)
-        self.assertEqual(len(err), 2)
+        self.assertEqual(len(err), 1)
 
         # -v not generating error for developer entry with empty list of file entries
         developers = b'# comment\n' \
diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index 2a8d5c213c..dbd21af443 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -243,6 +243,7 @@ def parse_developers(filename=None):
                 if name is not None or len(files) != 0:
                     print("Syntax error in DEVELOPERS file, line %d" % linen,
                           file=sys.stderr)
+                    return None
                 name = line[2:].strip()
             elif line.startswith("F:"):
                 fname = line[2:].strip()
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
