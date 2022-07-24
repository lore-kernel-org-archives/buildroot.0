Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4328EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 23:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD277611EA;
	Sun, 24 Jul 2022 23:53:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD277611EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T7BARaBAUhjZ; Sun, 24 Jul 2022 23:53:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D028C60773;
	Sun, 24 Jul 2022 23:53:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D028C60773
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 317121BF31C
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 23:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17601416EE
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 23:53:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17601416EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PiU3Su0G40T7 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 23:53:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9EC1416EA
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D9EC1416EA
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 23:53:36 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id bb16so11709383oib.11
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 16:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=JNJeNG3JJIF6Nnr6kqAGhMSWFs95Roxg+d1Et9+pmFY=;
 b=sz5ZgVVZiYscnxYo9P0q5+HmhF7xZiRmQhefjIpGuztUJr8reK7WGZ11L3SapnvqPx
 hNqpJx64vlFZZ3nMhTrkcN3xiGZUictRLgT+A/HgbAcviAP2750+pIYZPD3Ro5jh3uXg
 5hW/pnIghSnOKg9cY6YQS8ziQDgN47oISpsC4AfpjFrsUq7lI8N1MeDKiLO+KIZe4PT8
 lgi4qEpuQFGX96UNfzjxYjcVmOf5Rvm2DiOTmak6BFYAY/b0yTgAm9xMb4iRDYwHjrfn
 +FqIPXZILr55Pym+ZAGGwlndX5KjcR6a7EAiuY8fXkop1GLNfwgCCJoQ6Nc8HvSY8c6G
 dHug==
X-Gm-Message-State: AJIora/Y7se/CYMQ3qa89h68kPLaop+PXe17xtgwe0zv/4otQs7cxix7
 TyvJP6BhGZFDeRmM6o7vi0JYJm2y9ok=
X-Google-Smtp-Source: AGRyM1uBGj6dM38T3KZeQ+PBxAA1bcyB9B1QDSaNF6nBoGumSOOqXPnqJQ944sz1DZ/BJjKpeZCf0w==
X-Received: by 2002:aca:5e55:0:b0:33a:e055:38e with SMTP id
 s82-20020aca5e55000000b0033ae055038emr1263240oib.186.1658706814408; 
 Sun, 24 Jul 2022 16:53:34 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 k23-20020a4ad117000000b004359b581401sm4283268oor.25.2022.07.24.16.53.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 16:53:33 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 20:52:59 -0300
Message-Id: <20220724235301.3708271-1-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=JNJeNG3JJIF6Nnr6kqAGhMSWFs95Roxg+d1Et9+pmFY=;
 b=AaD/IJqZuXyMPl8SQV3UCQPP2KCLQJwoLEplTR5tCWkH92g2oFLwKqPiEqY3k0hGqD
 GOh/lg3r7cr11FVF572acPDfjLd06VOX33k7xEE0v95J8uJdWWy7pELVr9Va72C2SGOD
 ZS6EC6J1lNAh5WP1E/Pl2m2LjTi3dsFB8u7jlyuIprubEQ+0GjP+yNgMoThSYK1YbIpn
 u7kj661x+pHjsK+xLADC7G2QhVlEAqgKQaNAQTeu5m2stL3Rb51iVGs4bLF0BH8qT7jH
 1+A6M3Rv8RAYnQKvZRn7ylMN5K5nvEYvrhwecauAiO1xpT9WLrYpf5ewXdpxyC9VrtUG
 5JBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AaD/IJqZ
Subject: [Buildroot] [PATCH 1/3] support/testing/tests: improve
 get-developers test
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change the test into a characterization test for all warnings and errors
get-developers can return when parsing the DEVELOPERS files.

It will be helpful when changing the behavior of get-developers to bail
out on all syntax checking warnings.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 .../tests/utils/test_get_developers.py        | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/support/testing/tests/utils/test_get_developers.py b/support/testing/tests/utils/test_get_developers.py
index e4420bc6dc..12710fe8d3 100644
--- a/support/testing/tests/utils/test_get_developers.py
+++ b/support/testing/tests/utils/test_get_developers.py
@@ -47,31 +47,98 @@ class TestGetDevelopers(unittest.TestCase):
 
         # -v generating error, called from the main dir
         developers = b'text1\n'
         out, err, rc = call_get_developers("./utils/get-developers", ["-v"], self.WITH_EMPTY_PATH, topdir, developers)
         self.assertIn("Syntax error in DEVELOPERS file, line 0: 'text1'", err)
         self.assertEqual(rc, 1)
         self.assertEqual(len(out), 0)
