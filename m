Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D84CC4332F
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 14:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 150E740278;
	Sun, 27 Nov 2022 14:48:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 150E740278
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RX3juiINCgLP; Sun, 27 Nov 2022 14:48:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14D42401DD;
	Sun, 27 Nov 2022 14:48:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14D42401DD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE1311BF3C5
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 14:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6356401DD
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 14:48:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6356401DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gmixBG9m2gOR for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 14:48:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A465400B8
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A465400B8
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 14:48:39 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-13bd19c3b68so10333334fac.7
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 06:48:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E619c6XN2L6YyZuGlR/lWBaUdGyK8Z1TuZ9C93V6F6k=;
 b=ebgJ4r3IzeYV3K56BkFLt2By6BxCjyM8sHVAVBxoE2S9t5QECGDcWcbz39uxV5bNmo
 4QvfRe1xi5DurvNjrm6YQqaoPeVpmlIEqdxpNT10zx0oAdBRNfldTXS8sgDnbM4bYT4C
 G8xuFaYGEVs1qutqi18rnFD7Pj4HIVXGh6bwzyesuf1o4aGG8/kcY54SG8EyfxDmXQ7V
 mIWQ6jiMl1X0wEsNcc7inAQd92D8Um0euiq3E6JkL5Z2Db3ZBs70pq0Pfg8yw5gKrdyB
 MGu1euKhXQxrKMfRe2mvoPuk8yUo00hrJLcxsp7R5262QovhwCIQFvOP/d3YPUrtZp2N
 WBbg==
X-Gm-Message-State: ANoB5pkXdML5J/zmWtrETGKnCwnTS7sLD75BZoj/eLMlP/I92ALSVUrN
 QX5tzYpCb+QbBK3FcEnMwrcArAc4+Vs=
X-Google-Smtp-Source: AA0mqf7ehVuTOqzP4YmJwzYayJo517REsDv/08GMmGEbPntPSkEU2YUfgJhnYjgLB1RrZB7tZDvjjw==
X-Received: by 2002:a05:6870:788d:b0:137:3d65:f5ec with SMTP id
 hc13-20020a056870788d00b001373d65f5ecmr14752178oab.257.1669560518640; 
 Sun, 27 Nov 2022 06:48:38 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:9b54:d73e:4d8c:458c])
 by smtp.gmail.com with ESMTPSA id
 e64-20020aca3743000000b00342e8bd2299sm3471711oia.6.2022.11.27.06.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 06:48:37 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 11:48:19 -0300
Message-Id: <20221127144819.2022348-2-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127144819.2022348-1-ricardo.martincoski@gmail.com>
References: <20221127144819.2022348-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E619c6XN2L6YyZuGlR/lWBaUdGyK8Z1TuZ9C93V6F6k=;
 b=dF+icwmBwmY5VufTE8MuQqlcDR1GXekenlWDOVs2vWUqni1rMoGAXpU+T6PSvHncTF
 gbyE2mfN+/LMOEkjcDnOxloKP4vwv3phxADn9BFyHowmZGjrfod2uWaFeRHYDOvicWW9
 XDifvnrEwsEtfxKmgrqLxIA1SL3y7k4SRfZAGBIMa/jKriqXyJ4uJ8fSZ5zpFcOV8Dkd
 oognOtKV4oReKi4TG+EHt499c49WcM1cqonO613XhYPgja2vj2Iatu3Yg5g3t3aGQY0M
 +/+0zZKhTyL+CkoNuFJSB+7Omhtz+6jxFyB0N7ZU1UqgsOx4gKkm0KecNk4QDbIJgUIG
 BWIA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dF+icwmB
Subject: [Buildroot] [next,
 v2 2/2] utils/get-developers: print error for correct line
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

Start counting the line numbers in 1 instead of 0, in case an error
must be printed.

Both the error about a developer entry with no file entry and the error
about a file entry with no developer entry actually belong to the
non-empty line previous the one being analysed, so in these cases print
the line number from the line before.

Also count empty and comment lines, so a developer fixing the file can
jump to the correct line (or the nearest one).

At same time standardize the messages, printing the line number
also in the case of a warning for a file that is not in the tree
anymore.

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v1 -> v2:
  - avoid changing the message to a weird one, just print the line
    number for the line before (Thomas)
  - add the lineno on the warning messages in the this patch instead of
    the previous one

check-*:
https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/706255042

tests.utils.test_get_developers.TestGetDevelopers:
https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/706255012
---
 .../testing/tests/utils/test_get_developers.py   | 16 ++++++++--------
 utils/getdeveloperlib.py                         |  6 +++---
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/support/testing/tests/utils/test_get_developers.py b/support/testing/tests/utils/test_get_developers.py
index 0b313c7c59..ffc01f6ce7 100644
--- a/support/testing/tests/utils/test_get_developers.py
+++ b/support/testing/tests/utils/test_get_developers.py
@@ -48,7 +48,7 @@ class TestGetDevelopers(unittest.TestCase):
         # -v generating error, called from the main dir
         developers = b'text1\n'
         out, err, rc = call_get_developers("./utils/get-developers", ["-v"], self.WITH_EMPTY_PATH, topdir, developers)
