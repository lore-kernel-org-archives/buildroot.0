Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DC9C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 23:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF55183F25;
	Sun, 24 Jul 2022 23:54:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF55183F25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D9fhZcagOAkt; Sun, 24 Jul 2022 23:54:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81AC783E93;
	Sun, 24 Jul 2022 23:54:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81AC783E93
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B3951BF31C
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 23:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D85C5611E4
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 23:53:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D85C5611E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ZaC0ND9uezs for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 23:53:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E06BB60767
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E06BB60767
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 23:53:40 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 y10-20020a9d634a000000b006167f7ce0c5so7610888otk.0
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 16:53:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=mcRdom1IG3X+AjPXBhADIsBN3vAjJ2BA4PGqd+gXknU=;
 b=2hhQgdF312tIJK7YR/wA7wQsHUK31zRBDchOYTfCG2LSccmTUvacjvBrXNeXrmMlb9
 UXbQQY12hqX++WJB4EuUIUlcipW1XdkMrGXpuEKy32wGZQKcWRNrL6sj/wzIwi5ee2Er
 PKGVrMsGcJTDynaY4ICCZyp6/CkASj52q83Hnb4Nw8TM/KRMTFRiKJTFcx+Qbh9w+pn7
 Nz8jiQBrW2XEpUdB7GLomvPMhDGgmdXcP62q45ydeyTZzDtQmBUdwINm/pbHRWpdriv3
 1MrCnryIwPZicOdTVsB0m1HDYlILSpAKqsoeOtryUC+rDCdaQPBKVukz0icKefTb7Dzs
 YmbQ==
X-Gm-Message-State: AJIora9jK8pGReauz+wSRDOa5YAJgQdKv3MObGY3YgDy4e75hR3n+soM
 wipRpva+KIgUGrn/GIHubG7qFe6lqCA=
X-Google-Smtp-Source: AGRyM1srVun1tW8e3Vo2Ym9SWsw2CJjb2xrWmKzymw9o/wemgvm8tMXndO9vZp1lhSE3Sdck98wLvQ==
X-Received: by 2002:a9d:6ace:0:b0:61c:8270:a04a with SMTP id
 m14-20020a9d6ace000000b0061c8270a04amr3839403otq.134.1658706819916; 
 Sun, 24 Jul 2022 16:53:39 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 k23-20020a4ad117000000b004359b581401sm4283268oor.25.2022.07.24.16.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 16:53:38 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 20:53:01 -0300
Message-Id: <20220724235301.3708271-3-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220724235301.3708271-1-ricardo.martincoski@gmail.com>
References: <20220724235301.3708271-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=mcRdom1IG3X+AjPXBhADIsBN3vAjJ2BA4PGqd+gXknU=;
 b=iTdEWJybqqenZERxpDOszY/HscpbIIFTJMeADOjqmOu6pFO3dVSby/hFprE0iEWNpJ
 iYz7ibdxL3cjxQAxcHEjq5FJRqspDX6PnUQqY6BDiHaHH0N96xSxxwldu0FY3mtIPPLu
 o2JIj9uB7v+ljSLwJEAxgstldyyR079HmTFYiytfyEsATBlUVNF7NxKp3BxDiBcKIa66
 baOqqmG5ev/ywMvuSZG4RHuBAU0XEPMNv8E6WlJu/acUuCOgtcfIFpnoeCGkbZ98kCJd
 adCQmuzty0CvyXPCJeMQK4LJGD8PL7zY7EndNXjohaF5FXlKGFikLkLuB+ih+vdjNP77
 miWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iTdEWJyb
Subject: [Buildroot] [PATCH 3/3] utils/get-developers: print error for
 correct line
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

Start counting the line numbers in 1 instead of 0, in case an error
must be printed.

Both the error about a developer entry with no file entry and the error
about a file entry with no developer entry actually belong to the
non-empty line previous the one being analysed, so add a hint to the
error message.

Also count empty and comment lines, so a developer fixing the file can
jump to the correct line (or the nearest one).

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 .../testing/tests/utils/test_get_developers.py | 18 +++++++++---------
 utils/getdeveloperlib.py                       |  4 ++--
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/support/testing/tests/utils/test_get_developers.py b/support/testing/tests/utils/test_get_developers.py
index d0c8e4d028..df216d3b02 100644
--- a/support/testing/tests/utils/test_get_developers.py
+++ b/support/testing/tests/utils/test_get_developers.py
@@ -44,51 +44,51 @@ class TestGetDevelopers(unittest.TestCase):
         self.assertIn("No action specified", out)
         self.assertEqual(rc, 0)
         self.assertEqual(len(err), 0)
 
         # -v generating error, called from the main dir
         developers = b'text1\n'
         out, err, rc = call_get_developers("./utils/get-developers", ["-v"], self.WITH_EMPTY_PATH, topdir, developers)
-        self.assertIn("Syntax error in DEVELOPERS file, line 0: 'text1'", err)
+        self.assertIn("Syntax error in DEVELOPERS file, line 1: 'text1'", err)
         self.assertEqual(rc, 1)
         self.assertEqual(len(out), 0)
         self.assertEqual(len(err), 1)
 
         # -v generating error, called from path
         developers = b'text2\n'
         out, err, rc = call_get_developers("get-developers", ["-v"], self.WITH_UTILS_IN_PATH, topdir, developers)