+        self.assertEqual(len(err), 1)
 
         # -v generating error, called from path
         developers = b'text2\n'
         out, err, rc = call_get_developers("get-developers", ["-v"], self.WITH_UTILS_IN_PATH, topdir, developers)
         self.assertIn("Syntax error in DEVELOPERS file, line 0: 'text2'", err)
         self.assertEqual(rc, 1)
         self.assertEqual(len(out), 0)
+        self.assertEqual(len(err), 1)
+
+        # -v generating error for file entry with no developer entry
+        developers = b'# comment\n' \
+                     b'\n' \
+                     b'F:\tutils/get-developers\n' \
+                     b'\n' \
+                     b'N:\tAuthor2 <email>\n' \
+                     b'F:\tutils/get-developers\n'
+        out, err, rc = call_get_developers("get-developers", ["-v"], self.WITH_UTILS_IN_PATH, topdir, developers)
+        self.assertIn("Syntax error in DEVELOPERS file, line 1", err)
+        self.assertEqual(rc, 0)
+        self.assertEqual(len(out), 0)
+        self.assertEqual(len(err), 1)
+
+        # -v generating error for developer entry with no file entries
+        developers = b'# comment\n' \
+                     b'# comment\n' \
+                     b'\n' \
+                     b'N:\tAuthor1 <email>\n' \
+                     b'N:\tAuthor2 <email>\n' \
+                     b'N:\tAuthor3 <email>\n' \
+                     b'F:\tutils/get-developers\n'
+        out, err, rc = call_get_developers("get-developers", ["-v"], self.WITH_UTILS_IN_PATH, topdir, developers)
+        self.assertIn("Syntax error in DEVELOPERS file, line 1", err)
+        self.assertIn("Syntax error in DEVELOPERS file, line 2", err)
+        self.assertEqual(rc, 0)
+        self.assertEqual(len(out), 0)
+        self.assertEqual(len(err), 2)
+
+        # -v not generating error for developer entry with empty list of file entries
+        developers = b'# comment\n' \
+                     b'# comment\n' \
+                     b'\n' \
+                     b'N:\tAuthor1 <email>\n' \
+                     b'\n' \
+                     b'N:\tAuthor2 <email>\n' \
+                     b'\n' \
+                     b'N:\tAuthor3 <email>\n' \
+                     b'F:\tutils/get-developers\n'
+        out, err, rc = call_get_developers("get-developers", ["-v"], self.WITH_UTILS_IN_PATH, topdir, developers)
+        self.assertEqual(rc, 0)
+        self.assertEqual(len(out), 0)
+        self.assertEqual(len(err), 0)
+
+        # -v generating warning for old file entry
+        developers = b'N:\tAuthor <email>\n' \
+                     b'F:\tpath/that/does/not/exists/1\n' \
+                     b'F:\tpath/that/does/not/exists/2\n'
+        out, err, rc = call_get_developers("get-developers", ["-v"], self.WITH_UTILS_IN_PATH, topdir, developers)
+        self.assertIn("WARNING: 'path/that/does/not/exists/1' doesn't match any file", err)
+        self.assertIn("WARNING: 'path/that/does/not/exists/2' doesn't match any file", err)
+        self.assertEqual(rc, 0)
+        self.assertEqual(len(out), 0)
+        self.assertEqual(len(err), 2)
 
         # -c generating warning and printing lots of files with no developer
         developers = b'N:\tAuthor <email>\n' \
                      b'F:\tpath/that/does/not/exists/1\n' \
                      b'F:\tpath/that/does/not/exists/2\n'
         out, err, rc = call_get_developers("./utils/get-developers", ["-c"], self.WITH_EMPTY_PATH, topdir, developers)
         self.assertIn("WARNING: 'path/that/does/not/exists/1' doesn't match any file", err)
         self.assertIn("WARNING: 'path/that/does/not/exists/2' doesn't match any file", err)
         self.assertEqual(rc, 0)
         self.assertGreater(len(out), 1000)
+        self.assertEqual(len(err), 2)
+
+        # -c printing lots of files with no developer
+        developers = b'# comment\n' \
+                     b'\n' \
+                     b'N:\tAuthor <email>\n' \
+                     b'F:\tutils/get-developers\n'
+        out, err, rc = call_get_developers("./utils/get-developers", ["-c"], self.WITH_EMPTY_PATH, topdir, developers)
+        self.assertEqual(rc, 0)
+        self.assertGreater(len(out), 1000)
+        self.assertEqual(len(err), 0)
 
         # -p lists more than one developer
         developers = b'N:\tdev1\n' \
                      b'F:\ttoolchain/\n' \
                      b'\n' \
                      b'N:\tdev2\n' \
                      b'F:\ttoolchain/\n'
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