-        self.assertIn("Syntax error in DEVELOPERS file, line 0: 'text1'", err)
+        self.assertIn("Syntax error in DEVELOPERS file, line 1: 'text1'", err)
         self.assertEqual(rc, 1)
         self.assertEqual(len(out), 0)
         self.assertEqual(len(err), 1)
@@ -56,7 +56,7 @@ class TestGetDevelopers(unittest.TestCase):
         # -v generating error, called from path
         developers = b'text2\n'
         out, err, rc = call_get_developers("get-developers", ["-v"], self.WITH_UTILS_IN_PATH, topdir, developers)
-        self.assertIn("Syntax error in DEVELOPERS file, line 0: 'text2'", err)
+        self.assertIn("Syntax error in DEVELOPERS file, line 1: 'text2'", err)
         self.assertEqual(rc, 1)
         self.assertEqual(len(out), 0)
         self.assertEqual(len(err), 1)
@@ -69,7 +69,7 @@ class TestGetDevelopers(unittest.TestCase):
                      b'N:\tAuthor2 <email>\n' \
                      b'F:\tutils/get-developers\n'
         out, err, rc = call_get_developers("get-developers", ["-v"], self.WITH_UTILS_IN_PATH, topdir, developers)
-        self.assertIn("Syntax error in DEVELOPERS file, line 1", err)
+        self.assertIn("Syntax error in DEVELOPERS file, line 4", err)
         self.assertEqual(rc, 1)
         self.assertEqual(len(out), 0)
         self.assertEqual(len(err), 1)
@@ -83,7 +83,7 @@ class TestGetDevelopers(unittest.TestCase):
                      b'N:\tAuthor3 <email>\n' \
                      b'F:\tutils/get-developers\n'
         out, err, rc = call_get_developers("get-developers", ["-v"], self.WITH_UTILS_IN_PATH, topdir, developers)
-        self.assertIn("Syntax error in DEVELOPERS file, line 1", err)
+        self.assertIn("Syntax error in DEVELOPERS file, line 4", err)
         self.assertEqual(rc, 1)
         self.assertEqual(len(out), 0)
         self.assertEqual(len(err), 1)
@@ -108,8 +108,8 @@ class TestGetDevelopers(unittest.TestCase):
                      b'F:\tpath/that/does/not/exists/1\n' \
                      b'F:\tpath/that/does/not/exists/2\n'
         out, err, rc = call_get_developers("get-developers", ["-v"], self.WITH_UTILS_IN_PATH, topdir, developers)
-        self.assertIn("WARNING: 'path/that/does/not/exists/1' doesn't match any file", err)
-        self.assertIn("WARNING: 'path/that/does/not/exists/2' doesn't match any file", err)
+        self.assertIn("WARNING: 'path/that/does/not/exists/1' doesn't match any file, line 2", err)
+        self.assertIn("WARNING: 'path/that/does/not/exists/2' doesn't match any file, line 3", err)
         self.assertEqual(rc, 0)
         self.assertEqual(len(out), 0)
         self.assertEqual(len(err), 2)
@@ -119,8 +119,8 @@ class TestGetDevelopers(unittest.TestCase):
                      b'F:\tpath/that/does/not/exists/1\n' \
                      b'F:\tpath/that/does/not/exists/2\n'
         out, err, rc = call_get_developers("./utils/get-developers", ["-c"], self.WITH_EMPTY_PATH, topdir, developers)
-        self.assertIn("WARNING: 'path/that/does/not/exists/1' doesn't match any file", err)
-        self.assertIn("WARNING: 'path/that/does/not/exists/2' doesn't match any file", err)
+        self.assertIn("WARNING: 'path/that/does/not/exists/1' doesn't match any file, line 2", err)
+        self.assertIn("WARNING: 'path/that/does/not/exists/2' doesn't match any file, line 3", err)
         self.assertEqual(rc, 0)
         self.assertGreater(len(out), 1000)
         self.assertEqual(len(err), 2)
diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index dbd21af443..e7d0d23e49 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -236,12 +236,13 @@ def parse_developers(filename=None):
         files = []
         name = None
         for line in f:
+            linen += 1
             line = line.strip()
             if line.startswith("#"):
                 continue
             elif line.startswith("N:"):
                 if name is not None or len(files) != 0:
-                    print("Syntax error in DEVELOPERS file, line %d" % linen,
+                    print("Syntax error in DEVELOPERS file, line %d" % (linen - 1),
                           file=sys.stderr)
                     return None
                 name = line[2:].strip()
@@ -249,7 +250,7 @@ def parse_developers(filename=None):
                 fname = line[2:].strip()
                 dev_files = glob.glob(os.path.join(brpath, fname))
                 if len(dev_files) == 0:
-                    print("WARNING: '%s' doesn't match any file" % fname,
+                    print("WARNING: '%s' doesn't match any file, line %d" % (fname, linen),
                           file=sys.stderr)
                 for f in dev_files:
                     dev_file = os.path.relpath(f, brpath)
@@ -267,7 +268,6 @@ def parse_developers(filename=None):
                 print("Syntax error in DEVELOPERS file, line %d: '%s'" % (linen, line),
                       file=sys.stderr)
                 return None
-            linen += 1
     # handle last developer
     if name is not None:
         developers.append(Developer(name, files))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
