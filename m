Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92399C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 23:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45D9C8315C;
	Sun, 24 Jul 2022 23:53:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45D9C8315C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F-3sHe8sZKdZ; Sun, 24 Jul 2022 23:53:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19281830C1;
	Sun, 24 Jul 2022 23:53:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19281830C1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C72121BF31C
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 23:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADBDF416F2
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 23:53:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADBDF416F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id An4tEBi0HKbG for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 23:53:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52326416EE
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 52326416EE
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 23:53:38 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 r193-20020a4a37ca000000b0043578138958so1892449oor.4
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 16:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=/nii/ZCoJr1PY0DBtUpvOsH52LRegYOkQB/s7AsOiBo=;
 b=bm+tRPEbSeq1llkWALzxxeaXdei18zfq3kBWZ6p/l4ZQ7wPQwp0/51dr14VD4tBS3W
 85iSUFHPLXbwB3C7/MRSXYuQ/pvooixz+jawhRzH5zDJ5vrfPk2+1TDooAjIVgMi+clb
 zSNPb82BJicYuFRfvKh6JZZpiw7fwWvWVNdu5nkC5N+p/jqZTgET3GQLMCh2NZOSwBRC
 lh2W5DXtV8O+2lvknc1hF4m2tEiTi0XAH4oOGduxsPWCWW62JVr36/90nqS4W0IQ1kJd
 d2r2EIoeCSfCovVEq/QNjOjI41woVduia6V0IIOx4R2HYQ3rYqjsdKD41HIIFPhNOlS5
 AR2w==
X-Gm-Message-State: AJIora/rvZLBjdbhcQVcdMFauvfVKVlAe9jNhBeLgLPcRpH5pq+kPnl+
 NPZDQBHWfpMCvVVxEpWa/WmnH5LxWaE=
X-Google-Smtp-Source: AGRyM1uzhPQ3lKmewZhBKfVTgzvNUic7BZahCaMFV+UB48s6dWYafBOAoR5RqnQbh4PEu/qC3hoM/Q==
X-Received: by 2002:a4a:49d2:0:b0:435:9edb:9e8 with SMTP id
 z201-20020a4a49d2000000b004359edb09e8mr3389950ooa.62.1658706817247; 
 Sun, 24 Jul 2022 16:53:37 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 k23-20020a4ad117000000b004359b581401sm4283268oor.25.2022.07.24.16.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 16:53:36 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 20:53:00 -0300
Message-Id: <20220724235301.3708271-2-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220724235301.3708271-1-ricardo.martincoski@gmail.com>
References: <20220724235301.3708271-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=/nii/ZCoJr1PY0DBtUpvOsH52LRegYOkQB/s7AsOiBo=;
 b=P9emWSH8uKojZBag/HFpQCCzJ3zHA6Re6hb0mvegrtNtdXLh6OI3f4iDhF+vYD4Ikr
 QnehjLcO9AHS/wwlOMZdoMIzAVKsWtyg5u3U/SlJqqW1zyk0d0T/kmPgOg12EcJbaLxd
 z4Z1ac35oDQwz68HX8a09PVxLQ0cNB5wyKvUaSyRAbkAa95oVcIJGIO5QQVJoX2Mu88M
 3xTcpWNMCzCOydhihZg/h6k4c+9e2Cq9bUqXcTBgfl2QbdGKqW0AJLib2GsqqZ/Bw6Wv
 xMFEzNfsWBiLW0nwqOQBXDf63z6hxG8yLSzYDMhVnOPkyLDQPl0NPHPsMp0Brf+LUZUo
 uKPw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=P9emWSH8
Subject: [Buildroot] [PATCH 2/3] utils/get-developers: bail out on parsing
 errors
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

Currently 4 types of parsing errors can be found:
- developer entry with no file entry (error)
- file entry with no developer (error)
- entry for file that are not in the tree anymore (warning)
- entry that is not a developer, a file or a comment (hard error)

Currently only the last one ends the script with -v with error code.

Make the warning an error.
Suggested-by: Arnout Vandecappelle <arnout@mind.be>

Make all errors into hard errors.
Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

At same time standardize the error message, printing the line number
that contains the error.

Do not bail out in the first error found but instead print all errors
found, in order to help the developer fixing the DEVELOPERS file.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

NOTICE that when DEVELOPERS file has errors, pkg-stats will fail
(with a DEVELOPERS file *modified* to have an error):