-        self.assertIn("Syntax error in DEVELOPERS file, line 0: 'text2'", err)
+        self.assertIn("Syntax error in DEVELOPERS file, line 1: 'text2'", err)
         self.assertEqual(rc, 1)
         self.assertEqual(len(out), 0)
         self.assertEqual(len(err), 1)
 
         # -v generating error for file entry with no developer entry
         developers = b'# comment\n' \
                      b'\n' \
                      b'F:\tutils/get-developers\n' \
                      b'\n' \
                      b'N:\tAuthor2 <email>\n' \
                      b'F:\tutils/get-developers\n'
         out, err, rc = call_get_developers("get-developers", ["-v"], self.WITH_UTILS_IN_PATH, topdir, developers)
-        self.assertIn("Syntax error in DEVELOPERS file, line 1", err)
+        self.assertIn("Syntax error in DEVELOPERS file, just before line 5", err)
         self.assertEqual(rc, 1)
         self.assertEqual(len(out), 0)
         self.assertEqual(len(err), 1)
 
         # -v generating error for developer entry with no file entries
         developers = b'# comment\n' \
                      b'# comment\n' \
                      b'\n' \
                      b'N:\tAuthor1 <email>\n' \
                      b'N:\tAuthor2 <email>\n' \
                      b'N:\tAuthor3 <email>\n' \
                      b'F:\tutils/get-developers\n'
         out, err, rc = call_get_developers("get-developers", ["-v"], self.WITH_UTILS_IN_PATH, topdir, developers)
-        self.assertIn("Syntax error in DEVELOPERS file, line 1", err)
-        self.assertIn("Syntax error in DEVELOPERS file, line 2", err)
+        self.assertIn("Syntax error in DEVELOPERS file, just before line 5", err)
+        self.assertIn("Syntax error in DEVELOPERS file, just before line 6", err)
         self.assertEqual(rc, 1)
         self.assertEqual(len(out), 0)
         self.assertEqual(len(err), 2)
 
         # -v not generating error for developer entry with empty list of file entries
         developers = b'# comment\n' \
                      b'# comment\n' \
@@ -105,27 +105,27 @@ class TestGetDevelopers(unittest.TestCase):
         self.assertEqual(len(err), 0)
 
         # -v generating error for old file entry
         developers = b'N:\tAuthor <email>\n' \
                      b'F:\tpath/that/does/not/exists/1\n' \
                      b'F:\tpath/that/does/not/exists/2\n'
         out, err, rc = call_get_developers("get-developers", ["-v"], self.WITH_UTILS_IN_PATH, topdir, developers)
-        self.assertIn("Syntax error in DEVELOPERS file, line 1: 'path/that/does/not/exists/1' doesn't match any file", err)
-        self.assertIn("Syntax error in DEVELOPERS file, line 2: 'path/that/does/not/exists/2' doesn't match any file", err)
+        self.assertIn("Syntax error in DEVELOPERS file, line 2: 'path/that/does/not/exists/1' doesn't match any file", err)
+        self.assertIn("Syntax error in DEVELOPERS file, line 3: 'path/that/does/not/exists/2' doesn't match any file", err)
         self.assertEqual(rc, 1)
         self.assertEqual(len(out), 0)
         self.assertEqual(len(err), 2)
 
         # -c generating error for old file entry
         developers = b'N:\tAuthor <email>\n' \
                      b'F:\tpath/that/does/not/exists/1\n' \
                      b'F:\tpath/that/does/not/exists/2\n'
         out, err, rc = call_get_developers("./utils/get-developers", ["-c"], self.WITH_EMPTY_PATH, topdir, developers)
-        self.assertIn("Syntax error in DEVELOPERS file, line 1: 'path/that/does/not/exists/1' doesn't match any file", err)
-        self.assertIn("Syntax error in DEVELOPERS file, line 2: 'path/that/does/not/exists/2' doesn't match any file", err)
+        self.assertIn("Syntax error in DEVELOPERS file, line 2: 'path/that/does/not/exists/1' doesn't match any file", err)
+        self.assertIn("Syntax error in DEVELOPERS file, line 3: 'path/that/does/not/exists/2' doesn't match any file", err)
         self.assertEqual(rc, 1)
         self.assertEqual(len(out), 0)
         self.assertEqual(len(err), 2)
 
         # -c printing lots of files with no developer
         developers = b'# comment\n' \
                      b'\n' \
diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index f9f84ee8e1..3383df3c9e 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -233,21 +233,22 @@ def parse_developers(filename=None):
     global unittests
     unittests = list_unittests()
     developers_fname = filename or os.path.join(brpath, 'DEVELOPERS')
     with open(developers_fname, mode='r', encoding='utf_8') as f:
         files = []
         name = None
         for line in f:
+            linen += 1
             line = line.strip()
             if line.startswith("#"):
                 continue
             elif line.startswith("N:"):
                 if name is not None or len(files) != 0:
                     errors += 1
-                    print("Syntax error in DEVELOPERS file, line %d" % linen,
+                    print("Syntax error in DEVELOPERS file, just before line %d" % linen,
                           file=sys.stderr)
                 name = line[2:].strip()
             elif line.startswith("F:"):
                 fname = line[2:].strip()
                 dev_files = glob.glob(os.path.join(brpath, fname))
                 if len(dev_files) == 0:
                     errors += 1
@@ -265,15 +266,14 @@ def parse_developers(filename=None):
                 developers.append(Developer(name, files))
                 files = []
                 name = None
             else:
                 print("Syntax error in DEVELOPERS file, line %d: '%s'" % (linen, line),
                       file=sys.stderr)
                 return None
-            linen += 1
     # handle last developer
     if name is not None:
         developers.append(Developer(name, files))
     if errors > 0:
         return None
     return developers
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