Build package list ...
Getting developers ...
Syntax error in DEVELOPERS file, line 2: 'old_file' doesn't match any file
Build defconfig list ...
Traceback (most recent call last):
  File "support/scripts/pkg-stats", line 1289, in <module>
    __main__()
  File "support/scripts/pkg-stats", line 1249, in __main__
    d.set_developers(developers)
  File "support/scripts/pkg-stats", line 60, in set_developers
    self.developers = [
TypeError: 'NoneType' object is not iterable
---
 .../tests/utils/test_get_developers.py        | 22 +++++++++----------
 utils/getdeveloperlib.py                      |  7 +++++-
 2 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/support/testing/tests/utils/test_get_developers.py b/support/testing/tests/utils/test_get_developers.py
index 12710fe8d3..d0c8e4d028 100644
--- a/support/testing/tests/utils/test_get_developers.py
+++ b/support/testing/tests/utils/test_get_developers.py
@@ -66,30 +66,30 @@ class TestGetDevelopers(unittest.TestCase):
                      b'\n' \
                      b'F:\tutils/get-developers\n' \
                      b'\n' \
                      b'N:\tAuthor2 <email>\n' \
                      b'F:\tutils/get-developers\n'
         out, err, rc = call_get_developers("get-developers", ["-v"], self.WITH_UTILS_IN_PATH, topdir, developers)
         self.assertIn("Syntax error in DEVELOPERS file, line 1", err)
-        self.assertEqual(rc, 0)
+        self.assertEqual(rc, 1)
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
         self.assertIn("Syntax error in DEVELOPERS file, line 1", err)
         self.assertIn("Syntax error in DEVELOPERS file, line 2", err)
-        self.assertEqual(rc, 0)
+        self.assertEqual(rc, 1)
         self.assertEqual(len(out), 0)
         self.assertEqual(len(err), 2)
 
         # -v not generating error for developer entry with empty list of file entries
         developers = b'# comment\n' \
                      b'# comment\n' \
                      b'\n' \
@@ -100,34 +100,34 @@ class TestGetDevelopers(unittest.TestCase):
                      b'N:\tAuthor3 <email>\n' \
                      b'F:\tutils/get-developers\n'
         out, err, rc = call_get_developers("get-developers", ["-v"], self.WITH_UTILS_IN_PATH, topdir, developers)
         self.assertEqual(rc, 0)
         self.assertEqual(len(out), 0)
         self.assertEqual(len(err), 0)
 
-        # -v generating warning for old file entry
+        # -v generating error for old file entry
         developers = b'N:\tAuthor <email>\n' \
                      b'F:\tpath/that/does/not/exists/1\n' \
                      b'F:\tpath/that/does/not/exists/2\n'
         out, err, rc = call_get_developers("get-developers", ["-v"], self.WITH_UTILS_IN_PATH, topdir, developers)
-        self.assertIn("WARNING: 'path/that/does/not/exists/1' doesn't match any file", err)
-        self.assertIn("WARNING: 'path/that/does/not/exists/2' doesn't match any file", err)
-        self.assertEqual(rc, 0)
+        self.assertIn("Syntax error in DEVELOPERS file, line 1: 'path/that/does/not/exists/1' doesn't match any file", err)
+        self.assertIn("Syntax error in DEVELOPERS file, line 2: 'path/that/does/not/exists/2' doesn't match any file", err)
+        self.assertEqual(rc, 1)
         self.assertEqual(len(out), 0)
         self.assertEqual(len(err), 2)
 
-        # -c generating warning and printing lots of files with no developer
+        # -c generating error for old file entry
         developers = b'N:\tAuthor <email>\n' \
                      b'F:\tpath/that/does/not/exists/1\n' \
                      b'F:\tpath/that/does/not/exists/2\n'
         out, err, rc = call_get_developers("./utils/get-developers", ["-c"], self.WITH_EMPTY_PATH, topdir, developers)
-        self.assertIn("WARNING: 'path/that/does/not/exists/1' doesn't match any file", err)
-        self.assertIn("WARNING: 'path/that/does/not/exists/2' doesn't match any file", err)
-        self.assertEqual(rc, 0)
-        self.assertGreater(len(out), 1000)
+        self.assertIn("Syntax error in DEVELOPERS file, line 1: 'path/that/does/not/exists/1' doesn't match any file", err)
+        self.assertIn("Syntax error in DEVELOPERS file, line 2: 'path/that/does/not/exists/2' doesn't match any file", err)
+        self.assertEqual(rc, 1)
+        self.assertEqual(len(out), 0)
         self.assertEqual(len(err), 2)
 
         # -c printing lots of files with no developer
         developers = b'# comment\n' \
                      b'\n' \
                      b'N:\tAuthor <email>\n' \
                      b'F:\tutils/get-developers\n'
diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index 2a8d5c213c..f9f84ee8e1 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -225,34 +225,37 @@ def parse_developer_runtime_tests(fnames):
     return runtimes
 
 
 def parse_developers(filename=None):
     """Parse the DEVELOPERS file and return a list of Developer objects."""
     developers = []
     linen = 0
+    errors = 0
     global unittests
     unittests = list_unittests()
     developers_fname = filename or os.path.join(brpath, 'DEVELOPERS')
     with open(developers_fname, mode='r', encoding='utf_8') as f:
         files = []
         name = None
         for line in f:
             line = line.strip()
             if line.startswith("#"):
                 continue
             elif line.startswith("N:"):
                 if name is not None or len(files) != 0:
+                    errors += 1
                     print("Syntax error in DEVELOPERS file, line %d" % linen,
                           file=sys.stderr)
                 name = line[2:].strip()
             elif line.startswith("F:"):
                 fname = line[2:].strip()
                 dev_files = glob.glob(os.path.join(brpath, fname))
                 if len(dev_files) == 0:
-                    print("WARNING: '%s' doesn't match any file" % fname,
+                    errors += 1
+                    print("Syntax error in DEVELOPERS file, line %d: '%s' doesn't match any file" % (linen, fname),
                           file=sys.stderr)
                 for f in dev_files:
                     dev_file = os.path.relpath(f, brpath)
                     dev_file = dev_file.replace(os.sep, '/')  # force unix sep
                     if f[-1] == '/':  # relpath removes the trailing /
                         dev_file = dev_file + '/'
                     files.append(dev_file)
@@ -266,14 +269,16 @@ def parse_developers(filename=None):
                 print("Syntax error in DEVELOPERS file, line %d: '%s'" % (linen, line),
                       file=sys.stderr)
                 return None
             linen += 1
     # handle last developer
     if name is not None:
         developers.append(Developer(name, files))
+    if errors > 0:
+        return None
     return developers
 
 
 def check_developers(developers, basepath=None):
     """Look at the list of files versioned in Buildroot, and returns the
     list of files that are not handled by any developer"""
     if basepath is None:
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
